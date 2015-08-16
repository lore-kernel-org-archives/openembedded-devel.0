Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 741F776785
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:43 +0000 (UTC)
Received: by wijp15 with SMTP id p15so59337126wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V40oFf27akhud4LbYUn/LV++dMDDhFMr7wu9w2o8ius=;
	b=trkiZbdK18P6YVqZO4vru5v1zRGq+iA7rzc+OhKBUEjoEeaZ9IGImTXStTaMGl4o49
	7C1kv4FrGIBbpn9IyVlivOirDgAeZQkqt+3/4oXzsPSPEsBi6CrsutDUF+7QK+d7eIP+
	g33N22MuR6DnUiLFQBvdKfLXSN4KzrzWghXwSUNFTuQAUfxsxy9p/WmQ50o0NR1SgPb/
	hrk3mMJMeRhc8bACZEy2hXysrDFmYwe8IPYXiV5ZNC8+Tyl9ORVVK5LA8Aguh7UCup4O
	pOtDmGoi/jua5/GQrI4L7sjxCeGqBnxAPnRDkwxk5PZ89I3Vx39fRF73R2kt/TSLE8f5
	GF5Q==
X-Received: by 10.180.8.68 with SMTP id p4mr27951521wia.27.1439754403089;
	Sun, 16 Aug 2015 12:46:43 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:42 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:21 +0200
Message-Id: <1439754023-13290-7-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 6/8] mozilla.bbclass: do out of tree build
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
X-List-Received-Date: Sun, 16 Aug 2015 19:46:43 -0000

Do a out of tree build by setting MOZ_OBJDIR to something != ${S}.
Newer firefox do no longer allow do build in tree.

Change firefox_10.0.11esr.bb accordingly.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 classes/mozilla.bbclass                       | 2 +-
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/mozilla.bbclass b/classes/mozilla.bbclass
index f9a84aa..940f381 100644
--- a/classes/mozilla.bbclass
+++ b/classes/mozilla.bbclass
@@ -12,7 +12,7 @@ SELECTED_OPTIMIZATION = "-Os -fsigned-char -fno-strict-aliasing"
 
 export CROSS_COMPILE = "1"
 export MOZCONFIG = "${WORKDIR}/mozconfig"
-export MOZ_OBJDIR = "${S}"
+export MOZ_OBJDIR = "${WORKDIR}/obj-${TARGET_SYS}"
 
 export CONFIGURE_ARGS = "${EXTRA_OECONF}"
 export HOST_CC = "${BUILD_CC}"
diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index 07226ff..94bd4be 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -91,7 +91,7 @@ EXTRA_OEMAKE = "installdir=${libdir}/${PN}"
 ARM_INSTRUCTION_SET = "arm"
 
 do_install() {
-	oe_runmake DESTDIR="${D}" destdir="${D}" install
+	oe_runmake -C "${MOZ_OBJDIR}" DESTDIR="${D}" destdir="${D}" install
 	install -d ${D}${datadir}/applications
 	install -d ${D}${datadir}/pixmaps
 	install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
-- 
1.8.4.5


