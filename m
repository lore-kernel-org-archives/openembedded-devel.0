Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B138C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69112.1782634296620030719
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IpBlyl8r;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1397e093f90so3570184c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634296; x=1783239096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLGHZXeksvBOoUDxMhT5Q8yzHMNn0uUCr40unbrvbbk=;
        b=IpBlyl8r+IW02G533nqJa/oyY6GG85nzIPrSRXDI9vD09uZwFu00rRL/LKl50C+jiP
         RLWQoaEYHA11FzcYgUn3WJgvWW0vkMqC+Sk7shDpa4TcqXa4IWQ1dn3ddM35x5CesgX2
         eCwus0QreOQd8/KX19rhOrEoqWHmqctcACzzpE33oAkQRTqPG/BIUY1ZCbeiyu76/pqF
         XuW278mV4CLQj9x8hUiGn5VghGMBs6ocJQQNsi5gk3rOF63IDE7b3uahozvsdB3xmn6E
         M23Fa/SiS5JO+c74MDb2gIFsNP9TtTfBIVBv7mb5f5bDO2X0wKNgfqAxkHPPQBi9uiK1
         6jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634296; x=1783239096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RLGHZXeksvBOoUDxMhT5Q8yzHMNn0uUCr40unbrvbbk=;
        b=eEoiF1uLDo9wIQDjRw4aebXrGN6eHSxWyzOHWykcaTR2KxRarOc0BNjcPTSLc1YPPi
         gE9LvVeVhBxUvT3i80/Uldm2Kzz+eBVj9b2uXhRUlPdY69DmGMS1Cov4FSr0WoWp3y5D
         gp/PXhI0Qh5TqogkkBTHiGB2hdWqdNcZzTUFNZl1JLnh+kha2y/8d2PJTW1URbjQmGYa
         GK+VaykN3XPBE6hyR56YFH2bXLRunWRxlGZ3p1dEDM5O8J/bWTVMLY5cbZfuhYGa/jT3
         DEeE8yH0hUqJvN7FwrNu96JZGUfBQutea8flsvQBDE81sRG8bnSAW9SO2Hp5CeXtyfQW
         VS4A==
X-Gm-Message-State: AOJu0Yz0hzOLIaA5PdSheZzxoVjMmhWdLpUTc7we2a1+f+ozhyB9Lqrm
	gTmQ+hf1aHvgmGOVI35Mbt/1MREajttRJyogheweGTtJTojYCLVy2RoJl70Io4tgFB8C0g==
X-Gm-Gg: AfdE7ckd6YywpIx6MteW0Yzie2tgsXncZnw4WwcKpV5yEAxhamXmvlQkaMg/UIUcBSf
	VN0BK6mZY+iGtCdB2GnCxvXZQEzADRXwzlPgDdhOYLlB0i80Nz1r5k0xFOFt7AC1oGktBI0OvX5
	Ccq7uXGFPu5ikJuKVfjFI2ae2OeABFU0hVovBJS0CkXGNSYlIcEhvumuCg1ao54APAWwlnsJMQS
	An+Evu/SZIxmzLlL3x9yfyep6nHXGsjuTn87H4U4r3JIQGUoY6CGqtLvqh8QydZqRjKeNHuy9c+
	MycTo8IgyKcXK4336vZJqhO714MG12imI/MN43VSUNCzr1TaEmOehQAfH6pQAcEEm6CQJ8SBbiu
	1b4gcGlxZb+DvOM8P0lisFimIO63/ICSO68rd7n9tpNBo/TIgcD02MOKxt/fkBt9BJEIh0MPdYI
	Rous8bGlzvJiaijWwYeFZJUhkSKe0pqrHFOfNZNhixbjFUiPUczOoMge/bMlhPLd29Yt9GZP8xw
	mXj8L5xWtAw/dCdho8Z1PeCcUGeUJzKjTE3bgpuOxyGsVQoyBDNzI/dSJD5CeFZycaA9lJV4Axn
	RCICu1W7g8KyDgT+g2krfJjcK0jA2g==
X-Received: by 2002:a05:7300:3207:b0:30c:ab4d:382d with SMTP id 5a478bee46e88-30cab4d3bf1mr5703619eec.36.1782634295992;
        Sun, 28 Jun 2026 01:11:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 012/128] gnome-control-center: upgrade 49.2.2 -> 49.7
Date: Sun, 28 Jun 2026 01:09:23 -0700
Message-ID: <20260628081122.178348-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127822

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...me-control-center_49.2.2.bb => gnome-control-center_49.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_49.2.2.bb => gnome-control-center_49.7.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.7.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.7.bb
index 38b2c53c82..137d82e92c 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.7.bb
@@ -40,7 +40,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd"
 
 SRC_URI = "https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c23ae220d6c1237d285925de7801e0e36338b9cc1a8bb51c2e37e715e6b503ad"
+SRC_URI[sha256sum] = "e4a1524af73c25f0ebc5badcf5d5bea79024d801850bb051baf25feff320ed00"
 
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 

