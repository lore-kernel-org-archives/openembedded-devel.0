Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pcwqe-0002Rn-2d
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:18:32 +0100
Received: by iwn8 with SMTP id 8so316125iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 01:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=dLhYjKmc6EM3IDL/guR1eL9xILUNUgTlSmolZ0VbXeY=;
	b=GXaSJz6obaNRkD5xS5BuoxR3xq7CXNQc2cZkpshEXeeGbIecXyR/67+TtMvx4GZkz/
	f2rOxeIOin3dod/8XDe4YMsqxVI8XdAEm1xKWPC+3QxI2QZRlIjyCfFHYKZu/WsSZuXb
	+rSrCCNEG0nmWMsRWZtXQPrzHpKDCRIPUZwxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=G6NLisnO4yXS9shTEeqX+epS9B62B98tsWpwK4Xjjd6DCMWbMmHqfsA42uXHcpgSMG
	F0ugOSLCNxk87YIbCZKNLLMns5mrY/uYqPQPQ/BieBRSDuEJ7A+q1QmR70J27Da4iBYy
	GRDfeBjDwFgzQrmzHTh13h0CQ/0lSHcfPEL2A=
Received: by 10.42.239.129 with SMTP id kw1mr676513icb.522.1294823870258;
	Wed, 12 Jan 2011 01:17:50 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i16sm446711ibl.0.2011.01.12.01.17.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 01:17:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 01:17:43 -0800
Message-Id: <1294823863-13419-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: koen@dominion.thruhere.net
Subject: [PATCH v2] eglibc: Configure based on DISTRO_FEATURES_EGLIBC
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
X-List-Received-Date: Wed, 12 Jan 2011 09:18:32 -0000

* Let distros decide what features to enable if not
  selected it will turn off all possible knobs

* Enable all knobs for angstrom and distros based on
  sane-toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: koen@dominion.thruhere.net
CC: koansoftware@gmail.com
---
 conf/distro/include/eglibc.inc    |    8 +++
 recipes/eglibc/eglibc-options.inc |   89 +++++++++++++++++++------------------
 recipes/eglibc/eglibc.inc         |    4 +-
 3 files changed, 55 insertions(+), 46 deletions(-)

diff --git a/conf/distro/include/eglibc.inc b/conf/distro/include/eglibc.inc
index 5115e7f..cd66442 100644
--- a/conf/distro/include/eglibc.inc
+++ b/conf/distro/include/eglibc.inc
@@ -18,3 +18,11 @@ OLDEST_KERNEL ?= "2.4.0"
 OLDEST_KERNEL_linux-gnueabi ?= "2.6.16"
 OLDEST_KERNEL_sparc64 ?= "2.4.21"
 OLDEST_KERNEL_ppc64 ?= "2.4.21"
+DISTRO_FEATURES_EGLIBC ?= "ipv6 backtrace big-macros bsd cxx-tests catgets \
+                           charsets crypt crypt-ufc db-aliases envz fcvt fmtmsg \
+                           fstab ftraverse getlogin idn inet inet-anl libm \
+                           libm-big locales locale-code memusage nis nsswitch \
+                           rcmd rtld-debug spawn streams sunrpc utmp utmpx \
+                           wordexp posix-clang-wchar posix-regexp \
+                           posix-regexp-glibc posix-wchar-io"
+
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



