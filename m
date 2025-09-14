Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A220CAC594
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 15:40:30 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.11771.1757864427002518022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 08:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcOKtrHT;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26488308cf5so3533775ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757864426; x=1758469226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMwkzpHu4Mvyf1YoqsZdmdEf8KId/MsnWzGNj7lmpu4=;
        b=AcOKtrHTM4uai/xwWQ6X5JyHmGM390ogdZ6l01wONfJ7vuktE5bArZfuL+vh4wQj1Z
         occVVvOOCIrV0e1wb3VmM1B/yFsMxjTBVK52Hoa8Nl+ic32duYSNSoAwkBy2d9b/ceEJ
         3E5Y0YzlcU8SOTkEaZAjPsYHadLeWeiXf3byZXu+B6wbIGdkw/LKSFvVTthLBaW2ooZi
         rryypMCq+wFJz96mGHS70aGuwFzPAgX7/kmUPR7NqeCywPr2LsE4tSeCYK65Q1HCdUhx
         7SGlXf54e5mOLs/dyScUSf4fejnnxaPxhHlCDoUl1Sb1iph3rnM5PQgvkrnpZBCeWOOh
         y5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757864426; x=1758469226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMwkzpHu4Mvyf1YoqsZdmdEf8KId/MsnWzGNj7lmpu4=;
        b=CQE5Bjqf76YDxOqQIhHYmn2jpZQNZ2yMhwfjYKWhn1fQEvBDbGgt5v4xado4mB3pW8
         sORD2ykRfR2z3OelOGAwY2pCO3KvR2xeBTMKEx7ZvmwWUMCj8K1WjHsgldY6OA3NPzz8
         TOBVKoJ8byGROPXX5uz5tSMhfTW0xwI5OYqoj/k1mpq9SttdpfWME32ZkGs10Mz64wSF
         piUnfUysSXNewPMER5MDcdSMBnTLyXkL56xdrSiZnXs7YvXMVhsnViTjV/T8I6KpjTXU
         B8tdI6TlgHnfH2+WRk1WIIitOs26QuV0FX2kXNBPJN31lIj5EzC5biIMG1MJGqh4r7du
         ehAw==
X-Forwarded-Encrypted: i=1; AJvYcCXvphnr7TOs/5HfcabtI30AlPrIfmg96bJCr1MAJ1Wci4jHoOgW5vTQZlqbpJne2Xx3HSvSDVY/UUVT1lqoqF+06Ic=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxa+mRjz04yowEdmqRJ8VdTCBP4VrnPkmYEOm2Twv8swqYVxkqM
	MkwDcYIOZmjfkf1ZeiXgj0UhiwMM0xGEAiT8QYlw56z/HJE4G7g5s38Y3alzOg==
X-Gm-Gg: ASbGncvIyVwFaQ8qsBGlgKl+XPRFqY2dCxwdfW2a94AMTvTWgvBpwKHAKJwWG9Y6mdt
	iZwT1eKN4b4kvD/pdtXvodb8oVlhfCZVw+0rUnVMTwPw8a9Iv556ExTfS9cZf7FbFdZeELXbyDo
	hGehC7E/Iha/EyQopHiHeBMywD97H1FM7WMCxFiTWoZ0/zKlPNX6wnL5ILs+i+1vnoQQEWlvY55
	NJSWA+hy+6JuL32sTlIuAEZTxRW8pHdxyuePuqiMsl0kPLkck9wKbSKx0ZI522wXUWRzLvcoe5e
	joBFEkqf7xPjPKnLUj777QdtCx/AkIQ1QGX8ccIxadnuZjNSNjftsVduD0ltKkKDTBqdgEnBjtj
	S
X-Google-Smtp-Source: AGHT+IHmR5ugUvQs7Ahhk1KpqIVVwO8O/pMu95hPDEydJpHFSAuUEXMfB9BnWsqxcQ4QTeAzMfQQpA==
X-Received: by 2002:a17:902:ebc1:b0:240:9dd8:219b with SMTP id d9443c01a7336-25d2703a588mr129485995ad.49.1757864426399;
        Sun, 14 Sep 2025 08:40:26 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:6012:935:7d1b:6dcb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ae2dd2csm103015765ad.121.2025.09.14.08.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:40:26 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] meta-oe: image: optionally remove RAW image after sparse image creation
Date: Sun, 14 Sep 2025 21:10:09 +0530
Message-ID: <20250914154009.22042-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 15:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119396

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

    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "1"   # Delete RAW image
    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "0"   # Default behavior

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index d6ea68968e..5416c2a019 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -9,9 +9,15 @@ SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
 
+DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
+
 CONVERSION_CMD:sparse = " \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
     img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
+    if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
+        rm -f ${IMAGE_NAME}.${type};\
+        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+    fi;\
  "
 
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.43.0


