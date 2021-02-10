Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.12280.1612990558174039193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WO9i/ILv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id u14so3130409wmq.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pPWDBz1zhWqBnnvOkkpkOwzcSNrSvsHoyHqWuaH36yc=;
        b=WO9i/ILv6uboPrfqY7uoYINr3CzOedNnoGEErd7Zqbjm9avBLq9PAOMzC0RKHkVWLD
         YEkrcnrT2fffCmC4OZlh+Sm0qznrciafg17EdU6rZfWP9xhdaAkAs8OIxGnbIKQbB40V
         IZGO9KdDVrCttZKUdoJr3NcJUG9VGD8MRm85rjt8KN0GshoIsmb1snqBu9Og3UCJP5/M
         P6gOvEEqvQ9iZhW5fB2iOY3wpSwau9JdXD2DzUWb/PRWXRziQiaif3B1EP1Z8LebLrhk
         k42qcybu+gGcjJPdbTwjtKpBDSRfR4R9D2Dfp6VEAaWtSNYj56X87iowfA00GUGqrA4z
         tN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pPWDBz1zhWqBnnvOkkpkOwzcSNrSvsHoyHqWuaH36yc=;
        b=BsiHIS2l+vSwqCC+0lDu0aGYBd6ft/p0fEo3sqe4RD6Ff19C+Mjki5iDZdCVya5Vg7
         6kqEhKkh3WpGcJDamKUzntZalLIJDXFwE0IG+alyetCNfxGFgF5hoNASsoYuuh3YrAR4
         3rXqUdJ5sJpxif4ogEJoyGKs5Vk9cz5E9/1N1237Li8X55SWDOhOK8rS0CNh+zSKB/0q
         7lCrUTyMu57HsEa6YYR9O3/8xi1Zjm/EPDmD2hEV5/Ki/jNOOILcvosKKlAFckxzq+4i
         vWZaI6WvQpYyLagg9UrYpIvuB+FS1bw0kTa2SaaK4CsKASODhAWKEYKiFGrzG9ldADqf
         X1aA==
X-Gm-Message-State: AOAM530D5IcdoxGknPJ7vot49ipVjb3N3o8yUnJt6pyp1z31BwtkLbmO
	fzhuInxZhVzNhCcmQwTRSoTFG8/G6Mw=
X-Google-Smtp-Source: ABdhPJwUPfV13r6YU6Zcno0yU6trv+1uHJD+KSPbd6p4f7Lqrou6hRPUeETnyxYY5qeRwz3vtpC/PQ==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr871217wmc.136.1612990556780;
        Wed, 10 Feb 2021 12:55:56 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:56 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/13] libsigc++-2.0: upgrade 2.10.3 -> 2.10.6
Date: Wed, 10 Feb 2021 21:55:33 +0100
Message-Id: <20210210205538.690009-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build with meson

2.10.6 (stable)

Build:
* Meson build: Fix versioning on macOS
  (Tom Schoonjans) Pull request #65

Documentation:
* sigc++/sigc++.h: Describe how to use libsigc++ with Meson
  (Kjell Ahlstedt)
* Update links to the web page, now at
  libsigcplusplus.github.io/libsigcplusplus
  (Kjell Ahlstedt)

2.10.4 (stable)

Build:
* Meson build: Set default value of the 'warnings' option to 'min'
  (Kjell Ahlstedt)
* NMake Makefiles: Several improvements
  (Chun-Wei Fan) Pull request #58
* docs/reference/: Update for Doxygen >= 1.8.16
  (Kjell Ahlstedt)

Documentation:
* docs/manual/libsigc_manual.xml: Update signal and slot syntax
  (Kjell Ahlstedt) Issue #59 (Denis Washington)

The tarball for 2.10.4 has been created with 'meson dist'.
If you build with Autotools from the tarball, please read the relevant
part of README.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-2.0_2.10.3.bb => libsigc++-2.0_2.10.6.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.3.bb => libsigc++-2.0_2.10.6.bb} (74%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.3.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.6.bb
similarity index 74%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.3.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.6.bb
index e6129e246..f4c5aa396 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.3.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.6.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "ea68c7afc23a4b89a2dfa78344460785"
-SRC_URI[sha256sum] = "0b68dfc6313c6cc90ac989c6d722a1bf0585ad13846e79746aa87cb265904786"
+SRC_URI[sha256sum] = "dda176dc4681bda9d5a2ac1bc55273bdd381662b7a6d49e918267d13e8774e1b"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-inherit autotools
+inherit meson
 
 FILES_${PN}-dev += "${libdir}/sigc++-*/"
 FILES_${PN}-doc += "${datadir}/devhelp"
-- 
2.26.2

