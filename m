Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.40497.1585528306656682496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 17:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BpMCQHJj;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id a23so6054318plm.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VWtPxo5HX7S17UBR3KR5t9FqBC05xR3M5jSg0oIB1x4=;
        b=BpMCQHJjKfxfFYKNu+qJz8bmRLpb5xPACXZAEKfDtuIylJd+5mqYIT+Xr46uHgQhxr
         ARKUt8O+s2+mQiFQQbw403duePRJU3KU7VWR69qnByhTK5G1pFqhvNQa8zgW0/7cPwxQ
         9RyTxrowuCznE5yG9m71XYop/xcbScyYS2zGKbrPCHuRtmn0MdqEOeUBsmdMETAQd69Q
         ZCPZhiWYJ7zppgCX41BbFCayYgKwOxVF3oi6qaPvRiGqAONmZotHQ8JmE9wLDFTDWRoF
         05EtEA6fyGCX3AKH3uAnX1iQjE3VG4rb8+fGNzNHo5/JVFopyvuRZgy7n3ssvjDP0U/y
         vQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWtPxo5HX7S17UBR3KR5t9FqBC05xR3M5jSg0oIB1x4=;
        b=nCGNhO0PLWkejuOs3SCKizA3FKsXcjKGhSVdKRW7yktNeTRoNpsFsctqqwGirz6/Jy
         MlzZtgvLrNjc0b2uEhQjUilwRM46csUiFEfsFQDKE3o74eUtOFDx5rEKPm90XucjGByq
         vOb0nuTTXGuzcYZTYYWrpySlinZsUTjq5F91jvcrAPru5twM17hkEN1mpUxYDtMN6qg4
         Y8qbVpARnXqhhug/XteQyv72XcjU7pEQZHdyReW83Y3bpk+jz/fmoEXQbqjSVwQZSF/1
         pBF6UhkMM0lU5lLFYKfgYVjccVC8fUU8Wa1vhyVhG8JtyvAWXPw1SgtCNm0zzwb1JK0L
         0XHA==
X-Gm-Message-State: ANhLgQ2IBvPjLNrcVEON4EhmYxRxJ2XXISGlE6ZxH05lJxXmQQIfEXHp
	g9RzdVZB9az4bD1Sjzw8UgvRo1TGcCE=
X-Google-Smtp-Source: ADFU+vu7XIO6lVo2R8d71ArRki8alkB6AK+jzNi/b3zkOQDYdgzDIQ9E2okVsHG3nMFx1G7GyhNYSw==
X-Received: by 2002:a17:90b:1888:: with SMTP id mn8mr13216823pjb.115.1585528305698;
        Sun, 29 Mar 2020 17:31:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id i13sm4662317pfa.113.2020.03.29.17.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 17:31:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] id3lib: Make sure that quilt-native is staged
Date: Sun, 29 Mar 2020 17:31:54 -0700
Message-Id: <20200330003155.1670457-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330003155.1670457-1-raj.khem@gmail.com>
References: <20200330003155.1670457-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

id3lib_do_patch needs quilt to be built for it to run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 9d311608e4..21fa0bda1e 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -21,6 +21,7 @@ inherit autotools
 # patches maintained by quilt. So manually apply them before applying other local
 # patches. Also remove all temp files before leaving, because do_patch() will pop
 # up all previously applied patches in the start
+do_patch[depends] += "quilt-native:do_populate_sysroot"
 id3lib_do_patch() {
     cd ${S}
     # it's important that we only pop the existing patches when they've
@@ -33,14 +34,14 @@ id3lib_do_patch() {
         # the test inside which we operate
         QUILT_PATCHES=${S}/patches quilt pop -a
     fi
-    if [ -d ${S}/.pc-id3lib ]; then
+    if [ -d ${S}/.pc-${BPN} ]; then
         rm -rf ${S}/.pc
-        mv ${S}/.pc-id3lib ${S}/.pc
+        mv ${S}/.pc-${BPN} ${S}/.pc
         QUILT_PATCHES=${S}/debian/patches quilt pop -a
         rm -rf ${S}/.pc ${S}/debian
     fi
     QUILT_PATCHES=${S}/debian/patches quilt push -a
-    mv ${S}/.pc ${S}/.pc-id3lib
+    mv ${S}/.pc ${S}/.pc-${BPN}
 }
 
 do_unpack[cleandirs] += "${S}"
-- 
2.26.0

