Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcwO6-0001Fp-A7
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 09:49:03 +0100
Received: by pwi8 with SMTP id 8so72035pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 00:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=qiyp0hCRWT0Rcceby++0WBxk0dMnDVHxnHeZKKbx3l4=;
	b=QgFPIhAR9ZNm2YkO4zJ5VnYZflq1SYA6dAe5kgY09KeiX8moth6UMXhj43eccZ3hjE
	sTs1GNq+TToMxD19dSkZ2MCvPdhsRx6Vwb60Dv7e2FfvSyNrzdd5jhP/10qmj4nXqj8/
	xHZYoStHbxotKLlQt+6ozAsxlJiljMEefzcx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VkKJQIEYDHEijiAoPXUZbA6fb4/n/u8m+OcCr/wP3PmwzUosoyY0zTSV1YXkSCl251
	w/EIN44rVz7J3pcePBAYweMeuFFOkq6IJ7ZMMxX/W/wiGltw8erIE1JgUFxAS/Q879w9
	gD7/dFnnH71e9IbgRaWcCTZccqQprUdHTYx9Q=
Received: by 10.142.199.19 with SMTP id w19mr646003wff.390.1294822106917;
	Wed, 12 Jan 2011 00:48:26 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p8sm537855wff.4.2011.01.12.00.48.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 00:48:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 00:48:15 -0800
Message-Id: <1294822095-10559-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: k.kooi@student.utwente.nl
Subject: [PATCH] eglibc: Configure based on DISTRO_FEATURES_EGLIBC
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
X-List-Received-Date: Wed, 12 Jan 2011 08:49:03 -0000

* Let distros decide what features to enable if not
  selected it will turn off all possible knobs

* Enable all knobs for angstrom and distros based on
  sane-toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: k.kooi@student.utwente.nl
CC: koansoftware@gmail.com
---
 conf/distro/include/angstrom-eglibc.inc       |    8 ++-
 conf/distro/include/sane-toolchain-eglibc.inc |    8 ++
 recipes/eglibc/eglibc-options.inc             |   89 +++++++++++++------------
 recipes/eglibc/eglibc.inc                     |    4 +-
 4 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
index f0ef802..1e3b971 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -26,4 +26,10 @@ BUILD_OPTIMIZATION_sparc = "-O2"
 TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
-
+DISTRO_FEATURES_EGLIBC ?= "ipv6 backtrace big-macros bsd cxx-tests catgets \
+                           charsets crypt crypt-ufc db-aliases envz fcvt fmtmsg \
+                           fstab ftraverse getlogin idn inet inet-anl libm \
+                           libm-big locales locale-code memusage nis nsswitch \
+                           rcmd rtld-debug spawn streams sunrpc utmp utmpx \
+                           wordexp posix-clang-wchar posix-regexp \
+                           posix-regexp-glibc posix-wchar-io"
diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index daab0f8..75fd8e3 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -24,3 +24,11 @@ BUILD_OPTIMIZATION_sparc = "-O2"
 TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
+
+DISTRO_FEATURES_EGLIBC ?= "ipv6 backtrace big-macros bsd cxx-tests catgets \
+                           charsets crypt crypt-ufc db-aliases envz fcvt fmtmsg \
+                           fstab ftraverse getlogin idn inet inet-anl libm \
+                           libm-big locales locale-code memusage nis nsswitch \
+                           rcmd rtld-debug spawn streams sunrpc utmp utmpx \
+                           wordexp posix-clang-wchar posix-regexp \
+                           posix-regexp-glibc posix-wchar-io"
diff --git a/recipes/eglibc/eglibc-options.inc b/recipes/eglibc/eglibc-options.inc
index d552bbc..5e21d3c 100644
--- a/recipes/eglibc/eglibc-options.inc
+++ b/recipes/eglibc/eglibc-options.inc
@@ -1,50 +1,51 @@
 def eglibc_cfg(feature, features, tokens, cnf ):
