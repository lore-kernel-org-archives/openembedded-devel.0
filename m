Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC52E7F154
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:35:38 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.29895.1696023332650716429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77386822cfbso983606185a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696023331; x=1696628131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvTxVqJpYKL+Or/94HGGAv+DLd2GXPdQgWZnz4Zo1DA=;
        b=Mu/KO/9RIASG9zSe3YW/3ajc3ZWnL01exz+q2AAmKJbgTMVD9OmpHXtiW7ls0wmJRB
         hR6H3zg8pB7BxMMp/ehqgjOmpVbOisjwEsDcEF/x1KEH1X7k1iOVwFIbPnnKVolZFPOH
         ohAepuyulHlgdpYJqcgJzTOhlxdGh9Jz8TNhVVz+W6VRFfy4wF0fP1r/YO3XnfQjLDqJ
         fmZk8531F8UoX4lyvhITr6QlxRNJySHXlPOAL7VYtTXif5dUTHcmvF9o/8tTwElcHnLu
         1pe5tQlz7fj3aihRo9RHdROqUkv4KQZJo/OfYKMH0RVHawFVPykHL0UPmwaGhRioAzP/
         6pFg==
X-Gm-Message-State: AOJu0YwYDyTrC2++4HLPdYa07VkD1TqxMgVUJZOonjvZnJeaZ8gQwxxP
	WL34nvtPoz6GLIH7MQ3ca+ZOr3WMT+xDXfCi
X-Google-Smtp-Source: AGHT+IEtg/vOm+kvj31wlqC95rtpZVXlzS2Ry5XJYyg/BaMUVK2R1UkqNK8RpqmeBvt/IEvIrvcNZw==
X-Received: by 2002:a05:620a:44c9:b0:76c:572e:8de4 with SMTP id y9-20020a05620a44c900b0076c572e8de4mr6844119qkp.54.1696023331338;
        Fri, 29 Sep 2023 14:35:31 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id c4-20020a05620a134400b00773f008da40sm3222931qkl.125.2023.09.29.14.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:35:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-nacl: Add recipe for the latest release of PyNaCl
Date: Fri, 29 Sep 2023 21:35:21 +0000
Message-Id: <20230929213521.2140103-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105272

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-nacl_1.5.0.bb              | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
new file mode 100644
index 000000000..7d5292745
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
+HOMEPAGE = "https://github.com/pyca/pynacl"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
+
+PYPI_PACKAGE = "PyNaCl"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
+
+DEPENDS += "\
+    libsodium \
+    python3-cffi-native \
+    python3-pip-native \
+"
+
+RDEPENDS:${PN}:class-target += " \
+    python3-cffi \
+    python3-pycparser \
+"
+
+export SODIUM_INSTALL = "system"
+
+BBCLASSEXTEND = "native"
\ No newline at end of file
-- 
2.34.1


