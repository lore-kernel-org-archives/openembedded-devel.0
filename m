Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OQisC-0002XK-KZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 17:25:29 +0200
Received: by pwi8 with SMTP id 8so1487168pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=KlQsagfsyxEEjasdh+mR/rJhf+KPDLU9kfW88G5Fc18=;
	b=HCkJa6n2TLXWbZWevOx7TqFjFzwvU+t7Ym2kV53yoH8fUzR1iZuO304I5Di10AQaG8
	cioz/9u9OlwNN88MYcjlbsS1w1cu4FPxsHbd45f7AxFW6na+EZVDLvDg8POH2SZk8xLZ
	maswjFDmzaSRmKnsZyXry2MMzhNgR6ng/Pn28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=ONeRCccedB7NWzJXinMbW1BSlQ564MQ+Ts5udcxAmF6qvLt8gnqJlMHsAwSkRnrcts
	OrQGGOIoY2oV1xcR5TEiogHHadHSnwXrOYebrlg6luDiLxKbMfsNRqYiThGlaWFxMoPu
	kXz2qijUwvjrq6SPIk+iBmsicT53XADx3jjT0=
Received: by 10.142.5.25 with SMTP id 25mr3561339wfe.78.1277133636948;
	Mon, 21 Jun 2010 08:20:36 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id l29sm3817094rvb.16.2010.06.21.08.20.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 08:20:36 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jun 2010 08:19:43 -0700
Message-Id: <1277133583-9252-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Siteinfo improvements
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
X-List-Received-Date: Mon, 21 Jun 2010 15:25:31 -0000

- Do the sanity checks for missing site information at ConfigParsed time
  - This required making the siteinfo bbclass come in automatically via
    base.bbclass again.  I could have done the check at RecipeParsed time
    instead, but I think this makes more sense.
  - Also sets SITEINFO_ENDIANNESS and SITEINFO_BITS at config parsed time
- Don't supply site files for native
- Split up the site information, so we don't need to add every single
  combination of os and architecture to the siteinfo.bbclass
- Fix 'endianess' typo in the variablename, but keeping the old one around for
  compatibility reasons
- Instead of specifically looking for '${FILE_DIRNAME}/site-${PV}/<sitefile>',
  leverage FILESPATH.  Now it searches the paths in both BBPATH and FILESPATH
  for "site/<sitefile>".

Signed-off-by: Chris Larson <clarson@kergoth.com>

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 8a5b982..bc12ac3 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -28,11 +28,9 @@ DEPENDS_prepend = "${@autotools_dep_prepend(d)}"
 DEPENDS_virtclass-native_prepend = "${@autotools_dep_prepend(d)}"
 DEPENDS_virtclass-nativesdk_prepend = "${@autotools_dep_prepend(d)}"
 
-inherit siteinfo
-
 # Space separated list of shell scripts with variables defined to supply test
 # results for autoconf tests we cannot run at build time.
-export CONFIG_SITE = "${@siteinfo_get_files(d)}"
+export CONFIG_SITE = "${@' '.join(siteinfo_get_files(d))}"
 
 acpaths = "default"
 EXTRA_AUTORECONF = "--exclude=autopoint"
diff --git a/classes/base.bbclass b/classes/base.bbclass
index e26a45e..c5c22d0 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1,5 +1,6 @@
 BB_DEFAULT_TASK ?= "build"
 
+inherit siteinfo
 inherit patch
 inherit staging
 
diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index ebea487..e2f290b 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -15,121 +15,103 @@
 # It is an error for the target not to exist.
 # If 'what' doesn't exist then an empty value is returned
 #
-def get_siteinfo_list(d):
-       target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
+def siteinfo_get_filenames(d):
+    if bb.data.inherits_class("native", d):
+        return
 
