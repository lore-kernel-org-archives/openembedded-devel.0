Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41992CAC5BB
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.11310.1758716943319684105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PvNm++uS;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso2066983a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716942; x=1759321742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOiQFUnDM/izdOo4Th619bqQN0hPihRHzHuP4XAqFc0=;
        b=PvNm++uSPqzgCg7YJbmKBfP6g6aEm0LYJmUPY9DfJqjC/PO4CaPT/rwo3/9zRoRMhq
         tqwxyTL2bZThlHlE3mCywgpYfGZyS72p5ZWN7ZNomzT+BHSG0Z/qyEkTEHfSLJRebLIG
         v1uWFOoTDUkKJ5a+d1vJnO2Hmw2gHK+H0xl/UHGWsf+/VWHvmzG3JHFFVADpHBuK/rHz
         Bt5eB4TLJvDZCj/jdGml0WWHzVXO9OBqq2Am4Cjlevkaow/rKxrb8xSwsQOq6ITDxPpF
         v53mzpNQ27Ccjtu1rdpJzwjJBgjl/HX3STBStA+hhbY1WkHQ3nvhcJ6EihbTyHWlrSc6
         h8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716942; x=1759321742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOiQFUnDM/izdOo4Th619bqQN0hPihRHzHuP4XAqFc0=;
        b=VitatFnWBweHmjR37mHK5LjqISjyGyRNp9vwaYdPLVXIvQlnnyYqExfXrJHYATjlsw
         W0BG0D++4jKLTkl+7iuumqMClH4+r3LwKhmbgFGl/w2C6g0YILWq775ZynZaFCC34B40
         aVpa27SzXMxnwhIJ8l1SNhseWKVbbwSnp9VfUUQwMKeu0LyQu+qu8KrhGQA37jPYeEJz
         ifn+1JQOt4aP6PM0AVBsWzmUnDpGSKO6znU/YeoJCdX798UCzGhTirbqz5C3q73C/2EB
         8NnzIv96bZev6WkUGDxTpT2ukrU/vXsiF4B58DqlvXW5POQaUGjlbasKfGgwhoyD07WC
         dWhA==
X-Gm-Message-State: AOJu0Yy+C79uKDWYf13uktpyZBNo0/lhD/BFid8YB/9mgPvEohEtDqqm
	96et3FQVP8w0WBMOhcIR0lU86BSK38UsP6E/Dp9Erv1yeJOGw6/Kjx/XRLYedg==
X-Gm-Gg: ASbGncsnyItXiJwDSStS0Kf53ZZUfkZ0DJQin7d1wbYbpEW1f23S1c/EHFYi6vNwIZz
	kFZEO59cWFnU2AGY3xlJYQcuvNewABUhvpjUePUWS70N9Ed72quRkqPRstPgfvvjPMQsBt2YzsI
	iXz+vUiU0uBsFDPy+/v12JohJ5HD2ckBeoX3HrlHPfoSjkjT42J3U+1/5LIU541YSGW0BYybAYO
	vpbUEnV9ytWEh9NXZZgPZxs89tZPljxrPkIaCL6L8lawoEvwdxog7Xgt4rZ65LdTKaqYOXVzgE/
	Lrq5d1zEdEw9W7C9Hm+w4hNKjxT1bzoCcYE3NeCy5vBGFBcQz7X4CWSHbjj7tlUcetnBDT5/nae
	sayAWNFFXGPLMt7aYC/2HPzh+uXPRAOE=
X-Google-Smtp-Source: AGHT+IEm4R4yD09+FZCJxP6Lo9MPzeYP17P35MMlh4Ed4iKv1bo15AD3gTH6bxYlJoiPIpc11vWd9Q==
X-Received: by 2002:aa7:cacb:0:b0:62f:453c:7235 with SMTP id 4fb4d7f45d1cf-63483b66411mr1585836a12.15.1758716941595;
        Wed, 24 Sep 2025 05:29:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.29.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 16/20] gvfs: upgrade 1.50.3 -> 1.50.4
Date: Wed, 24 Sep 2025 14:28:34 +0200
Message-ID: <20250924122839.4184719-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119819

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* dav: Prevent usage of NULL for nonexistent source file
* client: Fix copy/move operation from/to Flatpak sandbox
* http: Report original sizes regardless of compression usage
* Fix string comparison on various places
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 80534e1f99b980c1591208dfb9260df3b3097337)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.50.3.bb => gvfs_1.50.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.3.bb => gvfs_1.50.4.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
index e55e86f8e9..a8510a3d59 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "6897119e97bb16029d2778e1a5a54a6a6592631f8b2f3a2a1dea4ef2b01803fd"
+SRC_URI[archive.sha256sum] = "ab9059a676a537edbea21388c2aafe1a7e2c8f1ac2dfdc6d64550233075457fd"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"

