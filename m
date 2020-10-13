Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.2387.1602614241722826516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 11:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnH0nDoS;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id gv6so445890pjb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rudjIxcWhLKZBUCgvh89XbyoJU6JZWDt3CFPACV5P9M=;
        b=NnH0nDoSuoDuFn1MLHx55yiK50Cymyec4bkkfX4zEVKzjzlmCpQz0f1s0MuIeVc3SN
         /tG9AQGNOXP+7NG6v6Oe0djf+HK1ASrS9T0AtVTHnRoBmK3b5ByCF6QntZ7WxEQ/uazW
         nTd2RNvtVr6Psgich7MciXnJtsJLFSE+8knaTMcra2LEG8BdCyDg9GZ021jNIEtoEMAa
         CD/p7NjxNq/FSqZCFZWYsLktRuUCm8e8jqYWHBaMrqwUmB0tsdKKRREPiSKXQ9dm4M1t
         DAxJIXyfhQj9jgGE0Bum8hiEdBzPTYnGx4M0VdqQRhBZGftZuITYbPPSn54p7hzQ5HIT
         lgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rudjIxcWhLKZBUCgvh89XbyoJU6JZWDt3CFPACV5P9M=;
        b=ZIHoxYSG3Bk+L2P1cwM9OYyAoqBtx4dDzWu1tt0Sl07VWro6yHGN0fAf9xqz78hKUm
         +ZOnh4gse8mTZzF50rX7BdeTRxIb7iSV4rk5q4s1hplELApNqWg5g0UGdGunhAuSbXvT
         Q8BJ8KGexUaDPIhlubZim+xNGiAIPID7BrO7XPklQzztiGhdRuxDgIQ0GuWJxMmfaHgD
         EiegmnwoHpJENQFzVnSgAA3a0VdW6osa0t1aW4Ibw2cmjy7fXJ1ifYItoToHzRh8t5aU
         B1chEVYKUb5yJOL3s8Wrl5FKZncXfploxFyYLWA40t/F4oCMOjW0MfwW2SN/ZOXEQaAT
         qXcg==
X-Gm-Message-State: AOAM531op536bUYYftqH9pjaBxmlP3txPhIg++LG49DzWvfWpmuGtgtw
	gPFtk1i+ORskBXu8VZeMNRzRL++O5qvvPw==
X-Google-Smtp-Source: ABdhPJy4gnZRFTDP5ol4x+DJkFaiX7wNPCOMC6SL4nYgnW5fkpUCesomocGhtHKvSiO5vA0VSwFYBQ==
X-Received: by 2002:a17:90a:fa48:: with SMTP id dt8mr1080615pjb.108.1602614240953;
        Tue, 13 Oct 2020 11:37:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3926])
        by smtp.gmail.com with ESMTPSA id u25sm336843pgl.31.2020.10.13.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 11:37:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] ubi-utils-klibc: Remove trailing slash from S
Date: Tue, 13 Oct 2020 11:37:18 -0700
Message-Id: <20201013183718.267652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This slash is redundant and removing it could help pseudo maintain its database

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index 0475cbeaee..d322381621 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
              file://0005-common.h-replace-getline-with-fgets.patch \
              "
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--disable-tests --without-jffs --without-ubifs"
 
-- 
2.28.0

