Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ob6ff-00057y-G1
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 08:51:19 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ob6fV-0001pN-TC by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 08:51:12 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Ob6fU-0005mO-J8
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 08:51:08 +0200
Date: Tue, 20 Jul 2010 08:51:08 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720065108.GC1512@excalibur.local>
References: <AANLkTimlxdwUxIog99H_Er_QL-tzZ5Ntd9kTyT8BcG-Y@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimlxdwUxIog99H_Er_QL-tzZ5Ntd9kTyT8BcG-Y@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: GPSBABLE -- fixed recipe
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
X-List-Received-Date: Tue, 20 Jul 2010 06:51:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-07-19 at 15:12, J. L.  wrote:
> It had bad checksums here is the fixed file, hope this helps

Did you check what the problem was with the checksum? Like the tarball changes
upstream but stayed under the same name?

> SECTION = "console/utils"
> DESCRIPTION = "GPS data converter"
> DEPENDS = "expat virtual/libusb0"
> HOMEPAGE = "http://www.gpsbabel.org/"
> LICENSE = "GPL"
> 
> SRC_URI = "http://www.gpsbabel.org/plan9.php?dl=gpsbabel-${PV}.tar.gz \
>            file://autotools.patch"
> 
> inherit autotools pkgconfig
> 
> SRC_URI[md5sum] = "d41d8cd98f00b204e9800998ecf8427e"
> SRC_URI[sha256sum] =
> "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

Please prepare a git patch that could get applied easily. That would include
that you fix the recipe as you see fit, commit your changes into git, prepare a
patch (git format-patch -1) and then send it to the list (with git send-email or
with your normal mail reader).

This workflow looks like more work in the beginning but it pays off for you and
us within the first two patches. :)

regards
Stefan Schmidt


