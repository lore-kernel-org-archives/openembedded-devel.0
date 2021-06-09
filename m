Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.4388.1623220745560953700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bjet4+rV;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ce15so36652198ejb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d3/kEB0GJMoU8CQsUwbHd2XbkbvwkH+zBKh6d0iieOo=;
        b=Bjet4+rVZPiDHLlIjweyFFwJYm2p7oEAO9QNEsCyFMOEoqa2jPpBQUoLmXvhLuRNK8
         e7siGuaTnNdXJtT73WF4IshM5O2bFUhiK4GIA/MHVI2lod53mKg53qcODQYdjF3K0ikV
         YWvWUpIl0wwfQiNE6+n0xlezlIYMDsGDkow6ebxJPmtjPZ90zWpo+uri8zvKC5AOmxRC
         MkMZSLtozQsdB0lGJhSVz6d+iMm16D3NDPBbkdgrMNqHgjxUP+ZAq8xw4xLpef7dXpVS
         iBPEh/640LO+ipgrKoHULnk7ukoXKBjUUNZEX6YeQTbwQP99GsD7MUIWIO+bNLzs5VLD
         Ph4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d3/kEB0GJMoU8CQsUwbHd2XbkbvwkH+zBKh6d0iieOo=;
        b=K7LVXW7VaHI5hRnkRUZ6p5mKHw2oJgH7djX2JiDWmUlWCVEmEYoAwgn9eWEfw/RIjn
         +DeheGh5I2yYoKBvcRQaS82XJrBEabx5Y+roJc+1KKYgATj/mIDZHjzb8hKj4NssCpjC
         FNmxqPhQJHoK57VMEiByipUQpw7GVrPg9OEHwFv9wUSOh4qFfU7LFeeHrg2B1wHqDoie
         KsbrLkFzLRGgCDygNWzhZcRg9SeDpgKbC1ZxGeVFuYxKMTRjeS3RqvFrWCEWGtkX8i2H
         QkIFi9fAzOs11z0NaDpmBC69YKMvEZ1c10ryiwUiguxhTP8dzPZGFdXONwCqUTa2fz0T
         9Wrw==
X-Gm-Message-State: AOAM531f6Ec2ySsr5Msfkn5hzjb9v4c7tCTDCA4rc4BCpTj2heUQgUde
	zq74rUQxiPxGEagJcR+EF5bmg1ndNXWv+A==
X-Google-Smtp-Source: ABdhPJxqfJ2IseRzLpuEXAZfHKhrmwY19T81ibdKqX8wYa6YLvHseBg10WFtPBSJ2WWu6HBhlsSM+Q==
X-Received: by 2002:a17:906:180a:: with SMTP id v10mr27054920eje.22.1623220744087;
        Tue, 08 Jun 2021 23:39:04 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.39.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:39:03 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 28/28] xfce4-settings: 4.16.1 upgrade 4.16.2
Date: Wed,  9 Jun 2021 08:38:31 +0200
Message-Id: <20210609063831.3400611-28-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.2
========================
- keyboard: Mark system defaults switch as active (Fixes #310)
- keyboard: Correctly initialize setting (Fixes #310)
- keyboard: Fix icon name in settings dialog
- keyboard: Make buttons translatable (Fixes #306)
- xfsettingsd: Fix setting float array properties
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-settings_4.16.1.bb => xfce4-settings_4.16.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.1.bb => xfce4-settings_4.16.2.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index ccd55723a..bf853bfed 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "bb28e1be7aa34d0edb1cfbaacc509a4267db56828b36cd6be312a202973635c6"
+SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.31.1

