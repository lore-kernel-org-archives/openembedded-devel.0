Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AE2C4332F
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.391.1636825570034375710
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dhXrcfc4;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u11so11044988plf.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XOraX3F1FRS5P1T1C/x7sd3AWbvKBdcGdIeOjvsmZjI=;
        b=dhXrcfc4dU3GalsTu/SsBFM1gzFEs7mupJiXPNmVKe5cstE5XpmQU1mqR7b1pJ1Plx
         ZKbyCL+BWWl73itwjXj06CdPvey2WvbLC6z1be9cQU7Z91L2O2W7v3fLOf1YLliG56Dp
         gIU/RN2UeaADB8Zkt775OreGyeZvd/oWiXnGlcfgzJ9Xg7vFvBhgPmxJmfSznC0g8/Mm
         JX888aWyXqlmLQmY1RaDaF9+O14BsZ92h+ODDUSN46OJXBYCTw5zVHMSscOUf6WBvd+h
         yuwEMjcai1xIiGWsX2XcqRUlUSrgbMDHPN9386CQIx9SxcesefgJbKSPz1iNl6T3v8h5
         a0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XOraX3F1FRS5P1T1C/x7sd3AWbvKBdcGdIeOjvsmZjI=;
        b=cLAShb1V9xSD2v9tHSHw3EemwARQ67V+at+WP/odwh8My/F3NKJq3ma6OyhOqIi56s
         Zp0lc0DDxfIFy3mBLNQ3IQgkKFilDKTg3YTA08g3IpQNFmAGiN50G0a64tPqdBP6RDL/
         cDsJv/qtn6p60TPWb/k0Ur/S4tdypxP7VgytvfxA+dIyWX1Xwj35aB09qeHN82FW+A9+
         Ovb0Lmm/0qp1hZw6YSYuBflC7Od5WNY23b03JRm3Rm6RjTzvL0WZX5AMh9ZXcnQRCO2g
         eYEgJFI66FicEPhtODLnZVxJO53hgnPFVYMU/zucP50X8M15xF0EuxFeFPytnD0FEMiF
         s+UA==
X-Gm-Message-State: AOAM531UodLDl9JqBt/lrO+1gYSge9YyHNvNCYC2FhGpyVliK+dQi7Kk
	bCGCioEzRQ3Am+7GhZTrtwUY6BY1mj8=
X-Google-Smtp-Source: 
 ABdhPJxeSTNCCYoxa4gfPvGU1VBrbK5naRyW84G5SXTg3cdx7rqaevVvpIvZHTnFtfsuel32OP8tpQ==
X-Received: by 2002:a17:902:d2ce:b0:141:f710:922 with SMTP id
 n14-20020a170902d2ce00b00141f7100922mr18975987plc.7.1636825569175;
        Sat, 13 Nov 2021 09:46:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/9] gnome-desktop: introspection is not valid
 meson option
Date: Sat, 13 Nov 2021 09:45:59 -0800
Message-Id: <20211113174606.2044137-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93931

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.0.bb
index 71ea79f99a..36dab453b1 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.0.bb
@@ -13,7 +13,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "x11"
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+
+GIR_MESON_OPTION = ""
 
 SRC_URI[archive.sha256sum] = "69cb1d3d9a10700eb66348ef1c0e66a855fc5a97ae62902df97a499da11562d2"
 SRC_URI += " \
-- 
2.33.1


