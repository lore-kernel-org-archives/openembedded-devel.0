Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74C1C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 16:04:21 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.66101.1753977853205128596
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Jul 2025 09:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BnzfHJ1H;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dc5bcf49eso16163225ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 09:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977852; x=1754582652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBObK12EcocF/4bfd5wbJpYdYO6j1Cf0v/kniQNU1uU=;
        b=BnzfHJ1HRTNUFSmkTlPyO79HDIrCN2pZ3AX9oGC77VTnXJ+/ENvu/+DO3uh7TmReps
         j+KlvhhIDEzQkiA/XdWKjE419qGUUk00H7eWxNvHxok8fIhO6nrbAI0OYv0a5kOvLTky
         sA+Gm5PRrckwuXLROec4oZ1BbllBOBK91B0/F+ZfITxe3IcG1D1Sd/ot38LEreE1M+BF
         GQTSC6AtpYBW+ZwhA22Fc/j0hzeYqFEBKcjlcV/NFAbaDNz5vF3h9KOVZyQWdiuCXWnE
         gZRCDi80CMfbrZaHO/lORScgDEfLnHcDEJMCDog88GVOiHjBqLTCHrF+MuAvaXr+qVvx
         rVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977852; x=1754582652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBObK12EcocF/4bfd5wbJpYdYO6j1Cf0v/kniQNU1uU=;
        b=kCGqWOjOagUu4JKzZbDgL+61GXuZHsDpK8qp30GDlK7EvIHubvHIQpZo+NTcAtKPDd
         XbnKvEVO7TDv5+YB/ryNaM2H/tSVSMN3Hi1ArSoa/2AcvAfuLYYffPWdbTfc/hStKmgI
         h6D9Pik2oVmNdy56Hcsr5y1xK1gG6BqwJqaNsrzj72Kv0NY1uRyi1O3sDPC1Bn0M4x7N
         JTyv3V0QSY31VR217fAgPJTIrFMgoFpEF66Q/ni7kXPlfB7pbmTGd1bsCTyL5k6vYOxh
         IOQsl4cQQmt/cEd6oO1FdeqpEq9e4bkxxeKMb5pI2rZLj0I0KJGa3q7X9cNdtG6Ag5gM
         e6Zg==
X-Gm-Message-State: AOJu0Yzk+vcNxFzohosBT8KyhC7z/8BPu7/6L+CGgCO7aArf+F25bgNs
	MqjXXCrDVr4KTti6wkdPt+jcaNQRY8ZqI1eWtIXkE95IYombjn6YgmL+GaaKPsvX1Sg=
X-Gm-Gg: ASbGncs7gap4qAp3Qd09uytwGsAHhNyJSHEXuBO7rD4Bh7os20VfcaJxfDOzf3WaZIR
	6bMSJCosDbIZWP423mNWuqYKYWpqnElqxXrw8tUdIbfAi4aKpRRVsslgCMZGRYkm2VY7hlKrDTV
	LxP2yHVO/dToDCh7CQvEny6TZ2Q6R8CCKgaS4Vif18mXb+C3hJavvJJ49HX5mKGVkecdROfBD9j
	wYastU/0ukppqi6mStc4VFLZAhiuu5FUJbBDcnURyN4xpjxbKyQ0lnkVP4oS5ntRqqwCnPrkxHc
	22GHspOFXTnuwW66kRFqM+sH1XOJ9H5WO/F8gWWu0TXs+x2qEK6U8ggXdzeZpHG1vLyfCijaMPu
	TOU5/ylvXluemeQ==
X-Google-Smtp-Source: AGHT+IG1wmeBHAU69SrgUGGRjLX6TJzR5w8cAU21PQZdzCoMz2ZCiRHr0gd5P2WlcguCW8iBEuQEfw==
X-Received: by 2002:a17:903:1967:b0:240:52c8:2556 with SMTP id d9443c01a7336-24096b0d471mr105133255ad.39.1753977851840;
        Thu, 31 Jul 2025 09:04:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6e45sm21546165ad.22.2025.07.31.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:04:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] waylandpp: Add tag annotation to SRC_URI
Date: Thu, 31 Jul 2025 09:04:09 -0700
Message-ID: <20250731160409.1347809-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 16:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118817

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
index 7ea9f3ffec..485915db35 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3aae28cc66d61975114c2b14df215407"
 
 SRC_URI = " \
-	git://github.com/NilsBrause/waylandpp.git;protocol=https;branch=1.0.x \
+	git://github.com/NilsBrause/waylandpp.git;protocol=https;tag=${PV};branch=1.0.x \
 "
 
 DEPENDS = "pugixml"

