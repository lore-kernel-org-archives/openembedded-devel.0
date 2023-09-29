Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08738E81815
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:49:19 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.30157.1696024156685326118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-65b2463d651so41930216d6.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024155; x=1696628955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK/bvmtW+s/4PksiuPiiJAJf84MQFsW9QsTUB8sw4VM=;
        b=KJdXeDEKSzx57apgq5f2g/46wNmFTW/y3vuA+5nK+64cx6Tu+vtKqObUBxL6/ENICp
         QOCdb0eAcUoKSRevvqKoYCs58czkHx9T60DMtHwE2xkRLGLfhaQJvESGXJuRHn6dr18a
         MFBH35ao7zIyw/yAPL2PWtX2i8cyx3ZIpIicImxIFuX/qb55fVLW0KgzttPo3IG6fv1G
         crInuNQqkY2WoxjC0FTTXUh8AY8DH+RFnGhrh42NDhd1PzdFSPdBc47kWMcqfuLz1DKR
         OHjEBJLEFNd9QJROh5iPAxAMvRPZ9Z+tZqM29hldSh+Ux5HDDv4avHdFokfgnV6PG1xi
         GcoQ==
X-Gm-Message-State: AOJu0YwgWyIHoRfKmsbTiVwRpMyL0ttcHCL4TZSZ4jYu++aCfF7eZctI
	J3kQ1s34tDjs6D4QnTpYX1qmOvF8g+VKS1SUlKc=
X-Google-Smtp-Source: AGHT+IHoyO0l/u1SMu6pXqzggOu1u8bXRj/Mg3KSu+HOJUN9cV4M3ce+3gctmW8GYkt3grZiwkRB8w==
X-Received: by 2002:a05:6214:500b:b0:65d:343:8e50 with SMTP id jo11-20020a056214500b00b0065d03438e50mr7667601qvb.3.1696024155017;
        Fri, 29 Sep 2023 14:49:15 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m8-20020a0cf188000000b0065898a8977dsm5444036qvl.71.2023.09.29.14.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:49:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/2] python3-botocore: add recipe for latest version of botocore
Date: Fri, 29 Sep 2023 21:49:02 +0000
Message-Id: <20230929214903.2144891-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105273

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-botocore_1.31.57.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb

diff --git a/meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb b/meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb
new file mode 100644
index 000000000..d0c3ff2d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-botocore_1.31.57.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A low-level interface to a growing number of Amazon Web Services."
+HOMEPAGE = "https://github.com/boto/botocore"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI[sha256sum] = "301436174635bec739b225b840fc365ca00e5c1a63e5b2a19ee679d204e01b78"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-jmespath python3-dateutil python3-logging"
-- 
2.34.1


