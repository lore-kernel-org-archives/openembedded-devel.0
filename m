Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D401731AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:25:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c82so2257000wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zz1RiGPUF9TxYXYluaFOypWiz+CAXtu/Qw/3YHme21A=;
	b=reduVPmpwZ9aMF1ojWKpqjnhonZQm8iFoGt1IkcNujF2XOaQemC1Xdmi3vW/hWUhll
	XnVAQj3aaUbZVBreyT763dBA0F2kajuYkD9F86A0DZdKnao+L//FPHc7c8nfHJysYylY
	4UxW+Iqzu4GI4kgr9eoivz1TbNQqeSOsDZX0gR1PU55STLO6E+bEGOVKRXjZehojXMK0
	O0Fr3CXaxFrWmGYq9PBgbiKAkwsfDyA73DToeqg8Z7SkpkN+7s+ESCsgZLGDM04rPmkp
	DpmzLEtiUZWjE8fNH2f/YoKQ/ziNKIzv3G+zchjyfDe4G6SK8jcdFEn53z1xLbg6DhQH
	1zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zz1RiGPUF9TxYXYluaFOypWiz+CAXtu/Qw/3YHme21A=;
	b=HIvS8gwQwbJUB8XjypOqSTtQDlcCKVkHrSF6FE4zmkfwPXEgfowCQqsRyrgotftvsl
	LekvjQv6aGuhx5EDgZMz/R/THVUxbaSEpWrfy/zePNQR1Xs/s0XXlrIiL3E7XZnMh6m3
	7QclqrVNEimjijN0Xitnev2U6YLOS8REGUj+mtJBddvArvy9GiGYsMKaPHWiFuvbDgdh
	79QY6SHPz0DaknSxiLGq9bP2p+0SPKYWSpPOM/Kp4xj+V2NIS0T1j75uKDoxN4CoL44J
	TkeKVt2rmsO8YQBPAg9KTwYRIDetGAKJ3JTNUpzoynb0ewXFdmPqo1OqBjenF02kFVPm
	J9YA==
X-Gm-Message-State: ALyK8tJy34oMcGA6y1JQDFltAW+5tVPp63jpydyJZ78qNqfiv1pTFX3Wx1fCdR/EbDcM6Q==
X-Received: by 10.28.165.5 with SMTP id o5mr9254225wme.87.1466609135416;
	Wed, 22 Jun 2016 08:25:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id u64sm1164909wmd.8.2016.06.22.08.25.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jun 2016 08:25:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2016 17:25:31 +0200
Message-Id: <20160622152531.983-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-gnome][PATCH] gnome-disk-utility: blacklist because of avahi-ui
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
X-List-Received-Date: Wed, 22 Jun 2016 15:25:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 2f427e7..b90fc3e 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -35,3 +35,6 @@ FILES_${PN}-libs += "${libdir}/libgdu*.so.*"
 FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
+
+# http://errors.yoctoproject.org/Errors/Details/69555/
+PNBLACKLIST[gnome-disk-utility] ?= "BROKEN: fails to find avahi-ui even when it's in depends"
-- 
2.9.0


