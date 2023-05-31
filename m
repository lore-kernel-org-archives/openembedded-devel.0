Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B24C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 01:06:49 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.3028.1685495201213540814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 18:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kjSlK+B4;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6af6f5fc42aso4843719a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685495200; x=1688087200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZmAaLtE8zIDaZlmVk1KkBV2rvKGyDxFzFqNzEDVpJU=;
        b=kjSlK+B4wMQmL2U1Pq/Qipiek7Jd9oNP9y2USXH5Xw4RfvobR1U4U86LiGfBjXl/Uf
         UCgiIantTfGsTHbb9vW4RQJ8JsFmzWbgADeT08pLeVv92I6nHlv4o9gGa/uWgvDwwrrO
         ztC/ZKlcUB4jZfLYCNKD+aJr0hQ+3JJn9W/LHR6jV2UgnWNiK5Vf+EcX7r6IVEnbsQ8+
         R8vWFjIfH8sUwIwuqq8/tqoQwZutXHFNAVYgMn5KmNxVdHZvpsOLuA6Flrt6LdEr7t5t
         dtwRL6mTdMDMy212L9u/MFRfeU87xOcF+TBrkO0htYt8HGIcLy7eP+nhOVcnKUxL0j/N
         Em2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495200; x=1688087200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZmAaLtE8zIDaZlmVk1KkBV2rvKGyDxFzFqNzEDVpJU=;
        b=QiO6bNSuFxQlH/blgwkT5uNk410HsJO3H/z6pF12sak2I/x0zK/u9K+efFQgfa1jO9
         yqgU421DEIQ8+w7Sy7iERGDLIVqCqPFhL2k+03X1qncsfpuMhZHjaSKwniesWO3eo2Su
         O75sbJ6U7/7x72chImSJCB0o+nr3TQd1IlYLMyckZEZA9ymZbci50c7WkAR+bwU4ttpe
         +CrgwHJ3eK7EroSkFGplukVRh00JQyuws96ywe8Dnq0DsueXaYQ+au0obDDlpd4Tizuc
         8utdK3JNWMVGxVHKYw6Z4iaUlzVjYCHuTA7cqyuPKHclY/P5RnXr7JyzTczlIul6pSm6
         /Jww==
X-Gm-Message-State: AC+VfDxcPsmGZMKQG6FIH+CDE7fhU2xKGmmDg5v+VW5LDPrKteiviVKR
	HEqvhJJFWyJiS8nUf0hR7mO8C8GJIVg=
X-Google-Smtp-Source: ACHHUZ6/2booWeE2exY9bOuMvWGzhwqkVsk4+o/Uf6EHB3A4kVTmqfxqGwxUaf+tDuY+4BpyUDMLHw==
X-Received: by 2002:a05:6830:4d0:b0:6af:8aa9:28b with SMTP id s16-20020a05683004d000b006af8aa9028bmr568024otd.35.1685495200132;
        Tue, 30 May 2023 18:06:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id l7-20020a656807000000b0051416609fb7sm3899pgt.61.2023.05.30.18.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:06:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ctapi-common: Use archives.fedoraproject.org to fetch srpm
Date: Tue, 30 May 2023 18:06:38 -0700
Message-Id: <20230531010638.3710566-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102900

This is a better place to fetch the srpm as it is fedora's location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index b7a9d3e936..0e994d8b09 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -4,9 +4,9 @@ SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
-SRC_URI = "https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.LICENSE \
-           https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.README"
-SRC_URI[sha256sum] = "0531a6db39271166f1e9060f81a0b2d47f878210dfb4f465c703fe205cc3a8ce"
+SRC_URI = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
+           https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
+SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
 
 do_compile() {
     install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE
-- 
2.40.1


