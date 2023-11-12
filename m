Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D00C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 16:17:12 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.17773.1699805831005581354
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 08:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WatW0RFU;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so5783759a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699805829; x=1700410629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypDCjkvSFqS+G5QIGmIkCHJMBktJuuN8dPqwrhMky78=;
        b=WatW0RFUYeiNsYJ33RpDHsMT1y6N+ma8mzX33SWkTRha/6fyuKXIm8bD5cCx4sjp3n
         BODidDKGi+YyTJM+VBmrNOjeEC3J4LpG0ANLDIQLONkdghaJFToYPF333w4aK2QQUXH5
         lAvW+AB0sj2zFpcd9yc9bc8z+p2w0a1Ec4m9Rjd8UIgFYnp7cs/4VFVtbeCFb1pE8cNp
         J9m0CsTJQAbuldaepmkIQOhVG5AEgliSKXst7SPPi3xHW6V2IL8qUL6ZviH+wQYKJdN9
         touVFavJv0FYhv056qk7rY7AEEkv176uRGKf0znv5hfJN9AxFdXHHcCPvgQ4uJkobp/Y
         f/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699805829; x=1700410629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypDCjkvSFqS+G5QIGmIkCHJMBktJuuN8dPqwrhMky78=;
        b=c6tPxsmXRTODRgXOelQcbnmgaSL/VN5AQEfXVHcDvCnpzBHvRLkCqNJDmkmcKCgm/x
         jKWyeDpfB4WhdoQbXdz+AML74ZFCYSNmS5U8n9aTEl7TqNBou4iuXY7zVXDIXuMIDIi9
         I4h/HPw+98fdhdxtVBYnYLZRWPo+xuBOGSIpfMSSs7f5MA5oaVsxFJ/4Ew9LkcHJlNnP
         0T+wq0QX160Df3+RV3YkaUpYY7eGNJYKM19es+mGayID8XtHny90K+ev1IKcK65wG/oA
         njUkvx3AOBG53PPGudpcd4BkhyhHL861KOLXVqQI/NbbLXT6I2eQIY3b650WAEMHhkBG
         xRIg==
X-Gm-Message-State: AOJu0Yx0oa2kyiSINEiK4GKZ9i/Or66mCGP9JB1eazls2BrT6lJXHWuy
	nYviHNc6F/ukpdNxqE7Nn2NQ7l77xCt4vQ==
X-Google-Smtp-Source: AGHT+IG/blt1E1X8n5aV3zyLOcMwxeXEZsidxRc4SD6ZbcJGODMZ8drS90BAOg2LiLUo/58JgCuQxg==
X-Received: by 2002:a50:ed99:0:b0:53d:d799:641 with SMTP id h25-20020a50ed99000000b0053dd7990641mr3392211edr.26.1699805828652;
        Sun, 12 Nov 2023 08:17:08 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id m20-20020a50d7d4000000b00530bc7cf377sm2479048edj.12.2023.11.12.08.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 08:17:07 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] opencore-amr: upgrade 0.1.3 -> 0.1.6
Date: Sun, 12 Nov 2023 19:16:57 +0300
Message-Id: <20231112161657.553436-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106592

Changelog:

0.1.6
 - Fixed an infinite loop when decoding some AMR-NB samples
 - Fixed noise spikes when decoding non-voice frames for both AMR-NB and AMR-WB

0.1.5
 - Fix an autotools issue with cross compiling from the 0.1.4 release

0.1.4
 - Autotools cleanups
 - Fixes for SID/DTX in the AMR-WB decoder, fixes for handling of bad
   frames in both AMR-WB and AMR-NB

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/opencore-amr/{opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb} (59%)

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
similarity index 59%
rename from meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb
rename to meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
index ab5813ebe..be7977308 100644
--- a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
@@ -4,10 +4,10 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dd2c2486aca02190153cf399e508c7e7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd2c2486aca02190153cf399e508c7e7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
-SRC_URI[md5sum] = "09d2c5dfb43a9f6e9fec8b1ae678e725"
-SRC_URI[sha256sum] = "106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da62ffc4a070595385"
+SRC_URI[md5sum] = "03de025060a4f16c4c44218f65e13e95"
+SRC_URI[sha256sum] = "483eb4061088e2b34b358e47540b5d495a96cd468e361050fae615b1809dc4a1"
 
 inherit autotools
-- 
2.25.1