-       targetinfo = {\
-               "arm-darwin":              "endian-little bit-32 common-darwin",\
-               "arm-darwin9":             "endian-little bit-32 common-darwin",\
-               "arm-linux":               "endian-little bit-32 common-linux common-glibc arm-common",\
-               "arm-linux-gnueabi":       "endian-little bit-32 common-linux common-glibc arm-common arm-linux",\
-               "arm-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc arm-common",\
-               "arm-linux-uclibceabi":    "endian-little bit-32 common-linux common-uclibc arm-common arm-linux-uclibc",\
-               "armeb-linux":             "endian-big bit-32 common-linux common-glibc arm-common",\
-               "armeb-linux-gnueabi":     "endian-big bit-32 common-linux common-glibc arm-common armeb-linux",\
-               "armeb-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc arm-common",\
-               "armeb-linux-uclibceabi":  "endian-big bit-32 common-linux common-uclibc arm-common armeb-linux-uclibc",\
-               "avr32-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc avr32-common",\
-               "bfin-uclinux-uclibc":     "endian-little bit-32 common-uclibc bfin-common",\
-               "i386-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
-               "i386-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i386-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
-               "i386-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
-               "i486-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
-               "i486-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i486-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
-               "i486-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
-               "i586-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
-               "i586-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i586-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
-               "i586-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
-               "i686-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
-               "i686-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i686-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
-               "i686-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
-               "ia64-linux":              "endian-little bit-64 common-linux common-glibc",\
-               "mips-linux":              "endian-big bit-32 common-linux common-glibc mips-common",\
-               "mips-linux-uclibc":       "endian-big bit-32 common-linux common-uclibc mips-common",\
-               "mipsel-linux":            "endian-little bit-32 common-linux common-glibc mips-common",\
-               "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc mips-common",\
-               "powerpc-darwin":          "endian-big bit-32 common-darwin",\
-               "powerpc-linux":           "endian-big bit-32 common-linux common-glibc powerpc-common",\
-               "powerpc-linux-gnuspe":    "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
-               "powerpc-linux-uclibc":    "endian-big bit-32 common-linux common-uclibc powerpc-common",\
-               "powerpc-linux-uclibcspe": "endian-big bit-32 common-linux common-uclibc powerpc-common powerpc-linux-uclibc",\
-               "ppc-linux":               "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
-               "ppc64-linux":             "endian-big bit-64 common-linux common-glibc powerpc-common powerpc64-linux",\
-               "sh3-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
-               "sh4-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
-               "sh4-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc sh-common",\
-               "sparc-linux":             "endian-big bit-32 common-linux common-glibc",\
-               "viac3-linux":             "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "x86_64-linux":            "endian-little bit-64 common-linux common-glibc",\
-               "x86_64-linux-uclibc":     "endian-little bit-64 common-linux common-uclibc"}
-       if target in targetinfo:
-               info = targetinfo[target].split()
-               info.append(target)
-               info.append("common")
-               return info
-       else:
-               bb.error("Information not available for target '%s'" % target)
+    archinfo = {
+        "arm": "endian-little bit-32 arm-common",
+        "armeb": "endian-big bit-32 arm-common",
+        "avr32": "endian-big bit-32 avr32-common",
+        "bfin": "endian-little bit-32 bfin-common",
+        "i386": "endian-little bit-32 ix86-common",
+        "i486": "endian-little bit-32 ix86-common",
+        "i586": "endian-little bit-32 ix86-common",
+        "i686": "endian-little bit-32 ix86-common",
+        "ia64": "endian-little bit-64",
+        "mips": "endian-big bit-32 mips-common",
+        "mipsel": "endian-little bit-32 mips-common",
+        "powerpc": "endian-big bit-32 powerpc-common",
+        "powerpc64": "endian-big bit-64 powerpc-common powerpc64-linux",
+        "ppc": "endian-big bit-32 powerpc-common",
+        "ppc64": "endian-big bit-64 powerpc-common powerpc64-linux",
+        "sh3": "endian-little bit-32 sh-common",
+        "sh4": "endian-little bit-32 sh-common",
+        "sparc": "endian-big bit-32",
+        "viac3": "endian-little bit-32 ix86-common",
+        "x86_64": "endian-little bit-64",
+    }
+    osinfo = {
+        "darwin": "common-darwin",
+        "darwin9": "common-darwin",
+        "linux": "common-linux common-glibc",
+        "linux-gnueabi": "common-linux common-glibc",
+        "linux-gnuspe": "common-linux common-glibc",
+        "linux-uclibc": "common-linux common-uclibc",
+        "linux-uclibceabi": "common-linux common-uclibc",
+        "linux-uclibcspe": "common-linux common-uclibc",
+        "uclinux-uclibc": "common-uclibc",
+        "cygwin": "common-cygwin",
+        "mingw32": "common-mingw",
+    }
+    targetinfo = {
+        "arm-linux-gnueabi":    "arm-linux",
+        "arm-linux-uclibceabi":    "arm-linux-uclibc",
+        "armeb-linux-gnueabi":     "armeb-linux",
+        "armeb-linux-uclibceabi":  "armeb-linux-uclibc",
+        "powerpc-linux-gnuspe":    "powerpc-linux",
+        "powerpc-linux-uclibcspe": "powerpc-linux-uclibc",
+    }
 
+    arch = bb.data.getVar("HOST_ARCH", d, True)
+    os = bb.data.getVar("HOST_OS", d, True)
+    target = "%s-%s" % (arch, os)
 
-#
-# Define which site files to use. We check for several site files and
-# use each one that is found, based on the list returned by get_siteinfo_list()
-#
-# Search for the files in the following directories:
-# 1) ${BBPATH}/site (in reverse) - app specific, then site wide
-# 2) ${FILE_DIRNAME}/site-${PV}         - app version specific
-#
-def siteinfo_get_files(d):
-       sitefiles = ""
+    sitefiles = []
+    if arch in archinfo:
+        sitefiles.extend(archinfo[arch].split())
+    if os in osinfo:
+        sitefiles.extend(osinfo[os].split())
+    if target in targetinfo:
+        sitefiles.extend(targetinfo[target].split())
+    sitefiles.append(target)
+    sitefiles.append("common")
 
-       # Determine which site files to look for
-       sites = get_siteinfo_list(d)
-       sites.append("common");
+    return sitefiles
 
-       # Check along bbpath for site files and append in reverse order so
-       # the application specific sites files are last and system site
-       # files first.
-       path_bb = bb.data.getVar('BBPATH', d, 1)
-       for p in (path_bb or "").split(':'):
-               tmp = ""
-               for i in sites:
-                       fname = os.path.join(p, 'site', i)
-                       if os.path.exists(fname):
-                               tmp += fname + " "
-               sitefiles = tmp + sitefiles;
-
-       # Now check for the applications version specific site files
-       path_pkgv = os.path.join(bb.data.getVar('FILE_DIRNAME', d, 1), "site-" + bb.data.getVar('PV', d, 1))
-       for i in sites:
-               fname = os.path.join(path_pkgv, i)
-               if os.path.exists(fname):
-                       sitefiles += fname + " "
+def siteinfo_get_files(d):
+    import itertools
 
-       bb.debug(1, "SITE files " + sitefiles);
-       return sitefiles
+    paths = itertools.chain(bb.data.getVar("BBPATH", d, True).split(":"),
+                            bb.data.getVar("FILESPATH", d, True).split(":"))
+    for filename in siteinfo_get_filenames(d):
+        for p in paths:
+            fullpath = os.path.join(p, "site", filename)
+            if os.path.exists(fullpath):
+                yield fullpath
 
-def siteinfo_get_endianess(d):
-       info = get_siteinfo_list(d)
-       if 'endian-little' in info:
-              return "le"
-       elif 'endian-big' in info:
-              return "be"
-       bb.error("Site info could not determine endianess for target")
+# Compatibility
+SITEINFO_ENDIANESS = "${SITEINFO_ENDIANNESS}"
 
-def siteinfo_get_bits(d):
-       info = get_siteinfo_list(d)
-       if 'bit-32' in info:
-              return "32"
-       elif 'bit-64' in info:
-              return "64"
-       bb.error("Site info could not determine bit size for target")
+python siteinfo_check_sanity () {
+    if isinstance(e, bb.event.ConfigParsed):
+        sitefiles = set(siteinfo_get_filenames(e.data))
+        if "endian-little" in sitefiles:
+            bb.data.setVar("SITEINFO_ENDIANNESS", "le", e.data)
+        elif "endian-big" in sitefiles:
+            bb.data.setVar("SITEINFO_ENDIANNESS", "be", e.data)
+        else:
+            bb.error("Unable to determine endianness for architecture '%s'" %
+                     bb.data.getVar("HOST_ARCH", e.data, True))
+            bb.fatal("Please add your architecture to siteinfo.bbclass")
 
-#
-# Make some information available via variables
-#
-SITEINFO_ENDIANESS  = "${@siteinfo_get_endianess(d)}"
-SITEINFO_BITS       = "${@siteinfo_get_bits(d)}"
+        if "bit-32" in sitefiles:
+            bb.data.setVar("SITEINFO_BITS", "32", e.data)
+        elif "bit-64" in sitefiles:
+            bb.data.setVar("SITEINFO_BITS", "64", e.data)
+        else:
+            bb.error("Unable to determine bit size for architecture '%s'" %
+                     bb.data.getVar("HOST_ARCH", e.data, True))
+            bb.fatal("Please add your architecture to siteinfo.bbclass")
+}
+addhandler siteinfo_check_sanity
diff --git a/recipes/apex/apex-nslu2-16mb_1.5.14.bb b/recipes/apex/apex-nslu2-16mb_1.5.14.bb
index 8e764dd..912873c 100644
--- a/recipes/apex/apex-nslu2-16mb_1.5.14.bb
+++ b/recipes/apex/apex-nslu2-16mb_1.5.14.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "http://wiki.buici.com/twiki/bin/view/Main/ApexBootloader"
 LICENSE = "GPL"
 PR = "r3"
 
-inherit siteinfo
-
 SRC_URI = "ftp://ftp.buici.com/pub/apex/apex-${PV}.tar.gz \
 	   file://defconfig"
 S = ${WORKDIR}/apex-${PV}
diff --git a/recipes/apex/apex-nslu2_1.5.14.bb b/recipes/apex/apex-nslu2_1.5.14.bb
index a1d91b7..92acf12 100644
--- a/recipes/apex/apex-nslu2_1.5.14.bb
+++ b/recipes/apex/apex-nslu2_1.5.14.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "http://wiki.buici.com/twiki/bin/view/Main/ApexBootloader"
 LICENSE = "GPL"
 PR = "r3"
 
-inherit siteinfo
-
 SRC_URI = "ftp://ftp.buici.com/pub/apex/apex-${PV}.tar.gz \
 	   file://defconfig"
 S = ${WORKDIR}/apex-${PV}
diff --git a/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb b/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
index f02cc95..aec8329 100644
--- a/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
+++ b/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
@@ -18,8 +18,6 @@ SRC_URI[sha256sum] = "20fc8f095b2d6894e5fd8156c870686aced5edee964b0dd7163163327a
 
 S = ${WORKDIR}/arm-kernel-shim-${PV}
 
-inherit siteinfo
-
 CMDLINE_CONSOLE = "console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "ttyS0"}"
 
 CMDLINE_ROOT_DSMG600 = "root=/dev/mtdblock2 rootfstype=jffs2 rootflags=noatime rw init=/linuxrc"
diff --git a/recipes/espeak/espeak_1.37.bb b/recipes/espeak/espeak_1.37.bb
index fb94bd3..70723e3 100644
--- a/recipes/espeak/espeak_1.37.bb
+++ b/recipes/espeak/espeak_1.37.bb
@@ -1,5 +1,4 @@
 require espeak.inc
-inherit siteinfo
 
 EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANESS", "be",  "espeak-data (= ${PV})", "", d)}'
 RDEPENDS_${PN} = "portaudio-v19 ${EXTRA_PHONEMES}"
diff --git a/recipes/hping/hping2_1.9.9+2.0.0rc3.bb b/recipes/hping/hping2_1.9.9+2.0.0rc3.bb
index 4a7fe8b..84e5ac5 100644
--- a/recipes/hping/hping2_1.9.9+2.0.0rc3.bb
+++ b/recipes/hping/hping2_1.9.9+2.0.0rc3.bb
@@ -14,8 +14,6 @@ SRC_URI = "http://www.hping.org/hping2.0.0-rc3.tar.gz \
 	   file://hping2_configure.patch"
 S = "${WORKDIR}/hping2-rc3"
 
-inherit siteinfo
-
 #
 # We've patched configure to accept byte order and ostype as env
 # variables Pass those values in to stop it trying to figure it out
diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 329c661..753961d 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -6,8 +6,6 @@ SECTION = "libs/network"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz;name=src"
 S = "${WORKDIR}/openssl-${PV}"
 
-inherit siteinfo
-
 INC_PR = "r12"
 
 AR_append = " r"
diff --git a/recipes/openttd/openttd.inc b/recipes/openttd/openttd.inc
index b1a5e95..bbbe3a0 100644
--- a/recipes/openttd/openttd.inc
+++ b/recipes/openttd/openttd.inc
@@ -13,7 +13,7 @@ SRC_URI = "http://binaries.openttd.org/releases/${PV}/${P}-source.tar.bz2"
 
 APPIMAGE = "media/openttd.48.png"
 
-inherit siteinfo sdl
+inherit sdl
 
 do_configure() {
 	# The way the OTTD configure system handles the application's directories
diff --git a/recipes/openttd/openttd_0.7.4.bb b/recipes/openttd/openttd_0.7.4.bb
index e052d1e..c8822cf 100644
--- a/recipes/openttd/openttd_0.7.4.bb
+++ b/recipes/openttd/openttd_0.7.4.bb
@@ -5,7 +5,7 @@ DEPENDS = "libsdl-net libpng zlib freetype fontconfig"
 RRECOMMENDS_${PN} = "openttd-gfx openttd-sfx"
 PR = "r1"
 
-inherit siteinfo sdl
+inherit sdl
 
 SRC_URI ="http://binaries.openttd.org/releases/${PV}/${P}-source.tar.bz2 "
 SRC_URI_append_shr = " file://openttd.cfg"
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 4f4c468..bf89c6f 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -41,8 +41,6 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-5.8.8.tar.gz;name=perl588ta
         file://config.sh-64-le \
         file://config.sh-64-be"
 
-inherit siteinfo
-
 # Where to find the native perl
 HOSTPERL = "${STAGING_BINDIR_NATIVE}/perl${PV}"
 
diff --git a/recipes/qt4/qt4_arch.inc b/recipes/qt4/qt4_arch.inc
index 7f4be63..c00302e 100644
--- a/recipes/qt4/qt4_arch.inc
+++ b/recipes/qt4/qt4_arch.inc
@@ -1,5 +1,3 @@
-inherit siteinfo
-
 ARM_INSTRUCTION_SET = "arm"
 
 def qt_arch(d):
-- 
1.7.0.4



