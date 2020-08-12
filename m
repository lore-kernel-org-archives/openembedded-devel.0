Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.1228.1597271986566236204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ROb8uanN;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id bo3so4009727ejb.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I/vItS21uLra4jLLfSk/BMYRTtYC6S8CaSrYRh76muc=;
        b=ROb8uanNTOzMXizF2JfBo9xRtaeHSh8CHY3O0Jjf1PSlGzfcCY+JS8jyWSZ+SsJDOM
         12xGp5+XJaAoABOOPDJ5X5eIidHRz6USsmVL04cXww2oGpY/5BV6pAZcGfEreZz+/unZ
         nr+02tCBDKfZMxdf5/4Iv32S5i8I5wTq0qY1KwuC2abUqSGEzkUHuncJGluaHGvvtT1r
         FbsbwJrPvMXgL48hvwB7wnxPgYYo0E+8bqWPKqutrNwwsWJSjfCdBF8pYlON1Ef1nMv5
         ZTZpJSbOF2cCpqa8DUQr4w8ZJLrxe6C886vssMlxZOe+7jH9G4L8VoVATdAYKxxi6wbh
         voqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/vItS21uLra4jLLfSk/BMYRTtYC6S8CaSrYRh76muc=;
        b=VOtB6AnWY9orQZAcPAJsWDTktpbyCvDQ1Bl7kAytPcKYy7smNSmY8FKcFP6xmXkunm
         ygAQhr1382Tjjx+RaYIszVmup5vMNhebYOa7jaACGE9+g7SccAW2t2t2WA8vdx/7uy8y
         T/1agTWpgJnlOX8I3bY93NTwfAIdxpuLHj9fQnCrHtmh5ApeApWWKBopNj7gXlALXmdB
         6ZFk83QsCNuyX1YBxMc41QuxsDouQrBoAGnX0rgQc26z22pbhIWP6IblIN8dBec4UXCs
         B51U2GCxL1j5PNhNn49fLyowfuV3Aao5YmaVGzKQgtVp3PUcrOYupCx0OK4IDT7v1Lzx
         7ODg==
X-Gm-Message-State: AOAM533ZTsbC9JuKZbfsM/jTsMnTm4KmNHrC2wPH38FcfM6I3JxdXZgO
	iGIqySzsiZGA1dEjrscl+t8O+EQH
X-Google-Smtp-Source: ABdhPJxdDM9Iy9p3eeamMELqIlQ85aeKKUSsY1eTvdgKWht45HFZbQ7YHYkGfIAy580VZK7QgCARvA==
X-Received: by 2002:a17:906:68e:: with SMTP id u14mr2192229ejb.166.1597271984821;
        Wed, 12 Aug 2020 15:39:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:44 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/8] file-roller: upgrade 3.36.2 -> 3.36.3
Date: Thu, 13 Aug 2020 00:39:29 +0200
Message-Id: <20200812223933.1119785-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

version 3.36.3
--------------

 Bugs fixed:

  * Drag-and-Drop crash after cancelling file overwrite. (Guilherme Silva)

 New or updated application translations:

  * Chinese (Cheng-Chia Tseng)

 New or updated manual translations:

  * Turkish (Emin Tufan Ã‡etin)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{file-roller_3.36.2.bb => file-roller_3.36.3.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.36.2.bb => file-roller_3.36.3.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.3.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.36.2.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.36.3.bb
index bf5e6f6d1..9af88f2a9 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.3.bb
@@ -13,8 +13,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
-SRC_URI[archive.md5sum] = "caa0103ab34d237a9760fbf5e1c72bc1"
-SRC_URI[archive.sha256sum] = "268f7fdad8d2a78dfed5e82eb8710bad389c311b720666d6f07a04ed51056bd2"
+SRC_URI[archive.sha256sum] = "0959e10a5d7a7442809624be9879d95db462ca76e8c66ad6299310e6acdb81b7"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'packagekit', '', d)}"
 
-- 
2.26.2

