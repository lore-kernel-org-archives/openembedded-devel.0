Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FE9E95A74
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:54:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62186.1767092089616548164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 02:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/8nKDcz;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso23760695e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 02:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767092088; x=1767696888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqz8oEMyzqirkou8rfBxWX92MUyoxwzj3bp3GzpoVBk=;
        b=P/8nKDczCVHGN4FZL8TNFB1LqczMOuXUbbnU/H/3Qd3SUD5pqiMmRa424M0cnnO3Mv
         4eSZRgjP4Rhhp0pwIjqXXLcV8MeBakIJlvpqoMhTSsi0gh9g33JKetYq5QgObsxqEAYU
         9TCVI0StQmW3DBRrnbb1a9mYe99V5wBNVqS//lJvLtRxHeMyhZIVBK41l8kOxXfUkW71
         KnTMXXHC9JM8mSaW3UsJFhMdDsNOAPgqeNfdjQo00rdT7Z4biauaMbrgpPCI8QO0txKE
         rvlBsm8GiWqHp+wqYtwXOJ7DVHY7HwuIO/5hU5A/p9bXFU6Zqz2k1NOSpsNZjer4nKU3
         1Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767092088; x=1767696888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqz8oEMyzqirkou8rfBxWX92MUyoxwzj3bp3GzpoVBk=;
        b=iJ0/6C/dxk2xawcl1SR89N5X2IeIOIYl85x1YNRkEn3JscBDT8Urif5eYmOi2pBB5p
         +z3DvtbhwlH4Panj7VTJ0+uCvymGNqAcuDAzZxuiwG9PyIy0ffdAm4goW/A4yPcylaDd
         FEKHjzJ3dgsyyOlEEhnhiZWXNqqix6a3s69ZGr8vV4PDXgGAyYr4DwzVlEBxYAfd/7gn
         EE5SZxJplK1NgScE12arOsCYwJBsZl0FoCW1FBeW7fnjnB2jfpUf7NXXv3mq7wITmZRh
         MeyshU9PKjdba9B4UCgrNJIbzBwEP0WNfio2tGyTfS0WONX3ixoZKKsYY0KDxCDSwtNC
         KQ1g==
X-Gm-Message-State: AOJu0YzTP0LvgHtMtPfGmgy3MwW8zBIdSIJlaZtCp4G7JGiF8oOWb4dX
	afnmepb+G5t6CDcHVC25/C3ZTJgQ9KR0MNV3R/1OBuYt6U8UX7cHG31Fcj2Mpg==
X-Gm-Gg: AY/fxX6uuUAQa8Ue54IcKjD3hzpxFbrr3xqz7XmKV9T0yQ8nBS8xXieL8+u8cZKHGgb
	zln0xQBLTaYBznK6b70RMjwBIoav9ujXV5NniUbZhxKHRa4Si3aJ9AsZvrcsJMOFV+J0U6en+7G
	OI+qvHyYmuSZIh0VKtfiUBIShKJhAWyPTFCDAL+8kd2L1jpTNXyQfPyhfrMDRsNKYGrcfGedw9V
	/UgUuppO07ZXYud+2DP6X7InWcyxmbBzbsLBDUPqPDM0XfH0sx/MgmueOh4CSlW+mUw1Wg6dU99
	lruZFnYwewtCUKMmQO+vVJDmxnFVuCObTdUah3x+teSGnBQiydp1Vsor8u+9kLyif342rChURTD
	IlusWN6z3ReIhONQBoaKK5j8G3tcWv4f/ee9LJQfXiUAFnrqkI2zXQS5DzbZFHCAYOkCpvNDF37
	DgU+Xp4kGR
X-Google-Smtp-Source: AGHT+IHn+MTaNuoo44FVq0L+VNQHQhl/V7DN4oYMUQdI8wz6gkIxQXacTUPUWOEAfn2FkyhgbgSCQg==
X-Received: by 2002:a05:600c:3b88:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-47d19556cf7mr482798315e9.12.1767092087700;
        Tue, 30 Dec 2025 02:54:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be26a81b6sm660338445e9.0.2025.12.30.02.54.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:54:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-cbor2: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 11:54:45 +0100
Message-ID: <20251230105445.712427-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 10:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123006

The default, "python:cbor2" CVE_PRODUCT is not appropriate for this
recipe, because most associated CVEs use "agronholm:cbor2" CPE.

Set the CVE_PRODUCT to cbor2, so it will match the currently used
CPE, and in case there will be future python:cbor2 CPEs also, they
will be matched too.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
index e124207cbf..26dc41802f 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
@@ -15,4 +15,6 @@ RDEPENDS:${PN} += " \
     python3-datetime \
 "
 
+CVE_PRODUCT = "cbor2"
+
 BBCLASSEXTEND = "native nativesdk"

