Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.12947.1589899435370030433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LkSvWSzT;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id u5so6507365pgn.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IKhGB7HiG0Tu1USvajB53ufRbypHnipygivEbolrrmU=;
        b=LkSvWSzThQHRrWLpJQ7rtME4aKIbqWUDD2pB8RSzL5yfFNx+FsFOFMQ88AuYN/YnCi
         /ZHMMihtqAXP0Vn8anLCveME4Q5eBPhN4LJA8XJwcquQYcaALMAuaj19ey8v9fxkafSo
         QNNf8QNXDBk1GwNgMQXBHOaLzaIVs9RA/1oqZPNbQ94pNW/dga46S5CVv2O1PG7foLq2
         IRlFBCOkNn/Pm85IaXNV/WjtQfR2EUHnczs7IfEHQOhZn+VykgGhJvd6RBhVi9nvV5fo
         AEAVXMn8dpmwvPjgS2ZaLwgrXbNkfh0ObNorvsJfaMfIg4W894WywQVx0pCLkT9t7dfI
         jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IKhGB7HiG0Tu1USvajB53ufRbypHnipygivEbolrrmU=;
        b=C4tmd68N0/LngbX41pRcPRwh1wviHOdYjla6uBIslyctwlKntq2kKSMYO6zFxpGUEl
         JNVUdGxEHycSmmgHpHg/osOaHAXGASX5V41HF0u4OqSvUn/spjqZe73vhsvzaT++Qepu
         fjRxTjYwKQ8l+NZzitN7luRKPVQcSwZO9ehpjhhII1MT/t4Q89DEbYXFyN0p+9k+Fq/L
         FQlffG85kgZNPNH1D+iaxnra3BlPPcVYjZ7sj711kkAYdsSOk2jRb2GIgGiR/hg5Ivi7
         JVyGHRhbaup5exvwWAamefRk2qHH4dEyntGVzjob8Wcs/Rg4x+7xFkEFJ6qcqCA7zl0T
         xz0Q==
X-Gm-Message-State: AOAM532Lyv3fvyS9SHd2Td2bG2Sz6zBlhrHPA2jIS9/ZezI32SPZeU0A
	E9AP735moPEcXEq2Mxtb+qBGgu/p
X-Google-Smtp-Source: ABdhPJwCAO0TUYFCjWLtec8tGBJZJhQGp0x51+P9sc8jIj0dI3YW/72nOaTP3y7z69QbJPsD2FWBOg==
X-Received: by 2002:a63:f64d:: with SMTP id u13mr19728862pgj.151.1589899434663;
        Tue, 19 May 2020 07:43:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emmanuel Roullit <emmanuel.roullit@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 16/18] appstream-glib: update 0.7.16 -> 0.7.17
Date: Tue, 19 May 2020 07:43:30 -0700
Message-Id: <20200519144332.12822-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Emmanuel Roullit <emmanuel.roullit@gmail.com>

Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 65bdf9fc431952313e6b70574a211eb722ca6d47)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{appstream-glib_0.7.16.bb => appstream-glib_0.7.17.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.16.bb => appstream-glib_0.7.17.bb} (84%)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.17.bb
similarity index 84%
rename from meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb
rename to meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.17.bb
index ec3e4a3d39..eb60bd9680 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.17.bb
@@ -20,8 +20,8 @@ DEPENDS = " \
 inherit meson gobject-introspection gettext bash-completion
 
 SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "78306049412396a72746186452abdf66"
-SRC_URI[sha256sum] = "04f290d73bc865071112076b8a3345df2730783a16af976fe3becfd2f50d5992"
+SRC_URI[md5sum] = "67d441fb0fb3e14551b47db656565fc4"
+SRC_URI[sha256sum] = "7ca7e91d4accefa1c0d2c6e310cb3fe2686c017810e23b3f82d9f5724345e549"
 
 EXTRA_OEMESON = " \
     -Drpm=false \
-- 
2.17.1

