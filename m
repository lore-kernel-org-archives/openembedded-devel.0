Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9A23D65D6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:39:51 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so193957467wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UGPwUL/mLq55nuJMGued7pqoWB/CdnWJYC3H9/VGvM0=;
	b=EF7G65owfcv624dGfHQ/jSlcxZbnyRxBZdTKYs6PVca2o+QqMuTOHt/++3PTw6vC1p
	ubh+g3BrY+dnpKClX2Z3fClmkbUvjN/Mw8n8BqSFP2Dlgx9rMyWK1Ia71uiC9iRPhdu5
	u2W+l5mN1nSZcEohEqs3i5TlzT8HPiY9B3W3gihl8CT28TRP9WQukv6TNqGPwm+dxty1
	YPE4bWAvYwZOCsnQLhJ9FqtzthBuoUepzpnrP6iEr84W62xtnRkH/BUi5RZyyEuQ3Vhk
	HgFZbCJlyw7+ZV4PF5ZfScOi2W2FSpZHiYO7AiyR92hDse8i2m18BTBYzsEvZNEoD+8s
	TgCA==
X-Received: by 10.180.211.10 with SMTP id my10mr22680144wic.84.1444750784422; 
	Tue, 13 Oct 2015 08:39:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lb10sm4382136wjc.9.2015.10.13.08.39.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 08:39:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Oct 2015 17:39:47 +0200
Message-Id: <1444750787-20582-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH][meta-oe] lirc: use weak assignment in PACKAGECONFIG like other recipes
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
X-List-Received-Date: Tue, 13 Oct 2015 15:39:55 -0000

* using append makes it harder to disable PACKAGECONFIGs set from
  DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
index 7d93757..900b68d 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
@@ -22,8 +22,10 @@ inherit autotools pkgconfig systemd pythonnative
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x,--with-x=no,libx11,"
 
-PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
-PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
+PACKAGECONFIG ?= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)} \
+"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
 do_install_append() {
-- 
2.6.1


