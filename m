Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6971265F2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 08:02:20 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so6592507wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FFZhB6wc62GzHKX/GT7td7vbWW1U3BdCwS6XAYvOduQ=;
	b=RUMKG81g/fu7tdHSjhYAQUNMco5ODpR9OIr/km9G7TssJFtIn+22GVazpYLiaSTCAk
	+3ixxASOtgC/cEFSSOC4ssbMoyjDeq2WrxcBrB0Ilm/TUpFm/6kbyWxnBDQexsZ6tice
	98vdB9qT0X8GqwZdIcvVFMgUYdgNSHPQqpMOwwrR4bluGQT4X91CMHfkDQq5s5IMvnFR
	Btc2Nm777DhkDF5xPGKy67OEs5JbONJ8ETUN1sxarQi3FaXkUGqZy1YzGVDYJgVdPNZB
	Na2d7U1jde3FberPU6FeqFIzn/C3L2j+A50r+Na44EqARDRIuoLnMBPBlbX1a9RDEV1n
	RdBw==
X-Received: by 10.180.187.113 with SMTP id fr17mr3416008wic.51.1406707341541; 
	Wed, 30 Jul 2014 01:02:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bp9sm52607158wib.7.2014.07.30.01.02.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 01:02:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jul 2014 10:02:42 +0200
Message-Id: <1406707362-26085-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-systemd][PATCH] portmap: fix FILESEXTRAPATHS
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
X-List-Received-Date: Wed, 30 Jul 2014 08:02:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
index 765f4b3..f13b511 100644
--- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
 
 inherit systemd
 
@@ -9,8 +9,8 @@ SYSTEMD_SERVICE_${PN} = "portmap.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI_append = " file://portmap.service"
+
 do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
 }
-
-- 
2.0.2


