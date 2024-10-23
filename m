Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7A5CF537D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:37:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.7966.1729687011906930895
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RVD9uQ+R;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d447de11dso5321533f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1729687010; x=1730291810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mlWPbypuovZ2UJKU35AVZGG9RT/z13guNbiPBrK2bA=;
        b=RVD9uQ+Ryff5Ee+f3Cvw3RXZJCd/C+A2q5CHbVtpIoQanQ7MPA1rz/EG/icx+FfKAl
         8Yl5KJchMSvWJfgSCqBEn13lJ2N66afmFAHwCfoQTq+EDAvDt8hxuSzohEezSF2RCWpC
         ZjhVuzlCoF7J5aazqm9oqYwatDa/ZM4VHRhpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687010; x=1730291810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mlWPbypuovZ2UJKU35AVZGG9RT/z13guNbiPBrK2bA=;
        b=MN/6XKfSd1wUYAh6sczsfqheRhIJS51LWPFwosKmhxtDbjpaUINXAHVSIUvLOk+Mo6
         /Xsg1z5pm4dMvKYui/2RQ3x+FQeRUN3mxw2QAyHCIOwJCcUVsTldKylvibZMXs7rDZbl
         K9I3hsSHFI5VhWTxMO7ehxxx62uHjrw17WbG8PcNTgKTWOd136n2h+D1y9h2W7K2jeDr
         mKjAMTuUYjbVlSVxdicxOjDP0nR9LR2+H7EcFCBJqhjx0tYYzUr9X0y4svICv9C3Aj8q
         b6C8dPfyRZJWLneqE2JqCWxNOj8GgBNag7wI72+lOhTaDvntZkKzDEdJE4KkM1bskLxZ
         XHIQ==
X-Gm-Message-State: AOJu0YyizTfJbB9204MJ7yXpuNzOqbt6+7yrEWIpNnYLoc0q6Om9Pd1g
	fBuxshTe/OrpnyYF3pW56HtbrOyJaPKG47lV1K5kfe20U+NW1Gy086YuAXqIosaGj79bL9xaEI6
	C
X-Google-Smtp-Source: AGHT+IF60RXv7EHvcV3h5am3Lrv57pg9L6YHpDFi31HVo5JyuhkUluae5Gzih5tUpIj04hOqeiPHOw==
X-Received: by 2002:a5d:50cb:0:b0:37d:3742:a5a7 with SMTP id ffacd0b85a97d-37efcf2de02mr1463928f8f.33.1729687009870;
        Wed, 23 Oct 2024 05:36:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bc90sm8751248f8f.100.2024.10.23.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:36:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-trustme: Upgrade 1.1.0 -> 1.2.0
Date: Wed, 23 Oct 2024 15:36:44 +0300
Message-Id: <20241023123646.1067047-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 12:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113148

Upgrade to release 1.2.0:

- Add support for Python 3.13
- Allow setting of cert's notBefore attribute
- Add the Authority Key Identifier extension to child CA
  certificates
- Remove support for Python 3.8 and PyPy 3.9

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-trustme-1.2.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with hatchling.build,
use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-trustme_1.1.0.bb => python3-trustme_1.2.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trustme_1.1.0.bb => python3-trustme_1.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
index dab18f28b..69db7e618 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.2.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://pypi.org/project/trustme"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
 
-SRC_URI[sha256sum] = "5375ad7fb427074bec956592e0d4ee2a4cf4da68934e1ba4bcf4217126bc45e6"
+SRC_URI[sha256sum] = "ed2264fb46c35459e6de9e454ed4bab73be44b6a2a26ad417f9b6854aebb644a"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_hatchling python_setuptools_build_meta ptest
 
 SRC_URI += " \
 	file://run-ptest \
@@ -32,5 +32,4 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
 }
-- 
2.39.5


