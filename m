Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pb8cx-0007BC-QG
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 10:28:56 +0100
Received: by iyj18 with SMTP id 18so16402532iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 01:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=OtVq2eTCqio98sy/zXzkPW4xJ0bLNsoPFDSWxD+AouQ=;
	b=FiU+nC6NtQueFXsCTokGEq3cVDGNUtZVc+VO0NhEQDZqMo44/VgLBmA0MrmAfwdN3/
	0YagVSZ5oCNpX9NnIY3+wPvx4Zjsmeh266Om00By1X+N85rMMbi9G8QntkiHW0LCGEDV
	m1vSTwMpVoYq9L54oQh2wBzRTI3JhQaIN8FNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VTo98tit4awdhwX2T8DdR0lvMUOAicQv/mvUAZnXGDQbCKh3Lt6Lw4k5yz+Mb4ae5x
	KTw9WpyMqQMW1TtxCsUkHmIZ8rCRYREg0MosLUEcg/CnAuxjN61jZg2j3Oi0ZTMMqurc
	ptJVsSRclWZjsCGOH/pQhhcco39hELwhNlYDo=
Received: by 10.42.241.3 with SMTP id lc3mr635722icb.347.1294392505569;
	Fri, 07 Jan 2011 01:28:25 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm22778265ibg.9.2011.01.07.01.28.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 Jan 2011 01:28:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 01:28:17 -0800
Message-Id: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Fri, 07 Jan 2011 09:28:56 -0000

* Look for disabled features in DISTRO_FEATURES and disable them while building eglibc
* By default all features are built
* One can disable a feature by specifying DISTRO_FEATURES += "noinet6 nobsd ...." e.g.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-options.inc |   50 +++++++++++++++++++++++++++++++++++++
 recipes/eglibc/eglibc.inc         |    7 ++++-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 recipes/eglibc/eglibc-options.inc

diff --git a/recipes/eglibc/eglibc-options.inc b/recipes/eglibc/eglibc-options.inc
new file mode 100644
index 0000000..d552bbc
--- /dev/null
+++ b/recipes/eglibc/eglibc-options.inc
@@ -0,0 +1,50 @@
+def eglibc_cfg(feature, features, tokens, cnf ):
+        if type(tokens) == type(""):
+                tokens = [tokens]
+        if type(features) == type([]) and feature in features:
+                cnf.extend([token + ' = n' for token in tokens])
+
+# Map distro features to eglibc options settings
+def features_to_eglibc_settings(d):
+        cnf = ([])
+        distro_features = bb.data.getVar('DISTRO_FEATURES', d, True).split()
+        eglibc_cfg('noinet6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
+        eglibc_cfg('nobacktrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
+        eglibc_cfg('nobig-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
+        eglibc_cfg('nobsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
+        eglibc_cfg('nocxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
+        eglibc_cfg('nocatgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
+        eglibc_cfg('nocharsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
+        eglibc_cfg('nocrypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
+        eglibc_cfg('nocrypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
+        eglibc_cfg('nodb-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
+        eglibc_cfg('noenvz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
+        eglibc_cfg('nofcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
+        eglibc_cfg('nofmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
+        eglibc_cfg('nofstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
+        eglibc_cfg('noftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
+        eglibc_cfg('nogetlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
+        eglibc_cfg('noidn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
+        eglibc_cfg('noinet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
+        eglibc_cfg('noinet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
+        eglibc_cfg('nolibm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
+        eglibc_cfg('nolibm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
+        eglibc_cfg('nolocales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
+        eglibc_cfg('nolocale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
+        eglibc_cfg('nomemusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
+        eglibc_cfg('nonis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
+        eglibc_cfg('nonsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
+        eglibc_cfg('norcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
+        eglibc_cfg('nortld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
+        eglibc_cfg('nospawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
+        eglibc_cfg('nostreams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
+        eglibc_cfg('nosunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
+        eglibc_cfg('noutmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
+        eglibc_cfg('noutmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
+        eglibc_cfg('nowordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
+        eglibc_cfg('noposix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
+        eglibc_cfg('noposix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
+        eglibc_cfg('noposix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
+        eglibc_cfg('noposix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
+        return "\n".join(cnf)
+
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 0644d49..c9765dd 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r19"
+INC_PR = "r20"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
@@ -17,6 +17,7 @@ RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 PROVIDES_${PN}-dbg = "glibc-dbg"
 
 inherit autotools
+require eglibc-options.inc
 
 LEAD_SONAME = "libc.so"
 
@@ -41,3 +42,7 @@ do_move_ports() {
 	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
 	fi
 }
+OE_FEATURES := "${@features_to_eglibc_settings(d)}"
+do_configure_prepend() {
+	echo '${OE_FEATURES}' > ${S}/option-groups.config
+}
-- 
1.7.2.3



