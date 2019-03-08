Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D5E147CF0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 02:23:47 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a3so12945307pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PnXlZNsYLtoNaXJ6CfUENMIS+q7wooQRfuH/VStqYSw=;
	b=gtB6vDyQaJajVhJEOekPasgB3oOZD8Ky1s/Qyyti8PBV7sKdracrFo7ByjT/nNp3Z6
	7B3BBvoyalP2eQXIc7RZyPfcVv9avUaeFJ+5KiEq/KJCkQmdXH9M6ON2qZQXIajjpmhw
	kjHszbzkrBNQEh7RuQCHOJLzGUHBbxdq+2AatkcHqnuji+jW1qBnnx8StdqiR2tgbDSB
	pA+D9LtrTz79Ts1zygvTVhT+LrMESwn5GVI1SWXDlU1gSY6qun2JhaWkPj8hCzEvMYJf
	R42nQHzomQum7vo187qqBJrTTuNg+8B6JHsk2/llE4NdiLuTA513ukr1AbJjhGGoPdbF
	8Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PnXlZNsYLtoNaXJ6CfUENMIS+q7wooQRfuH/VStqYSw=;
	b=M+4gZXGW+M6NBi6up4CsarOMMo8Z6sAv4TQ6LFamXggQdeOHzNWArVHRuqcD3O7VXF
	8QqL4y2/i7R+03t1CDKyR3h9hoC8Kt3StL+XggnM+RqVgKD/u7cEeHxVvPm7PadphwTv
	CQd5+A79wb9kLoEhg0BXa/HT5kP60+0pxMKfrfz/3Vjr2p6jYPP4dniWWghIRx1spzpZ
	8vZJqIuDjd7v+AcAU94IWw57eUKeWJpM5weSSo9Qb10CHkpo6UT7wIyEb/SiJNAXjv7A
	XyS1toJWYej5h6NksAtrygqzDD7xl2gGGc6Y7x6ix+xWq18Fh+VRr6QsnIOKsCSPQga0
	IESQ==
X-Gm-Message-State: APjAAAUb9gAHAiX7UZWwMT1SKofCVdLYffRfwt6QguTM+GkGBJ43eSzw
	xfmigb6Kb58kcUhripT9yNHgo+zU
X-Google-Smtp-Source: APXvYqxz3KRphUXTp4YWTx9h9Q0OOTvxe5d3Xmdlqd6DYeKdmwlCKI9GXnATZWx21RCjN8DPlm6yWA==
X-Received: by 2002:a17:902:7042:: with SMTP id
	h2mr15992046plt.323.1552011828428; 
	Thu, 07 Mar 2019 18:23:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	n75sm17685600pfb.39.2019.03.07.18.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 18:23:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 18:23:40 -0800
Message-Id: <20190308022340.35951-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix: Upgrade to 3.4.1 release
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
X-List-Received-Date: Fri, 08 Mar 2019 02:23:48 -0000
Content-Transfer-Encoding: 8bit

Fix build with kernel >= 5.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../postfix/files/linux_5.x.patch             | 27 +++++++++++++++++++
 .../{postfix_3.3.1.bb => postfix_3.4.1.bb}    |  6 ++---
 2 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/linux_5.x.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.3.1.bb => postfix_3.4.1.bb} (66%)

diff --git a/meta-networking/recipes-daemons/postfix/files/linux_5.x.patch b/meta-networking/recipes-daemons/postfix/files/linux_5.x.patch
new file mode 100644
index 0000000000..fbb811c06b
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/linux_5.x.patch
@@ -0,0 +1,27 @@
+Recognise kernel 5.x versioning scheme
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/makedefs
++++ b/makedefs
+@@ -543,7 +543,7 @@ EOF
+ 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
+ 		: ${PLUGIN_LD="${CC-gcc} -shared"}
+ 		;;
+-  Linux.[34].*)	SYSTYPE=LINUX$RELEASE_MAJOR
++  Linux.[345].*)	SYSTYPE=LINUX$RELEASE_MAJOR
+ 		case "$CCARGS" in
+ 		 *-DNO_DB*) ;;
+ 		 *-DHAS_DB*) ;;
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -749,7 +749,7 @@ extern int initgroups(const char *, int)
+  /*
+   * LINUX.
+   */
+-#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4)
++#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5)
+ #define SUPPORTED
+ #define UINT32_TYPE	unsigned int
+ #define UINT16_TYPE	unsigned short
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.1.bb
similarity index 66%
rename from meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.1.bb
index 6718b7ef93..73380d8c63 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.1.bb
@@ -4,9 +4,9 @@ SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patc
             file://postfix-install.patch \
             file://icu-config.patch \
             file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+            file://linux_5.x.patch \
            "
-
-SRC_URI[md5sum] = "4381c6492f415e4a69cf5099d4acea76"
-SRC_URI[sha256sum] = "54f514dae42b5275cb4bc9c69283f16c06200b71813d0bb696568c4ba7ae7e3b"
+SRC_URI[md5sum] = "d292bb49a1c79ff6d2eb9c5e88c51425"
+SRC_URI[sha256sum] = "8c9763f7a8ec70d499257b7f25bb50e1f3da8a4c43e59826ba8a26c4a778d0ce"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.21.0


