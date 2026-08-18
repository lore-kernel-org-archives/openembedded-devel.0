Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA0BC5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2321.1787029304714676339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QExqCnxn;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so49216955ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029304; x=1787634104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWnxwDIZf1Mw9ThYzQTSH7iLLYZZalG5BnqF3J7ZdAU=;
        b=QExqCnxn7eGUuXoo7U4pbpixDkbJp3jmjcicBiszvCH8zZePNN9pJ5M1jRVMmtq1Zr
         0eDj6CVSn/BoqfTN+itGGJVFm7DNFcLKhQBM7VKj8yBtlWj5RCDdXMdWwJMl0hbHVznO
         w19oVO8BYN9jbe9gzwCyws5ovR8bhkHAtTFmG0yZWFyCK5P/bvcNn09RlBxoawAQtQHr
         EnVMtUVfKLp+ftZ4PhUy9A2HNs6XHPJRjT405RJJC9HYQdslEq+RZAKGy/ILmoazbONP
         cIkA4kVMtQ6CZpQvdDDf0GNxZNJRyAx/EbFbSC+nHr2opXT2md0ffUEXRbKIUDg4wrpF
         zRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029304; x=1787634104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWnxwDIZf1Mw9ThYzQTSH7iLLYZZalG5BnqF3J7ZdAU=;
        b=plCMtCTvtpb7sONTALnhToEtbpXz2wMyBclxisZuQgKVEbpUH7pydDauppJ54weJWC
         p8NCyxXHlUCtNT40g3arFyA7qM2Uk2nNmdhFfOGzB7gMjwUSsVhWbB64LJuNnF2aTe1Z
         doch+eBtEiAx/KalnLu4GH7mAZ5eer7com/IkXSmWt2yDSVONbAVkPe2mhuSGWiQnP4M
         9h63zdS0NVsIpwoHxgDGgpWlcv19KfKEsGUR5MAFKz3guCRTrqMwF9Jf/52uk/Y+x369
         NS3wPl1SzqmTvfznW8xGOSIdQ2qyOeMyZ5NeNL402ytF9idIHJFfSIwzTqxW47bH+qGd
         0RKg==
X-Gm-Message-State: AOJu0Yzmlpa/68tDqwtUWbEpG50HKU8F2yXcsnwElAFe1fomv1OkSkhM
	S8meqimr/rRrdzBFjOK+tgUTI4cMs3b2tUA/ODVpdqtHc2Cx7ueyg8czq78tw0Br
X-Gm-Gg: AR+sD13+XT0Lt9rsv3JbXXK1cFFQFQMVK547StdXZyG2jhV1AkebUHIwShRNpykNga0
	3oQM26PuM3X98O6yeYlZjhENHzsAsYmj8sRHHWjvahD6waL6oDVRwgnz1Inbp6WXAfiB6SHxdoi
	89zFkFusaTLP1i8KocWGuokvb00FuL8AiaPZm4Mwt8+Ma7ftSn5Y/RsPGgtQALMZDwDp2ptd9FE
	s0f9NcovFn0RwHCFA/krPIyEy/BY2jsQ9YaqkWuHofbb9DxLR63kzAF/oeP11jfDdIo8mm4O4uh
	bbFKDaTwKF23RPTyeT5zLGeempBQVhVwJAoVpYr+TAOzFTBFYgS1jyV0dyr1LzdPSHwP9+H1Dcx
	1KdSPbbuC044yAw8NmUoT84Mzz8JB6LAaFX613zSDYww1XvI96sd/D2QdC3aYrUsoms+g7oqCqs
	nekdDceyrdXCVwdFqg1NPkNyB2vk24AQpe8vrp5otXhdUiIynPjSK602moF2vt7OJX+/YViK6xx
	w==
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr373665455ad.14.1787029303905;
        Mon, 17 Aug 2026 22:01:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 3/27] gnome-desktop: upgrade 44.4 -> 44.5
Date: Tue, 18 Aug 2026 17:00:58 +1200
Message-ID: <20260818050123.2901739-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129202

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version gnome-desktop
...
INFO: Current version: 44.4
INFO: Latest version:

Release Notes:
https://gitlab.gnome.org/GNOME/gnome-desktop/-/blob/44.5/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gnome-desktop_44.4.bb => gnome-desktop_44.5.bb}         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.4.bb => gnome-desktop_44.5.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.5.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.5.bb
index 204c1f2cc9..2f084ea7f6 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.5.bb
@@ -14,7 +14,10 @@ GIR_MESON_OPTION = ""
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch"
-SRC_URI[archive.sha256sum] = "1d8cb9c6a328eb689b0c1269cf53834cc84d851d7e71970cdabba82706b44984"
+SRC_URI[archive.sha256sum] = "20e0995a6e3a03e8c1026c5a27bc3f45e69ffcc392ad743dcab6107a541d232f"
+
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/gnome-desktop/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS += " \
     fontconfig \

