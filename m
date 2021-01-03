Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.20166.1609637175244580188
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j9ltPZTZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id k10so13924127wmi.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5UOmWmh+K0NrXIGiDpWKFxJ+C263tzW0NitFzre+7V0=;
        b=j9ltPZTZ83jcCcK3ChJcaY5IqAcws3yUouTHgGiXcsx1t9gyLIEG2m9GPX72tyqVvm
         WntpUhANWXIn75B5buEVDSwt+fXfgSdkRiR9nlVQZCRdp8E5XaMCiVmqygHiUVvu1L+c
         a7R18nXQRXvXWp9VMJPlhH0o8tuxy14F9HhC0g/Okg0uB7Ko+x60ldFgDj5svCY8c65l
         Jzd8BMiysNPUi1QugvCJF0/g+mxM/onlnq0z53LNHa7fzOhivM89AcqLehxKZH+tj9WW
         rqAEO1kzyZpiMKijmWiQmF80IYHQilV3AwTFORBjVeIyxYZNyC5gYBIVMyJmDOqOTPh0
         CMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5UOmWmh+K0NrXIGiDpWKFxJ+C263tzW0NitFzre+7V0=;
        b=B7fPOdrsmT+WWk5G/dbh6D+t1yZ34Uknpr9wUmspYkMlW8CLDk8MmMqLD+6YLbhkwI
         SK/0sDQlH6+JIZlA9Iqxp+h0FqcbAV3QlRXeD2ZmWSYeHOeiqCrHq+GiMnmEBlK1VGRc
         9zhJqEUJgerFIY0fTFz1Rn9DZrw/jEXqDB75G6h70mGHhExOtBcICriXAve/XxD6CcIk
         W0U046HoReatyQwrMR1HxKLbL1hp7GxX4I7ohh9XEVg9DPs8IPv2EMMDE4op2Vcs87uR
         8IVvMHZ+ETjUF4bMF/se5iKXxDV/n/kKKFwainkDi/IOiy74ZT14Sb5XENI8oBvUBHU0
         FqVg==
X-Gm-Message-State: AOAM530Ip3tR11pwdLQ/KXb6u90mzaBES6n9n1ai3Dff+qzSKflq8NnK
	j0A5UzquKP09HuU1JxOw4a0PkypzaHjOKA==
X-Google-Smtp-Source: ABdhPJyrveIolXpZWwysBXWzr4Go6MbEiFluIKeSgAUDy6A/ncNdsgLFuwO55dXA/LX6vVm+AMXbDg==
X-Received: by 2002:a1c:1fc4:: with SMTP id f187mr21016444wmf.107.1609637173836;
        Sat, 02 Jan 2021 17:26:13 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:13 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/16] xfce4-datetime-plugin: upgrade 0.8.0 -> 0.8.1
Date: Sun,  3 Jan 2021 02:25:48 +0100
Message-Id: <20210103012556.557336-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.8.1
=======================
- Fix build with panel 4.15
- Update configure.ac.in syntax and enable debug when building from git
- Remove GSourceFunc casts
- Fix font size (#30)
- Add new README.md and update AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16159)
- s/http/https
- Update .gitignore
- Make build less verbose
- Translation Updates:
  Albanian, Armenian (Armenia), Belarusian, Eastern Armenian, English
  (Canada), Estonian, Galician, Hebrew, Interlingue, Persian (Iran),
  Slovak, Spanish, Turkish, Uyghur, Uzbek

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...atetime-plugin_0.8.0.bb => xfce4-datetime-plugin_0.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.8.0.bb => xfce4-datetime-plugin_0.8.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
rename to meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
index a1fc139bb..ea1184291 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "b88e47af4e9e156e43dc993f18218bd3"
-SRC_URI[sha256sum] = "cd358bc2ff0707b8ef1504396a19b0a27f802c2ec7bceb5cebe2c7baf6adebd4"
+SRC_URI[md5sum] = "3b2176f41ca2031d66ae2584504dc073"
+SRC_URI[sha256sum] = "e9f6f15be29ceb5c45718006b46dbd19b89981617d0768b2ef942b5a70af2540"
-- 
2.26.2

