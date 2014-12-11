Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B91C7231B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 17:12:02 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so7065351wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1GJN1v1n5Gxtj5LaV/x6+JmYVYwLB1iu7aw0I+SJYbk=;
	b=akfXTEDdhPlLazrf/3fG7D5ps5qIQ+qiEHClzp068Szz1Zc7zY/zIfpaqtXp7v+Leu
	oB8UAKSvmbou9t3xG+vitqugYCZsGaGVJHJ+To4z3AC/XAGxKHeA6XH+Cie2HwHji0mM
	wrjtaeBpOHHA/JD1mKor3EXYC7O7g0xRbIUSR+gqf/AjHlapkTzVydX2dellfAT6z90K
	RKI2Yl4AlRXkOzSY04Za5x6FAfTFD/KQA44SAvUGnL9mp2tyDHzn5OFNPgtczqmEoR9A
	3Q/3K2JaVRRCiQohYUJzYelBmyJIQkDu3Vxmd+InoXboRfiRAd6PZLHObC0uJB47orsl
	tg7A==
X-Received: by 10.180.96.161 with SMTP id dt1mr18303292wib.38.1418317923019;
	Thu, 11 Dec 2014 09:12:03 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h14sm3069505wic.8.2014.12.11.09.12.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 09:12:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 18:12:03 +0100
Message-Id: <1418317924-22256-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418317924-22256-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418317924-22256-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] polkit-gnome, network-manager-applet: blacklist because polkit-gnome.do_configure fails
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
X-List-Received-Date: Thu, 11 Dec 2014 17:12:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.10.bb           | 2 ++
 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb                   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index 663c38c..8c271ed 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -8,6 +8,8 @@ inherit gnomebase gtk-icon-cache
 
 GNOME_COMPRESS_TYPE = "xz"
 
+PNBLACKLIST[network-manager-applet] ?= "Depends on broken polkit-gnome"
+
 SRC_URI += " \
     file://0001-remove-classes-and-properties-which-are-not-supporte.patch \
     file://0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch \
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
index b262b5e..f5480e7 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
 "
 
+PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
+
 PR = "r2"
 
 EXTRA_OECONF = "\
-- 
2.1.3


