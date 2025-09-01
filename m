Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB51CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:22:51 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.54352.1756739391263243255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 08:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtF87KYZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: logan.grosz@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-743814bcca2so3154662a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756739390; x=1757344190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/iTmDXxIxA6C/TDlpSVfobOrhauu4/PP9cupw+SKPE=;
        b=MtF87KYZeKnPEJ7ahoMcRgBc73sn68Y+XzMeFAtCC0JadvAa+4MyuDVAycupv8PZvR
         eUGx4OdO7akOR11H8igaUf/pRsb+PNqUqhwrwEkpDXhIi33wVxYf5Id2qGK3ueNR6CUZ
         wpR/KHWNwPZaARdP82cGLc0YUXLhkgj5mestM0lmLA5cS5GWO6R0ZWz/Y8w3/yOpmVjV
         roiZ/9T29+7F66CtSxFeXYNqv8dfoDw9c6n1HRRIxHKsKfb/oQhT3g/zs3Y4JykyAlbf
         eNblXCAh3Gj+E6rHJYSdeCKYHZBp1v8tVf4ZNmq0GShnrOH34GPi/SL0GuQQaj8B6mTu
         Uzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756739390; x=1757344190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/iTmDXxIxA6C/TDlpSVfobOrhauu4/PP9cupw+SKPE=;
        b=OHCfxWTluv/yLBQncesj4nJTWyazfFTgGQFuMO+yB76ZGmxyQa52swjNtsbIs/VQq1
         3YPSE//PCIUU70rTc2+SlhXkIdipKKWn76wN425/+ljxMGzlg6G0A7wdo2gBckADNIia
         5xjWErvLcVjTAUoXomWKNimxkH8IoLaYUcUwcE7uG/MvJErKq1F+NUJulQLN/3XCrIxO
         7QmHzcE8pAqEK9aD5nsYXFwZSK4Uph+N7314OWTaYw8A34q21VpYQlBRMef9zXiNQDWo
         y4yMzHT1NhwrBcVYqiUFuUB53DU30IU4usUH+fZp1bq8YNPPWYBWBKZJ+f3tQWz4eAXg
         taIg==
X-Gm-Message-State: AOJu0YzAxB65eDjFMvTD3Tmq+iMWYLC2T9rK1w2cwJwjwuiPczn5w9EG
	5yxjQJCMmgVVURcVn9g/gDpDrPjgvHTPpKZjeLDAIISaGmRHWukQfl0jbHHapA==
X-Gm-Gg: ASbGncu8LLTSQOnmYe29HrW8Aor7lwD7LM+BJueDEXqxE/JWkAi+RXfUMMiHt+sNJYK
	2OCzXAqaw+nRvmL9z5RCFqWQFJqx8J+nRIV20GAZOLE9kdbI3BiepyEJ8RanvztgrtQ1UUmqfV1
	PGMPacHkjGu5iC9AGYsJELR+zMJrLgOCJ0G08BmTbU/WxFYXCXYuFNdUrHsqqW4aTf/OPqSK48O
	mwfTUlgVdPbEXNqqq20VaZyNQD10jRMWknGlvFCTBO4hXaOOoNclgoyKRSekWq1UMbrrt+OFCgy
	kYfBO3iZpmbVQWem5npJ6dgJHY/B8raP0KWtL81TjeD8+7pyEFZeAUnlpvUYSoEXMyv29x8cFYt
	jF8NsIHTgQLV3EqYhtKiqYYY403cEW3zLSFYV+FyjQR8fvJ78afrpnOaLXPU=
X-Google-Smtp-Source: AGHT+IG6PPipJuMtgcwW5gNqS6I72usTdl6dkkcnE2fDls8/RXRLZCd2GH+pJSh1A41HcdNMOzeo1A==
X-Received: by 2002:a05:6830:3342:b0:745:6b27:f8c0 with SMTP id 46e09a7af769-7456b280a3emr2582035a34.5.1756739389946;
        Mon, 01 Sep 2025 08:09:49 -0700 (PDT)
Received: from localhost.localdomain ([209.159.212.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745742a4faasm1068477a34.10.2025.09.01.08.09.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 08:09:48 -0700 (PDT)
From: "Logan Grosz" <logan.grosz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] packagegroup-meta-filesystems: fix build issue
Date: Mon,  1 Sep 2025 09:07:22 -0600
Message-ID: <20250901150805.97615-2-logan.grosz@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250901150805.97615-1-logan.grosz@gmail.com>
References: <20250901150805.97615-1-logan.grosz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 17:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119160

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

The packagegroup has to be arch dependent to address build failure:
ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (fuse to libfuse2)
ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (fuse-dev to libfuse-dev)

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packageconfigs/packagegroup-meta-filesystems.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
index 75591c31fa..1954b5979c 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Meta-filesystem packagegroups"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
-- 
2.46.0


