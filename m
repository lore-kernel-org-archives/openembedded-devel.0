Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id BA09265D4C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 16:47:51 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2483420eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g7WlKk0ese9KkqYrvNhGlnI9JKgwwEAW7fwWQg0ygSQ=;
	b=DmamBoK941TOQdjl9C8vzB9tjOCIh9lGjP3DH4HE/kKVv4K54BgiVPKqMSJIoweJqA
	J2VwCV1kuPfdX77/LfIu8LUMsBeW+lsnT2Wg88tKTpnEcAz0dasRWjMZxSi/+GYR4la+
	1mmk9DwWyxgX+Rd2pNEluhyGXBgIiIIgwXlKLHFV+vD1Z6Mwjf1tLT8fzY/uT+I49wJ9
	+czAtNXs8p+38LsD7yrawBPBi2o4wEgTzmB1j+wtteEzzhGscHFsLjf2Jp5QqOMThoMw
	FICFTHuBERqJ9EOFnu1eCmyn6csBVG33PtjMmonaV8sw5FQpFJLA/a1YttPM6wmSXzV+
	wzIA==
X-Received: by 10.14.225.132 with SMTP id z4mr1180044eep.92.1397926072015;
	Sat, 19 Apr 2014 09:47:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm87031854eel.16.2014.04.19.09.47.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 09:47:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Apr 2014 18:47:46 +0200
Message-Id: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/5] efl, elementary, e-wm: Upgrade to 1.9.3/0.18.7
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
X-List-Received-Date: Sat, 19 Apr 2014 16:47:54 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/50/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.18.6.bb => e-wm_0.18.7.bb}           | 4 ++--
 meta-efl/recipes-efl/efl/{efl_1.9.2.bb => efl_1.9.3.bb}               | 4 ++--
 meta-efl/recipes-efl/efl/{elementary_1.9.2.bb => elementary_1.9.3.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.18.6.bb => e-wm_0.18.7.bb} (75%)
 rename meta-efl/recipes-efl/efl/{efl_1.9.2.bb => efl_1.9.3.bb} (81%)
 rename meta-efl/recipes-efl/efl/{elementary_1.9.2.bb => elementary_1.9.3.bb} (69%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.6.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
similarity index 75%
rename from meta-efl/recipes-efl/e17/e-wm_0.18.6.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
index 852046c..0e39727 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.6.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "a3a707e32fd72547e0911e3765d112f1"
-SRC_URI[sha256sum] = "a75f85e65038672a0413c74bffc7f4869c3c41090afe6b66876241780e478c2b"
+SRC_URI[md5sum] = "499b92ef38347881c72729f1e066eb20"
+SRC_URI[sha256sum] = "1b05a1d986643a6603b1c20ac87b6864325d0aea22a3d1d096f4063b4fba2f4d"
 
 do_configure_prepend() {
     sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
diff --git a/meta-efl/recipes-efl/efl/efl_1.9.2.bb b/meta-efl/recipes-efl/efl/efl_1.9.3.bb
similarity index 81%
rename from meta-efl/recipes-efl/efl/efl_1.9.2.bb
rename to meta-efl/recipes-efl/efl/efl_1.9.3.bb
index 0670359..61e6a9e 100644
--- a/meta-efl/recipes-efl/efl/efl_1.9.2.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.9.3.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "5520ed809cdccd8b2a3e376f56f9ae61"
-SRC_URI[sha256sum] = "530cec25c7f41c188599a1e239bef72142850f6a5f67c1dd4184354f756181ad"
+SRC_URI[md5sum] = "102acebaf453346d745b0974f736a5e6"
+SRC_URI[sha256sum] = "46da18ce5ec6ded559dbf461ff58113f82937efb6e26a098a82b2f360e8faf88"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.9.2.bb b/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
similarity index 69%
rename from meta-efl/recipes-efl/efl/elementary_1.9.2.bb
rename to meta-efl/recipes-efl/efl/elementary_1.9.3.bb
index 110f07b..32ae663 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.9.2.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
@@ -8,5 +8,5 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "48a4b155ced187db87c503d4f376aa7a"
-SRC_URI[sha256sum] = "c31644109cd29675bc65b220d19c633c8d089feb955c439988b2e19f026b3376"
+SRC_URI[md5sum] = "cc75bb1c7c4c49de120ec33e413130ce"
+SRC_URI[sha256sum] = "49f896066b72ba51eefd8e92f0b7e7b8e190b0dd26323b12cbd4f26216f578fb"
-- 
1.9.1


