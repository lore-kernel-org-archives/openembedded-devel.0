Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvR-0006vX-5P
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:16 +0200
Received: by pzk37 with SMTP id 37so936449pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Mzl6wSv6T3+qymVt85UzZFp7/FQ7JcS4ANZJO53uKPs=;
	b=UT1kN7vhOAgYColUgFoVVpF0XyJOCO/Oo/KhTGB+6UPjnP4uv5f3lGrOWkcbDfn9aB
	GZlUQaAWeoUCfb+VklHAM/vN2xN1ADFOXWZOEqstVZSs42WUvOEyV2ewsn1IXCp0Xo+e
	7elgeN65jGESMXuX75spXLBx2eV5HKYH3XvEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kka9TBV6BczXbm3McyG3BiDWS9UFCivO2UQW9Wd2XscEoDFCFOYbQxcLkBlzgbEcBP
	s7pAVmQuWqVFzSOrRpX91LRUvZiJIf8XRICCq3QX352oNz5cIcYXKlGuaahsoBcPFeFo
	FOPWC1kJJx+ZFe047Ua46ZvoKQMeBN4lLtkSE=
Received: by 10.114.133.14 with SMTP id g14mr5912169wad.192.1285456372038;
	Sat, 25 Sep 2010 16:12:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:25 -0700
Message-Id: <1285456353-27457-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/12] distros: Disable gnu-style hash for mips64/mips64el
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/angstrom-eglibc.inc       |    2 +-
 conf/distro/include/angstrom-glibc.inc        |    2 +-
 conf/distro/include/angstrom-uclibc.inc       |    2 +-
 conf/distro/include/sane-toolchain-eglibc.inc |    3 +--
 conf/distro/include/sane-toolchain-glibc.inc  |    3 +--
 conf/distro/include/sane-toolchain-uclibc.inc |    2 +-
 6 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
index 4b059fc..3a62781 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -23,7 +23,7 @@ BUILD_OPTIMIZATION = "-O2 -g"
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_sparc = "-O2"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
diff --git a/conf/distro/include/angstrom-glibc.inc b/conf/distro/include/angstrom-glibc.inc
index 27fa024..0ebfaac 100644
--- a/conf/distro/include/angstrom-glibc.inc
+++ b/conf/distro/include/angstrom-glibc.inc
@@ -22,7 +22,7 @@ FULL_OPTIMIZATION_ep9312 = "-fexpensive-optimizations -fomit-frame-pointer -fren
 BUILD_OPTIMIZATION = "-O2 -g"
 BUILD_OPTIMIZATION_pn-perl-native = "-O1 -g"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
 # Disable -Wl,as-needed for now till all the test come back OK
 #require conf/distro/include/angstrom-ldflags.inc
diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
index 1e11ede..95892b9 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -25,7 +25,7 @@ BUILD_OPTIMIZATION = "-O2 -g"
 #Note that this testing was done without the gcc-pr32889.patch.
 FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'avr32']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index 8f07b96..e03609e 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -20,7 +20,6 @@ FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_sparc = "-O2"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
-
diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
index f029c6f..cf2830b 100644
--- a/conf/distro/include/sane-toolchain-glibc.inc
+++ b/conf/distro/include/sane-toolchain-glibc.inc
@@ -17,7 +17,6 @@ BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
 BUILD_OPTIMIZATION_sparc = "-O2"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
-
diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index 9f515a0..bfe0bc8 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -35,7 +35,7 @@ FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-reg
 #Note that this testing was done without the gcc-pr32889.patch.
 FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
 
-TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'avr32']]}"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-- 
1.7.0.4



