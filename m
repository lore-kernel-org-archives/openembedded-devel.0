Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC09D111A3
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3850.1764190167175608585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFW5+QDt;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-298039e00c2so2456635ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190166; x=1764794966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IfZmxU4ZD+z3yGS3DU8SfefiypasDXFGXxSuL3sYy0=;
        b=dFW5+QDtcl826Y5l0Vlg9zpBJUBqTEC34cZk+DEOcwVd7OdEXnMF8W8rjrn72D28t1
         8N3H1eCXhD3+gUvrdXnn8giIRvWQuyEKg54+N6VSY5j/OlvhT/EVsqfKtn7bz2m9XAab
         Bri8ufIVFFiVU/kDD9Rt/MeMxCQ2S2mtaQeEh8NmbcjrV1BQl6o7Isx0L4Yc6uLpzVNZ
         43/BfnzIGRrR/Dr5pjX9Jm/j5FXTqZ8ZB7VxgYJqgSCuJFHqohhm0wiefWmh9z7170+W
         mKJuYG5yV5B/c1MBW9irbuaE8MyALoAhmw2TekmxceUouaDtOKmzNB6qbAlhqOkRHwSy
         BoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190166; x=1764794966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IfZmxU4ZD+z3yGS3DU8SfefiypasDXFGXxSuL3sYy0=;
        b=ExcDB346Q3EqCneCu9IOM2wTlj8dQzVM/gqDQ+6knrtujlDVp7RGxCLr+Y2M1dviRN
         uh50XzivTfze9B4bZ5uBMEr/5ds5dPHdAIsXr4fHWzoAx7+ljvKxfzP2TiLqLKovu3iV
         60CsaEFisM6uMTm1V+BFoYvplKhry+6gkhAB7ZASEHVdZRu6YIqLc0pS7Se5br+WQOBu
         XS3wJ+UrOrSNcvjiZoTqrLMqSuP/bZXiOXIaFG7MVnWPnGIIZD6ZzjpB9azT44n6vvh0
         P+YV3cA9Pl1DJoaKs05ZY1qagF3j0wN+hbeTra/H2yMgx4oETiZXfYQskG8NjvN+/nH8
         nxEQ==
X-Gm-Message-State: AOJu0Ywd8Ll/6RUBN2GQGmptpiWvU2uPGbioEmeZAeZ2c9udf8+0zG80
	vyqAvjzqdErghm3PpehwmVbdHf+8A9KdaF1YC1xp7eSqwqbKCfIaCw4j11+PLw==
X-Gm-Gg: ASbGncuHXY9SKavrSp+i3SYGqpFPYqZcjs6Pckbf7bR1QLGefYCxRezxbe7O25ADOih
	NfMeEHMVQoJhRMQHzATPhhz8F2Y1AFjb2x0EjAKodUGwrctwqd3hNtYeartHp4duXRYwhMG3NwW
	dBRnX2qjxTO1Pg6B7+9Eui1Qjq1JuPb6XnNWnhiuZQx215zWCEVW5bT/Kirp559gFHS8ABWL74T
	0T5l9tda2G1S8OvRN1NcMxf5UeGA5IoI0NwFNM8fN53/CTJdw22Y0hzJ8ZphcptByDONdg28Z6b
	EgT2xazxMhegWgW+QZvpMeT26aIl3QiEkvvv3MB/xjNv05IFMBNQJh5+fNiYUxVromNw9JEElM+
	qQ48qbHFHf2ccKORvF97du51WNRkrXGscfR6gNqMt0lAiQ2xC9JbblhW+MB3Ny8QMefNxwtnaKV
	mst7qG5VmhjBb4AALdRjyyO6Y=
X-Google-Smtp-Source: AGHT+IFIWqHFlciVZ1Msheqy4T7MBFAvchTghSC0nAi3ihbG8AYmnS5XUdc5jMGOP4Fc7100vpE84A==
X-Received: by 2002:a17:903:1b47:b0:295:8662:6a4e with SMTP id d9443c01a7336-29b6bf5c8d5mr245721135ad.47.1764190166295;
        Wed, 26 Nov 2025 12:49:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 5/9] gsoap: upgrade 2.8.135 -> 2.8.137
Date: Thu, 27 Nov 2025 09:48:42 +1300
Message-ID: <20251126204847.1969339-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122087

From: Jason Schonberg <schonm@gmail.com>

From the changelog.md file:

  Version 2.8.137 (02/21/2025)
  ---
  - Minor update to improve XML entity parsing within limits.

  Version 2.8.136 (01/28/2025)
  ---
  - Updated TLS/SSL demo server and client certificates and keys.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 49894e57b05badb1416dc23e5ec3a02b2acde565)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gsoap/{gsoap_2.8.135.bb => gsoap_2.8.137.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.135.bb => gsoap_2.8.137.bb} (93%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
similarity index 93%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
index 8ce4f17075..b91187c13f 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "b11757e405d55d4674dfbf88c4fa6d7e24155cf64ed8ed578ccad2f2b555e98d"
+SRC_URI[sha256sum] = "a6c9fb9088efd60ad0e983fa83d8440fe128514db22297b5b3f2de302106e55c"
 
 inherit autotools
 

