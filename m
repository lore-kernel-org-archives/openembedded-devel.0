Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0EACA5FC4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:46 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3427.1790823817697326965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WP+3hQ1D;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2589529b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823817; x=1791428617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3vVyfrp+4ShWl9TOajZnB9ElFeIB84f6bGdeM8ux+A=;
        b=WP+3hQ1DJYTyhBIRlPLooqixE2TB/2JBAnjkLji7en3L0mqlLskJl1afS3qJZWV3+m
         PgsCy4Lj7YCkHa6a/pkz5nOQ+2Z6+JV2ueSeHlLAFv4Ztjo0lVmPcfqFHfGz9HiExMmP
         1EY9Pj0xWLmnMaFrlniJUUossJGoQR4B04g/uJsyjhk9PZPpW7/Mgmu4h2QBsMFKA7LJ
         MraRUph/1QSoYBW5xARc/KJ23RbzVo1mBcdKPumIo/Z8zzdndB6byQGtz1JRM1TfdsAo
         TifeazACYgUqWNBkIPLNnjlXZc8VTqK45v41FSmcxXm8KoYz/dhPIKpbhFtHGgNE/tOD
         FKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823817; x=1791428617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3vVyfrp+4ShWl9TOajZnB9ElFeIB84f6bGdeM8ux+A=;
        b=jGPaKjoqTAz3aAurL3AQqwfPKynxs7z9enlTptXECzUDtBHXT2Zhlltnm6bPC57WPe
         il2WAS1ZyG4F7ENzFC28TEsxI6MhJYkH/hjYTHp2KsWtQC0V3w2S9NTwBWSuE2ewHwDw
         LiYxy0SQ50YGZ78p9jbqNM9rH06xxVewgE1XlVBrLJeeJULk9nZQ/Lzh0c/7ClHVnVxy
         CVsaZzRK4M8XlY7Vu+gdqhP6TaU+BfKa1t4oH/5LJiGbhVzR0jLrw/acRHuHdrA4GLna
         zGgW8QvsfZNy0xVnlzLllhpOgBTtbqrmYw3Kq+2S8yecf0zWwZ5WX54u6QtvoRJpEc3X
         XpBw==
X-Gm-Message-State: AFuF++leKkdfL8d6o3brS3pTu3ht082E7twXuemddFU8hkTV23vFMCv6
	2d8oJaszJqiVJBEhssV2HsYVAO832tqMmMAUkGCnat8qGfQzahnXFjTgTRg1gw==
X-Gm-Gg: AYBFou05kOo9jCO1uZ4/N2BGyx5e+aKhwOINmc8aoTLnVAioQzK0jLmKfqEPFy14K7Z
	QAOu58xug7W6Za839CXkX0e5Fbe9NpRjjnC/LSQvMObjk2FLu2jihM3bSO/x5zw/XoAtWDwrrNK
	34OmMBeaFtdGzigKBbUJCQss29EbSuaKAXYHdbsfDBIqz5mr+9SgYPrNZ7At9RE6U8mjTNfOkAO
	5qRqMAkHCKhF8EvoI7LiOfa5b7yA+3x50s+wMXBuzGerxl28F4wYi2roBtLylhN6LV82W5veTMu
	c7wV+0O6l5JOOeBK1Wdn15g9hui/DDsVLpo8AOlPAiOMtjeUjJ97ASsd7DjL/uXTLBat6JbLZe0
	mwvwfhLoOx8ZULai6xlupvnslNGZlf6fWe8DE+/ztvzPqUM2M2h8MNz09RAd9RT3az6tqhrwysc
	XQlptxo3zquzapqqVnDcOXNfKyN2d1ZzDXe2D0PZop3EBU7XPzhgGWOabMI41b18QUQuTNvtCJe
	OSRd+LmUtwU/7s9+sHVUusHv4nCyN7FuQ==
X-Received: by 2002:a05:6a00:2e9c:b0:878:3538:8f7f with SMTP id d2e1a72fcca58-8874b259803mr2459951b3a.45.1790823816870;
        Wed, 30 Sep 2026 20:03:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 1/17] gnome-online-accounts-gtk: upgrade 3.50.10 -> 3.50.11
Date: Thu,  1 Oct 2026 16:03:13 +1300
Message-ID: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130550

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...unts-gtk_3.50.10.bb => gnome-online-accounts-gtk_3.50.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gnome-online-accounts-gtk/{gnome-online-accounts-gtk_3.50.10.bb => gnome-online-accounts-gtk_3.50.11.bb} (94%)

diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.11.bb
similarity index 94%
rename from meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
rename to meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.11.bb
index a28f24814f..9ea6b662b5 100644
--- a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.10.bb
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.11.bb
@@ -20,7 +20,7 @@ SRC_URI = " \
     git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=https;branch=master;tag=${PV} \
     file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch \
 "
-SRCREV = "b42482522bc9089c139ceda9b8a7d81a7a149cf9"
+SRCREV = "2796ab3cc4e5b29f64a92b239eb3f4b1eef190be"
 
 inherit meson pkgconfig gettext gtk-icon-cache
 

