Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1O9oJ8-000129-Mg
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 01:47:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o45NhRS9013330
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 May 2010 00:43:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13272-01 for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 00:43:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o45NhLDw013324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 May 2010 00:43:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 06 May 2010 00:43:19 +0100
Message-ID: <1273102999.5743.49.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Wed, 05 May 2010 23:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I finally felt the time was right so I've merged the work-in-progress
branch I've been talking about to OE.dev. This contains various
architecture improvements and legacy staging cleanups that have been
used in Poky for a while with great benefit.

One thing people have seen with this branch is configure failures like:


"""
Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.10
cp: cannot stat `/media/data1/builds/oe1/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/share/gettext/config.rpath': No such file or directory
"""

This means you need to inherit the gettext class in the .bb file as the
package has a gettext dependency that is missing, i.e. a trivial fix.

Obviously these don't appear once gettext has been built as a dependency
for any one thing. There are warnings about missing inherits in the QA
tests though. Poky has these as errors, I don't think OE is quite ready
for that yet but it would be something to start working on.

I and others will keep an eye open for problems related to this merge
and address them as quickly as possible. 

These changes are important to move us closer to our goals of improved
sysroot handling, better packaged staging and so forth.

Cheers,

Richard



