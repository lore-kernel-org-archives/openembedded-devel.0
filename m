Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6D17171AB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:56:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so23143312wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AyrHrAtUUvCe3v3QkYKsJOn1xID8iacpOJeyGWnI/3g=;
	b=fvrYRq4KKtSSUlJpobOkKses3bMJKRilE/In+SHghlk+fgoa+RoS2a/mozVFL6WJp6
	qmMoa53m0Q91sYb06Ux+5ZHA7wsfzH9z1VbvB8V1103cn2sj/kkxmjNH/JaP+l/y1FFd
	Sf4zKQlqT++AoJN0Y5VpPLWldme/skC64hAAzV/6PYpqQpGeAr9PQBAQyjN37h7WLa6E
	JG3o8ln5kNBgsBJuXl2Hg42Jq+2srUqnabj5jcpaFYw1YaW4Z82a8EBjrErMUjH4F5Vw
	525tTFJ4WzjFXu7hScVRTE6hsAhs7CbYSMaPAIwmTFPd3uAemBfE+7z3FB/tojQaTT+o
	tWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AyrHrAtUUvCe3v3QkYKsJOn1xID8iacpOJeyGWnI/3g=;
	b=HwgKve28qn+pfKccXYPtTz4P0IegRPfwRSkIHLJ89KUxq/e+Xpjhy1TJDLZOdcdG+K
	7/pLNRwqOEwlCOU7GjEjbpJxxcFCEZw8kMLp/roaRCo6NOsh0IrE+62qQaCahQYaKGxt
	CuMjo97oUxVAGnjwvn5/7L1yuchA/LLSujnm0UmJ3bChCQtuPddFHg7cLvVzhWINFSX8
	7ONFnaUk3WkNE8QjQkCOpUM2uz2g0101L7HFBC4Bxy+djl6sYMFjpQKQbIdj1XhOtSdq
	4iId60MC5JW3br2S1lN/Z6XNiVu31JTG6VoxZbg5wxOm2anLBfrR1TVLX5srMuFc/+Gx
	TnPg==
X-Gm-Message-State: AKaTC01qWfT+mWznaN+CcASJG998OBGU14q+HLLtkcjn7nHlNWnX7eDtVgwzmcHYYeQjdQ==
X-Received: by 10.28.180.214 with SMTP id d205mr24070176wmf.131.1480409811192; 
	Tue, 29 Nov 2016 00:56:51 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d184sm1665584wmd.8.2016.11.29.00.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 00:56:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:56:51 +0100
Message-Id: <20161129085651.29566-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161128085130.GA3018@jama>
References: <20161128085130.GA3018@jama>
Subject: [meta-networking][PATCH] iscsi-initiator-utils, open-isns: Add systemd to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 29 Nov 2016 08:56:51 -0000

* and fix indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../iscsi-initiator-utils_2.0.874.bb               | 40 ++++++++++++----------
 .../recipes-support/open-isns/open-isns_0.97.bb    |  6 ++--
 2 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
index c3ac5a8..72a17b0 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
@@ -14,20 +14,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SRCREV ?= "8db9717e73d32d2c5131da4f9ad86dfd9065f74b"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
-           file://iscsi-initiator-utils-Do-not-clean-kernel-source.patch \
-           file://iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch \
-           file://initd.debian \
-           file://99_iscsi-initiator-utils \
-           file://iscsi-initiator \
-           file://iscsi-initiator.service \
-           file://iscsi-initiator-targets.service \
-           file://set_initiatorname \
+    file://iscsi-initiator-utils-Do-not-clean-kernel-source.patch \
+    file://iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch \
+    file://initd.debian \
+    file://99_iscsi-initiator-utils \
+    file://iscsi-initiator \
+    file://iscsi-initiator.service \
+    file://iscsi-initiator-targets.service \
+    file://set_initiatorname \
 "
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-inherit update-rc.d systemd autotools
+inherit update-rc.d systemd autotools distro_features_check
+# open-isns depends on systemd
+REQUIRED_DISTRO_FEATURES = "systemd"
 
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
@@ -37,16 +39,16 @@ EXTRA_OECONF = " \
 "
 
 EXTRA_OEMAKE = ' \
-                CC="${CC}" \
-                AR="${AR}" \
-                RANLIB="${RANLIB}" \
-                CFLAGS="${CFLAGS} ${CPPFLAGS} -D_GNU_SOURCE -I. -I../include -I../../include -I../usr -I../../usr" \
-                LDFLAGS="${LDFLAGS}" \
-                LD="${LD}" \
-                OS="${TARGET_SYS}" \
-                TARGET="${TARGET_OS}" \
-                BASE="${prefix}" \
-                MANDIR="${mandir}" \
+    CC="${CC}" \
+    AR="${AR}" \
+    RANLIB="${RANLIB}" \
+    CFLAGS="${CFLAGS} ${CPPFLAGS} -D_GNU_SOURCE -I. -I../include -I../../include -I../usr -I../../usr" \
+    LDFLAGS="${LDFLAGS}" \
+    LD="${LD}" \
+    OS="${TARGET_SYS}" \
+    TARGET="${TARGET_OS}" \
+    BASE="${prefix}" \
+    MANDIR="${mandir}" \
 '
 
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
index fe41093..b809762 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
@@ -14,14 +14,16 @@ SECTION = "net"
 DEPENDS = "openssl systemd"
 
 SRC_URI = " \
-           git://github.com/open-iscsi/open-isns \
+    git://github.com/open-iscsi/open-isns \
 "
 
 SRCREV ?= "09954404e948e41eb0fce8e28836018b4ce3d20d"
 
 S = "${WORKDIR}/git"
 
-inherit systemd autotools-brokensep
+inherit systemd autotools-brokensep distro_features_check
+# depends on systemd
+REQUIRED_DISTRO_FEATURES = "systemd"
 
 EXTRA_OECONF = " --prefix=${prefix} --enable-shared"
 
-- 
2.10.2


