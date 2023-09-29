Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2A1E82CA0
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:49:19 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.30006.1696024157745183546
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-65b0e623189so52600866d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024156; x=1696628956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzXSoiGtHEJYpx3fmmxScWheYuspO72u/C3kHN1pE0Q=;
        b=waLiujX411orY+fqUGUCfdtrLLzGSVHxuiXkUKDntCcGwWvfU1Ew5hMW+Sz+MxZIUU
         7GNCM1uHuWEXJqnXMdv8hUa9e+RduWn5C9+YOpevrBjAN5JnfKWKDv3o3JduVTDXDKnZ
         +3eUdSIvyBPkbQrzopKIF9YfBZlVzNVwhzyf255IgZTT6tz1CZnLpHDbjvS93ZA0aRnR
         590906FF8BS0/gaES/+RAEjoL8kPinmoDKRrz2v/yCHdr5nFEIyrYRA96ONIjJL0bvly
         2MQNxCpkG/rK6aDGdIremxBEtzvH+eYSGHfDU+SJHwcczM//lp/5R4pQpwRPrFWaD7pN
         5nUA==
X-Gm-Message-State: AOJu0YxVeBgpj3m+WprEeKSLrscrYOib3EbJKzSa4q8Z9knosCJr+6ad
	iRBfKjnqHwS+WKlr/zRBz64bQP+/LO9KrZPHD+U=
X-Google-Smtp-Source: AGHT+IFkiup0JcjDXjAsP6uSKunaE1V0ltRGvElCs+ppu8dvZJA2XnpxaR6eaLL3RuA4+XBPrpIdQQ==
X-Received: by 2002:a0c:c207:0:b0:651:6349:fa7 with SMTP id l7-20020a0cc207000000b0065163490fa7mr6086299qvh.25.1696024156387;
        Fri, 29 Sep 2023 14:49:16 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m8-20020a0cf188000000b0065898a8977dsm5444036qvl.71.2023.09.29.14.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:49:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-boto3: add recipe for latest version of boto3
Date: Fri, 29 Sep 2023 21:49:03 +0000
Message-Id: <20230929214903.2144891-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929214903.2144891-1-derek@asterius.io>
References: <20230929214903.2144891-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105274

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-boto3_1.28.57.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb

diff --git a/meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb b/meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb
new file mode 100644
index 000000000..ad40fd0d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-boto3_1.28.57.bb
@@ -0,0 +1,16 @@
+HOMEPAGE = "https://github.com/boto/boto"
+SUMMARY = "Amazon Web Services API"
+DESCRIPTION = "\
+  Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for Python, \
+  which allows Python developers to write software that makes use of services like \
+  Amazon S3 and Amazon EC2. \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI[sha256sum] = "e2d2824ba6459b330d097e94039a9c4f96ae3f4bcdc731d620589ad79dcd16d3"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-botocore python3-urllib3 python3-unixadmin"
-- 
2.34.1


