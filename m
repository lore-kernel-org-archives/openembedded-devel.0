Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB3EC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:17:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.1947.1751995022849202283
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xw3zJXw/;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: yishai1999@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso4140348f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751995020; x=1752599820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tl19cYCX9h/hPh1bd+Ei8qcZHOmgY7sY3xpYLc6DlUU=;
        b=Xw3zJXw/U2iShENnRe8pa5R2MezMtSEFTdq4SG/eL3vH/eHT6nqoly4z3tpaid/N5C
         wARnvPad5LlnCtc6hsEayJOrIl8SVB8kOyqAAS240gtOf4lFw17aXBJ5IP5zgkLAT8Uc
         fX7PB857WA5EF6FbFqO7eR0ZxPJhRll+GvlL79gSPcHUetcgNbT0MhACmTcNpbUqDfYC
         hT77HZDqzHH4wgiDWjVJGhnEHaPyLE0g6jmVJGKg0nYe5Apo4tv9owIVio5M2RKqw4+y
         KtwENgkgKb4yxazs4vKX3QEMLOpd5eblhxrdF2wPoVQiSC5lmMeUXMWx1yYNGvlVhL2V
         H25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995020; x=1752599820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl19cYCX9h/hPh1bd+Ei8qcZHOmgY7sY3xpYLc6DlUU=;
        b=IFlu9WIfGR0i1wHTcC9pTL4y8Kqbdg7sVgGl9Zg1wJnBKbSajlYmE3lnLV52LtLDXa
         jqGeAS+jwmHE8+1FQNkCsbyMMxF5SW2BWNG3qQURltQtghlnxrc/Wk8pBTZqTfZ9QjEv
         513fGk6zSv6ZaoPODYiAmdXRTGzkPaPU6BXCIQ4KlryVAK1P4GH29iHXvlh79kFc7dXu
         bqHE7Zn6jBxG5mIddjKOLySPBRDIGQnPlIwcKabhpFClc64xhpHN+WaGstcpge4GlL0z
         SIizxrDwwXgSzPhgcf8VjTvNxIE9AvNL8Ml9PI2yO+OyBbtOq3d3IlVGSLZrtt6Lq8y/
         2xVw==
X-Gm-Message-State: AOJu0YwpP7RDI8+p7/Hydyc/igSnTz5Cl8SAbidm6luBWQ2NbRJwqHRC
	SLPDQgWyyQ3bgpFVs6O1SQWoQ6BmRXU+0bLvqyXLBKU6Yr/KMLgBHStYi9YY4Q==
X-Gm-Gg: ASbGncuz8hI1NeEAw8oCOe0H2jFDS1RJo/AJ4O5salgqOdAfvbzOaPBsuAljlTzgfvx
	h10VdY0KgY9cBs3HjwLnFEhaxdmUrO6iv0aFaPeDFcwMijIlLiWs2RuIFRgFP7MiDvCvEO4/xv/
	FuQI/Ezzi+MleYjxRrJFgC1l+zYgHopB7dhUC/AHm2BQaRgJjyevuREIBMibnrGczugp13e7BA9
	saELrI0kpi2ODkhLEKvs9hGZ1i0yzm/wnajjmUlMSi9LeGApyV0i7S0atlwZ3bWA7MpowFthGtr
	8WmZV8TATSGJesMJhK2KPyQ7jNR8X2rXzgJgPQsaQEe8lNbYKS/OWgvAs2729hhavrvy7g==
X-Google-Smtp-Source: AGHT+IF70twwQIbSTDVTGVaqwoUVqw8sJtUXMA/UUU9MUg+ESqS9of0R22d7d9if3V+oqojseIG60A==
X-Received: by 2002:a05:6000:4022:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3b49702ea79mr16346114f8f.48.1751995019781;
        Tue, 08 Jul 2025 10:16:59 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c6c9sm13342132f8f.89.2025.07.08.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:16:58 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [meta-oe][PATCH] cpp-argparse: added recipe
Date: Tue,  8 Jul 2025 20:16:47 +0300
Message-Id: <20250708171647.2706820-1-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 17:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118320

Added recipe for C++ argparse library

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../cpp-argparse/cpp-argparse_3.2.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb

diff --git a/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb b/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
new file mode 100644
index 0000000000..cb7ae45d38
--- /dev/null
+++ b/meta-oe/recipes-devtools/cpp-argparse/cpp-argparse_3.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Argument Parser for Modern C++"
+HOMEPAGE = "https://github.com/p-ranav/argparse"
+BUGTRACKER = "https://github.com/p-ranav/argparse/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4f3ed9ec2c801700ac8fda1fcd29a330"
+
+SRCREV = "3eda91b2e1ce7d569f84ba295507c4cd8fd96910"
+SRC_URI = "git://github.com/p-ranav/argparse.git;branch=master;protocol=https;tag=v${PV}"
+
+inherit cmake
+EXTRA_OECMAKE = "-DARGPARSE_BUILD_TESTS=OFF"
+
+BBCLASSEXTEND = "native nativesdk"

