Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB4C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:43:04 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.15694.1752648180338035939
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PGRruQTt;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7494999de5cso3937353b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 23:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752648179; x=1753252979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmQe9WnAdrTCLyxhnZbgMOF2I20jvD0CH5lHjGM/58s=;
        b=PGRruQTt8SUhV3pv7xxe3Go23ztPHwu1F6wz+A1JWWuwXXZ8o8uPGQFBCSmqCY+87X
         yyH6NrSBOCsEwGzl7DPC4AZUUJqOK3O29EnWGOYlEnm9YH4yOYkOTCVNhZPqexfdUdxe
         ygmcwDDZTTODbjadhioka4q3XZHfY0VrhvM5dvINPCsRERpZpUOXgbDmS8DO/0VZr8rC
         /FpVLP9jEZkWxx/KIUnQszSKvi0l9TeMe86JhAK9R50EE5Xeau3fDZgwL0AImR0aK5fv
         jE8uwf9ErfsXrzXinPIziUUHLeqcDBdwhVoeKntl4FsyQ9f1ntMXF4Cq0PGl/Mi9yH8g
         IKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752648179; x=1753252979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmQe9WnAdrTCLyxhnZbgMOF2I20jvD0CH5lHjGM/58s=;
        b=KiVA8yBV2bubiyKSpJYEXIUFHdmp7vYF4j+b/OoqwERknJYtBJdyv7G5F/bVG0E1DZ
         cL8YEwVdV/43spwlBv+b4BA8IAxMR0ZyqOylIlFRubiFDx+ePIKfadkVu+ocxVNP7Ki3
         k5BYGN9Ayaf6QszfLFZvMI4aVHFMDaQVDHYOzGEOLHim13u7Mj+VyvONfH2HILRoCiXg
         qECzgXaLaHjjj12pVCiAfME27asIbQYDGVuftcMh59DEtpFXp+YaxqYAWrdw4ZgxD5dQ
         LC9a8hUuhTWKl9APP033J1SbCrGqICvL9E6YiGR/c7Ua0QTPApumHyfaxmIW3kb4mWTA
         TDew==
X-Gm-Message-State: AOJu0YzDl3VkZyIXxWFHhTWhyjthAtg268OXsKAAN50OkslbXGXAOE6W
	2HwbfiZ7mZI4gSkOijAqkjDZPWJYrdNTbsv7gw0LAP3L3DUyVu+ENdvf6UGjWuQeGsg=
X-Gm-Gg: ASbGncsUV5gHUK6OAztHxbPYv8SqfLmIYGKUNXnapt477lV4A5mXk4bDLAG2lByp9bf
	NJFkjWE2k59r91WM2/T0QK+lncKW5R0d+BcAqZ5TNrcy0TZljbTvIsXDHU+1q6f0KqDK+PIC8pW
	IRAKeTBpudJudDikU907+psL4HXJXKsSwk282Q7IXmzW3kNazsaUsJrpZZz+posE9j7LqHFeWzO
	KSFD/EKYHTVx5SLgDzligfbzjQcR6S79EhGv3X7PQRxMfHcr1o+9d+bntJILeDI5M7zgwfZZNd1
	OHPbEJh+w9UfZX4akeuXv6V7RvuQYAXjRP2NrIe1nxkvQO1ddkQYOewCy1gwxNMd5zn0OKLpPMk
	xA4xF5FQWQEXlOw==
X-Google-Smtp-Source: AGHT+IH6izPNUjHkjp3ZenNz5SJ/Ax/RIoe6i9R/CD3Z6au71sNqmQSv+ajwMn3+w2n2S65ZufZuKw==
X-Received: by 2002:a05:6a00:4fc6:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-756e8774764mr3614457b3a.8.1752648179149;
        Tue, 15 Jul 2025 23:42:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::730c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd6052sm13498168b3a.34.2025.07.15.23.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:42:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v3] libmusicbrainz: Upgrade to tip of trunk
Date: Tue, 15 Jul 2025 23:42:56 -0700
Message-ID: <20250716064256.337846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118585

* Brings fixes for cmake4 builds

* Define _IMPORT_PREFIX using CMAKE_CURRENT_LIST_DIR, this
  will point current recipe-sysroot-native/usr which is then
  prepended to find the native make-c-interface binary

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 1ae43e8aef..9486dec17e 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "expat libxml2 libxml2-native neon neon-native libmusicbrainz-native"
 
 PV = "5.1.0+git"
 
-SRCREV = "4655b571a70d73d41467091f59c518517c956198"
+SRCREV = "4efbed3afae11ef68281816088d7cf3d0f704dfe"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol=https \
            file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_request_.patch \
            "
@@ -20,7 +20,9 @@ EXTRA_OECMAKE:append:class-target = " -DIMPORT_EXECUTABLES=${STAGING_LIBDIR_NATI
 do_install:append:class-native() {
     install -Dm 0755 ${B}/src/make-c-interface ${D}${bindir}/make-c-interface
     install -Dm 0644 ${B}/ImportExecutables.cmake ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
-    sed -i -e s:'${B}'/src/::g ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+	sed -i '/^# Create imported target make-c-interface$/a\
+get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)' ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+    sed -i -e 's:${B}/src/:${_IMPORT_PREFIX}/bin/:g' ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
 }
 
 BBCLASSEXTEND = "native"

