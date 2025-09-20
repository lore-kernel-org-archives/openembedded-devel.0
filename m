Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ADECAC5A5
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 17:38:14 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.14337.1758389880227670349
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 10:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+1gbiqN;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77e69f69281so1654451b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758389879; x=1758994679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtqwV+rcXWUuHjXiyEB48yitQAjJw6z1KuMPqAmcB9c=;
        b=D+1gbiqNYAHYi562j3VgMsVvhsgqXXuZXtwvR8JFwf7+kts1Yg5G4fZiMFl+E/Y0kl
         WjwQuqdKhldffZbA+5lQp60Yz8JD+J7pS9CKdY28x68n4GawhF/rBNEW+6wJpvH62xrx
         TzIcEYEqcO2Pz6xJuDxkZMj2cBI0pG462a9OJ5LlcA6BTjoR6m1sE+O1sw7bzcXewKey
         mnex/h8F6WqKYfckXtmN1xy82+VQxvlc/KPUszEsm+ruoSc1HrgAvOt7stUiCvXzTdvu
         BiZAmkaU/j3TLg/nsN8185Q1jHu0X+yX6SbKAnITyUjNFgKNm1fJxn+++j/erD0uotyE
         pAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758389879; x=1758994679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtqwV+rcXWUuHjXiyEB48yitQAjJw6z1KuMPqAmcB9c=;
        b=mArusI2KI42FOBjEYJO4S7ZgEfhgyv2wYWSTWvKclDlBOIAkF509lQAbXNzlW2iDeO
         AaBGlB6nGv6gQqwambnXKxo4K66OWE9C5yAqLphXmTMntFW7s7S8ffbRp13SCrrnni1x
         nAZVL4xSYQerDmyrknK782zeITdrvXnW0Ou4KlKme2UuoPaQhvfjAdjFcNkgsqb9vPEr
         v1B8FvxmZz0PhZM8CJwn2QEqcbYVaEhGKeEKqneeiCopE0POxXOHWzwIjRMyYctMLEEr
         j+ycP1cVekFVQ6+N8bKKMxcL/wS0EJ+PwcdMIuZfLubAbTFsBlAhGd/+zz+YpMQ3QoF0
         rsew==
X-Gm-Message-State: AOJu0YxDVaH8ELw3xGf7FIoeLllq2PbjHzZa6rtgz8HopXvwMcwOYkcm
	Lr1dvDnWakDveE/Oz8PtIyHgf7HqnNz6QuVlxyQArIo+oZZfRDCxaHp+3rbiWg==
X-Gm-Gg: ASbGncuUvAH2O3WPhpmDSijloOhsbmlHzFT9Y+EPL13hbG7In1uNC2xh+C62dGnKvEE
	Q7XpvhdXN2/xqz8BqRWQI56nidGrCC2PXANCLXzYcYZAyCfNBSisSDT4OXsNZ2GGZNWxW2X2Vhl
	XsCt39Es5RE7eah5Xsk2B7wSMuAbHvsQOZJiON830TkzMGc6WetyXnKT4g9vpEvpnyvBvahYiz/
	Egzt+HHfean/PBqPSyMs2c01m2CDmmrWpy/5e96wTXasA7LG62fbDsm1wlI+PKP3Sva4JFkv3rP
	xv+IH6dpnW3JCI/anDtUOCGfJfCgHGj62FBoT49E5w3uS60WNMeSIdDXOEyETa8ZbS70ulj8gV3
	qmQ==
X-Google-Smtp-Source: AGHT+IGYxCcL1tPfWoAvN991+s/ns3xdgngB3YraGyBZMOFSXiN7I3mUfnGI0I52kAFAesZ8A+QBKw==
X-Received: by 2002:a05:6a20:c996:b0:262:8422:5751 with SMTP id adf61e73a8af0-2844f10e822mr16672627637.10.1758389879273;
        Sat, 20 Sep 2025 10:37:59 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:6e65:c469:8e65:be54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5509b47f55sm6776488a12.48.2025.09.20.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 10:37:58 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	Sean Anderson <sean.anderson@seco.com>,
	Khem Raj <raj.khem@gmail.com>,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [kirkstone][PATCH] image_types_sparse:  backport fix pad source image to block size
Date: Sat, 20 Sep 2025 23:07:42 +0530
Message-ID: <20250920173742.3449291-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 17:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119621

From: Sean Anderson <sean.anderson@seco.com>

If the source image's size is not aligned to the sparse image's block
size, then conversion will fail with

img2simg: libsparse/sparse.cpp:133: int write_all_blocks(sparse_file*, output_file*): Assertion `pad >= 0' failed.

This is a bug in img2simg, but an easy way to work around it is to pad
the source image ourselves. The default block size of 4096 matches
img2simg's default block size.

This change corresponds to upstream fb331cb62eafd1e534dee292525084ccee0ef3e1

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 4263593a8d..b092f68406 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -1,8 +1,16 @@
 inherit image_types
 
+# This sets the granularity of the sparse image conversion. Chunk sizes will be
+# specified in units of this value. Setting this value smaller than the
+# underlying image's block size will not result in any further space saving.
+# However, there is no loss in correctness if this value is larger or smaller
+# than optimal. This value should be a power of two.
+SPARSE_BLOCK_SIZE ??= "4096"
+
 CONVERSIONTYPES += "sparse"
 CONVERSION_CMD:sparse = " \
-    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
-             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
+    INPUT="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" && \
+    truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "$INPUT" && \
+    img2simg "$INPUT" "$INPUT.sparse" ${SPARSE_BLOCK_SIZE} \
 "
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.43.0


