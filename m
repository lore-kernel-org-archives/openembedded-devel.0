Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF83CAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 17:30:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2987.1758821421401094801
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 10:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dA/MCrWu;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27ee55fa1c0so6792495ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758821420; x=1759426220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKmPvWQ1fz9A/RU0T+MchF3JGILRM3fhErNtsIGSF/w=;
        b=dA/MCrWu6DkV2pDpHECBIP2p3QORu7LrFZynjOO25y1tuVsnLjHW2diKfe9H5sCdqe
         T8Dd04aUUtdC5OsLq++CK3jmoAIrVlUwBDzXa15oZrUrIO7i7iJV2Z8iNwVXyEcmBfsH
         /tpmQZX5OuUHLPr9NsNpn6/b9umEOBkyVv23rGh/ZuGvSRqSfud0P8kX3rydkrKde2D0
         9k3YWUenHbAi5Y2A3eL6EJd7TYCgerGMWUme7gEYAUTw6eEZnumGT3PrzxbPSDPN6Uxs
         WtPHfx3AV8FwK6ESUWX75t4M+jp8fIDquLdbpJlY3+7S1Nf/1gP/7gnPdnNtyrKYC7PX
         J9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758821420; x=1759426220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKmPvWQ1fz9A/RU0T+MchF3JGILRM3fhErNtsIGSF/w=;
        b=F2YvmMGjCJYXo/Q8qyMbi2kOPMUGpBD0DqarACYo6JYhHok1H0K97uOI2MMGP8Cemg
         q45b2GHhEr0njBi/65G81pw791d9vJcVe/9PHBzu6lVmW8OgyRpf1WKkQ/gZE3ejhycX
         ganvUsO5yxJ4sENu3SWU+T80IRtow7aAuyHyn/VskrIIvX4+lckgWLUeRgpOQ5XGorvu
         EkpzuEEaMCZO8V6WLK+QzAD/9jWcoiF26b7mTupRNnL2K7eqqX2jmVg4ip+CpVMN/qxk
         /V12+rS236uLDqUEO+MrGYYGmidRHInfy5Bsmlqh7V1Z/wkbD+BK9dxW2cJSPnvaso+U
         Emlg==
X-Gm-Message-State: AOJu0Ywhcj22ZQiVZ/L5iQqDU8Ky7RTs/BfZGnNG1N1sa32AOfX5CPNV
	cBdvmL1fwwubINy+ayfauHNLXZyQ7OeY3phwLddLNQhfYw/UyF3qVSpCzxYp6g==
X-Gm-Gg: ASbGnctcQAvgbOQ5F98lPVP6O+eZLJ7JlJLlBV37L3iqY6gsQ1x42iDb17OjnmQqCFO
	XLrdNkNv2TFXSW01+hWhaIOPeUtOAwvA3aUx+MeUnn5zi8MkDncwBU608GhDCuNqj8GSzQj5t1N
	V3BE/7fq78FivmNdtrQko5rhxqIumwWrabt+2YgBlrMkZD9b0aJyDJGa9SKzQumMdrS9zzF2XNU
	nzG1PgmzqIwGHbek91H9pz9cQtsiNOLOo+RjGUslaHFuadAxQs8CMsMhOVicd89MyC+m9qBNRL1
	mt6Zz1lgcVCgrGcj1zCxtcfPQHIXueR408dsF5yByuvWz1PDMqMruz/VEjeYfNV0j1PWwsOwwGs
	hqVw=
X-Google-Smtp-Source: AGHT+IFBsPu8sojmqFAlpDGk5noG4KCPVfrvhVBkccv2GUkaYGKcDhJhnTn7vMMB8FeECHZWIfTCVw==
X-Received: by 2002:a17:902:db03:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-27ed6beb88bmr43151105ad.10.1758821419312;
        Thu, 25 Sep 2025 10:30:19 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:d4bf:fcd3:666c:cf48:c8d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6adcac9sm30129475ad.148.2025.09.25.10.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 10:30:19 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [kirkstone][PATCH] 3/3] image_types_sparse: backport optionally remove RAW image
Date: Thu, 25 Sep 2025 22:59:31 +0530
Message-ID: <20250925172931.64046-3-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925172931.64046-1-emailaddress.ashish@gmail.com>
References: <20250925172931.64046-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 17:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119885

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

When creating sparse images, the RAW image is no longer needed in
some workflows such as Android and CI pipelines. These RAW images
can be multi-GB artifacts and consume significant disk space.

This change introduces a configuration option
`DELETE_RAWIMAGE_AFTER_SPARSE_CMD` which, when set to "1",
removes the RAW image after sparse image generation.

This reduces disk usage in builds where sparse images are the
final deliverables and RAW images are not required.

Default behavior is unchanged: RAW images are kept unless the
variable is explicitly enabled:

This change corresponds to upstream  f5246b7df447ac76ec04c6e5add398862d1c9ccd

    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "1"   # Delete RAW image
    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "0"   # Default behavior

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 8668739fd9..81dba96305 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -8,9 +8,17 @@ inherit image_types
 SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
+
+DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
+
 CONVERSION_CMD:sparse = " \
-    INPUT="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" && \
-    truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "$INPUT" && \
-    img2simg -s "$INPUT" "$INPUT.sparse" ${SPARSE_BLOCK_SIZE} \
+    INPUT=${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} && \
+    truncate --no-create --size=%${SPARSE_BLOCK_SIZE} $INPUT && \
+    img2simg $INPUT $INPUT.sparse && \
+    if [ ${DELETE_RAWIMAGE_AFTER_SPARSE_CMD} = 1 ]; then \
+        rm -f $INPUT; \
+        bbwarn 'Raw file $INPUT removed'; \
+    fi \
 "
+
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.43.0


