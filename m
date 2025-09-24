Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE144CAC5B7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.11198.1758716932079926893
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0D0f9dA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so9928325a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716930; x=1759321730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3q1SV7XaimU8gnoANAUQ3ZKilt15r93UjQTrh9werr4=;
        b=L0D0f9dAHw2DcGG6o5s0P2KWqDhxh5X9eL6izHINs9ANxUXY66bo8EQtea3ZjD+TNU
         DAQG9j//u+zBVGVUg73sg8CQDs4vYWxORKHlhSh+VDgI+gjZw1VwAB5yCeckWPN9hlWB
         xvOWZzfnBwTdwlUGSIgI8Njx5Wmdv4PcltROE/I7Ad4XOnly5v6DHvVNl6DqbPyk6Kmr
         uo4JChz+GIoVJAWkZU8aglMmU+5u4zwDSPHjvG/TB5RYlV9QYDL2vtf+F4rx4awNML0b
         fnwSooS3ED0+Z32PzMqn7QSjHlwx5oYa+Fn/W3yi/DMd/7t7FxWrIB6blPTpVAYGTkBN
         gNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716930; x=1759321730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3q1SV7XaimU8gnoANAUQ3ZKilt15r93UjQTrh9werr4=;
        b=tdv+ks2WSOnI6HEuwIHdH3/MGp7q+pau0tAYFIt8DIgatspyB7L2QuB/BbF6cIdPf2
         /myuhGEqKdRvmazCqMWgyGjn8KBkVDLOnCo5gyN79GcsL5ieN3PYN/aeHpikv0fcNEdm
         XwZoFI8I9CYMQXVfre3FGHav3tj5pQKQx5qRCBhdp//wOPyTKYPHEf5SCeu9gQPg1CDO
         c1ue+oufuXRjHHz6D7TmB4Ya5TbIKX6oGHlROlIDK/MnxiQQrKKQccFDeauxBjUpL7Pa
         IiellM4SuVgdRH8HJ7HrvGikovgqrxWnxsnbOU4t8iUN34vH700J9ZvnJvwZvCqxbVqw
         t54g==
X-Gm-Message-State: AOJu0YyDH6KsGH99x1GHwzgXlUc3LkZ8ebwF8sJ9J2yMtUk1CvTlOiVY
	2JpqP3Zd2JQaqH8sB0gLa43YK2dLHOz16p0ndO1RdQ8s3TC1nkE3yVVdfbAz/A==
X-Gm-Gg: ASbGncv/KUz7XTPqg8hnKKT2BS4D29JxQ2Pl+IY04/NT7OwGHTFf6HbA6Uju9Ivv4i7
	3Lbx5ZKLRJU9q8jI76m5zI9FtemosxnnafPenjkURAkJKcQxdR5H6Ysh8XLzLJ75RjIub75mNWP
	LDic6X159M490K25cpUWci0+K7s7YJW7h+/5UaC6Pkb/HQ5G38/GjFavJukoBZYUK/m22Bm5DVo
	EMnrITC0KZldkfONdUEzW9qxsO5P/GNC6SWM1MVk+PoQdnpVmW5RxTim6urT3JujIhFCqPA9RV5
	8qbj6f5YYdSwQAnJ4ViwJAUX3fOtKGfgx3I8C21mxxTlS1gIAzLize+7fMEpgzC0s+C7nud+dTq
	5shXIjjGF9JAQdZXQxEpF
X-Google-Smtp-Source: AGHT+IEM2ISvDOFShGhMJ0Ju2pCrKRbETRp7WJSOmXP1aK6EUSF9ANR5dJvvXEzG+MeMHKA8ZIVEog==
X-Received: by 2002:a05:6402:46d2:b0:62f:3436:a396 with SMTP id 4fb4d7f45d1cf-63467821f27mr5525740a12.31.1758716930373;
        Wed, 24 Sep 2025 05:28:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 08/20] gnome-text-editor: upgrade 42.0 -> 42.1
Date: Wed, 24 Sep 2025 14:28:26 +0200
Message-ID: <20250924122839.4184719-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119811

From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>

Changelog:
==========
 • Improved preference dialog styling for libadwaita
 • Build system fixes
 • Fix icons for zoom controls
 • Fix titles in save-changes dialog
 • Translation updates

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 14452249d84b1d94f66c3fd01b01fbc671c0cef8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-text-editor_42.0.bb => gnome-text-editor_42.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.0.bb => gnome-text-editor_42.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
index 01504b1cb7..7efc6867d8 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "0e32140ee1c13428563bcd5f784e61ee22ffd1ad27d8c02283b4358a81dfab50"
+SRC_URI[archive.sha256sum] = "a3c8508033bfb63a8b48a062ac1e67b2c333ba0153879b38c661968a103ad15c"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \

