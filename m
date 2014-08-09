Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id B395F70AAF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:10 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so6814678wev.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zcGsAELdQwixFLJpWK/3MPDJhhYN/qChP94mteVwgBg=;
	b=V+GQxyx8JIgSJfiio35TLrWY8D9wpPNnh0XR5+h1aYClqMwEBPVZ1+hmNyM6gk53ob
	5NBvgQmfzZPiQjh9zwZo/9WtdPCXo98b1EPny1NDpk1ijvpFWqyuxVIE/RrT5fNzFW5L
	Sw8RPLydRdpsjLuI861dICtzJeCAihRL8hIckhNhz9IIgAiYr6GQqbpbyXs8o79JrcJP
	E9Cb1Ffw2i2AL3HB1DRPeJAM0xU+ve8grEuWyX70UxmBZFJdiN7Nj983l35q9EKAH0RC
	G957FZiT8w164VEKzC8SS/oH2W/GmNZ/hE6Jjx7GVmZrM9kng5zIA2M6QzwkXZNPC+7c
	TR8Q==
X-Received: by 10.195.13.102 with SMTP id ex6mr38828679wjd.48.1407600551592;
	Sat, 09 Aug 2014 09:09:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pj6sm25534737wjb.21.2014.08.09.09.09.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:57 +0200
Message-Id: <1407600537-10857-36-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 36/36] oscam: add dependency on pscs-lite
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:11 -0000

* fixes floating dependency:
  oscam/oscam/latest lost dependency on  pcsc-lite-lib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index ab74cc4..e3f2708 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.streamboard.tv/oscam/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "libusb1 openssl"
+DEPENDS = "libusb1 openssl pcsc-lite"
 
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http"
 SRCREV = "9164"
-- 
2.0.4


