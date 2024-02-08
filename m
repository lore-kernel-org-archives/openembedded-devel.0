Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C78C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 12:01:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.16136.1707393657829625330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 04:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bv2rOaFs;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so2090247a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707393656; x=1707998456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L57MJhtJeyqyoNiSiT9/iwOVJnhEMkcbkpqN9/gwI0I=;
        b=bv2rOaFse+VMEoaFXGnKSWZmX/C9BZkAIoJ+2ldHR0wULi7GcG2YUMA4c/E1FLG6Ma
         8HJrWitWReb0rKr3ZMPEkIdEBBxE6kML1hz+4pIWP5ssnfKhI0l9pwXF/iKRMuQmCdNA
         OPJ2I+j5PzQzpQZVeIhgzCspa9E7xUTO/8NVNCxCNpPQ3GrfmZs4e0xs0H+EShxFtJlO
         5QJZ5KsDlWhEcqY1y2VJOSyljmlYvr9d0qXI5msLA7ylOUgykD6IN4KvPp3EcpTWpBfX
         CPd6gslE6lIAmFOassIox7cs71pkfjOXbp9sG6/1blpgqDMmjSBBakYOkyyhwHoAbM4j
         LoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707393656; x=1707998456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L57MJhtJeyqyoNiSiT9/iwOVJnhEMkcbkpqN9/gwI0I=;
        b=FtGw5wNZ8rqhMAt9dtvQR2/eHYGIrCQsm1/myJTTbkIk04OfiX/0FyEXVXC2eSCGF2
         i4m3MxjXbCfZMp4/fb687Te6GR8OLnDgYLamsY1j/AUzPy4r9Bf80kJXjps1/T1LZbst
         ZsjB01jAqhl0FQcg8s+1xfqzElbd9Ua8bpM4xrm3ptvk2cY5NxygZFqey8SWnT9MwF1P
         +uLk2tcs9pV4mVvtqQtd7DPLrkdUmnZ2Clwr6d8ShL40thWK3HGVMwSOGP6JKraaiLkn
         iGn5fyQplkDEVskQGsC5h3z/Y3dsczhOr0+ZlCuJoH7/RbDudHmzdVTrqkYhsdm6mxEo
         64LQ==
X-Gm-Message-State: AOJu0YwgxPkjUMliCZ/jfKR8RaLNAlAzMR48KQ2uRhCKfVJdjSTcZaJo
	ZTpTAPWv16meEAlhIiNKclHf9FmUFLHqpwfY0wug7H3cYh/iFyyzmM0uSA2lon4=
X-Google-Smtp-Source: AGHT+IG4t+qesYDMNd0kWGI93jD6GimJ2ikWM5EBuDGWQn+j30oujAoamxi0xjko/Q7sXq2NItAy2w==
X-Received: by 2002:a17:906:3498:b0:a38:25f0:aa35 with SMTP id g24-20020a170906349800b00a3825f0aa35mr6243912ejb.41.1707393655376;
        Thu, 08 Feb 2024 04:00:55 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id ps4-20020a170906bf4400b00a3bbf724978sm132584ejb.220.2024.02.08.04.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:00:54 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2] python3-strenum: add recipe
Date: Thu,  8 Feb 2024 15:00:45 +0300
Message-Id: <20240208120045.2004323-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 12:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108664

StrEnum is a Python enum.Enum that inherits from str to complement enum.IntEnum in the standard library

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...ioneer-for-python-3.12-compatibility.patch | 37 +++++++++++++++++++
 .../python/python3-strenum_0.4.15.bb          | 14 +++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb

diff --git a/meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch b/meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch
new file mode 100644
index 000000000..cdf3f1acb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-strenum/0001-patch-versioneer-for-python-3.12-compatibility.patch
@@ -0,0 +1,37 @@
+From 3a71c9bc3747201e5bebe0e80b98ac6219209875 Mon Sep 17 00:00:00 2001
+From: alperak <alperyasinak1@gmail.com>
+Date: Thu, 8 Feb 2024 14:09:32 +0300
+Subject: [PATCH] Patch versioneer for Python 3.12 compatibility
+
+AttributeError: 'ConfigParser' object has no attribute 'readfp'. Did you mean: 'read'?
+AttributeError: module 'configparser' has no attribute 'SafeConfigParser'. Did you mean: 'RawConfigParser'?
+
+readfp and SafeConfigParser has been deprecated since Python 3.2 and removed in Python 3.12 (due October 2023). Use read_file and ConfigParser instead.
+
+https://docs.python.org/3/whatsnew/3.12.html#configparser
+
+Upstream-Status: Submitted [https://github.com/irgeek/StrEnum/pull/34]
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ versioneer.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/versioneer.py b/versioneer.py
+index 64fea1c..3aa5da3 100644
+--- a/versioneer.py
++++ b/versioneer.py
+@@ -339,9 +339,9 @@ def get_config_from_root(root):
+     # configparser.NoOptionError (if it lacks "VCS="). See the docstring at
+     # the top of versioneer.py for instructions on writing your setup.cfg .
+     setup_cfg = os.path.join(root, "setup.cfg")
+-    parser = configparser.SafeConfigParser()
++    parser = configparser.ConfigParser()
+     with open(setup_cfg, "r") as f:
+-        parser.readfp(f)
++        parser.read_file(f)
+     VCS = parser.get("versioneer", "VCS")  # mandatory
+
+     def get(parser, name):
+--
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
new file mode 100644
index 000000000..aa85189ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
@@ -0,0 +1,14 @@
+SUMMARY = "An Enum that inherits from str"
+HOMEPAGE = "https://github.com/irgeek/StrEnum"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba0eb3de1df70bde0ed48488cfd81269"
+
+SRC_URI += "file://0001-patch-versioneer-for-python-3.12-compatibility.patch"
+
+DEPENDS = "${PYTHON_PN}-pytest-runner-native"
+
+SRC_URI[sha256sum] = "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeacf3bcd80875c82eff"
+
+PYPI_PACKAGE = "StrEnum"
+
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


