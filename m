Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 23902782D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:06:11 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v104so28307387wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 03:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iI10gIiT5CIUF/OKWV/wRbYbzHQYtdH0VV3uOdTFiJ4=;
	b=MCcgZR3yQwr9r93BmcZG027lPllepgO13IMq4gBRQiwEeqsZaPGHklioGyGX7Fww/d
	CPp3U6MRaDvnTk0HU8lwb1bi5y+q5YNl/+JCcfrWnbyEmWbvNZG70GnFJAwuT9XKAqAR
	QGLuaS29daGQYdiDLptDXyTgbjP7A74ZHLCHZOy3Y3CY26TSn1tX4L1XjXDN0+V/Qn1p
	RD9sV6F2LqaJvbHIlsucUdMmd9VYu5wBxlMIzWBfReDcWhXS3dY0BzfjocDHCAeES+38
	O9w5x67Nsaao5wSvDR3o9f1XedxjWRottQwPWbkJCkTDsGR85kkVgYKZmY2z6o47c90Z
	Lizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iI10gIiT5CIUF/OKWV/wRbYbzHQYtdH0VV3uOdTFiJ4=;
	b=UdpKnIuXsTPwcEF/29ZOtlabeoegyAnHX5DDB+X0iU0CDD6jRrKJC19qjcydolGes2
	KLbMTDdMiVanm8xpiR80MkF5PLOEJyw3nbLYb4oLLr7akQuXRTWehQQjCl94SiVdpdtn
	CtDLzbS7c9BxtunBc38RMeroNiC6VFk6KfYeIfNFJYb8j8Nq0Q2bivpjVWVY0Bkuqg3j
	G9VgAXvIpggFXyyxXLn55+0el7DyBGy3tddnvMyZJb3jG1RoYdYZXCi78vSSct6/anFR
	+MFnRN/sL4zqTnRknGpRoBVtMGUgpGC3JY/NvnR63GxN3g37MuQA5wrXj93qMgRHDWJ0
	Pdaw==
X-Gm-Message-State: AKS2vOy5CWY8YShpxOMOQTA93K3pdgqqzw/CPW0Vp3543mTeM755ycHc
	nz8RdA8/ZpDekHpK
X-Received: by 10.28.24.207 with SMTP id 198mr10680837wmy.86.1497348372635;
	Tue, 13 Jun 2017 03:06:12 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h73sm8803125wme.18.2017.06.13.03.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 03:06:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:06:09 +0200
Message-Id: <20170613080609.4476-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH][meta-browser] firefox-l10n.inc: mangle download filename instead of DL_DIR
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
X-List-Received-Date: Tue, 13 Jun 2017 10:06:12 -0000

* it causes unnecessary directories on premirrors, which imho aren't even used
  because fetcher will search for ${LANGUAGE}.xpi in the top level directories
  not in ${PN}-${PV} subdirectories.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-l10n/firefox-l10n.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 1be15ba..961cf3c 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -13,10 +13,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 LANGUAGE = "${@get_language_name('${PN}')}"
 PR = "r3"
 
-# Mangle place where to store the file
-DL_DIR_append = "/${PN}-${PV}"
-
-SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
+SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi;downloadfilename=${PN}-${PV}-${LANGUAGE}.xpi"
 S = "${WORKDIR}"
 
 inherit allarch
@@ -31,7 +28,7 @@ def get_language_name(package):
     return lang
 
 do_configure() {
-    xpi-unpack ${LANGUAGE}.xpi ${LANGUAGE}
+    xpi-unpack ${PN}-${PV}-${LANGUAGE}.xpi ${LANGUAGE}
 }
 
 do_install() {
-- 
2.13.1


