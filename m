Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E13C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:44 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34528.1790506303054989971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rOWqoTvZ;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881d9da69b1so161622b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506302; x=1791111102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jCtMknkV3qs4xwXTGeBDqk6PDhNcJKQb71QWPQLSZE=;
        b=rOWqoTvZSnnhxCgXStJQGP+9BMsXplRpJFGe0xaey3mTyU3qp6bMDXe2RA6qwsJ9+9
         ItBLDfIXjn+dYQe0dKAppMABN3Hyn9QKnxUQsNlmDrKZECmKl2EqHuC8bHOigNhRwJRX
         Gistz8yAUbVjKDUWb7Un0plg0hhP28KJUESr/H9vaCbmxvnO+onptaBS+S6VoFyYFqjO
         NK5ixwE4YhZrKPDSYvwCoYMAP/Vmb1hcWWFTEotErq7kF8nxnJjz8M0emztfK/3M1HD7
         QfYe9flzHqxsmBHsazJlWwG9mD9ikpZ5SAmEGjDmTomar8ZPodr7vWdPRY9PzWkVMHB/
         bYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506302; x=1791111102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jCtMknkV3qs4xwXTGeBDqk6PDhNcJKQb71QWPQLSZE=;
        b=ylRjA6ThIEqCbTlSp/b3eWuhesyd5hrLYGY9dplWHy1PHoxRUVpa5l5m0gflhzAZTo
         /kUruLxHslRiTJ1UMsb6mv4ty/xEtBFPRDWUMVyMgUmzKEjh+xp3ASry+bizxHivrsSh
         GwTl6WdDoGwjl9CaFAfK+GcUorbHDhJeiVHJLqky1Ch5Y8WgBHomAzC4sir909qDGezf
         d4NDh8SaafPamR90pE1bn2ocCIAGDZQX272gh3c9kGKTroSxCcR1WQVRF3324MzZdtTb
         wNtpg9wlXHMQ1ciGCt0lOIUYAJDkaXe+bENJ5WE6lyK4uX8277P3wg+8R5GzTnfD51n/
         TqBQ==
X-Gm-Message-State: AFuF++nnt76/3RRZN3xkjUX0xCAL5qtyxxoeeT3kFfOyCcvOCjG9d7uY
	InOEN2kNepgVKn8rP1j/UEhGq+erJ1EdTXY3mQAx1cXQydnF4hMhAxEPfZBxFQ==
X-Gm-Gg: AYBFou3kKAdAFfFwrqZLnqHZHJ5hBZ9rP+9ARnuYODMO/WmSR4RJI/dCIE9RzlKoWFC
	aI28LlEK8jS7V+2MNan+Ut8tEMho2nh3bfIFNQIJ5qeSz+DztfyqS0b0YmMv/cuXR1XfEm/V/lW
	nqaOKdy829pxp7ex54chibZsIDLIr6q2IAVY0X/Fx4OeWd4GYSqlHfLNq5PBa20kMruESp5pVVV
	ybHtslxHa5tegYg4ij16lkK6KRtuS0gf66bqkxIQC01VWqHIb2A+/6E7wiy3TNzJ/l4ITY1cj5h
	5tV+rT4NXdk9PtlXikgH69XmYsKJeNvq5AJP67b/RvzZxrcswTCWFeyXJRb/Xcx1gBWjtKAyMXx
	05aMGQdajBqvF93SbLXW/B+L+ztIDCl1yMioUS7qfRHkN/HA2QaRF+vQPk7hyGQHPaY4yCiwMi3
	WiwuIE2iwTa+cEc7/IHSfMEGqeBiibONi1KVmhKQLcJ+hlkUGvbDGNe6ZD5DxpQrow9A/IyKntx
	5LsbWTmRKN4zLjqQdoBNpMxppDJhLeGrg==
X-Received: by 2002:a05:6a00:138d:b0:881:7ff5:605c with SMTP id d2e1a72fcca58-8817ff562d9mr2830005b3a.55.1790506302381;
        Sun, 27 Sep 2026 03:51:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 33/35] crow: upgrade 1.3.3 -> 1.3.4
Date: Sun, 27 Sep 2026 23:50:00 +1300
Message-ID: <20260927105002.1832451-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130367

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://github.com/CrowCpp/Crow/releases/tag/v1.3.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/crow/{crow_1.3.3.bb => crow_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crow/{crow_1.3.3.bb => crow_1.3.4.bb} (93%)

diff --git a/meta-oe/recipes-support/crow/crow_1.3.3.bb b/meta-oe/recipes-support/crow/crow_1.3.4.bb
similarity index 93%
rename from meta-oe/recipes-support/crow/crow_1.3.3.bb
rename to meta-oe/recipes-support/crow/crow_1.3.4.bb
index 4d09202102..22642efc70 100644
--- a/meta-oe/recipes-support/crow/crow_1.3.3.bb
+++ b/meta-oe/recipes-support/crow/crow_1.3.4.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e08502e395a6f7c037ddfe7d2915f58e"
 
 SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=v1.3;tag=v${PV}"
-SRCREV = "7375d3dc1ffb8719778cdb29fb1c73141ce684e8"
+SRCREV = "ae0fef0ee67eec897e401321b99b6dd7cfbdc155"
 
 inherit cmake
 