-        if type(tokens) == type(""):
-                tokens = [tokens]
-        if type(features) == type([]) and feature in features:
-                cnf.extend([token + ' = n' for token in tokens])
+	if type(tokens) == type(""):
+		tokens = [tokens]
+	if type(features) == type([]) and feature in features:
+		cnf.extend([token + ' = y' for token in tokens])
+	else:
+		cnf.extend([token + ' = n' for token in tokens])
 
 # Map distro features to eglibc options settings
 def features_to_eglibc_settings(d):
         cnf = ([])
-        distro_features = bb.data.getVar('DISTRO_FEATURES', d, True).split()
-        eglibc_cfg('noinet6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
-        eglibc_cfg('nobacktrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
-        eglibc_cfg('nobig-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
-        eglibc_cfg('nobsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
-        eglibc_cfg('nocxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
-        eglibc_cfg('nocatgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
-        eglibc_cfg('nocharsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
-        eglibc_cfg('nocrypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
-        eglibc_cfg('nocrypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
-        eglibc_cfg('nodb-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
-        eglibc_cfg('noenvz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
-        eglibc_cfg('nofcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
-        eglibc_cfg('nofmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
-        eglibc_cfg('nofstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
-        eglibc_cfg('noftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
-        eglibc_cfg('nogetlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
-        eglibc_cfg('noidn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
-        eglibc_cfg('noinet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
-        eglibc_cfg('noinet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
-        eglibc_cfg('nolibm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
-        eglibc_cfg('nolibm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
-        eglibc_cfg('nolocales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
-        eglibc_cfg('nolocale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
-        eglibc_cfg('nomemusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
-        eglibc_cfg('nonis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
-        eglibc_cfg('nonsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
-        eglibc_cfg('norcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
-        eglibc_cfg('nortld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
-        eglibc_cfg('nospawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
-        eglibc_cfg('nostreams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
-        eglibc_cfg('nosunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
-        eglibc_cfg('noutmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
-        eglibc_cfg('noutmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
-        eglibc_cfg('nowordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
-        eglibc_cfg('noposix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
-        eglibc_cfg('noposix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
-        eglibc_cfg('noposix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
-        eglibc_cfg('noposix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
+        distro_features = bb.data.getVar('DISTRO_FEATURES_EGLIBC', d, True).split()
+        eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
+        eglibc_cfg('backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
+        eglibc_cfg('big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
+        eglibc_cfg('bsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
+        eglibc_cfg('cxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
+        eglibc_cfg('catgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
+        eglibc_cfg('charsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
+        eglibc_cfg('crypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
+        eglibc_cfg('crypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
+        eglibc_cfg('db-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
+        eglibc_cfg('envz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
+        eglibc_cfg('fcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
+        eglibc_cfg('fmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
+        eglibc_cfg('fstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
+        eglibc_cfg('ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
+        eglibc_cfg('getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
+        eglibc_cfg('idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
+        eglibc_cfg('inet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
+        eglibc_cfg('inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
+        eglibc_cfg('libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
+        eglibc_cfg('libm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
+        eglibc_cfg('locales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
+        eglibc_cfg('locale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
+        eglibc_cfg('memusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
+        eglibc_cfg('nis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
+        eglibc_cfg('nsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
+        eglibc_cfg('rcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
+        eglibc_cfg('rtld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
+        eglibc_cfg('spawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
+        eglibc_cfg('streams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
+        eglibc_cfg('sunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
+        eglibc_cfg('utmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
+        eglibc_cfg('utmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
+        eglibc_cfg('wordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
+        eglibc_cfg('posix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
+        eglibc_cfg('posix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
+        eglibc_cfg('posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
+        eglibc_cfg('posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
         return "\n".join(cnf)
-
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index c9765dd..02209eb 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r20"
+INC_PR = "r21"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
@@ -44,5 +44,5 @@ do_move_ports() {
 }
 OE_FEATURES := "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
-	echo '${OE_FEATURES}' > ${S}/option-groups.config
+	echo '${OE_FEATURES}' > ${B}/option-groups.config
 }
-- 
1.7.2.3



