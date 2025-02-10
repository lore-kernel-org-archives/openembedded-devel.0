Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F197C021A1
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:10:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.55416.1739203826156368635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QkVg1XMN;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2333685f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 08:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739203824; x=1739808624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ODAfQRKtfxbj+5EmYXUewYqOoIypxiT6U+Ucvxcc0Q=;
        b=QkVg1XMNmXh+hjaVEisM5gBRSZ0djbkPbXjwAeMnMmomjDBG77paagyo1ougjVDUSH
         sDg3jKMLUdmbH/ndVBceiBiPgrWZn1lSC05MI3Jt3gmcmhvnQiJgsj4o6z7LU7R4s7R7
         X/Aq5t+kPFjVTZ9ITEKT6UOdjyZtUSn6HQzrHMps1jfZ8Ls13sLI8b+p/2tNU3qOb5vR
         Iw88W5DqMLbou72n9YGp+2m57s5m2WRCm2GLYupayQVYd8xl8Rixrz/MseLkUbXIj6pn
         IkH8ds3vGzTEdBAu7biXmfL9WmgeNMtxvKaa38spkblyt2nmMEKpmKP57X8v5/q2lWsn
         yGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203824; x=1739808624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ODAfQRKtfxbj+5EmYXUewYqOoIypxiT6U+Ucvxcc0Q=;
        b=kEvRTnI55qtWCbWruDIva6NfVglvp1UtDimaiFlDekdLLZ++7A5nEBDPgsfv7+XINA
         aSwlHAxu7mqD5Q1AzqwYEYvu+8woDxM29z3ASeoNF/SSW0K4FtGz0ej03V9Ip4AqZLY7
         6I9KkLCBWuRs8qQeEa/UStWw01nK+A80XmBmpLj7J5uZ+cDe/uBUlduBDMiLgv3PG+gV
         /PXjhL4M4+E2aqBB2CdDDSuRWjoXGx34roZ52/gCO5CvjaECKamdtJ49A+7Hwqa8Ig8W
         BxCopyxU1CEKi8zSnGVNvMtsWa1ecxCk58ewMoQsfo7hg8CifBRF719YMTca063znrel
         VhPg==
X-Gm-Message-State: AOJu0YxCJJ7PvDG6JKh6k3Xk1qkXSX39TIV6ey/Ks9VYPiaAVe6pp3DJ
	yEaTV5N4Oy9elK87kzIRl4hVIYtRHchxsfGAumXp5iCP1gtYDE4YE5ezINOa
X-Gm-Gg: ASbGncsc6NBd6QQt5Om1uiQ9zd0jpYkNFCb4EqcAgcN0BldGL6QglTMzM3sdzdy16JR
	JxzVy5TsLzNExxQCP31ZLjLaaiifd67dmfsF3ggxkQ+rKA/8WutQ2agHfRrfbylMQ76kR/8vMta
	/8ve3vU+M2aJzU9lTCHacqrxrupkJsVv8k/EZMsoIDLl43wQI2EmnBN+LOVhI/K69pwe36ST65q
	YxMuUa1ff2IgMjY8+ZGLWKcVKBPd1RGTZlOtPdigDstW1bOWTmJOjpBh/KK9ygupiETimBd3eZ5
	q8T8CzT0ICWkTaspBlT7tHJDYayLIVE=
X-Google-Smtp-Source: AGHT+IF96rb1zJmLX8riu851613rZpBrkO8c1TsvEVX80doNw3Mf2bLVoh/bjGJTpw6ud1+B90r+UQ==
X-Received: by 2002:a05:6000:2c2:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38dc8d91f1fmr10720203f8f.2.1739203824337;
        Mon, 10 Feb 2025 08:10:24 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm10928004f8f.79.2025.02.10.08.10.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:10:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] grilo: remove obsolete comment
Date: Mon, 10 Feb 2025 17:10:22 +0100
Message-ID: <20250210161022.2904524-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 16:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115406

grilo can be built without the "net" PACKAGECONFIG,
it has been fixed in the upstream project[1] in version
0.3.14. Remove the comment referring to that bug.

Also, fix a typo.

[1]: https://gitlab.gnome.org/GNOME/grilo/-/commit/9995169ab01c6a274a471b6f6d5f560683b0ae99

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
index f6ea21eb5..786274818 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Grilo is a framework forsearching media content from various sources"
+SUMMARY = "Grilo is a framework for searching media content from various sources"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
@@ -14,8 +14,6 @@ SRC_URI[archive.sha256sum] = "884580e8c5ece280df23aa63ff5234b7d48988a404df7d6bfc
 GIR_MESON_OPTION = "enable-introspection"
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 
-# Note: removing 'net' from PACKAGECONFIG causes
-# | bindings/vala/meson.build:15:0: ERROR: Unknown variable "grlnet_gir".
 PACKAGECONFIG ??= "net"
 
 PACKAGECONFIG[net] = "-Denable-grl-net=true, -Denable-grl-net=false, libsoup-3.0"

