Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C577C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 09:27:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.25832.1744536468126893963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 02:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mre10pTb;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso4255026f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744536466; x=1745141266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEBh/LBakTv0r2mrdTqg9UWVbgpu7k+nYx1uxqoqAvg=;
        b=Mre10pTbt3zaEjsPH5bPW2O5cSSQeBRqHYbeNpqDImfoA2EeDOGxyipYgNuHzqJjZ1
         jfoRwUax3tt4vU4P9YNooHB5IRAhFGdu1hjDm1/iD9CreXch19uEp5ZHzm5Dm5An/rQf
         D9ieFn616GabrAt5nPf/Z7+0jp1KwFUjjCgDWQgciRwVu7jE3qbJylFzbK/ToW6b4hlk
         OZ/PZcupwIhnOIJw5rjUN4eP/5kaj5bacjqqCUOMAeJvYxbMDyh6LkeCod7ZvK6zgmjf
         pIBfcZNxXeYRenehCWDKZEyQDzS3tb+T9uVA4A6b9LHuysAcn6RMJpqieH5sqjdzEfRR
         aeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744536466; x=1745141266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEBh/LBakTv0r2mrdTqg9UWVbgpu7k+nYx1uxqoqAvg=;
        b=eVmBn3kiFBs6l2QT6o2ba3sgl+qW8v0v5gknqZxqcVFj2aTb8aGYykqpLmVYqJxa8D
         3UqgnGamMlvKB/lfs+tUoQYjE9/7dsFf9tjsKHg8l5yDtBfje9C8WZu3aeAfazpuLLop
         jpVyjoNeP50Ck4zfvWF9apVIPytHPo7KZtN/UI+fDVy7IG5jgdYRDih6JrZfzEiPN4er
         /bcmeWv1/1v9H61FMpMMAhRD+TM1RNNFtKVw9hRr+I6ALWngmDCWJCDRupKoELoMpM5r
         KXuDum11fNXAMXVCDRAq+7WMWRxwi/otJoewReIuY/2Ykg4DfhZFqzHO0NgHKZjqign4
         +jwg==
X-Gm-Message-State: AOJu0YxgPlivB0FsVZ0f1XRdwJ7dSVTU2vLQvwBu587P4HTOeC48l0Kg
	JAckotEfwYN+MO0TECvA51S5MX9vnU0BA+cfp6cFVslfy0KHZH4o4VzoDA==
X-Gm-Gg: ASbGncvMdwbcM+ALi3wWDnyzU/hpr9h4opL8acxsXZBiAeU0ISnmNJlHbPgjCBW/d4E
	KaZME7tdXTXAirVnNcfI5zXcEfLJd4VgEwXn9C0R6gy3Ql1qYDTEqQfGPq9hIM7SZ2X4DFqLHQU
	Rl0jk1/QArgZYzSNUE1dQZcX3I0Zf+qCNBofRiDtCcVzYu6qDtJ4WhFX+EPR7nh5QF7w/K2U3WJ
	E5sbKGcrm/E48y7X1fbnB7EX3rBTWkXQ412WRwOQBa3gLBxsyej7wcbEVq9L31j8PoLpcSSAVMN
	CqM+wuRJpKNQRLG5arNe8MigESayfRC4wOO6tIobuCkLQZeGbt+jfzU2s4GIsdLwtj+CdZq/Ihq
	aTwSaE7uMpD3B5u4g4H4u/4E2gvH11l4pNLVZhJTGUBiYA0pPOEMiWOALEQ==
X-Google-Smtp-Source: AGHT+IFFe9xRDnow4Sj6KWEnIM4FikKSowgVdtEEedPse8qDMmq4QkDxku7lQJcrIHSiC9nvUuWLwQ==
X-Received: by 2002:a5d:5f52:0:b0:39c:12ce:67d with SMTP id ffacd0b85a97d-39ea51d0fd7mr7049269f8f.9.1744536466147;
        Sun, 13 Apr 2025 02:27:46 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d6ebsm144294585e9.2.2025.04.13.02.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 02:27:45 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-markdown-it-py: new recipe version 3.0.0
Date: Sun, 13 Apr 2025 11:27:40 +0200
Message-Id: <20250413092740.802883-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 09:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116828

Python port of markdown-it. Markdown parsing, done right!

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-markdown-it-py_3.0.0.bb         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb b/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
new file mode 100644
index 0000000000..5ba4fc88b7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python port of markdown-it. Markdown parsing, done right!"
+HOMEPAGE = "https://github.com/executablebooks/markdown-it-py"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
+
+SRC_URI[sha256sum] = "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += "python3-mdurl"
+
+PYPI_PACKAGE = "markdown-it-py"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


