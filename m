Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB245C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 12:39:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.57821.1717331948570759737
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 05:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BWz1h63z;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35dc36b107fso2538733f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717331947; x=1717936747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0i0fbtOwwY3W62nUwXolFofcI4Hh4Org2+CAGSi6LiM=;
        b=BWz1h63zE7ilNLjtb9FrA5i4zPo8LKRXODV+cZgF4qW5rGyRA8X72paGU5W/f3qcFv
         hX0IJ4FIJAuJLAmus3bew4SKKeOYH5JLCtLbLyESSHMRztkaHWuuKu4cm16AcpLacoSl
         nqFRhzTAcNCMgLqiKmVOWsWdz/ioL9dh/j8FQKqysU0uTUVDEJFocm8IxtsgJXSlyups
         mwSChconBEX1AZ2k+3RrPwBHD8hwHYIIfEKWriPuvqciQfBnoWzWip7cGFTde9olFRJs
         IKnh9FU0N54lxS+WEGXvcF31B5vl9Ss1mzqTMTLgVt1trVqrpAk2rEt5O5RygzbkbbuC
         LyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717331947; x=1717936747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0i0fbtOwwY3W62nUwXolFofcI4Hh4Org2+CAGSi6LiM=;
        b=JuD2PmJrfCg7LKAnKZIMa7jToIUbJhXghhFpoznYV2NyEXj7KB9R5mnLEPFvbUIW99
         Nrhxq8tdhgwckYDZcrAudrp5ed1tao/pzI3vAFcadNb9g55LvXFbHeh/hMKtT7dRyio7
         0slZWsXCwDChjubE0/rDc3mXmvM+V0hDqHzyB3UabphjJmFlCudKuIeeDONVy5iWHR2M
         MEGDFdVArKOygN1C1CXqmkc5iy4yy7zR55Wp1yCBzBKd2ZMRT4BRhQzQCiylNVqU3gjU
         0DUd9dbLXXPaApY5agLeF1NixOuM7F+BsCqYL+Ifi5kfcX2GZLaM2xV9WS6fy82nw8lh
         +XJQ==
X-Gm-Message-State: AOJu0Yy6dhSXoU4bY7makMpmcOG7qSCiffV42gCOtO5lbPs21T8+RIMw
	U1TNFrf9h1xqjISZxHRQ5IMAeMEiZ89a4eFEquVN0Q6zy4/NABPYAt6gJg==
X-Google-Smtp-Source: AGHT+IGiTor+02cIcc/BnXKkkq4NIKAGRD04TZV3jXvogDSOrgJ8T1rOF0MH6OScPy8Psstkmi/IPQ==
X-Received: by 2002:adf:ce91:0:b0:355:161:b7e3 with SMTP id ffacd0b85a97d-35e0f316a57mr4546246f8f.48.1717331946509;
        Sun, 02 Jun 2024 05:39:06 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c9d26sm6075576f8f.25.2024.06.02.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:39:06 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-typer: add new recipe
Date: Sun,  2 Jun 2024 14:36:59 +0200
Message-Id: <20240602123659.254606-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 12:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110661

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-typer_0.12.3.bb            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-typer_0.12.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb b/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
new file mode 100644
index 000000000..a4b45f367
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Typer, build great CLIs. Easy to code. Based on Python type hints."
+DESCRIPTION = "\
+    Typer is a library for building CLI applications that users will love using and developers will love creating. Based on Python type hints. \
+    It's also a command line tool to run scripts, automatically converting them to CLI applications. \
+"
+HOMEPAGE = "https://github.com/tiangolo/typer"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
+
+SRC_URI[sha256sum] = "49e73131481d804288ef62598d97a1ceef3058905aa536a1134f90891ba35482"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "\
+        python3-pdm-backend-native \
+        python3-pdm-native \
+"
+
+PYPI_PACKAGE = "typer"
+
+RDEPENDS:${PN} += "\
+    python3-click \
+"
-- 
2.39.2


