Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13874C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:06:46 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.7265.1705097197016344634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7bc32b04dc9so208755239f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097195; x=1705701995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tsbree8eRm3J+iFBmbMTaH0wAVVS54fT5QMHVBpgN4=;
        b=DVfQF7LpgCqdbw719kBFSSG3GB7UvDYfqhM+JjDNieUEoqjCrf0GtHFbWqqKgMT/L6
         ecKWuZKhO9gM0MkpGIZNtzeLCRkqz8/e5QjaKHMVjJRnO7N0wh05kb8kvj0ZLw7JDZ4R
         ybc9DjoD8Kf1/M5797A70QPBfT/7aork0NqFbOIIhNircr3gIyy0dCStq6pKj6a/O74E
         XeenZ+R1k445wU9g9esc68nyEj0aY1eLQANntMx+kApzOnqvtXF81KH4Xri+IYOGUodl
         ki2u7iIQpjOYWJHbDuomU+sGBsxJXvhMObX5QdYdMfBuhAojv8k4CRTjd4TOtU7grcXj
         Zwqg==
X-Gm-Message-State: AOJu0YyKEo4ut3W92u+oww9HlMoREbqrdZ0ow5GJLOwzEUJutPE93sPu
	VWbaBccFdJGJE/OUPrEDOv3deSXF8tEjNA==
X-Google-Smtp-Source: AGHT+IEsXJbm6Y+IQ9NZ+Vc4c9J/59sK6fEMv3Rn8DXQXkWrE9dDlZHcAmcG2GMVausjkbCAV3MVLg==
X-Received: by 2002:a5d:8e01:0:b0:7be:db69:b3cc with SMTP id e1-20020a5d8e01000000b007bedb69b3ccmr2113638iod.39.1705097195275;
        Fri, 12 Jan 2024 14:06:35 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ba36-20020a0566383aa400b0046923df89easm1101496jab.158.2024.01.12.14.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:06:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-apispec: update to version 6.4.0
Date: Fri, 12 Jan 2024 22:06:26 +0000
Message-Id: <20240112220626.3033015-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108256

Updated license checksum for copyright year and verified MIT still applies

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-apispec_6.3.1.bb => python3-apispec_6.4.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.3.1.bb => python3-apispec_6.4.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.3.1.bb b/meta-python/recipes-devtools/python/python3-apispec_6.4.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-apispec_6.3.1.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.4.0.bb
index 6b9f704a6..a48e1cfae 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.4.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A pluggable API specification generator. Currently supports the OpenAPI Specification (f.k.a. the Swagger specification)."
 HOMEPAGE = "https://github.com/marshmallow-code/apispec"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=824d596e050c0d5e3361efb438425945"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d9c303644a2e62578f0347748a80358"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b38e4479916d43f2b1e88ce15fc2fae93adf2e8d55cb59ec74ac66a827941483"
+SRC_URI[sha256sum] = "42b8a6833cf154c9dbd22d006b56bf9c49c972d32d24fe716fd734e0f6b739b8"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.34.1


