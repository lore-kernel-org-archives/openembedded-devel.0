Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6617162F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:24:16 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id fb4so6695353wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ui09q7vmiOl4A/ZQxnoNZBVQ5QNe/3py14WITT943pI=;
	b=xH/igjsv8yZXpMnHZxRP9Em3yJ8GmvllF9XIuAyKC1Ksf0MjEdt4+4fHmhNOhxn+Af
	rJl0g4se4k7PcxeYF4YfNOEcarFKmU9GtxkKCjAyKzXxSEFB4ybCtn8ikUnMH2OiLynC
	s5/7L12qLpXNl6bnlALv2sCN0XIQ0LOdVRAjO174dh/TPgUMNM1K2LDtHhZkBzoCl211
	YX/ULamOD31iDdjfdRGRGLf8GT/uxZ0xlpK4DJK11T+VKyPdqxbouyZNKzwr0wa3QpXE
	gyWPE8FAKmoRZCeCFKYRDzPQPG9uaMZF2NhGQt/8/gL2qh0EXNYWYLh8mDzR54s05DED
	wVpw==
X-Received: by 10.194.120.37 with SMTP id kz5mr8749491wjb.107.1411572257479;
	Wed, 24 Sep 2014 08:24:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id t8sm55306wib.8.2014.09.24.08.24.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 08:24:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Sep 2014 17:24:53 +0200
Message-Id: <1411572295-5889-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-efl][PATCH 1/3] e-wm: add recipe for 0.19.0 but with negative D_P
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
X-List-Received-Date: Wed, 24 Sep 2014 15:24:17 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/87/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_0.19.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.19.0.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.0.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.0.bb
new file mode 100644
index 0000000..c1e8deb
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.0.bb
@@ -0,0 +1,20 @@
+require ${BPN}.inc
+
+SRCNAME = "enlightenment"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+# couple of modules needed for illume2 (mobile) profile were removed in
+# http://git.enlightenment.org/core/enlightenment.git/commit/src/modules/Makefile.mk?id=1be76d599ca27f820b58b8186c5f73d9844c67ca
+# and replacements aren't included yet, if you want to use e-wm on device with small screen, better stay with 0.18 release
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://0001-configure.ac-add-foreign.patch \
+    file://enlightenment_start.oe \
+    file://applications.menu \
+"
+
+SRC_URI[md5sum] = "9571d7e77fdd1ddb877adb063aaf9896"
+SRC_URI[sha256sum] = "30a5633be43a9bb33ce397afe0870511e7b148ea9c1f1a8536818354c20f2e31"
-- 
2.0.4


