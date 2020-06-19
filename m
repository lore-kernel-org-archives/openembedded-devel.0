Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.1451.1592608564641990918
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 16:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q7HzdiVe;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id u8so4718122pje.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 16:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vlEAG6owc5CCxfwVkS9q/f+vQdnfteRgV1fm/0Ulxf4=;
        b=Q7HzdiVesrpto1pNObX5bO2ZthtKWi2DoqxvR8BaOOsFjxpnGU2WgFHvNQnf2p4JQe
         KAfRJsiPCLSB0oBTY/7NxvJiOuOnXivkZZ4sxQCv3gGebphqxTm8JpZp+FK/TMOJtlCZ
         qA8E8VN5ycW3941U4sYSzSi4DBFqmLKYtX20v9ocR6O5OOR1btwCJTTdekEL/VxN7OBM
         RwXtQbmtJAqdKgm9NSWTEMNgejLZIVFmQpBndOzdw6zVVZztZaGmTFVovKzv7RRKGFoA
         UNrAweUXNlv4E01+//8tEnSc9PMc6Xf2AkYymPPRMjCKfmVEnNE0wMMJNTX/Nw56WSZj
         m9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vlEAG6owc5CCxfwVkS9q/f+vQdnfteRgV1fm/0Ulxf4=;
        b=PXyHgsTmtv8ff6o9cvkd74b8KqSM6KWB5HCyGypKJXgIN0XmssA0aRj0BAzS3CBYxO
         9oVHVEoktVKWC/C4+7CzZumdtwSXmCf6jv7QEJwrPyye7i7ihasM+MgpXZIvuCGJbsrM
         aOxb4pjrU+gVM+9/Ul9IJqEY4Spy/117IYWW2acCBEEyd0TLpRWVHIy6IpCniY8T3z4D
         ilg0ZrDGZ6tVeAtW/GuV9kMKM2iLFmTZSZuGajzrrdHZtXp/XIEDcEYcSs3HTqdGZmR2
         PzsOekfX7xWRjn095OC8u3+eFC7jnDO2HqRRaNtB+JWt5YXcKO2RjMoZk1d5W3roTa+K
         iY8w==
X-Gm-Message-State: AOAM532OpHfuyvEDUWRyUxEyABACl4Ehz6Kvs5bHmIsoYYAzpcTQMyXm
	SwEsO//7PO10/yqNvHXYlseN1nF14XQ=
X-Google-Smtp-Source: ABdhPJyd+kVn9lXEXFLP/kVYTM2V6j6Mm6aweXbkj7GdlfHI9z3MMm9oXdbBl9XvcXDMw3U3ei24rQ==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr5746481pjb.106.1592608563632;
        Fri, 19 Jun 2020 16:16:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id k7sm6746258pfp.84.2020.06.19.16.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 16:16:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][meta-oe][PATCH] nss: Remove mcpu to avoid march conflicts
Date: Fri, 19 Jun 2020 16:16:01 -0700
Message-Id: <20200619231601.2777510-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some files are compiled with armv8-a+crypto and when using cortex-a55
the deduced march is armv8.2-a which then conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.51.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index fba80ce2a..36e6cd8fc 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -47,6 +47,10 @@ inherit siteinfo
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
 
+# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=armv8.1-a
+# which caused -march conflicts in gcc
+TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc+crypto"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure_prepend_libc-musl () {
-- 
2.27.0

