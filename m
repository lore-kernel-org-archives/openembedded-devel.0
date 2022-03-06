Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97C1C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 22:35:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.20054.1646606123986727492
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TKMM5vIP;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id s8so8121267pfk.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkL8V72M7eswgVQDkA+dEhH41rrwhvjfE0Xbgvcngvg=;
        b=TKMM5vIPDWXLOosMHMY3Vik/l+UkTON4xa/kV5U15acIq7+co9ZxL6iEKRgn7aH/vH
         TqakqlMwRex6KZJzt8kjm7S47DhQz2h2M4+/FDGVZRSJfyXvQTwmlkF+7zdjL3YWxZol
         BlWRhS5fKXA7WX1GJKBeYAYUPy8DDVeqzY+hFUVw3Ss/eAQ488vOOW7QsiXNu2Wrsuk/
         FbSA9wr7c2hZQkHfUABSFjtc5rb+qtHriWeWM+FQOyymbJn6edxDHurAxQVBnsSCdqNV
         bgvZ1AJ2OItnr0y8tBmzLLVqL4fQ9gbS5406tij3Rw1kLhSJcXlxce4f1QLgW1IH7tqF
         gr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkL8V72M7eswgVQDkA+dEhH41rrwhvjfE0Xbgvcngvg=;
        b=JveoKsiTKsC1kYULEoRMpPVsQwXyYEFVz6hRoaRNpz+DvdaftKcTXKqaaE5acrNzKf
         aYI9Q0O5jvoBW2p94Dtxo/pxwXEMeTNQ7ickX+4q7eMTC52eHPV/17uKHxcrScAyVg0E
         HYboRKH7W+QuvU3oVLTvOsCPMAEA12VLqbSOUlnWEqazbZaEwbS/oiVaaxD71l++HuUl
         I0XOWxv6v4LkZJuhs7vEpt3NgJrFpJGavoRX61341SYg5w4vHoeiby0shHpKSbe9IXy5
         glzm3wJrSoNq/3adINHVCc5D3y30IdWmnFfSww97f78JCZbRFJAkTX4Pv101YoRvaovz
         P7+Q==
X-Gm-Message-State: AOAM530SJkAcZZEhOTF9szEUWRMlSeUheyvt4ue4vKfnKkP5YE85oLpW
	6PX8oGZhfLbK28iQCbqqjTy8o9EPDVmyzA==
X-Google-Smtp-Source: 
 ABdhPJwrsCpytYPPzmbDwtz5eRUW5PH1MEue9kyP/Lu8VLAqhOH07R25qXNhXQG4kzKEGBv1Nmqhuw==
X-Received: by 2002:a63:cd02:0:b0:378:9b24:4a9 with SMTP id
 i2-20020a63cd02000000b003789b2404a9mr7372278pgg.327.1646606123348;
        Sun, 06 Mar 2022 14:35:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm13502369pfh.83.2022.03.06.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 14:35:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 6/6] thunar-shares-plugin: Check for x11 in distro
 features
Date: Sun,  6 Mar 2022 14:35:16 -0800
Message-Id: <20220306223516.504947-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306223516.504947-1-raj.khem@gmail.com>
References: <20220306223516.504947-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 22:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95827

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../shares/thunar-shares-plugin_0.3.1.bb                       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
index 26e96f3612..6ed9cecefb 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
@@ -3,7 +3,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit thunar-plugin features_check
-REQUIRED_DISTRO_FEATURES = "pam"
+# x11 is needed for thunar
+REQUIRED_DISTRO_FEATURES = "pam x11"
 
 SRC_URI[md5sum] = "0884855d60cf1031b9013b6f5b125372"
 SRC_URI[sha256sum] = "dc1d8c7caa727e76d033d4653dc0742613f57a1711d0050900659c90a84452a0"
-- 
2.35.1


