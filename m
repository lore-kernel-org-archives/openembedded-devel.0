Received: from p3plsmtpa01-02.prod.phx3.secureserver.net ([72.167.82.82])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1Nsp4x-00052K-6M
	for openembedded-devel@openembedded.org; Sat, 20 Mar 2010 04:10:24 +0100
Received: (qmail 8494 invoked from network); 20 Mar 2010 03:00:35 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-02.prod.phx3.secureserver.net (72.167.82.82) with ESMTP;
	20 Mar 2010 03:00:35 -0000
Message-ID: <4BA43A58.905@mwester.net>
Date: Fri, 19 Mar 2010 22:00:40 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.167.82.82
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Patch "Don't inherit siteinfo in base.bbclass" breaks SlugOS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Mar 2010 03:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The following commit breaks SlugOS.  I apologize for starting a new
thread on this, but I am unable to find the original discussion on the
OE ml (but I probably missed it in the several hundred that piled up in
my inbox this week).

------------
commit a215c2f283476776567506c2e3f969c48f7e5e3d
Author: Chris Larson <chris_larson@mentor.com>
Date:   Tue Mar 9 16:54:57 2010 -0700

    Don't inherit siteinfo in base.bbclass

    Acked-by: Richard Purdie <rpurdie@linux.intel.com>
    Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
    Signed-off-by: Chris Larson <chris_larson@mentor.com>
------------

In a nutshell, the ixp4xx can run in either endianess, and SlugOS builds
both a BE and an LE image.  Removing "inherit siteinfo" from
base.bbclass causes parsing failures in every recipe.

As an example of the issue, consider this lines in
conf/distro/include/slugos.conf:

IMAGE_BASENAME = "${@['slugos${SITEINFO_ENDIANESS}',
'ucslugc'][bb.data.getVar('TARGET_OS', d, 1) == 'linux-uclibc']}"

and

DISTRO_NAME ?=
"INVALID-${SITEINFO_ENDIANESS}-${ARM_INSTRUCTION_SET}-${TARGET_OS}"

There may be other locations (such as recipes, etc) where this problem
may exist, these were just the two locations I found easily.

Any ideas how to address this?

-Mike (mwester)




