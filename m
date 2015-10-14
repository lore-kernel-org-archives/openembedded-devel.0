Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAFA770B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:17:37 +0000 (UTC)
Received: by wijq8 with SMTP id q8so96409731wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UGPwUL/mLq55nuJMGued7pqoWB/CdnWJYC3H9/VGvM0=;
	b=jYknXYZM1UT35qRSY159DJOX7IW8pE6C6Kq9SrbHZn17wJCS0JTUcrgkUFzymfYl3z
	718z64+RiZW3FQo6+tj1vR8pl5L34LDIh6Z0lQB0Dd3/Asv2oQCKODd/JRQrvXvSbQfm
	+IXO8SSaWKBZMOOaM+ajsNS7mEe1X2hho97iF7GxJWw/KAhHzT8PaT4UuJ15tCoZkbJv
	Rj/7bwAWFo2d8ruC5A9NOOobveGW0jiHl4ymHr0J0ddPZq0kVFrGv8FWJi7hMv3UrhZL
	QX1EKNYY8LaCBbrSZ/H84GeC4PQn1VYvEx+SCEBDZUNR1GcJzl8ph2HAtZrebqyvxkJR
	fpSw==
X-Received: by 10.180.105.138 with SMTP id gm10mr5940186wib.37.1444850257672; 
	Wed, 14 Oct 2015 12:17:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hs5sm20483002wib.6.2015.10.14.12.17.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 12:17:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:17:48 +0200
Message-Id: <1444850269-18516-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1444850269-18516-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444850269-18516-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][fido 2/3] lirc: use weak assignment in PACKAGECONFIG like other recipes
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
X-List-Received-Date: Wed, 14 Oct 2015 19:17:39 -0000

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


