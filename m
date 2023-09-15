Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FEBEE6425
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:07:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.15549.1694761653238715122
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdi526hI;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so2202647a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761651; x=1695366451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+InCxqIFwssUkVSV04wMAbmOKgZFTHwn/RiQo4lS+a0=;
        b=jdi526hILK+Iysb58WecNPnzTVVDpkO76+2XZF/n011ytW5RulvO1Qrj8Vt7jVT5Uy
         yFvj4AohdNCXVM9hfmBDswXMsoPNgCFZpc2AH168a80sK3P/wAzTHj2kc1XqZroMT0jD
         rsSMBrKOK7/s4q1fiPrco+tmul9wcOKVJIvHN9w9QDCCf7IReHcrP87GS/mrV/4nMyAC
         GYTLJPxKGDgnbMtTEc2alMO4SWAx+A/CeR2/3aXhGQi6Mq7wyAlE4fisCKOTvPsvBwML
         ZhnQzZnxmI51MveWtW0Ii9VyVHRDeYC4yFoThZSSP2obTq0z3Cqa77Q5uP/ZlROt0WQI
         fNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761651; x=1695366451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+InCxqIFwssUkVSV04wMAbmOKgZFTHwn/RiQo4lS+a0=;
        b=T5ahcRhdRMBuBHDlX0570iGDK7zyEwy4gZdTzUvrjVGE3E4HMpzcZKD2Sy1Y5UOm8v
         WM6XCx4hwkHWr1svvSvqL1QjGRkubnGovv5WWCjypodpUBcs03HSWILgYYZhdrMIY4Q1
         dnbI0qbjPwf8hhSkL8tQ9wG1B7MZIhBCRpb3acCBoRnptrH6KtZVuVUyJwT9aXWyzpfI
         tZ4QwEHMWha1d5tFkFQ3i8c4iqxytk7EALxdDFOa4KH6FC/4ixkHBAAmdAvlqJqFHraB
         PsZMaCoZ5kLvMFnucBOdJyw7eibTAlVPIDBFp37slB+iKea3kcnNSKBdU9J9TVZxiGVZ
         y1PQ==
X-Gm-Message-State: AOJu0Yw2SU5yOP+J5HSgPnw4EA00e6eb1LSHpxCDrsHFFeHj3bzO09x4
	qcw5V6RMal81lzloZ8e4r6ufHjH3qw==
X-Google-Smtp-Source: AGHT+IE+YKGQP1yVs2kucP+6wisbVoAh2QUl3gLfwDXsOmesu65EiwjVEfSjFf3qmhjE1QMddBywwQ==
X-Received: by 2002:a17:906:1da9:b0:9a9:f239:d874 with SMTP id u9-20020a1709061da900b009a9f239d874mr590518ejh.58.1694761651262;
        Fri, 15 Sep 2023 00:07:31 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1969889ejc.124.2023.09.15.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:07:30 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH 2/6] python3-flask-marshmallow: add recipe
Date: Fri, 15 Sep 2023 09:07:23 +0200
Message-Id: <20230915070727.4026-2-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
References: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104886

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../python/python3-flask-marshmallow_0.15.0.bb     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb
new file mode 100644
index 000000000..25ca4d24c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_0.15.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Flask + marshmallow for beautiful APIs"
+HOMEPAGE = "https://github.com/marshmallow-code/flask-marshmallow"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c3ff8567ef1f2a8cf223f30ac5a6f094"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "2083ae55bebb5142fff98c6bbd483a2f5dbc531a8bc1be2180ed5f75e7f3fccc"
+
+RDEPENDS:${PN} += "\
+    python3-flask \
+    python3-marshmallow \
+    python3-packaging \
+    "
-- 
2.34.1


