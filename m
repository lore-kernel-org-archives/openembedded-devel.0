Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA6DCCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:10 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.37390.1759765922367263194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m8ua6ekm;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d6083cc69so56616247b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765921; x=1760370721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J+ODLIOBTMrv7ZayU60DCssy7F55ktFMPnnzrga2Ak=;
        b=m8ua6ekmkHcnm50fF6VnkX9FlAcIKF9hwlWar2U4ayKvHxEWdMIj920f+1VD89cDV1
         BepACv77K2hinFWr0YuPU6OjAONbDKLnPHE7AyjmM/fUGWgKz1uRCzDPdTlE13EW9KZ4
         6MvYknHiBhG4c2ioV+qYlnf4zV+9GBSlZcB48OSlYvcoJPwpFW7PZUjswrpKNpAwlm/f
         hLMk0Z+a6cDheuzKfeJiSyzl3IWZnmycQBoaSHCSVzweHEycAYviYSZdl5/HKzhAWXc2
         A9aja0JxGxZGRWH3S978+Cj7lid8kYRSOTOVVTFKuey69Sg4bXdNJ0Eopzk34+PiB8Di
         J2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765921; x=1760370721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J+ODLIOBTMrv7ZayU60DCssy7F55ktFMPnnzrga2Ak=;
        b=bMg+ngdS7Y4m8CCu97e7m7CxdU3m3/utnm0jAe4W2pUhnYdi7Xy8T52elMODZraIl4
         aW1XPJqwpcgQc1mU6bizIfyL298psDED6RSC6wKmCHgdq+3N1nFaD4KAYtCVfPA2CPsu
         I6e9BvwUr8DkdBGsbeWrorDkBh+g8jGiwBcAgOoQ7cj3yWfaylBHvBCHsnUTZXUamLWz
         LZ+5wW6d0IHqAWqKhKiNeHbCoExLBF291fVKEGkcyv93xhQxzOBVxZaUkmE4oPHMFASD
         qklVIXRcuqQcVAsulTopIbiV1xMzl208GmBvx/kRc32LE/CsnA/8sT6gHpvimPfceZLJ
         5Qig==
X-Gm-Message-State: AOJu0Yy+q7obxbqh4zV9RSTugmbuQwTvbL5xPWmwuQ73evQnJhS5a/xe
	isoybIoIfpSO+aliCRCQsnReSMWvY+vmIf/HYo8RQw22z2OeWTf06PMbqz/57Jhq
X-Gm-Gg: ASbGncuNeYviTqoeIPasGOy/sfV1D+YV8O2uXKmNsP1WKq1rD5n4Fh5wdHLc/X36o7z
	ISx8Oe+FaHBHnPGHo1xVPceNdMDQyIEHWHZaygybDSWJYi6k+V6v9Q+dpq8VYGF+hwhH6nzs9NF
	bClPgT6JSaeqJPL5A05x4q4KCjJVfyDb/SofDsADtmWYuHbl0C8IQ0iZkKJyXrmeuo/JCvN1Gvk
	2B/QT3RKqSJG7W5i89ASL3J26fyfBz4XPNt3I88/BKuFY92L5ipru8sgSEHHxCsgwNPiPu2kiyS
	K8+89Qr5h+9gnI0yQSt4I3dKaxGHeiy9zG0NAt82QD/ADDWJruhi9pGr6YGWZUOs/t7xR12d0ho
	u8wQD0Z0zbxIn5Vb/9RuWeuwurvy1Xc3KBEs9JUHqT5TxtYF+3FHg
X-Google-Smtp-Source: AGHT+IFQXy17QIfMe7WCyijasuZwERz17kavasQCnuv0qnDp8soKQSRG+J+CEOuqUHcIyMInSJ32tg==
X-Received: by 2002:a05:690c:10:b0:71f:e154:7aa2 with SMTP id 00721157ae682-77f9448ec3fmr168346877b3.25.1759765920985;
        Mon, 06 Oct 2025 08:52:00 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:00 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 02/10] xfce4-places-plugin: upgrade 1.8.4 -> 1.9.0
Date: Mon,  6 Oct 2025 11:51:38 -0400
Message-ID: <20251006155146.416335-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120293

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-places-plugin/-/tags/xfce4-places-plugin-1.9.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-places-plugin_1.8.4.bb => xfce4-places-plugin_1.9.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.8.4.bb => xfce4-places-plugin_1.9.0.bb} (81%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.4.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.9.0.bb
similarity index 81%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.4.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.9.0.bb
index 4fe293898d..268cb4e02c 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.4.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.9.0.bb
@@ -4,9 +4,11 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-places-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "ba766a5d31580fad043fbd1fd66b811cbda706229473d24a734a590d49ef710e"
+SRC_URI[sha256sum] = "76d95687e0bea267465e832eea6266563a18d2219192f9e8af6f88e899262e43"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.43.0


