Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7107F716CB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:05 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id m15so2818082wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iNcqbUYidlLecSs4sho99UdUkl7xQE7ksoavgPrUMn8=;
	b=zFzikYPqSGBURVKuQLVho3iuWPCMkf+7YKILiGDaD42GcA1NobyMa3/uMKe7Ks7i1t
	HbFJqpwAXJknUzmrwa/ZwKnX/YvC6Vb/FgP9t4fhsYeU0IW2LzG8HyIXjhjmR3JMuxoU
	9yJihnChkxqfCyhPOEbjZ2CZTquqWTwNxljpnep7UhGps/eBwnr4I1x2jLQBjOzs4Ft6
	uw+nPFjPQKHJqVG7lve15F8on89ORC9OlRRsue72P0368hZH4FHnn3rUgDs6M2vcuFsC
	9vG3Syr335++zzgM0r6Pv/LgOuHtHZpvpk9hyOrqopbv76m5cE2N0b1FhBj87uO1/0iq
	hCyQ==
X-Received: by 10.194.58.130 with SMTP id r2mr7216707wjq.29.1412389507144;
	Fri, 03 Oct 2014 19:25:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am1sm9603569wjc.29.2014.10.03.19.25.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:56 +0200
Message-Id: <1412389558-13237-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 5/7] qtbase: Drop dont-process configure option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Oct 2014 02:25:07 -0000

* it was removed completely in 5.4 with:
commit b7d86139772c3ce662ea7f092658699d351bbb1d
Author: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
Date:   Thu Jun 19 11:46:10 2014 +0200

    nuke -process/-fully-process/-dont-process options

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 1 -
 recipes-qt/qt5/qtbase-native.inc    | 1 -
 recipes-qt/qt5/qtbase.inc           | 1 -
 3 files changed, 3 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 6987c9f..faecc64 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -142,7 +142,6 @@ do_configure() {
     fi
 
     ${S}/configure -v \
-        -dont-process \
         -opensource -confirm-license \
         -sysroot ${STAGING_DIR_NATIVE} \
         -no-gcc-sysroot \
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index f58fdb7..3ba7f8e 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -34,7 +34,6 @@ do_generate_qt_config_file() {
 }
 
 EXTRA_OECONF = " \
-    -dont-process \
     -prefix ${prefix} \
     -sysroot ${STAGING_DIR_NATIVE} \
     -no-gcc-sysroot \
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index bafb59e..176aec4 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -168,7 +168,6 @@ do_configure() {
     fi
 
     ${S}/configure -v \
-        -dont-process \
         -opensource -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
         -no-gcc-sysroot \
-- 
2.1.1


