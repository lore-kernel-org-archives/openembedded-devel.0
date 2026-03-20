Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34481075269
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:05 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18076.1774026119882737482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihnnNR2y;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3129941eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026119; x=1774630919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0Az/v0h1QDRtLpOfAiWH8Nhsb3GvTZAteHqnieYUPI=;
        b=ihnnNR2yrMx+ErLLOQxn6uB5AuVQ+442Gx/h/ALOQXzEM6W16P1is0rBor00XUY1KU
         sfvuWkkVM/147ClIHlUmsNVLZhqy/JIoU9bK0LuW49JPDMEyiqLIkwYF4kU4rmRbaXqA
         X1wtwPCB1wqqU+akEpjKnx9XoKWZFn+RRk8ofx/8l8Nz7RwG4PfixYbnKBHIcgZkHQ78
         OBGXVsuWOLNllC0nInc7occtnjtfvJCTdqqzhwtEFpUPzEaZEV3B+XZkOskknf1SDBd2
         k7t9foo1aZczQ1Q3DydWQaeKUvrQat/PRiec1z3G1Z5ej2rzKgX0p0NgYCbxZtbmpS0w
         suKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026119; x=1774630919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0Az/v0h1QDRtLpOfAiWH8Nhsb3GvTZAteHqnieYUPI=;
        b=mmvUp9QWB1CKpuJ1nQa4+tUSudZO7a6TbaP/9yd+rkJIIrXZh8ZOAi6ffHXUqFHuwr
         8aULjAdFnQELfIUlSui6zz1l0RG9gguZfw6udDuaQ5ToWYaUOHs36qoDEZxj63HeLl55
         3BDMA3q4zWMgRI6B+UOygagnKsCHThbwDQGqhCSaCyF2B+AyVqCBkEC5yirE/N2A0CYA
         mBvd643GHn1LmepvvwMpPCBTMih47fmD2VwlF5lr3hwJLmI26nfpidJmJN7Pi7htnLkk
         1lC0ABsn8jYg8rR1bvvLh6LRULgxQBcETvQre7y3VUfFjLnNvUYl0kT7yO3eRY5vTOVG
         Ub1Q==
X-Gm-Message-State: AOJu0YzyCk7jBEga0hraPxSV9qmunzRkEEaT+gk8hdhv9reaFYgRmJZQ
	4U56dgpUKgkjkN36bKXo/kOmA5l0sRS1vlkurJdUREVhFNhKsV24Cz8Aef7fYNL4
X-Gm-Gg: ATEYQzwXsQLMouAgiG1EsTlCMpN7VCy56KvQwSp/mtU+LpUhlbx3JiCkLdIyenDwNB5
	Y+lb8H+JBTy8Pa3bwl8l/h+3RkP4MtEe5sQe6ksfbP3O9WQpoISdnjVXaN7JitmbPjPNpjPPgoz
	POoVs+aPbhCl9w8zbGNgPcrn+ybjiyZz6e4MJSdktn47ENYRmFmsCvXY/p4kfOEcY6vw6Uu809f
	l3xiY+BOnZiTvSkX6OyEgrrI6Twc/pkVv3bi24znXkhF/DGBaL7gwUS3OVN7KYR6Tnz0aQuFQKe
	VDVJuRw9wsradna01SoBjOK23Uvg9bjhdo6ejtNvR4n7EmTlH1nlf1HiIfAgPZhkDciwK1taUD1
	XGlw+eNNhRSJbUIRODNsdOryDZ46/750PXLMHQETkPn6npAUW01tXXYEKaS4DBMOMsGUpsVPQpZ
	JbMkL1paE7iBefgjIMj8ZydYGyBnWD3X+C3hW8XkIooE9cTDjJRf3UoiRo5SrwybhME2bEDlwTM
	r2b4/IxtnTDTYGwjQ7vK8QC+IWf8361uehaZazqy3ljuIHvaI+kvGZynqSK/1EPvSGs2aE=
X-Received: by 2002:a05:7300:e208:b0:2b0:52cc:fe69 with SMTP id 5a478bee46e88-2c109567323mr1721642eec.5.1774026118711;
        Fri, 20 Mar 2026 10:01:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:01:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/8] python3-xstatic-font-awesome: Upgrade to 6.2.1.2
Date: Fri, 20 Mar 2026 10:01:48 -0700
Message-ID: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125441

From: Khem Raj <raj.khem@gmail.com>

License-Update: Updated font-awesome version number to 6.2.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e_6.2.1.1.bb => python3-xstatic-font-awesome_6.2.1.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xstatic-font-awesome_6.2.1.1.bb => python3-xstatic-font-awesome_6.2.1.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
index 0562cc2671..934b236983 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1a2fe131dcb2fc6243c26cf05ecdb36"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7c083fdfe0b927a9de368a17fbf13b20"

-PYPI_PACKAGE = "XStatic-Font-Awesome"
+PYPI_PACKAGE = "xstatic_font_awesome"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

-SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
+SRC_URI[sha256sum] = "9f3cb2f038fad7d352722375d3f25af346da9ee093ed9dc2c8c46bd911ab1971"

 DEPENDS += " \
     python3-xstatic \

