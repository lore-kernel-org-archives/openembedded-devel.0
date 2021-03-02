Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.4724.1614661814400748126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 21:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eirbTgmY;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id k22so11330097pll.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 21:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rTfMuSKmHirktFQ0kY9POZGhjBKNgEPaN7KUXCQ8fhU=;
        b=eirbTgmYaN/4kzv+qHyiYBscEjZC89h0Pys3AHZExke+dvA+mqfwWtXJ8FsZS69UT2
         sAEqUqBJYLyaKdfjSyklqEjVsq1AG0GApFBPZ5Y0cI5GOcgVO8WZ5scVuAw3LSoTJTo9
         lHqkkDyhM835YLm03NutjCPHRJ22UL6gCXzImJB4DIWKeYkbpsBZdzs10TrTM/acWjcN
         7/5sB4MP7lU5CBCkRmhnxrirV9qqQofwEXV7GddGD5/gw0Gt9OTlzSf2FyhnDpkwoLF6
         7+Em2tbv5ojaRA4X8KBhfkRmXvaGAdbo91cSdYaLj8rHKG7trKVMrjKX+/wQzDvnD7hI
         37Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rTfMuSKmHirktFQ0kY9POZGhjBKNgEPaN7KUXCQ8fhU=;
        b=uRtdiK4/NRH6xQE5qZLq+9wUrSdRwWUdKuBKtF7VQfXnVB7kLFN+vPrT2R/RkJBY/S
         NJUQAZCUb2+Ue561Q0Y8pFQxSEj/15kB6UeJ6qffB7PQiFsTjagfvssHwKsz6nCeVwVk
         nCbrlqOMlpRTqJPRhrgdY339aVO3320aqAz8Sn4iVAOJGuhP4HGDAB6C9ozSV5G4ITAX
         s7QHVvwZUEdPXekaxq3uvAYTyOBIugdGFHeqgxwrwkvKzzFMWUkNCzhOemQN97ekxbn/
         XdEVglw75QEZw6gm5YDDj4RqKHW2rTl1VTPGuqb83RgymKvuATbQSU5baH2HN15R+cPg
         /r+w==
X-Gm-Message-State: AOAM530uvYbabX6HvGaaZbropeTPD5qGpQK4e9ZHu3kulAniqNS33lQ4
	ac49WYGrNeVfJDM8U5xInsM8obQrpaMO9g==
X-Google-Smtp-Source: ABdhPJwkeDD4yR+RGHOf/XoJMiRPRvgQA8dDMbGucjlEvh+Ws9u2Z1Rnd55of9oHCMANtT0T/+1Syg==
X-Received: by 2002:a17:90a:8b02:: with SMTP id y2mr2448128pjn.111.1614661813492;
        Mon, 01 Mar 2021 21:10:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id p190sm4470195pga.78.2021.03.01.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:10:13 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] mbedtls: Fix gcc11 stringop-overflow warning
Date: Mon,  1 Mar 2021 21:10:09 -0800
Message-Id: <20210302051009.292001-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302051009.292001-1-raj.khem@gmail.com>
References: <20210302051009.292001-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sl_tls-Increase-size-of-padbuf-to-64.patch | 34 +++++++++++++++++++
 .../mbedtls/mbedtls_2.25.0.bb                 |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch
new file mode 100644
index 0000000000..f3ba04f51f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch
@@ -0,0 +1,34 @@
+From c3d7321d59e959b357a7d3d69782d9105f3d04aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 1 Mar 2021 21:04:57 -0800
+Subject: [PATCH] ssl_tls: Increase size of padbuf to 64
+
+This fixes warnings with gcc11
+
+git/library/ssl_tls.c: In function 'ssl_calc_finished_tls_sha384':
+git/library/ssl_tls.c:3267:5: error: 'mbedtls_sha512_finish_ret' accessing 64 bytes in a region of size 48 [-Werror=stringop-overflow=]
+ 3267 |     finish( &sha512, padbuf );
+      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
+git/library/ssl_tls.c:3267:5: note: referencing argument 2 of type 'unsigned char *'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ library/ssl_tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/ssl_tls.c b/library/ssl_tls.c
+index a1a5859f0..4c98a4104 100644
+--- a/library/ssl_tls.c
++++ b/library/ssl_tls.c
+@@ -3205,7 +3205,7 @@ static void ssl_calc_finished_tls_sha384(
+ {
+     int len = 12;
+     const char *sender;
+-    unsigned char padbuf[48];
++    unsigned char padbuf[64];
+ #if defined(MBEDTLS_USE_PSA_CRYPTO)
+     size_t hash_size;
+     psa_hash_operation_t sha384_psa = PSA_HASH_OPERATION_INIT;
+-- 
+2.30.1
+
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
index 27c1b209dc..481e7ea949 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
@@ -25,6 +25,7 @@ SECTION = "libs"
 S = "${WORKDIR}/git"
 SRCREV = "1c54b5410fd48d6bcada97e30cac417c5c7eea67"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development"
+SRC_URI += "file://0001-ssl_tls-Increase-size-of-padbuf-to-64.patch"
 
 inherit cmake
 
-- 
2.30.1

