Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id F22BB60806
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:13:10 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p11-v6so627449wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i82wUahaRA28kc156dA1Ow26REyfiRXSyRYA7Z58UnY=;
	b=lm1OJv8vmY/ESVrD76DHMig1kBds5xC0oyyE6J+0ktBHuPOwrMX4zrCc3TCHKa+Aah
	i5wS966fFFjcdYghMBHtCIzgciG7owFOb2/LcWlIwkXkcQtXfirAv7yE0fS+CGPcWP6U
	EZqqEf0wgztB/k/8H+kpJWtMDnHq/VRodWJGkRNvBI6d1p1K1vUtABBvgy7dY/UpCFkO
	17JWED1x1JEUA3c1gK+FV/nEplIdmO2aehlk3O2EtbvmahfuQZ5xK9uNjSpmQY2ODsVH
	vWzq4M1BdMed6nJK/fixojHNNg3BWDMdkptcxnQ+nSSux6UEd5pRVqSfYpXT5Xvp2YDX
	eH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i82wUahaRA28kc156dA1Ow26REyfiRXSyRYA7Z58UnY=;
	b=TP9BKcBKpJrqW0hU2NNGBIBwE4qPJ1syj8G3FabsY/6mC2LGf/vaq/WZQdre487s6r
	22svTAlyVgjfwitEMNAo4Ola+fUPy2L1cIecBPoXOy0XJJWAyE2s6VvPHELFot0v8104
	qefC9xidiQdne72xc0VgryZ9kWLGUf2b+excpIvwCcgE0efomJxGKkJnSUZU4EIkO9g3
	T7K0m0t1drF2gBlLc3eNp88NzLY2VtEzIwAEX/XO020WDyi3QdXNIm9Noz5B5Qk0BcE0
	E1Wk7TPg7y0cwL674CV5d9obHzpd8UZWw0900REndZtBmuDuKO96mBgw80RLf01NaI62
	z4qw==
X-Gm-Message-State: APt69E2Gg/2rl9ZViAIqg4a3rMOzo2LNDFahBJLTXwtT6Y0wS+6TQ429
	QCxcKTynSzMLL3YS6C8PppHzwg==
X-Google-Smtp-Source: ADUXVKLBcczsW+Y9nO/RAJ65AmPGlqs0VMm7kYQztowP/ykDk/EeXSB5+RQYjv9JJ3wxFERghyp8gA==
X-Received: by 2002:a1c:878f:: with SMTP id
	j137-v6mr1112551wmd.97.1528827191636; 
	Tue, 12 Jun 2018 11:13:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y5-v6sm1058211wrp.51.2018.06.12.11.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:13:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:13:00 +0000
Message-Id: <20180612181300.2478-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180612181300.2478-1-Martin.Jansa@gmail.com>
References: <20180612181300.2478-1-Martin.Jansa@gmail.com>
Subject: [PATCH][sumo][meta-oe 2/2] android-tools: use fixed SRCREVs instead of tag name
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
X-List-Received-Date: Tue, 12 Jun 2018 18:13:11 -0000

* so that bitbake doesn't need to use git ls-remote during parsing to resolve tag name into SRCREV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 5d8f8a8435..780ecaa11a 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = " \
 "
 DEPENDS = "libbsd libpcre openssl zlib libcap"
 
-ANDROID_TAG = "android-5.1.1_r37"
 ANDROID_MIRROR = "android.googlesource.com"
 CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
 EXTRAS_REPO = "${ANDROID_MIRROR}/platform/system/extras"
@@ -17,12 +16,19 @@ LIBHARDWARE_REPO = "${ANDROID_MIRROR}/platform/hardware/libhardware"
 LIBSELINUX_REPO = "${ANDROID_MIRROR}/platform/external/libselinux"
 BUILD_REPO = "${ANDROID_MIRROR}/platform/build"
 
+# matches with android-5.1.1_r37
+SRCREV_core = "2314b110bdebdbfd2d94c502282f9e57c849897e"
+SRCREV_extras = "3ecbe8d841df96127d7855661293e5ab6ba6c205"
+SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
+SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
+SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
+
 SRC_URI = " \
-    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core;tag=${ANDROID_TAG} \
-    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras;tag=${ANDROID_TAG} \
-    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware;tag=${ANDROID_TAG} \
-    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux;tag=${ANDROID_TAG} \
-    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build;tag=${ANDROID_TAG} \
+    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
+    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
+    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
+    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux \
+    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build \
     file://remove-selinux-android.patch \
     file://use-capability.patch \
     file://use-local-socket.patch \
-- 
2.17.1


