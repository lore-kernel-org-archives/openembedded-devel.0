Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B04CAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 17:30:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2862.1758821400420581289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 10:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWA/m2PJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24457f581aeso13350405ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758821400; x=1759426200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtqwV+rcXWUuHjXiyEB48yitQAjJw6z1KuMPqAmcB9c=;
        b=hWA/m2PJEMu9FZQCtXfMkpH120CL/12s+UEZuNBXmZQKAUJ9FIQkdGWxkYPXVVOvdg
         4WFJGuVzHvrkGAWc9ivkxtTdkHLxjSonNvEsOHEeDwNKZDXpZx6eMhjVh8pM56hnETS3
         IJ9Mhn3VD2DP2UUM29Ui9QEmBIhnCzVMJTy6FOfjnSZs48y4nPXlk2cM9IJVHLuXAESU
         QPe/iMUCl2eKGnVmlfoofCaTa/F+YdZPTsFUT1ekFGZMoSFlFk96qrSi+Edt1OQbBm3z
         f6tDdo+HUc51V/w8x0xLZBNZ7H/bMC4V4/9qtuAk76d//R8D8H0DAd61kkKHQwBmof1I
         hzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758821400; x=1759426200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtqwV+rcXWUuHjXiyEB48yitQAjJw6z1KuMPqAmcB9c=;
        b=fiEzPRx+6HvMfAxOVRzzlTisbYoEg2tgCw0UAs/Rx+cbgzwFj7c/6GMtpDwxU7WKWb
         nT4sGit2ANw0V58qi4ochViwfAzgQCJbIMf0e9ZpO6Ylmi2DySyadUWrM/KsCWmgefxh
         SwpwE0/flddmbrTjj76QFZmMrcwkfVPZFwXQFHzrslBmt1PQN4RqQOOnGzPdbfyPKvZW
         wxjrQFU3dC4gitrIHbkYob93ZIOQwiDqK9YbTgmmnB6Tmb96ypJP9zNkTcEsiTC0vQ/D
         If3EOxbtTT1Ql3hqsFp1TMANHM4UcpMJFKNNzJ/vteAN+5A4vwzuPLOJJ5l89t3BuXQ7
         2XIA==
X-Gm-Message-State: AOJu0Yxp1JAgj+m0tG7Ez7C5b4CkYzvHPXocg8RfYwt0Ao0TrVQ7g0gz
	6eB0tlrHKE/2J2E3PCWIwQCCRcVC8+nybkUZh6kdqcpvsd8tqxUHzKav4+6Qrw==
X-Gm-Gg: ASbGncstX/uEvd7vbqQltrROYJiCNHlE/uHbjM6Bj2UfPp6h162/gGgsYb8oxIqc1Xv
	PauUHv22NdBcn3xvL+9L3oQIOOhvYGCUhqAudD8tSaPzrU9bx9yMPJ6imasgriLRrKbTOvXfw7H
	xayQ2KNfnPY/jlQLTa+hfKFJvSnNPuIwEJRO/YJG8OM32vOiZxVcIlolDnMU39y+Vrj0NMP+NZ8
	XNFB99FbnoERiTo2svQBAnU6T5TcuNclo+t+R55PDqbFJ2dgnbtLmCaUJeSGmzYHAsHPjp2mEy/
	Z6rAGW22xi3KGC5MhsFAvoVx8GxKtHPgvc7TUHSKAXGcsgCpFDIGTQah9Bn9YoCw56urUnpqUWl
	/Z7Frm0EMD35x3A==
X-Google-Smtp-Source: AGHT+IHpXD1PthZUxW2YWfevI4iizS0cu6rokc0vIEcS3glYxWDxJFclNcnlvaA0fD1cXY7VkE7osg==
X-Received: by 2002:a17:903:32ce:b0:26b:3aab:f6bf with SMTP id d9443c01a7336-27ed4ac311dmr54512885ad.42.1758821399575;
        Thu, 25 Sep 2025 10:29:59 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:d4bf:fcd3:666c:cf48:c8d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6adcac9sm30129475ad.148.2025.09.25.10.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 10:29:59 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	Sean Anderson <sean.anderson@seco.com>,
	Khem Raj <raj.khem@gmail.com>,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [kirkstone][PATCH] 1/3] image_types_sparse:  backport fix pad source image to block size
Date: Thu, 25 Sep 2025 22:59:29 +0530
Message-ID: <20250925172931.64046-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 17:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119883

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


