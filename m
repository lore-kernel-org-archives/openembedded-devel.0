Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5444CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.11193.1758716925034546195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSbzh6eK;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so7733850a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716923; x=1759321723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tpWR2/xY6rfurGJHIpO9hUF3fK6yZuW7pWvoe9l/8Q=;
        b=cSbzh6eKbreqHiD70i0/CgnePZJFcTEA0xUh9lsKLxZm43TkGIQuWIiRbeczigwveZ
         gVdDsDmSro2wElDX6WSk1UxrnC1HkqhVJFSowk3mDJCyNiMiBeAVE6OLhFiDHfWsN3+G
         I9R8d58aasg4w4IyXfN7D6VEyAtqkjM8UPkGd1tHhk9GeqvxVe1WqI2m3eL8bj58ysPj
         eLXfnnwGSVtG/jT/iQHBYSat80lAi6KCfvpzp0YYRWNlmhguVZhYj5lyzwzjVqzlO5wO
         1Fi2vIEd2/HGm2mo37nGlcv/FsNypbHK4aso4/4uOn2HiApS1YvZbhu6jr9CHrvhXvS/
         541g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716923; x=1759321723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tpWR2/xY6rfurGJHIpO9hUF3fK6yZuW7pWvoe9l/8Q=;
        b=E/qy9z9l2IFl74dMudNgdlCnkU+bzvGNe/D5zve0XJrjk/cKua1z3qrH0298eyd7IP
         OgTV6hEKl1rdM7VF2/LYOfpXwar2cCL0rzNM9dEL785wTBduQGSYsKYkXHshznULEd+w
         qOG1+6ElqIA5lavY9+h7RNMsgyOE+WiJkiB7WyO5rQUTlDCi8UkFD8L8yEt3kFl2PLug
         tNekmvRK/u8R1kQ2kixQbvk0ubceTpmi3nBoW2Ao0VSHQbVffDkmmqIvY3wbQnODjRkk
         YXJGhZjOcicFeKbpJ+LhXOol9SCbHbllBZw1Ce+Mq3QXy1K/C6vEPAf6Rum4ouYZPOoX
         2TrQ==
X-Gm-Message-State: AOJu0YztJa/p16IUnbt6eMhFhT+5RC5yl4GghaC5jxtu/n6PT/B0QXui
	AC8d29RBlinf8SRchLp3Xs+VXWVWSVvgg9yEeACRJeg/sjAYirAb/bnTm++4aQ==
X-Gm-Gg: ASbGncuHpy051ucOlPj/yaFEXBpZczoBMNSj/IMA5VNYPS+rNyDjPkMrKogGdX3nyXz
	fegbLz9lQBiU3KQ2nTsMvH+PbZIyAVm8ffcURR9JmBTAwl8JUWND4Busbo75W8OYZ5Fx/kE5DVN
	IGMMCfutf/QYhbqBQ1tzHZb8fc914CiFa3b5NZ6SI1zQ7oID6aRHFV8uiSw8RMChcgInaXHP/OM
	S8N+P/UebZKTAzTquZTZFIOlGB71Us0mcs+joyzMj1pGflEkHnqwOarROeVK2k3BwBNbpuEnlte
	sWyBWaQOVtvcAl6VYtubO7YO2sDZ8x2HUZ3IWtrKW+TXVwRjJdF7q2Q5fKx5Z11hGHaCvGVIvck
	FO97zcF3gp1Kw+lKr1dw9
X-Google-Smtp-Source: AGHT+IHIVDcTSK9VcqWGkuCZkRjB9+EnXvsWeXq/M1mdOFCXv6ETUX3qOdGvvKSNCXle69ET9uaSdA==
X-Received: by 2002:a05:6402:44c6:b0:62f:4b68:bfae with SMTP id 4fb4d7f45d1cf-63467806cc0mr4703166a12.31.1758716923214;
        Wed, 24 Sep 2025 05:28:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 02/20] gedit: upgrade 42.1 -> 42.2
Date: Wed, 24 Sep 2025 14:28:20 +0200
Message-ID: <20250924122839.4184719-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119805

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
* Fix bug: text cut off at the bottom in certain situations.
* Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f550d1fe6a149b88f610b1a57493aa0d3a77693f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/{gedit_42.1.bb => gedit_42.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.1.bb => gedit_42.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
index e2bbf1889f..e022b9ddf9 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "7f1fd43df5110d4c37de6541993f41f0fbc3efc790900e92053479ba069920e9"
+SRC_URI[archive.sha256sum] = "3c6229111f0ac066ae44964920791d1265f5bbb56b0bd949a69b7b1261fc8fca"
 
 # gobject-introspection is mandatory and cannot be configured
 # x11 is needed for tepl and gtksourceview4

