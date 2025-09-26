Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3092CCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.18547.1758896369932421769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4WzFUyT;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so4422346a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896368; x=1759501168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfdkSW8O5s+OuwcCdOrsniAln/i8SKZw0zHurUfDugY=;
        b=i4WzFUyTVn0+C87Y7+SpmeYYDMhCOsBV7AnPJhTjU2UM3IJFxZd1xPWtJ6BpZavQ/G
         WTrgYOA9DUyQ1W3U2Ts67G+bWc4yyxqw7Vae2kwCwR3F8t0H6pWMutpRS73m4+lMvAc9
         m3abUUmIWQNjmwuUK+xhe68DxDkNblIGqVNaYtrHssh3kQfSqHm2r3rtiwFf7IyuXPNn
         TzLK23cSehvEw9yzEVkSD3/TL0B6PRYYwrAWsPRm073OvlCuTfZYXJxT2Cvl33BhVQ/f
         zTAdXkozgAkJJM1SVMe+efemxB644FEN2PTUWq7LNMhfriauPPXlGYVjOG9C5SGPfgnR
         XUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896368; x=1759501168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfdkSW8O5s+OuwcCdOrsniAln/i8SKZw0zHurUfDugY=;
        b=F1CpuXDVzvDBeyhkdMJRw8PfCsn63QO6SylW4o5xSHrgm3ACL0uSVtop/yZLAZ7sxD
         2VIM/aAjRY65zxf/y0tS/T/HL1jx2tbyRjkV6YCiLhzgTdG8kTE34I//2Iz1a7/f5ovg
         H7FhczTsmhkuvhUm7vf9PR1lz0eeugHDZWm2uYWF8him4pYWBua8QUvZ0z+FkmFZDFwH
         id3sPOpEEu29LvyYdAdP98NlI+m/x0aw2djztLsAiDYE1LeNk+tBW0sXlAxTwoBCR9W8
         M6h+Iz4ckRDza/0305/aFPBj+Td6rJ1VtGjcXWiXqoT6/rofKTVD7JqdQrSDhyzJw7NT
         n2+w==
X-Gm-Message-State: AOJu0YzEnVRtDxmYIQTYEWbJRE9pPyYwqpYe3j+kDQ2cFDj/K/vmskDZ
	rzqHUTTGg14uvbzpJvL9iNsHHXRe0sZI7GI/J5eT3GKU+SZ/TNLl0Thsui3vqg==
X-Gm-Gg: ASbGncuDu15IjheNQY9D1pGVa4sGeipj0LZN23xziNkm3yd3Myqa+Cw2ob92gTyi0FJ
	KX0FCv89uxLFGut30J/PnLjMJBCdy5LtwwVli22kzJOaTKU+xgPuGjLiiGtLSj8dKWqDIEnkxNR
	eT6rasjqDOLbN12n6++gysyVI168aoYcme7UQ998Bs2fTAr4QCrJkX7OYkTAJ6E2Ve0gTih+rdg
	1qo7X0lXYVgxNSs8DzoKbOFJeRX1kaaY18+w64HKnaU65UcBIm8n9yqyS1CaKow2LWZTqgGkWk1
	cvbFA2JgXHPzDoMc1rW1aS7/vpFwUHIo1IeQtVHKjB+Iqp4ZEPp9HJHQRJL346f0srphw7lA11Y
	0+Gtxp9KdAjjcakah+Q5+WofnSqFQg8Q=
X-Google-Smtp-Source: AGHT+IHO4m1PjpNUDrXzjmueUo6jGEw0ZU9f9QwaxNiUwEXBp4/LWLUdl0zBv9hHeI7APf5XWrUNMg==
X-Received: by 2002:a50:ee04:0:b0:632:16ad:d70b with SMTP id 4fb4d7f45d1cf-6349faaaea7mr4949628a12.29.1758896368077;
        Fri, 26 Sep 2025 07:19:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 06/20] pure-ftpd: upgrade 1.0.50 -> 1.0.51
Date: Fri, 26 Sep 2025 16:19:05 +0200
Message-ID: <20250926141919.2010846-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119915

From: wangmy <wangmy@fujitsu.com>

0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
updated for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8a50039955ae8feb8cfa2b56969a9b8039d3f248)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...oded-usr-local-includes-from-configure.a.patch | 15 +++++++++------
 .../{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.51.bb}  |  4 ++--
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.51.bb} (81%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
index 2606a36675..c213943d53 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -11,15 +11,17 @@ Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Update for 1.0.49.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
+Update for 1.0.51.
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- configure.ac | 15 ---------------
- 1 file changed, 15 deletions(-)
+ configure.ac | 16 ----------------
+ 1 file changed, 16 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 079e6f0..9a1ec06 100644
+index 62768c8..efaeee5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -96,21 +96,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
+@@ -97,22 +97,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
  AX_CHECK_LINK_FLAG([-Wl,-z,now], [LDFLAGS="$LDFLAGS -Wl,-z,now"])
  AX_CHECK_LINK_FLAG([-Wl,-z,noexecstack], [LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"])
  
@@ -27,7 +29,8 @@ index 079e6f0..9a1ec06 100644
 -  for path in \
 -    /usr/kerberos \
 -    /usr/local /opt /usr/local/opt \
--    /usr/openssl@1.1 /opt/openssl@1.1 /usr/local/opt/openssl@1.1 \
+-    /opt/homebrew/opt/openssl@3 /usr/local/opt/openssl@3 \
+-    /opt/homebrew/opt/openssl@1.1 /usr/local/opt/openssl@1.1 \
 -    /usr/openssl /opt/openssl /usr/local/opt/openssl; do
 -    if test -d $path/include; then
 -      CPPFLAGS="$CPPFLAGS -I${path}/include"
@@ -42,5 +45,5 @@ index 079e6f0..9a1ec06 100644
  
  dnl Checks for header files
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
similarity index 81%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
index edc2af3a34..6f03f73db5 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "0BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a4496a14dea009df36c612707d455d02"
+LIC_FILES_CHKSUM = "file://COPYING;md5=194bc994ad6bbd4ff5a021082fe52156"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "abe2f94eb40b330d4dc22b159991f44e5e515212f8e887049dccdef266d0ea23"
+SRC_URI[sha256sum] = "4160f66b76615eea2397eac4ea3f0a146b7928207b79bc4cc2f99ad7b7bd9513"
 
 inherit autotools
 

