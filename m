Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1Oy7Yt-0000zA-Q2
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 20:27:29 +0200
Received: by wyb34 with SMTP id 34so4102247wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=1sBd8AuOYhMYHApLKN08WoTBQFXQJ63rIsqV/w5sytU=;
	b=jpxYiWqqCLOwisodbiUXPoPn94vUMIZCdhGMY0XvMw8K6fn064Ec7rKlby/wRec6mX
	ORLmHYoAO3cvgnLDCIRH8HkzTj3VyG3ltKZmBWQutXejwZLNpKvPyyMzd8watEVZjSgV
	X/HIX3/E2EQMogz98VGdQT+YgBPXafMiHu5Uk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=D77kr4nbrMIDmYzl1LzxXh5HjJOHShu8LWJ5ZuukkzOv1l67TXKrJ1ikP8SBGRrrQY
	2Dhya+VSey9+l4BkXcD9W+oo9xV29C6yj0fs2J1VpY158LrVnM45Zg2oDoggnQILtF2b
	nFjh8bGH/XYejzMAuOYuT2f1saZtzfWTjWiNg=
MIME-Version: 1.0
Received: by 10.216.155.206 with SMTP id j56mr9544359wek.67.1285093643891;
	Tue, 21 Sep 2010 11:27:23 -0700 (PDT)
Received: by 10.216.202.35 with HTTP; Tue, 21 Sep 2010 11:27:23 -0700 (PDT)
Date: Tue, 21 Sep 2010 14:27:23 -0400
Message-ID: <AANLkTinWU3xoXzvcF7J6ExWjuh+gB9O6U2uChdTi77Bj@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: george.huntingtoniii@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: trying to use external-toolchain-csl with angstrom
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
X-List-Received-Date: Tue, 21 Sep 2010 18:27:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

I had to set TARGET_SYS = "arm-none-linux-gnueabi" in my local.conf to get
the toolchain to be used, but now it appears that the gmp configure script
doesn't like getting passed "--target=arm-none-linux-gnueabi"  am I just
configuring things wrong?


here is my local.conf:

DISTRO = "angstrom-2008.1"

DL_DIR = "${OEDIR}/downloads"

BBFILES := "${OEDIR}/openembedded/recipes/*/*.bb
${OEDIR}/openembedded.custom/recipes/*/*.bb"
BBFILE_COLLECTIONS = "upstream custom"
BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/recipes/"
BBFILE_PATTERN_custom = "^${OEDIR}/openembedded.custom/recipes"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_custom = "10"

IMAGE_FSTYPES = "jffs2 tar cpio.gz"

BBINCLUDELOGS = "yes"

CVS_TARBALL_STASH = ""
ANGSTROM_FEED_CONFIGS = ""
#DEBIAN_MIRROR = "ftp://ftp.us.debian.org/debian/pool"

#ENABLE_BINARY_LOCALE_GENERATION = "0"

PREFERRED_VERSION_mono = "2.4.2.3"
PREFERRED_VERSION_mono-mcs-intermediate = "2.4.2.3"
PREFERRED_VERSION_mono-native = "2.4.2.3"

#PREFERRED_VERSION_directfb = "1.4.1"

#PREFERRED_VERSION_mono = "svn"
#PREFERRED_VERSION_mono-mcs-intermediate = "svn"
#PREFERRED_VERSION_mono-native = "svn"

# Black magic to automatically set SDK_PATH out of PATH - don't touch this!
# Works with pretty much any external toolchain, like CS Lite or MV Pro 5
# Handles cross-toolchain vs. native toolchain
# SDK_PATH can be overwritten externally by META_SDK_PATH, e.g. for SDK
TOOLCHAIN_PATH = "/opt/arm/arm-2009q3"
TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
#~ PATH_prepend = "${TOOLCHAIN_PATH}/bin"
SDK_PATH = "${@[bb.data.getVar('TOOLCHAIN_PATH', d, 1),
bb.data.getVar('META_SDK_PATH', d, 1)][bool(bb.data.getVar('META_SDK_PATH',
d, 1))]}"
# Set the necessary variables to use binary CodeSourcery Lite
TARGET_VENDOR = "-none"
TARGET_SYS = "arm-none-linux-gnueabi"
TARGET_CPPFLAGS_append = " -I${SDK_PATH}/${TARGET_SYS}/libc/usr/include "
TARGET_LDFLAGS_prepend = " -L${SDK_PATH}/${TARGET_SYS}/libc/lib
-Wl,-rpath-link,${SDK_PATH}/${TARGET_SYS}/libc/lib "
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"


# add the following to site.conf if you want to go
# faster, use less space, etc
#PARALLEL_MAKE = "-j 5"
#BB_NUMBER_THREADS = "4"
#INHERIT += "rm_work"

