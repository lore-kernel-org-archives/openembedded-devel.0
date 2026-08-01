Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C63DC55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5273.1785589958092293533
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uqd+omsu;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84847482584so1243103b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589957; x=1786194757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwtZc2rqlA+/nqXJdVCH0WC9RjjEm6qzAeebhAa8Nkg=;
        b=Uqd+omsuxhqE1lNAMk2yK0M0q13te0K6GWb7Tm3FpIEF9wCD3P1M4CJHnBcRPdozsC
         zhpbWGrL1vlYp1vAvtxmhy4kfHRCYx9O1jtPqmJXcsYfor1t3DLnKcjvwFLro5CxRPWc
         mCDUavevildvu0SdIhyEsReY8y/Rjp4mj4k15h7x0NR2vsOy+HH9I2nKnZHgDL2VQ6qu
         cjnmlLyN1cGjuRj32uidVaicAD9SjbBam+rQxbvrrzCSuhIUADDYf5LWvEdsiehm0Dbd
         TGgh4DM7sEPIUchJzyVItoWvXAg3FBWZbePpknhmLmCBC0Re2O865hYydE6sXYBJo9EO
         /k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589957; x=1786194757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwtZc2rqlA+/nqXJdVCH0WC9RjjEm6qzAeebhAa8Nkg=;
        b=UNvXdEy9Z93vVzPVzltCaMtY0OZQfzD9uBCPLyvJTiSs44ElLcq3ReFaWI3v54Azmm
         EzbjX5XT/Wqtgsvv0s3EcB7Cnt+lNXkCXgrvND9tEc5tAkyG17Zpj+7AVbxflL/5uu8N
         UwX2SPGMfrsWmWCZaedpNGByD8vInla0/htKioEp+AsME7CVeMI42LD3eW3kAZZby4rc
         FkO6TRm3JpooIdX7Zt68Kr604BKm9cLkkOYIIA3oUfdw1mZeQjNHmj2ZLNxhGSiZIPKu
         s1AafUeY2XVecHWSLnyri9e3bDzeyDjtBNhijxAlKUNbRjkdAjGYO/duQHAI0KjifqFh
         oHhg==
X-Gm-Message-State: AOJu0YzIixIoeWML00hXTxsnuJiEnxxtLOZFT8Z20wOukG3igQyF2qk4
	yNx2GeJ9NXCr0yXlANjFAQrMmXT6zmPrzSnbL23L3dYfsMeAj8XR5NaSdrG7qVxg
X-Gm-Gg: AR+sD112Y2H9iVRmLaVQOTL3Bnt8zMwGQ32AtAVkBnJ37PKbbe0lkrdKu4qIJl7BP76
	/xYvKneTk3bwaX/TayhNTAW38KRymkHEhWmAg98wli6NTctylUx6WukLBwhP7NvX81eMv5qFz4n
	ByLycXVW5jKFbE+oUPTfRZS2NTkvwRSkNEZpFVTX2ueBH7kT3zdBW9KOI4Nh24jtPY1wrPOt94y
	+sKuVauHuzL/WVdbRQksP1lvXh/avuJk8WKohQUg/W0f4Jl7W1PKoQ8ojjtPJlOHYkFCzC/X3n0
	GgHrGWaL4TJPOLnvX4ZGy7taUd+nSgWSDOeWDKkLUfUR8kmwmEvZRR7hZM9z/Z0QnRe75YuF6d6
	9W7ZkAJtfQWOgDTuWhNzV4EDf9lZQT8gNbLridwT060rd4A7kjtrdDb42R3MvhXPGZ8sfKGRDS4
	RFmWf1PFT9wmbfr/Ht1StYaNreLJ1UjAr01Nqw9OhJqgfIXF5km/+nEZhfE+4vz4tCpCHqVJca7
	IAs34i57z6G
X-Received: by 2002:a05:6a00:981:b0:84c:2d22:7307 with SMTP id d2e1a72fcca58-84ee485e0c8mr2837003b3a.13.1785589957426;
        Sat, 01 Aug 2026 06:12:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 18/20] liblc3: upgrade 1.0.4 -> 1.1.3
Date: Sun,  2 Aug 2026 01:11:36 +1200
Message-ID: <20260801131138.3299410-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128612

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

https://github.com/google/liblc3/releases/tag/v1.1.0
https://github.com/google/liblc3/releases/tag/v1.1.1
https://github.com/google/liblc3/releases/tag/v1.1.2
https://github.com/google/liblc3/releases/tag/v1.1.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liblc3/{liblc3_1.0.4.bb => liblc3_1.1.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/liblc3/{liblc3_1.0.4.bb => liblc3_1.1.3.bb} (83%)

diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
similarity index 83%
rename from meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
rename to meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
index 1baa84c330..86c8b405d1 100644
--- a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/google/liblc3"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/google/liblc3.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/google/liblc3.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "1a5938ebaca4f13fe79ce074f5dee079783aa29f"
+SRCREV = "96a3af0beb5487aca3b98a4b992a539a1f6d80d1"
 
 inherit pkgconfig meson
 

