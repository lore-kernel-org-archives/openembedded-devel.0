Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.12494.1612990557367968934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RaZgnEMA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id o24so3130306wmh.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HFv2jEy6WArnrJsT4DWIiE9TA22YeK0j64jTd1CzyLc=;
        b=RaZgnEMAqeeVj0iuVuPexhglBLMn1IBj9DN7BjsD4ViweqHGNoimMT3SkSPC8SOXL+
         R5s+YJwFJ5xImj3eEETW+BJWy4w3mA114kkQJnwPYPsm/PItf3QdVHFN8NsuxtNsZ6xj
         oqABRhJyzfcSQ9o1oWV5vLg7GbnWkrsvDDyfaBOdlNKX8xB7IC+c0eo+te51rtuB8l3v
         N6+GfsWIx6VTorQTsWbdt16oVgfbYkKd3Me13Keh17L595UjuQi+YAUBaglFIGxoMIZp
         Q6LoT4IXG2UtYJeLJS4ie9TMYBlCYMdxMBeCAXxDm8fPVhLdyzIAxYBUQ6yCBOTOvOpY
         jYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFv2jEy6WArnrJsT4DWIiE9TA22YeK0j64jTd1CzyLc=;
        b=GxDWj3bPRFCG19hwyY0+Fl9+vjPLmeG+Y2BJqLJ1WYYVE8FVcZOg2zCApqJ8Kf8iOj
         fycI2omWV6tTEGeM/LUcdkJFdEaephdfHdfijB4qyyrPeVQoYC6dX+geQ1cJtIS6HmGg
         4A/d3heUIz97eksBXUx0CknkeVmIvf47YJ+JIJMbeuo0brdrR3LhvfFMSoCMQ0cBc4FX
         o55vdGUnRy5mTXpkOzjGyxk+OuBmE83EAEBa6l2X0b5uPupqGShEANevyS9BBhnmPUwc
         or2jD2DVejpPGosuGeyLHdWfQNc4KSIo1A5J9ePyg4iLnt67b3WBozCjrOYsqjYfdAzR
         erqA==
X-Gm-Message-State: AOAM5321jbhFS5fgamNT4UX/iHqUagStkeYmWqiMMq3szJZcmkR3140K
	AVDCxTZ3WffkilN4XrB5J9nTmxhXjMA=
X-Google-Smtp-Source: ABdhPJw9aVj3JZct5JCmpoYjgBiRE/XV6rVM4plKIfWOVUBn5LMMe/3UaYy/nClFtRbUhecJO3UJyg==
X-Received: by 2002:a7b:cdef:: with SMTP id p15mr861372wmj.112.1612990556034;
        Wed, 10 Feb 2021 12:55:56 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:55 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/13] gtk+: upgrade 2.24.32 -> 2.24.33
Date: Wed, 10 Feb 2021 21:55:32 +0100
Message-Id: <20210210205538.690009-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of Changes from GTK+ 2.24.32 to 2.24.33
================================================

*********************************************************
*                                                       *
*   This is the final GTK 2.x release.                  *
*   There will be no more updates to GTK 2.             *
*   All users are encouraged to update to GTK 3 or 4.   *
*                                                       *
*********************************************************

* Make the output of gtk-query-immodules deterministic

* GtkCalendar: Use %OB if supported

* GtkIconTheme: prefer exact matches

* win32:
 - Always process all available messages
 - Ignore autorepeat for modifier keys
 - Ensure monitor enumeration matches up
 - Fix pkg-config file generation with msvc
 - Fix UAC manifest rc file
 - Add Visual Studio 2019 project files

* MacOS:
 - Use NSGraphicsContext after Yosemite
 - Force redraw on Mojave and later when processing updates
 - Fix a use-after-free

* build:
 - Support automake 1.16
 - Fix compiler warnings with newer gcc

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gtk+/{gtk+_2.24.32.bb => gtk+_2.24.33.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtk+_2.24.32.bb => gtk+_2.24.33.bb} (91%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
similarity index 91%
rename from meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb
rename to meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
index 682d31e49..0c2e353a9 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -13,8 +13,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
            "
 
-SRC_URI[md5sum] = "d5742aa42275203a499b59b4c382a784"
-SRC_URI[sha256sum] = "b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e"
+SRC_URI[sha256sum] = "ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
2.26.2

