Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D391CCAC5B3
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 06:21:36 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.4909.1758781292995114763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 23:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kSWuy6k/;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-425911e5661so2448815ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 23:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758781292; x=1759386092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn06av4p33HspWbBRbVcuUWD3Vz5nEHlka6l6BWWGvI=;
        b=kSWuy6k/W4hYzkwjL8UKWKtyl6xVes1ySL+OtwwakH3zbWbxNdo2YsnfiBMIFoCSrk
         rdc1pL8AXLllNrdFlLDOqxE7ohwyrzIiZ3ano3uvbJOyhajXWGhzY3Zj2k6JPGlOc86z
         5NzHDlP2NOnOAdh6OFRBmnbwDT+iwgCuQmEZU48+UY6x1RJby0K/nktxj1RGs4BB9ipr
         fWYCE5xYgbHLzKLB4qCaL1vyqZgRK/ohVCdn8O7KTvW7gnYQgnfjW4khxBMu5i41EGnF
         hc4BhJYHIu/Y8JNBAAQRiLOVdC0pMQUIjw9a0dgNuy0LMaCC6bIP+DYLCSPE2uK6vtpj
         Saxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781292; x=1759386092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn06av4p33HspWbBRbVcuUWD3Vz5nEHlka6l6BWWGvI=;
        b=kLBXxyB6xyQqz3PYOdk7Km/psuaksuo+gHyGuaAzVEB+1ZUEAwo8zRYsqolvexjm12
         ef6w3GrmYjTAoNT/2DJ3FEm8Mi33FVzwpOERvFqBv7ypB4GzXCfKU2XVArUaaxJlpHT1
         b2PGFkPyAbUizNdRFyM2ZdBxBz7oXCssLd0tGQUu1r2KdvIj1rhbZa0x+2Oo4NZiro9M
         2EYfRTJwjZ4ikli+TPbOMfsZ+nN8o/oh/mS0tVQfmVIPZ/ha1vC+iQAjYwLhHKr6caEY
         9iGwN3af2kniSpdlGij5Wnp6NgZOaHy7ggHK2F14Y0I6ZlhtIvxhstnD851QV7BqPjA/
         Y/FA==
X-Gm-Message-State: AOJu0Ywz66jvu6e5Au8D2nS5jZUmQjWY2AeVnetKv9dpLJU5eHzHKt3n
	qkl+0v2WYmU6B/y1yg37h+M1F6unKok/TvEabFLZzxxhirbzT/C8j3sS0qtzDw==
X-Gm-Gg: ASbGncv9fXgekvJIZikZ+OYdw9PkOwl3ps/qqfNK8EMjArVehQvRgElbMdhXGSEClR5
	u39CzMATUMf5zG6nMiOW6qYrMV0q4QocXrZSGthtJ+0Ddmp8s4+aC0vGFaITeJ4gfoz0qsJa9FU
	LZHtaky9Gn3XF1MDGwr69z7ffxzLhC8/QkwafZXN7NfOLuChGeZUawkXp2GvfCi4eXjzBVluRjf
	sdWzBgXxex+Qme3hE7/f6WM9ld0XdWqnpHYEEd4kvR9xDYS3ErkScrcAzgE/DAtszWuAJSwnIPB
	iytLQTv9jw13XoId2S+0cF05f31AsEeHg1GNoAG0G9p1sMqH3MHCi9hv9F8HZSdmXP0hCoDcU4p
	4FsqVjRNPpTs/rdXL+HKEH0eBZ6sQDivpw/Vm9B5LrfkAP71Jehxb
X-Google-Smtp-Source: AGHT+IHuOxAheFwBJlVATuMiSJp72r6w2X6tJE57pAwjmZShUq9NQ9cNcl6e4WesYO7CQ8rpTndQwg==
X-Received: by 2002:a05:6e02:218f:b0:424:b862:8329 with SMTP id e9e14a558f8ab-425955cc9a8mr35691415ab.6.1758781292009;
        Wed, 24 Sep 2025 23:21:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425c016c6d8sm5560055ab.38.2025.09.24.23.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:21:31 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH v2 3/3] lsscsi: upgrade to version 0.32
Date: Thu, 25 Sep 2025 18:21:11 +1200
Message-ID: <20250925062111.240262-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
References: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 06:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119852

From: Changqing Li <changqing.li@windriver.com>

Upstream changelogs:
https://sg.danny.cz/scsi/lsscsi.ChangeLog

Changes in this commit are referenced from 51e410a84eaa9742ea8881435925a242fb5529cd.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 51e410a84eaa9742ea8881435925a242fb5529cd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
similarity index 63%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
index 63b94e9d6e..127be8fbfa 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
+SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
 
 inherit autotools
 
-S = "${WORKDIR}/lsscsi-${PV}r154"
+S = "${WORKDIR}/lsscsi-${PV}"
+
+UPSTREAM_CHECK_REGEX = "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"

