Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7014.1593383759481320963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 15:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q8Pku1Ik;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dp18so14716306ejc.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/3vajvdjOtsSc4m5+/IAAV9XwVMHQ6jj1Nnjooa6avs=;
        b=Q8Pku1IkCxbNTgtubOGUfdl8lztJ4ba6HgNumSuVjV6V+9f4Ndt+J76C9+W5GHTyWP
         EHLijMciT5LEO4CBUxCdkI7z8E0fiQHYl3cyLBIwjnxNOk1sw1Ej1lQUckRCUFwb/B2G
         aBW7tw8MGcXFQ6hijOLTPpbCk9daF+oIApofUUT9qoqlB1IeJY6FG/D4nfBLFDrzfeKh
         qWBoRe5rpuHpq4pphe3cq8aOQ4QsiwSPpafDrJBJK6dKqdFpSyZQ2a5bnNaIeTElMwoY
         pghkcqgPZDa0W5637Mzxz9WVN2gHZ4G/M2QEfuvuEdL7lWZ0EB9ymBO2GOu5XscrkjdB
         ngaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3vajvdjOtsSc4m5+/IAAV9XwVMHQ6jj1Nnjooa6avs=;
        b=hBa/UW2d2hTdgz7lMtKx0/pirT2LK511asV4treNhg2dZ7HAWZBP3eggfInf89REai
         P0CCDT4lv7VRAGqjqeFzjv6tW9bKvO3hV5VE7gG2jdUG2BAlT7z4Kk5CdUmZkihPfdbt
         0oJMdVoOHDn2lNNvUOElpBqA7SJ34ykgVF7PAW7NERC8TLQaKu1J+fWcrWmDYllFGMUq
         0HJCRpz3Z+Z0Bgah6lOsdACKY9O5sWErMNgRdKwpKt7NeBcLLrCc6pOY8fv8rZo/9FMO
         WGvYY1p5ZfEeulYcRFFsj4Sb7EaO81G7OUVy4FN/ZJYZ6SR4ddIXRqunvq3E71nSc3ky
         8VYg==
X-Gm-Message-State: AOAM532/K+a1gX2+LzsIKt0a9oBqp87MV2bdRw6xSWflxcbP80Ilh8C4
	K2nR5Q9GdKEFOKqmz7eNyymOo+2T
X-Google-Smtp-Source: ABdhPJx7I/htRM+yN0DI02HCk2lYyN6FaYIIP3qX0sE9xUiwApQjwxGRnyMfznQwgDV8cyPX86kRHw==
X-Received: by 2002:a17:907:1002:: with SMTP id ox2mr11383709ejb.358.1593383757821;
        Sun, 28 Jun 2020 15:35:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id q25sm7602169ejz.97.2020.06.28.15.35.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 15:35:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] ibus: upgrade 1.5.21 -> 1.5.22
Date: Mon, 29 Jun 2020 00:35:44 +0200
Message-Id: <20200628223545.3853840-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628223545.3853840-1-schnitzeltony@gmail.com>
References: <20200628223545.3853840-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1.5.22

* GDBusAuthObserver security fix 3d442db
* Use XDG_CACHE_HOME for Unix socket directory a141a14 982c40f 5742e1b d53401e a1705ad
* Hangul button press handling 25d11f5 c662a02 ecc3465
* Fix deprecated APIs 48a8d7e 35863d8
* Bug fixes 773420f 745ffb8 26a8105 bccf94d d50627f 7486385 cd4fef5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 0f4ae7d04..1bbeb2c48 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
 
-PV = "1.5.21"
+PV = "1.5.22"
 
 DEPENDS = "unicode-ucd"
 
@@ -13,7 +13,7 @@ SRC_URI = " \
     git://github.com/ibus/ibus.git \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
-SRCREV = "ae0040c73466bb6e78fce5e669a55fcce6ffd16d"
+SRCREV = "e3262f08b9e3efc57808700823b0622ec03a1b5f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
-- 
2.26.2

