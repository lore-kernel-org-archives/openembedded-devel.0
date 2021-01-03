Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.25274.1609683181908030968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ti+Uc/8Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id d17so33382610ejy.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1CeKjLUgt9j3NgAznKlJdgejtFmBfopWElwa/70vlk0=;
        b=Ti+Uc/8Z3SZgDn08J93kwoXXJSwenGDZbpVe7HfPXJOcyvtmcjH7RebgbXLL7SeN4d
         uAf2SqC1h9DiUS5vjI5EneKgDPN9TfBHC/WChO9f61SzACk55doGMWX5z7TDGYv2Cucq
         w98bbu3KpZWYW5cjmzw1GDl4CqYTrRuo/pqzOapZeR62LzwyxMAQbLB5B3u8xzhMeL5j
         K/U8uDj2BCKLU1eKCiG0q1mzof6r/j2yfiy9z66c+4Ph586Fuj9xQ+Kua6hWPrg2/hLm
         qrWsie0WcwAxUiqYgFoanrpWYuh6TyZ2Zijfn44gM+G0nEY7AKSLD0awAke6p0CZxHEf
         +uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CeKjLUgt9j3NgAznKlJdgejtFmBfopWElwa/70vlk0=;
        b=FQk/PUizOCTI3W568TdijDZCQ5MRVsvAqYkidu+UxXN629pF8qZQeJSg7Fq4rvmFwW
         wXILm4RXl7PGEmAL3eVOnvj+rZTF2t1gsehHeLpkavkYEbSqyq2FvFnUsWCJevQD5Qmi
         r4/03dFrG56u2sPn8rLkMJK+q7WONpn5dJUj1v2SwofGZSbIGP3RrsuaTnLzXhtBIbTB
         Ig2z2KgoWhJWWciqFkwtJPY1l1k/oUbydE6YEojfWHTOntj8cWHaMeAgIGQxQYoSR8J6
         5Kp21k7gsFd7z/AHUuBIxabh+2fNyZItlTVEK5+GQ36C34/OpA/3Es2DuerfGVA9tCDi
         DNdg==
X-Gm-Message-State: AOAM53312ZHCf4Z2mPTWsB1ioZar64pjNGgdmTYKwZjcTTEDTFDrzDQ3
	fDaX2EptRG+LHv1+TYQ9WTnMmyfVdXA=
X-Google-Smtp-Source: ABdhPJzdPW1sO3YbfZPwFI0mvpgUysqnImYHe+IJ1g4Xg7NGN+ZpQUjKlwJHf7jPaCaFmnfVUEoYTA==
X-Received: by 2002:a17:907:961b:: with SMTP id gb27mr45257843ejc.313.1609683180513;
        Sun, 03 Jan 2021 06:13:00 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.12.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:12:59 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 01/16] xfce4-panel-profiles: upgrade 1.0.10 -> 1.0.12
Date: Sun,  3 Jan 2021 15:12:32 +0100
Message-Id: <20210103141247.1637618-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.0.12
========================
New Features:
- New build option `--docdir` for documentation install path
- New build option `--mandir` for manpage install path

General:
- Manpage `xfce4-panel-profiles.1` is no longer gzipped (#5)

Bugs Fixed:
- Release install error: incorrect README filename (#24)

Release notes for 1.0.11
========================
* New Features
      - Add support for saving xfce4-whiskermenu's configuration file
      - Prefer CSD in XfceTitledDialog
      - Use XfceTitledDialog from libxfce4ui
      - Use Xfce's about dialog via libxfce4ui
      - Add new icons and use reverse DNS for icons and files
      - Open xfce4-panel on close button (bug #16505)
    * General
      - Add new README.md over old README
      - Try the new and old libxfce4ui gir file name
      - Add basic GitLab pipeline
      - Make tarball creation reproducible
    * Bugs Fixed
      - Update openSUSE profile and fix build
      - Removed check for if the menu is installed. This would probably
        get in the way.
      - Use current branch in 'make distcheck'
      - Use configured appname instead of argv[0]
      - Fix typos in comments.
    * Updated translations: Albanian, Armenian (Armenia), Belarusian,
      Chinese (China), Chinese (Hong Kong), Chinese (Taiwan), Czech,
      Eastern Armenian, Estonian, Hebrew, Hungarian, Indonesian,
      Interlingue, Persian (Iran), Portuguese, Slovak, Spanish,
      Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-panel-profiles/not-create-link-to-locale.patch    | 6 +++---
 ...el-profiles_1.0.10.bb => xfce4-panel-profiles_1.0.12.bb} | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.10.bb => xfce4-panel-profiles_1.0.12.bb} (78%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
index 80cdfb903..b5421f6f7 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
@@ -12,11 +12,11 @@ diff --git a/Makefile.in.in b/Makefile.in.in
 index c0ce866..c2f26fe 100644
 --- a/Makefile.in.in
 +++ b/Makefile.in.in
-@@ -61,7 +61,6 @@ install: all xfce4-panel-profiles.1.gz
+@@ -70,7 +70,6 @@ install: all xfce4-panel-profiles.1
  	install data/metainfo/*.xml $(DESTDIR)/$(PREFIX)/share/metainfo
  
  	cp -rf locale $(DESTDIR)/$(PREFIX)/share
 -	ln -sf $(PREFIX)/share/locale $(DESTDIR)/$(PREFIX)/share/$(APPNAME)/locale
  
- 	install -d $(DESTDIR)/$(PREFIX)/share/man/man1
- 	install xfce4-panel-profiles.1.gz $(DESTDIR)/$(PREFIX)/share/man/man1
+ 	install -d $(DESTDIR)/$(MANDIR)/man1
+ 	install xfce4-panel-profiles.1 $(DESTDIR)/$(MANDIR)/man1
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
similarity index 78%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
index 7226b1a03..1fcb7edc0 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
@@ -3,7 +3,7 @@ SECTION = "x11/application"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-inherit python3native gettext features_check
+inherit python3native gettext gtk-icon-cache features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -12,8 +12,7 @@ DEPENDS += "intltool-native"
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
            "
-SRC_URI[md5sum] = "6190678bc701c197babcb2389ba46182"
-SRC_URI[sha256sum] = "a84d5e748d53bc5da269954cc3ad7f5ac0c4f5813acfd3892ea6f9064f17fb68"
+SRC_URI[sha256sum] = "246e459d2d2f3f524968440ed7fddb2a891567ebc05f10a800f7f5821b3452a7"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.26.2

