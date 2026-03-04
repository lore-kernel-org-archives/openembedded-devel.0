Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D31EFCE44
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 20:24:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28135.1772655862759634015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 12:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4N9Qymk;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso49196285e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 12:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772655861; x=1773260661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVDvncVxQeHtIWybt2AgvClOUVLandKMCru1vrenWnc=;
        b=l4N9QymkGpG9p3w/79w4Ln4DFPC4s4Ajt3tqBuMhaBD2PoX3ebZejO+tTyQG3Z+AfU
         EJu1VSUQ3QK+w8RoIirfRclxMC23OqlOdbk4CeKllC/oXPyjfJbUd8R4RCgP+ImRUptC
         PdJCrf8YgV+S6LZjiJvV8A8BGPEV2LkOuh88JtJjf0j5elOAmSOK119mseMRZqZ3kUU6
         3dfvgUyrgtIN9q5Qe1JnRWoZ5iCKyZTeQ11dtBnmqjpSXyS/jgUxjRhASRrXw4fEnvUD
         5Im5sRt2Cy2q4lQQfVOAEZpyjhmKDoGPLEB0uNvZcRtXYzxFRbdn4krs1WafmBhkTCvD
         jxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772655861; x=1773260661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vVDvncVxQeHtIWybt2AgvClOUVLandKMCru1vrenWnc=;
        b=Gp0s5avHaswYfMbX3zPrCvOJJ8NxLmjPFUbrjTE72qMHVuew92gXLdEfFwIn55H66Y
         azRH/NRVI9u5IcKxBmcADTb0M94NwF1Dr9JcotXLY6XljEBsPGukHk+w0xQF9UCedUOs
         3Q96Zo+K5gMRXeMd+s6iBKX7817rySTF4iZEXDzIWRLglq7/LQXo3DpKKTf1TGUEW7Qc
         aAgvoUEJxV+jgggai78a6QLXBfD/5vQH6vnAA4dd+9Vpf0Q0n3lU0tAbsH7cSLF2yFoi
         PwyMkDN/hoEMSG4HO0CWrOIswQoIBi1Pn0hna/uGjMXMkpG1I4sRBkGXJEOswwTTIZiW
         nzZw==
X-Gm-Message-State: AOJu0YwUFOensSe9q44xD5MjmAcg/Ab1oDTpYMWzFOL/Gcdy5ukhWWyn
	W6n1HOxiwBOzfw1Uc4vxNbwXNnyDHHALbVaFlRD9j+Ln9NDQCcJtOcxs7HDq+Q==
X-Gm-Gg: ATEYQzyIiQcjGF0G4x4GmQaZBOYUlvZeFyjVBKzwAVyTLW3GRewHqxHnZrJZFrecYG3
	vpBkPGSdJzBQwt4ENyYo+N3QBHkQ1Bc73UfIstVbsWbQpNv4vMbZ+7GdSJ03v4UWetKVz6670Qk
	nKZo2PonT/g0jctaba58gAJ4tyblq+3yqM7EgE9CSXerSZtfVOBIWlAkwCsTqmN1Wk2LTf1z/K8
	eDSAll/aClLNyYgYt8xdFg0l5stMs5/3u2SVqNVN97Oz/P/CpUAagtCR6G6G7VolbiLRWtxAre9
	hyAu7OMfsr70Lr0RoGR9gIYo+GpkRVaQ2WJKlMUYOFl0qzXNijWz995D1FzWd9cwndzxV4ZsQpk
	kGaCimH0EPVpP+kg2wci9VuKwsXDZaV6QdnUUBo0VGW2rhSnWzknK9TFA8VHTcAx9WmR4knseum
	Yk+fdK/lvrtAi//1lXMI4rMR/fKP+1JNU=
X-Received: by 2002:a05:600c:37ce:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-485198be785mr52578955e9.12.1772655861032;
        Wed, 04 Mar 2026 12:24:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851d8ecb09sm7667775e9.2.2026.03.04.12.24.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 12:24:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/2] freerdp: upgrade 2.11.7 -> 2.11.8
Date: Wed,  4 Mar 2026 21:24:18 +0100
Message-ID: <20260304202418.2346652-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304202418.2346652-1-skandigraun@gmail.com>
References: <20260304202418.2346652-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 20:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124856

Drop patch that is included in this release.

Changelog: https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8

Backported #12319 bugfixes from 3.x
Fix incompatible pointer type issues
X11: fix pointer/integer type mismatch
Warn backport
[core] eliminate rdpRdp::instance
X11 client: ignore grab related LeaveNotify events
[winpr,pubsub] add NULL parameter checks
fix: correct server port assignment logic

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Fixed-compilation-warnings.patch     | 27 -------------------
 .../{freerdp_2.11.7.bb => freerdp_2.11.8.bb}  |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.7.bb => freerdp_2.11.8.bb} (97%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
deleted file mode 100644
index 7fae2703f8..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
-From: akallabeth <akallabeth@posteo.net>
-Date: Mon, 4 Jul 2022 14:34:46 +0200
-Subject: [PATCH] Fixed compilation warnings
-
-Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- client/X11/xf_graphics.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
-index 5aa1fd48b..fe81e0ed9 100644
---- a/client/X11/xf_graphics.c
-+++ b/client/X11/xf_graphics.c
-@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
- 
- #endif
- fail:
--	WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
-+	WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
- 	return rc;
- }
- 
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
similarity index 97%
rename from meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
index d51700c81b..9c3d532438 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
@@ -13,10 +13,9 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
+SRCREV = "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
-           file://0001-Fixed-compilation-warnings.patch \
            file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
            file://CVE-2024-32661.patch \

