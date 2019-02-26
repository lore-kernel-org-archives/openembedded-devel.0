Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C14F7CB9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 06:52:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id c4so5736297pls.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 22:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Ojvwa1hC61Mhg8p1eb537z7P8s51TNlAOyG1LdO404=;
	b=oDq5v5acp+oAdjccS6R+8ZFa4meOhjs/YSujT1kgBOWa+qNFci+tkHDKP6ZwRkwGkJ
	qTI0jNI4aZ4TQUelGaMp1jBQHHTUTLar6g+ZQGzwE6rFLYnzLlcnkpkOkrKPn+f8FUlG
	8P7WV2uInDicK42dSpldRXRe1IKVXEwLXTpz6nKQAy/2QnMeIGkCBS27pVnn2WPye6EU
	t99eFJE56zD76g+TX66unFNNyj7KIox8Od5K7YnQJzGroVb4Ng43kzVOR+g7AKGRGp8n
	FqktI0t7AsYvUx4JnLqau7EOSJ/LBNnSaJum3I5+H6Xa/I9fGpc1c6VyZ6s4QbXlwp62
	rC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Ojvwa1hC61Mhg8p1eb537z7P8s51TNlAOyG1LdO404=;
	b=RktHY++BrzRr7qW2Q0WCv/UQ2pWXTzO4zVPAQRjRODvFq4vLmoGz3bFpH1Amd9zsRv
	cJ4vGsk2ffOOczM2pc//AYQx2G8+rijWyqrh21FycRbHCh4NMkmxSYNaqrfSW7ATyHnN
	2sfSfDXpvTmPP8F7DmE04eQBdiV8BwpBReg0fXkq/gbCLfrrSb+73lh918zGIFxdYg4I
	nie8WkPTdNh10ZKWgLDg3qXKXIDfODHmTVQNRZxjleboM+d2VkfznHtXScT0BVOg8S8R
	7+CHwnpZWhJNv+/b2ffXNipj08RcOS7INjKHQPMfYMzDKMgJgErnzRjA/vIIq/qzGl2F
	7nRA==
X-Gm-Message-State: AHQUAuatmqG/lGEyyaCKUDjn/8KAuFRHh0H8cjPuYnmQsNczD5TgTJO/
	XQvaEsTPHa/23g6M6BcRqekaOL41
X-Google-Smtp-Source: AHgI3IZ/gpB26qGaBKoprg3GjGkbrcwpYpnbtJqATwVwWwmlR7gouz3yhWbXP8EIERrJ/GTdKoWzig==
X-Received: by 2002:a17:902:b117:: with SMTP id
	q23mr25105818plr.160.1551163953385; 
	Mon, 25 Feb 2019 22:52:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1cf2])
	by smtp.gmail.com with ESMTPSA id
	z185sm20728875pfb.17.2019.02.25.22.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 22:52:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Feb 2019 22:52:22 -0800
Message-Id: <20190226065222.9281-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: Fix cross-builds of nsinstall
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
X-List-Received-Date: Tue, 26 Feb 2019 06:52:33 -0000
Content-Transfer-Encoding: 8bit

nsinstall must be built for host, so we need to define HOST_* compiler
defines so, it gets built using native compiler correctly

Disable stripping, OE will do it

Disable optimizing, set BUILD_OPT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index 74dd15bfcb..92d15724fb 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -45,7 +45,7 @@ EXTRA_OECONF = " \
     --host=${BUILD_SYS} \
     --prefix=${prefix} \
     --libdir=${libdir} \
-    --disable-tests \
+    --disable-tests --disable-strip --disable-optimize \
     --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
 "
@@ -53,9 +53,15 @@ EXTRA_OECONF = " \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--x-includes=no --x-libraries=no,virtual/libx11"
 
-EXTRA_OEMAKE_task-compile += "OS_LDFLAGS='-Wl,-latomic ${LDFLAGS}'"
+EXTRA_OEMAKE_task-compile += "BUILD_OPT=1 OS_LDFLAGS='-Wl,-latomic ${LDFLAGS}'"
 EXTRA_OEMAKE_task-install += "STATIC_LIBRARY_NAME=js_static"
 
+export HOST_CC = "${BUILD_CC}"
+export HOST_CXX = "${BUILD_CXX}"
+export HOST_CFLAGS = "${BUILD_CFLAGS}"
+export HOST_CPPFLAGS = "${BUILD_CPPFLAGS}"
+export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
+
 do_configure() {
     export SHELL="/bin/sh"
     export TMP="${B}"
-- 
2.21.0


