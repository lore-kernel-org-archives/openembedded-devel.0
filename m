Received: from smtpauth02.prod.mesa1.secureserver.net ([64.202.165.182])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Pr2EP-0004dV-Po
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 06:53:18 +0100
Received: (qmail 16653 invoked from network); 20 Feb 2011 05:52:01 -0000
Received: from unknown (209.242.7.132)
	by smtpauth02.prod.mesa1.secureserver.net (64.202.165.182) with ESMTP;
	20 Feb 2011 05:52:01 -0000
Message-ID: <4D60AC02.2070605@mwester.net>
Date: Sat, 19 Feb 2011 23:52:02 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Parsing stalls at libinih
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
X-List-Received-Date: Sun, 20 Feb 2011 05:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Parsing stalled.  Debugging shows its stuck on parsing libinih:

PV = "0.0+gitr${SRCPV}"
PKGV = "${GITPKGVTAG}"

I think we had decided some time ago that OE recipes were to be nailed
down in some fashion such that one should be able to parse all the
recipes, at least, without a network connection.

Have I missed setting something for my distro so that the above lines
don't have to go to the libinih git repo for every parse?

For now, I've fixed it by masking out that recipe in my local.conf -- I
have no need for it.  Is that the correct solution for recipes that do this?


Thanks,
-Mike (mwester)


