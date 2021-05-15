Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.7298.1621093436855287151
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 08:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GC/GENd/;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d16so1840496pfn.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QqVQliSU6yCHpX6tjXQ8FMl2GroboEx+Jxb3Od5hM8w=;
        b=GC/GENd/TYmRnDb37qXvbwsPymeCaCngzGcvwbrlrM55cgB5Y7T7Zl8tHLVTQ7MnMD
         4cuPf7YPlKvYN2YH/lQTfoT4C0cAyte1MpzqTPJVfEMISJGYiNGeHYZiPoqCCuWeKCnJ
         jEZfxv9Blp9SfX5P15wIDpwlrLKPt+64xK7geQIFqgqPndJNT4WfQGz3HpOc4HBxCOO1
         IRMiaMcweaw66+fYSrkC+JqALTLLq7gwqsLjXYMujDWxwK8bA15ZaKbdKRIPcNHSe59V
         sbK/W/sIlng6c6t9Ohq6YoW1hTWLzQIrwpOL6gWGGh4rZ7CEhW/zzd8TuNC441v01fSy
         PKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QqVQliSU6yCHpX6tjXQ8FMl2GroboEx+Jxb3Od5hM8w=;
        b=OJQtsJZt8dXWRjwH2rQMhMIzrXwkaXO8dTOWNcScKCkR2CFY/OetU2jNoHh59Q2WJS
         1vuLT/Pp3QY7ueI8aHRlh3uRy3AJA0ZZfHsQ0H653mkkaVYPDe7SpU/3jkvc6+XrqgET
         4xznbslCM851bHpEagV2bON1mEg67Z0xiywpq7hewuBGF0ofmryfG36gzSB5Ek2BIkB0
         LowhU6hLQVax4GGwHeWc5n2cZVA9Ak3s3mduV15J2/usRMySFApDo7jGEYMtIjnsoSjc
         LGv2QouHGSkES2uCml/v9P+lZ3eyKzI4eAkTlIxVNR+eeamRgmOXjIaNOKsqg6JYNCcI
         woRA==
X-Gm-Message-State: AOAM532mSrtRfcxFVFzvXbdk8KuuhSpQY5sOkq5+4s6DPoE8q7vA9e0Z
	KPIre1jyehudYvI2sA9gSVpWNfllWcDCNA==
X-Google-Smtp-Source: ABdhPJxjXO0xIV3nFmS5go3eATsJhO7CtU79hyW3TYbs9Vvdyc4kvCvJxrilLSjh7Rli13wjEhi7ag==
X-Received: by 2002:a63:5d66:: with SMTP id o38mr25411547pgm.444.1621093436157;
        Sat, 15 May 2021 08:43:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id c83sm701380pfb.10.2021.05.15.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 08:43:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] googletest: Update to tip of trunk
Date: Sat, 15 May 2021 08:43:53 -0700
Message-Id: <20210515154353.3889108-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the top level license for checksums, as it is now available and is
BSD-3-Clause

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 354e7de337..2e0fecf7a9 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Google's framework for writing C++ tests"
 HOMEPAGE = "https://github.com/google/googletest"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
-                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
-PV = "1.10.0"
+PV = "1.10.0+git${SRCPV}"
 
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
+SRCREV = "662fe38e44900c007eccb65a5d2ea19df7bd520e"
 SRC_URI = "git://github.com/google/googletest.git"
 
 inherit cmake
-- 
2.31.1

