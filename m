Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A2FC02192
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.15097.1737828193503621451
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jm04mJtf;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215770613dbso39511035ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828193; x=1738432993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkTIVVPGP4tPFczzakKxnSbRj6fRyfUZ7TZRqqFJWOI=;
        b=Jm04mJtfKRkT+uaaKrnfY2BzMN7PMyJIaALWMUhOnTyWftKOaa9/alhbCgPC1qQ3bl
         bQqsORx8nVHCougRI8ZsT7occog8DoaEmQECXq08nj7DfHgGrsg1eIRz7Hutmkh7MKlO
         ObvincwbyOt1WKbX8Ca1hi2xjKbV0wb8o2htSqJPSJ4AjF+ly+YKdWSxrzFo6ShWjbL2
         0IT+8hy4xkewFAQzJIqmbtX6iv0v5VwzHZrMCTzdmBGvL6AhXQjIbHfoEukjbG0yl122
         Yg9lSCjjCNFUJrVwMt0H40B+168k2x1sfR8iiT5iRgRXjxNkI7dK3s49YsAzuaG/vApg
         rjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828193; x=1738432993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkTIVVPGP4tPFczzakKxnSbRj6fRyfUZ7TZRqqFJWOI=;
        b=PWn18CUf4gtdG69YILQMbuRidqUbu9TWmyvj9i5dOOiKVoc2Muh6wPCUHxbj5KqeHK
         nDIIWDwFD8oNFSl7KQtWEC+wiqgXPuDet4wdsC/p7drS3LeD3iA+Q1f/rzYQ+6QnuQw8
         zgNSFdeVXvtw+KgMhPmCfQBbIjoVgVOBmhohUXIm/uPepc8k9Tnabsw06ouKYKI/9gv+
         kHR3E6lhd6uhCLW9DBXP98KSzYlkJmCIUhvytD/Rdgox1fw4mFBkDTeK908WKEMP27Ki
         53tviuNbXJm6KlSRxlqTmP+KYM6eEiBoIPi2vd3iYUvzSEnJyVx7YKiRBXyU04X4Ovej
         ZgLQ==
X-Gm-Message-State: AOJu0YxuAcSCC9DoYK5vIXX1/Pith5O9BFLCOYm9eKB0EjkBylFBHEox
	pkSYnrzfLKsMxX4ZkXwRuBkX6N21NUqetsvN7jDpKwAKerM5Cf4p8/km7w==
X-Gm-Gg: ASbGncvQgGQJ5+q2/VqPK2HDbHIes6rWgReRLKOWxoJCcv5P21SHFdSuKbECUqClaM9
	jPcQj+y14spuamYoEChPaa3QaxnIC3vbHZERt2Zu3LyYJBguw0ddUjsc8N1B3FsCHb8p6WbTcD9
	E1u15VJRCPIKOKGxSX0l2Hu+BrubPK6+4XE98ahzafhH7v8AeERxN/9n3BHiW9gXLNldIefhYS4
	h+ui873vqED4TZc7LkZ99GoFmyqadBCe9m+blhATxSlU0LpE5b3XhvKtMHRzJOGbbEx+vPiDbKC
	yrQ0Ox0tY7F1Z0qD2o+bf2pmYWA=
X-Google-Smtp-Source: AGHT+IHV110Y2icvvZfyfN4sOcG45Ch92AVEYLLTOHQ2kypnqRUo1w9lKLuRkY1g3c88siAwiIYwJA==
X-Received: by 2002:a05:6a20:3d87:b0:1e1:af74:a235 with SMTP id adf61e73a8af0-1eb214ea4a4mr59389026637.24.1737828192759;
        Sat, 25 Jan 2025 10:03:12 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 03/14] libtinyxml: set CVE product to tinyxml
Date: Sat, 25 Jan 2025 10:02:57 -0800
Message-ID: <20250125180308.7856-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115086

From: Jörg Sommer <joerg.sommer@navimatix.de>

This library gets tracked with the product name tinyxml:

https://nvd.nist.gov/products/cpe/detail/95BDA29F-257C-4C44-8847-25CFC107228D

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c5ef63d685b291b648c364dcd880dca39b13b538)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 6fbdd071e8..2a7ca30a9d 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://www.sourceforge.net/projects/tinyxml"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://readme.txt;md5=f8f366f3370dda889f60faa7db162cf4"
 SECTION = "libs"
+CVE_PRODUCT = "tinyxml"
 
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
-- 
2.43.0


