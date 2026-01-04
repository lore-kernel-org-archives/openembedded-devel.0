Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89C1C2A076
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 10:38:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40901.1767523128534177340
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 02:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E54krWw+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so5354839f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767523127; x=1768127927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwsiU1j7CgaclQ917JzFDIFVqDEMQxszaVfa1+c/VVA=;
        b=E54krWw+1HVD6mNZb/PFqdFTv845MjYVO5ARRTjbMvKZJpPycwa6vItGq6v31vHr6F
         rYI2j+5yl5xsRaDGdgMf7C01Ji/s8K3kjZOc0FVGJ0COGaI4jL3oaxhipdDg+dR12+sG
         JQ+cRVtcwNA6eQqWP3JpQj3+MF5bSN2kruP8Jc7gENYhlrXfF61fETGUTnIx5uBNDHnz
         7JMV6v6dO015C1VqEmjcMe+dfovd2gPurZUU9K99Zdf6KVNZsCnFDVdlTj44yuu1Bw4W
         Qli2RgpWfaLWH+mc0x/NgCuNcZhGwv0f0UuC+2imyg/U6eHqaO/DUTH4jZlfdk9m8lnX
         CUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767523127; x=1768127927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwsiU1j7CgaclQ917JzFDIFVqDEMQxszaVfa1+c/VVA=;
        b=FobQYG8ALMRFEByN5uf/le9q4NoQoHZhdmwiLjQG6NDfhYZMcV/y1qyGwlgb9e1Gu3
         vn+frAR7IcTwLuN51caSyVDhgwbp+ZGWQudRT1ZNscj5eJTwrxxJ8CpZJaSGK+dewsEN
         bQDxOrLsRnulvl0XLxV6OViAgc0QKoKk1GdosKAxwveQFDu6cbHEmJAQeKvNeZa+rmR6
         CuylmhkhGoxJdEUZNfvw9rmrivP4OTdBdGb+euI43pXtBQKKMebfAW/7QgcPoumuFCWi
         sJ+bPVCsY6hiuDtNenXyRbHCJjr38wjekD0B5abacfOqhH30JKzlbbFYdsSwClMcY2xT
         Gahw==
X-Gm-Message-State: AOJu0YyxdbVLKYgLTRZkWT34wVBse9LgN3vQXx0xZ3uOjORlrqfIM5/i
	V5UoHVOnn5Kynxr21rLL+IRAksNoVl76m6OYsA2iHTd2hUSCMpqw3Cb99/hPjQ==
X-Gm-Gg: AY/fxX4nyFsgCMrm3srQjuuPBxdidL8h6XOAwHHoMwZ1KVLtZqReCfPqYXaqtjikQAk
	6L6uPpZX+he2cOtefcsMx5JWVntgjKhsyYKFs1P6i1ax3d1yFC0nx2HzR2j8ieHWytAw3arKBpc
	tSxD9ofyADkSmVB/+6XVXeDxC5Xx0CDd0snKy7/qMwMZ1SCQvoGZkrNDEycM1wgTnvyr0/SkPqV
	1N0StLbsmyNFe2kPCsDgwrtH9LsB3ftSKBVgy4pm0QD2ATwOF5s28zksLLtEOKazd2wx+xP49we
	Dr2iaYAubNZLod58WUUnmqODjbI8JhQ4150w9whtxaK6qkIReoVHlbTqZ2H4oIepzw5psSFIqn9
	AXIhMub84TuawF+aYZkkWVXrYjn4DeVeJGWzQTyGCePaAXrMZihi0nfxfB42GTmnYcNQ3nR+MPF
	3QRKP4BmHU
X-Google-Smtp-Source: AGHT+IHkI7dQpWQQqPgsQtB2tYzWjfR8biBffKFnPtM1X5ZB43CtTv7EK4u30R8MrAQURSRRn0O0qQ==
X-Received: by 2002:a05:6000:2301:b0:431:266:d134 with SMTP id ffacd0b85a97d-4324e50c2ccmr59009180f8f.53.1767523126835;
        Sun, 04 Jan 2026 02:38:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm95885178f8f.4.2026.01.04.02.38.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:38:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] tree: upgrade 2.0.2 -> 2.0.4
Date: Sun,  4 Jan 2026 11:38:41 +0100
Message-ID: <20260104103843.3450950-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104103843.3450950-1-skandigraun@gmail.com>
References: <20260104103843.3450950-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 10:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123116

Changelog:
2.0.4:
- Fix missing comma in JSON output.

2.0.3:
- Fix segfault when filelimit is used and tree encounters a directory it
  cannot enter.
- Use += when assigning CFLAGS and LDFLAGS in the Makefile allowing
  them to be modified by environment variables during make. (Ben Brown)
  Possibly assumes GNU make.
- Fixed broken -x option (stops recursing.)
- Fix use after free (causing segfault) for dir/subdir in list.c
- Fixes for .gitignore functionality
  - Fixed * handing in patmatch. Worked almost like ** before, now properly
    stops at /'s.  These issues were the result of forgetting that patmatch()
    was just to match filenames to patterns, not paths.
  - Patterns starting with / are actually relative to the .gitignore file,
    not the root of the filesystem, go figure.
  - Patterns without /'s in .gitignore apply to any file in any directory
    under the .gitignore, not just the .gitignore directory
- Remove "All rights reserved" from copyright statements.  A left-over from
  trees original artistic license.
- Add in --du and --prune to --help output
- Fixed segfault when an unknown directory is given with -X
- Fixed output up for -X and -J options.
- Remove one reference to strnlen which isn't necessary since it may not
  be available on some OS's.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.4.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.2.bb b/meta-oe/recipes-support/tree/tree_2.0.4.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.0.2.bb
rename to meta-oe/recipes-support/tree/tree_2.0.4.bb
index 08d234acdd..4bb49a377f 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.2.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
-SRC_URI[sha256sum] = "7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf"
+SRC_URI[sha256sum] = "b0ea92197849579a3f09a50dbefc3d4708caf555d304a830e16e20b73b4ffa74"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"

