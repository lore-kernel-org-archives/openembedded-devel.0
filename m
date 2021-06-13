Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.23265.1623627169277881580
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jun 2021 16:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hrYb3N5V;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id h16so8702358pjv.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jun 2021 16:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5pgCGo/uZAF4DdAIRzU60rlEs/houXAsZ99vQplq3Pc=;
        b=hrYb3N5VQ2pQ3wDZQCYgT9bHvfKMuQVuw5JA4wNCP5O/aKsuVcKaub+NzhfwMT7Rh8
         Wn1PPazAta76qUO/XrwjbtfV6J1mzP5xMPGc8T+FoYIPOeljpyE7s1wC7eWVe+LRLc5V
         1fJ+tm9GqPoSlhMDy83LjToS6xhcG6+bJuFsiPuGkTkBMxie8oNR/vZCzwmLTt55YGXg
         tZfa0zhmqU4PWMGuObbHAKl1KIFwpeZU/i2Cu+yhlwLyjcMh7RdoojI62aGwsWwxrMFz
         fYjxu/bgU4JQf3oe0n+Q/sHFgtU4aaq4L8iiOcD1F8nIl3y2mfwNeRewnLapbHhWmlCG
         JalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5pgCGo/uZAF4DdAIRzU60rlEs/houXAsZ99vQplq3Pc=;
        b=bPq4O63Fkl6EL6BsNPQn3XYlVlSc+FETFnZNyY7bPWRtcEPniL5zVChgl/mYeC/fUu
         HBy8O7qzzvlloY60c51mvxYI+c6S5qbZPs4lUmBClMv54N1wevZLqudCafRE6q4Vo/oI
         sHiI/6ifLQ8Vu69Vwb59hsebgyleKRN3zjcSAJOjjzSD3SruzLmua9I5oS2fK/mGBDMz
         oHmJ8Efms0Ff49hFZsUM1VCRNfm0CdK53xr+WkchsxMVo18nlF1rD2r15zMxJyQ6GK1y
         zUk8zq+ueuSYXC+Js32jLSliJWE8voxBNp2A7o+BQdfuoYIw7ZoKX9ezZpoXA8V4myjk
         PaIA==
X-Gm-Message-State: AOAM532v1wWOEdFreouErQlytEVs5Hruih942q6jpQpbNgCg6Wrleaxs
	KAak752n7iXSFztpvTjIuXi7qWc09kJj7w==
X-Google-Smtp-Source: ABdhPJz7+AvFZqc8vfgl4D2oI+5//XUlNQfav/ZnqUVAZwvDG7PHOcvqhNgyzLav7yPxugIRyFO56A==
X-Received: by 2002:a17:90a:a509:: with SMTP id a9mr15611477pjq.190.1623627168576;
        Sun, 13 Jun 2021 16:32:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id gd10sm9933924pjb.0.2021.06.13.16.32.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:32:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Hardknott 1/5] squid: upgrade 4.14 -> 4.15
Date: Sun, 13 Jun 2021 16:32:40 -0700
Message-Id: <9362c5078db4ac2a21b698a65ca92b87e87164d0.1623627089.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1623627089.git.akuster808@gmail.com>
References: <cover.1623627089.git.akuster808@gmail.com>

From: Andrej Kozemcak <andrej.kozemcak@siemens.com>

Changes are found at: http://www.squid-cache.org/Versions/v4/changesets

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 77e614754553e64c4bc554ae802dc09e56eb6209)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...0001-Fix-build-on-Fedora-Rawhide-772.patch | 25 +------------------
 .../squid/{squid_4.14.bb => squid_4.15.bb}    |  2 +-
 2 files changed, 2 insertions(+), 25 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.14.bb => squid_4.15.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch b/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
index 28a410c26f..ff51f53448 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
@@ -11,10 +11,8 @@ Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634
  src/Makefile.am               | 4 ++++
  src/ip/QosConfig.cc           | 1 +
  src/ipc/mem/PageStack.cc      | 1 +
- src/proxyp/Parser.cc          | 1 +
- src/security/ServerOptions.cc | 2 ++
  src/ssl/helper.cc             | 2 ++
- 6 files changed, 11 insertions(+)
+ 4 files changed, 8 insertions(+)
 
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
@@ -70,17 +68,6 @@ Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634
  
  /// used to mark a stack slot available for storing free page offsets
  const Ipc::Mem::PageStack::Value Writable = 0;
---- a/src/security/ServerOptions.cc
-+++ b/src/security/ServerOptions.cc
-@@ -24,6 +24,8 @@
- #endif
- #endif
- 
-+#include <limits>
-+
- Security::ServerOptions &
- Security::ServerOptions::operator =(const Security::ServerOptions &old) {
-     if (this != &old) {
 --- a/src/ssl/helper.cc
 +++ b/src/ssl/helper.cc
 @@ -19,6 +19,8 @@
@@ -92,14 +79,4 @@ Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634
  Ssl::CertValidationHelper::LruCache *Ssl::CertValidationHelper::HelperCache = nullptr;
  
  #if USE_SSL_CRTD
---- a/src/acl/ConnMark.cc
-+++ b/src/acl/ConnMark.cc
-@@ -16,6 +16,8 @@
- #include "http/Stream.h"
- #include "sbuf/Stream.h"
  
-+#include <limits>
-+
- bool
- Acl::ConnMark::empty() const
- {
diff --git a/meta-networking/recipes-daemons/squid/squid_4.14.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_4.14.bb
rename to meta-networking/recipes-daemons/squid/squid_4.15.bb
index 6d154c87e0..8ba10674c9 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[sha256sum] = "4ad08884f065f8e1dac166aa13db6a872cde419a1717dff4c82c2c5337ee5756"
+SRC_URI[sha256sum] = "71635811e766ce8b155225a9e3c7757cfc7ff93df26b28d82e5e6fc021b9a605"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=0e03cd976052c45697ad5d96e7dff8dc \
-- 
2.17.1

