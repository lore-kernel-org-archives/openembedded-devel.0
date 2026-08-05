Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94867C56203
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:30 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37734.1785927381016077120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XViKPtcM;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c999f162c9aso591104a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927380; x=1786532180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3DuooT55rfJYyYgH5AaOkWNjcCOdM6plX+xezdcUaec=;
        b=XViKPtcMPW+EVXSNsXJs3Ws9MqvSejm9GvhtfARdzMphNb8WGwgZwmoytwto22Gusg
         LlK8180LEsXWocIC/c8JQLgNp87u4MGm6vP6R7Mg6uMIeb9wXheGwLxX6IQFWQ/+NBrC
         /7GNpQ/gO32hDnLHo7VEX7k0WwYzD/DKj6jPYo/Wgt+OAPZ48DOtWxm83jfRCp7pwrNT
         4GpSR3qCVIMhjz7tWnF8yjIhdTQY3v+tbBXlAr337hgVY+bymUl/jqANA9+yfEfI7qTd
         n6JNYlihxtJOZL2LTwsXD2zd+tdYOWVCMpFVhOKzTcy4OOLlkFXGiCNNDrYbRshecOj/
         GskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927380; x=1786532180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DuooT55rfJYyYgH5AaOkWNjcCOdM6plX+xezdcUaec=;
        b=Dfdr77MUp3R4WrrPKacRKVfVaol0aqthY15mBBgXWK4ubX5w7ydwmE2HuCzrsimgIj
         twqhwLb92Z1WUPDpcMIyx0v3ae+8GNn2IpJhdfzyJuiM3QQLnbwlGT/37l7F2Cy9HgQL
         Tq64yrbHFPEZlZlbzzs/M4xjOmPuCuAhQrCPr3nz9QZvHDq1usTeeSTQYz6V+VqyB9G+
         TbrLN0rHPcztUg3ksW6t2KXZEnDAZVvPzxbZbKs2GX7o7pc10R0xJ2i3Z7Pgpfj2gpjB
         SkItz1IngXCMpbc/9G8RBZoJ/qSFFyifN2moHK9Q4ntdlkhpNjnmqAk4TCX+IrDZ5hmx
         TGnw==
X-Gm-Message-State: AOJu0Yxuy8IW738m4o0ghGVU+g7v90fBZiCsX36qHgSToGqa9O/QuRr9
	iZjef/aLUJG8Pwmccu5ZEG9GUb3A6PVRLDKbzHNellH/ClFb8PcapNkUlubpmg==
X-Gm-Gg: AR+sD11TcG5oV6eq3OKgGuEUpnyyVJKwesgdabHFPgaNZ/rN/v1gY8vTa2C+cDNYChY
	fwaXYBuzKKGp8CH2HhJyvqISd5U7WImMmzrhtIfQE6Jys5WPlI8WbUi89CvM4qOvsBJ75Ag2Vno
	PgG94kMmOnPr7ECl/Hbhp/l2BfrCaZHF1gSEFcFMgRd5ToqiF0mQsP2D9/4dmvM4e9ATPSM1tGn
	tukfZ5VaH8vhUltXI3+BRbVJtaKRnJ8F9DPiIC3owvhF27KpV2JZDXm3VY0s0vTHNmI25OPAaz+
	G/drtoW6d3KEXp283dOwUPsIPUenP48PV7sYFPsi7Gi9NILRyo2o3tlgsTXpANqwX2Bi8oN0SzN
	NU0hUP5bEF2D57mnPNHK1W/BeUUrGXqbvXHAi71Hu1PckAfU71hZsDLo/O8Ps33lU5SlUTdBjKc
	yZACWiMQ/3PSlymuIvoRJg0s/JVj9e/G9a4gatqKtBd9DpLjSFjCBPoIrARZ2rKPWbis7DXD2Il
	A==
X-Received: by 2002:a05:6a20:2450:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3cb85eb92a7mr5599390637.30.1785927380260;
        Wed, 05 Aug 2026 03:56:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 1/8] gdm: upgrade 50.1 -> 50.2
Date: Wed,  5 Aug 2026 22:56:04 +1200
Message-ID: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128810

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gdm/-/blob/50.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_50.1.bb => gdm_50.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.1.bb => gdm_50.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
index 9332c7836c..8b4470ec98 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "770159373512192410f412b5d0c4678ec1573f1ae4b39c81fe75861fe8890174"
+SRC_URI[archive.sha256sum] = "8a4679e47cddfe8b0a1bd9d3836042deb68fb3e1b0e7e62dfd0631dc5b6fc541"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"

