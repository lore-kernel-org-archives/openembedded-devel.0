Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E28287ED3D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 18:59:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c3so2888638pfa.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nbaivUiuB41Ox7ktbvI8eQAbtUA1g0OefCcV3bOndjk=;
	b=JiInR199HCajsieAji9mYB/lB1wMqbSzXz8h5SkjEFp8e2FdNYzSYXmeiOL7jLxmNH
	tsX8cTNE35VwxTR4gllXwQ9lbwwAxhwT7JchaSLYGkeaw5yFfy4wXN0nUuWEwChFVUXU
	qlvJRCE99ccRRLVkDJwi9Ad9FqIeXUfyezlMzqmI3sS+febDVnbZtkAobxsMO1pm5Ajn
	6w/xvsDUF7/bqaPb7s9mqscd0BsDNPfJxbLV/Z8e9LC1u9+q7ztl21b00w0Gv1fGJAxZ
	itC8xA32TlhSImBBfomZjRcyHAkVP7rUFuyFWIsGt/+jOifhQWQTrz/uWIBViqH3bbJx
	QGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nbaivUiuB41Ox7ktbvI8eQAbtUA1g0OefCcV3bOndjk=;
	b=hoNjRSY/rFGRvifCztdWWZRYvtg6M7v1IIyMSV5yWgKDxyhvhnraP3la8gruRd6xcZ
	MtvJM524tjsULnV2hO3n6HpOnjiCGRpyEll7esY6MVWQoZ06zCfeNZmzPz2IwbPsKUA7
	2v+exvgLLC7N56idDaaWb0iBfrcVx4/YjDT7yd7FGwpppvAOhX3XqaAzETZyXwsmVCpG
	cQ/wnnMKh6RXa58eNo5iUfK1AVigpHLAk0tSV1VlbMm4PBnGezTaFOZAervsRuulzLLn
	7phRYGcgDaej89jfvLFKxEK7PtZFYnG/HiAhlOWWEG/7SFwJgUiNMJmcFO5cRzfWv9Yh
	F18Q==
X-Gm-Message-State: APjAAAUIEG9VIlYw0huYm2xca2trd6GyUvzARN59K9kkdmLrofdDvlrX
	VpWIbrNab9BqOgW4MRKnAZFu9gokqyw=
X-Google-Smtp-Source: APXvYqxauK69KZUKYLtkVk7z7qSMnM0Ttg09dB3xGqXppWLNUaoRqUln37jXPjG886SSIWjmgsvU0A==
X-Received: by 2002:a62:18d4:: with SMTP id 203mr28832819pfy.165.1564253985701;
	Sat, 27 Jul 2019 11:59:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k22sm60178333pfk.157.2019.07.27.11.59.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 11:59:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 11:59:34 -0700
Message-Id: <20190727185937.29832-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/4] postfix: Fix build failures with glibc 2.30
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jul 2019 18:59:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix.inc       | 11 ------
 .../recipes-daemons/postfix/postfix_3.4.5.bb  | 18 +++++++--
 3 files changed, 51 insertions(+), 15 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
new file mode 100644
index 0000000000..22adaff729
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
@@ -0,0 +1,37 @@
+From 8b3792830f4930fee7fbb00c854d9766f2b74dca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 11:35:38 -0700
+Subject: [PATCH] Fixed build failure with glibc 2.30 due to dropped
+ RES_INSECURE1/2 macros
+
+see [1]
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=333221862ecbebde60dd16e7ca17d26444e62f50
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dns/dns_str_resflags.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/dns/dns_str_resflags.c b/src/dns/dns_str_resflags.c
+index 5f2cce5..df32345 100644
+--- a/src/dns/dns_str_resflags.c
++++ b/src/dns/dns_str_resflags.c
+@@ -60,10 +60,16 @@ static const LONG_NAME_MASK resflag_table[] = {
+     "RES_DEFNAMES", RES_DEFNAMES,
+     "RES_STAYOPEN", RES_STAYOPEN,
+     "RES_DNSRCH", RES_DNSRCH,
++#ifdef RES_INSECURE1
+     "RES_INSECURE1", RES_INSECURE1,
++#endif
++#ifdef RES_INSECURE2
+     "RES_INSECURE2", RES_INSECURE2,
++#endif
+     "RES_NOALIASES", RES_NOALIASES,
++#ifdef RES_USE_INET6
+     "RES_USE_INET6", RES_USE_INET6,
++#endif
+ #ifdef RES_ROTATE
+     "RES_ROTATE", RES_ROTATE,
+ #endif
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 94379412f9..7781005336 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -14,17 +14,6 @@ DEPENDS = "db icu libpcre libnsl2 openssl postfix-native \
 LICENSE = "IPL-1.0 | EPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b181651ad99a7dc4cc8c4ce2f491ed1a"
 
-SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
-    file://makedefs.patch \
-    file://install.patch \
-    file://main.cf \
-    file://postfix \
-    file://internal_recipient \
-    file://postfix.service \
-    file://aliasesdb \
-    file://check_hostname.sh \
-"
-
 S = "${WORKDIR}/postfix-${PV}"
 
 CLEANBROKEN = "1"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
index 3ce8055539..189baea5c3 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
@@ -1,9 +1,19 @@
 require postfix.inc
 
-SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
-            file://postfix-install.patch \
-            file://icu-config.patch \
-            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+           file://makedefs.patch \
+           file://install.patch \
+           file://main.cf \
+           file://postfix \
+           file://internal_recipient \
+           file://postfix.service \
+           file://aliasesdb \
+           file://check_hostname.sh \
+           file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+           file://postfix-install.patch \
+           file://icu-config.patch \
+           file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch \
            "
 SRC_URI[md5sum] = "093109941095390562166de766d4720d"
 SRC_URI[sha256sum] = "8b2ba54f9d2a049582a0ed3ee2dbe96ba57e278feea9cb4f80e1a61844e6319f"
-- 
2.22.0


