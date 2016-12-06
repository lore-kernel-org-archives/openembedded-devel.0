Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1B68471B16
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:41:04 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so46602316wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kd2oSg68Vmt5kRR43qMEXgLieXlLiC/vD4KQi57vpxM=;
	b=LDNrD8FutAux+BeHx4xUIToJGE4X5/DJC4+6ltZjbNVOOTPFa7FYaQyvspNAjCXmWZ
	o08mVQVWsHxSzidx29lAlSfWJIt3gBQpmnKlU44dNz0/IJ9xtRAS+rCXPuXTN81ivdej
	o5jLu5UcFgg60VHJBtAz4V3cLWJyj5PoVzNwayYW1TZ29OTnlHD8p+T4erpu0nxNVAgZ
	vk7ichV/hHrvBt5WoyyOShoqt3WvGonFP31tVQGxW+kapnosjzhPtHiPNyAoPWkeSQDQ
	KGdDdyk6zGo/rYGBNRlX7LvSAo2BV6w8cnpq5zbfhBaEYYIee/Ko5REmQ34BVos1u+0W
	otxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kd2oSg68Vmt5kRR43qMEXgLieXlLiC/vD4KQi57vpxM=;
	b=Cy4g7D3l4EwFMt0miQrTolPvnTwgcIBEwt68WW9avrvnSk4erCUuRas/+Axqa+Bgg+
	w589HKyeHS/IBYqy/NjPEB6kuQWSpNHayH9+Hd+qeJYwt86PWcHL6Dsjzs+4cakkpPlI
	Y3hjfj8PZtNPmo/0ODjSN6j/7a2qlr8e7wMg6XYlOApXO5y7Bubp4UvHo5s06iTdD6B/
	ez36iCdyVAjHoovBt3g6BSJAwAKmarp2dQ1alBCpsmDiVcU+IFuWJMMeeUC92LZfEpZT
	QjbAtIQYSkKHvXPlejRx6ZfMecz6jQoS/h7pil7KSMasJTydvDXNmuwdeo5x1w9Nr/Sh
	zIcg==
X-Gm-Message-State: AKaTC00SH/ctoB7bMWlfyAu0b8TI9OYmJ33JrDcyN68lHvrkqOvx4XObxG5+P4jbf8JoAg==
X-Received: by 10.194.58.52 with SMTP id n20mr56040247wjq.110.1481064065060;
	Tue, 06 Dec 2016 14:41:05 -0800 (PST)
Received: from localhost.localdomain (p579CEAA5.dip0.t-ipconnect.de.
	[87.156.234.165]) by smtp.googlemail.com with ESMTPSA id
	j6sm28060674wjk.25.2016.12.06.14.41.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 14:41:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 23:40:41 +0100
Message-Id: <1481064044-26249-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] gnome-menus3: add gnome-common-native to DEPENDS
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
X-List-Received-Date: Tue, 06 Dec 2016 22:41:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
index 544bbc1..dfc1775 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-DEPENDS = "python libxml2 gconf popt gtk+3 intltool-native"
+DEPENDS = "python libxml2 gconf popt gtk+3 intltool-native gnome-common-native"
 
 inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
 
-- 
2.5.5


