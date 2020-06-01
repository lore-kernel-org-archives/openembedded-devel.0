Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.48700.1591047959307574947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RU7thnK4;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l11so1348374wru.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=00qANzZOXclhJ4K0Unam82DUBayh6ghTCCT1XHIWrtw=;
        b=RU7thnK492KtmYMcyOleS9Ioxph2sGHFUA0iH09+n/XZIKVyZ9ZtNCdpEr32KM0m3G
         Zvji30+jFEwCMH4E/yQX8gy6u7Vrol2Yhd/m6yGqGrrxG3Os3gPFSeYO1NqMvoZncKEP
         mgD+YIYk5ErHGwR0FWi9z2LVASbeY7H7bBjVnwRF9dFpneHiLiifC94P27a72xpdwLeq
         oeSs697yTtYEhtfRlNMfIt24dV5PyBlS8QG5iGyPYvq1SHr368XAEa7d21kBJ4An8QT3
         b+kX8dGYlvaju7AUwJy0p0Apr611aDAvIHTDVBI7BD3kYM/zSMUPRIuavsqy7r47J5Uk
         KbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00qANzZOXclhJ4K0Unam82DUBayh6ghTCCT1XHIWrtw=;
        b=b3SmuZ0lPKigdXxX1AnyQOwIMFsfiB/G5itzsRbo4Fa+dpai/rxB3+eoETUMamaWXl
         VzEZpYWNQYQAnk0w/StaMvzD/dbbqXAeEI6f92nC3jzDeL47gh+zYRRa3OxvaRH7bQ6g
         S7YuVP+poAsD0apqmEPZKuWU2Id99MC4zYMUQijTLWpGwMXpQld06aAhLs/YWPDZ0xi9
         fvViD5M6Jmsjep+qKckyTRyxvAf33VB8HDwH8DI1q84dEdizmpwINSVhBxFVuabnhf41
         qbMLAusrAXJfanzHo/DUZDCv7oJvoejnsOc2sYGYQelLQME1uUUVh6Z1BdXA8WdrsFbh
         DvIg==
X-Gm-Message-State: AOAM532JRS61YQhSwKZ1JXmARslJYof+pLL0SKKoVPn9imsT9hp9X+/G
	ZN1eWkZSHgsT164/YrHXOk7wFUJw3Dw=
X-Google-Smtp-Source: ABdhPJxM4StnnhhI87PglomLI9yXYH2XGObLRmX9nMyvMhpjS5qxDKVSnnBg52IdEvI8hJ7pofaGjQ==
X-Received: by 2002:adf:9507:: with SMTP id 7mr23355580wrs.63.1591047957548;
        Mon, 01 Jun 2020 14:45:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 30/38] libgnomekbd: remove
Date: Mon,  1 Jun 2020 23:45:08 +0200
Message-Id: <20200601214516.26624-31-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* last release was Feb 2019
* nothing depends on libgnomekbd

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/libgnome/libgnomekbd_3.26.1.bb   | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
deleted file mode 100644
index 2a2db9c19..000000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "GNOME keyboard library"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
-
-SECTION = "x11/gnome/libs"
-
-DEPENDS = "glib-2.0 gtk+3 libxklavier"
-
-inherit features_check gnomebase gobject-introspection gsettings gettext
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "98040022484406e7ebe25f82cef93344"
-SRC_URI[archive.sha256sum] = "f7ca02631576e9b88aee1b1bae37ac1488b80ee7975f20a97f29e761a7172679"
-- 
2.21.3

