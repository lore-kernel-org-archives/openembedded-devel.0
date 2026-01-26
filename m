Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBEBCF65EC
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:25:06 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18346.1769430301372854016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OE89uVG3;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b883787268fso674691166b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 04:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430300; x=1770035100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=elgVv8eNZ2rJYoPEHgIFDSkj3L4Gtq8eBCAARWvVpsk=;
        b=OE89uVG3K+pVhGCys0UuEM399xKAV5QsRAmOAY0IiUVk2MP3av8eTdl7lGJaL2tkm8
         j8bZWglOjTwBsUqdrTXoVvB+84DCHhnmrt0PTCr7EfS23D+GOY83749GUyk0Zq2QayYz
         UfacuI2WzHO2RfOWp71DZePcjeo6UHmR7xWBNx1SMCVsk0I7v5mMmSruWtdTEj9WN4Qp
         Ta5v/l/K5woEZYcqozhf33DgX45Tk4XVwp4XYEDtsCSTfRywluFvq2fu0qrYIguMqYDG
         kmBhjPvUOp9a7p+wdDWwUREUkn4ASjiPII6MgamV18NYGg8CS8V1mDtGweZjmrFIfyYE
         bECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430300; x=1770035100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elgVv8eNZ2rJYoPEHgIFDSkj3L4Gtq8eBCAARWvVpsk=;
        b=orxkjS5lTYPbuWfMvvwQDB1Nj7GifnZ5ne2sQcFaGfTX5bhYkTBM7mD7dGYFOp+Q4T
         T/ar9eayRUSFGa+OVXHo5Oy+w0GNj1CTpw4xWSWefCEzCsUlNMnGiqF4XPZ3U3mRaGrm
         NLc3DXIG0DdzTpn2Y955gE4AhBANZpfsmNl3ozrYK/1wI9uHJXO+E1hQLDaVtTmQcr6/
         FPwGywQvOsm/lEGcMMAFCl/BKY3e7NmjETeFgxfFRTm4g48SwwlvkfIBHMpV/Xj0ZhB2
         PzQ3SZnsVs86hbGsfqMKrw3wcfbQVtQJnGk+JW1ZdgIJKS12pO6x01MPoi9Eo9eZVJiy
         RzQA==
X-Gm-Message-State: AOJu0YytHONIPqqa3/NgmuwgOLSI86d5lgeAcl7Bn3NRADlaxuycAWuX
	uhEYmi4vcSHfdMcOHXpCKuM3OKBUAAp7H+Xl/pwEtqThaiF4BbuHzc6uy5oPvw7b
X-Gm-Gg: AZuq6aLG6AV7ZGUg/esSu7T+NDFIledobWmt33Bq+8CURZrMekmfqeiKw5aiS7UV/c1
	85fgG/EKPudoQWP93XvYzJFYO+e6tsXK2DePm24mVhjVWCAnZv79y7yAycnfkyNNeXXSy4BrLJE
	U9bbEemvMxlWU5+jqraCG58emY2hY58S0yVcCb/O4h3VgYEimNIw0ySv46yNWh20BvTDz3VEKSW
	Xowvbxa2m6G8qUYdHf046g47A/d4LJoQJSMQOMISv1yQToVJddzwGi40N4mb99OXE5PLa6gA/O6
	vh6d6jFWYcMrk0WeiNq7phW2d/VJL1DHMjFF+x8orQuMUabG0xmtD1EJe+QEhdZ61gyjbsaKZJc
	Qo5cpeI8JoZv5+3kVCDeyhDJXGm2R0+YOcPpWOem3tHU8QP639fdDCqabBVLwHEK8y/tBspSGWX
	tyXjdJQ/nA+VhEQz50fGhvQdGLBFfqWOpqfHYcpzHRzSifVsTLmpMVf7TvaZMnsU1S
X-Received: by 2002:a17:907:3c87:b0:b8a:f29e:307a with SMTP id a640c23a62f3a-b8d2e8a9a7bmr290933166b.57.1769430299463;
        Mon, 26 Jan 2026 04:24:59 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b75d65esm645403766b.49.2026.01.26.04.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:24:59 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-python][PATCH v1] python-iam-rolesanywhere-session: Add recipe at 2.3.0
Date: Mon, 26 Jan 2026 13:24:33 +0100
Message-ID: <20260126122432.1312490-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123876

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../0001-fix-remove-license-classifier.patch  | 23 +++++++++++++++++++
 ...python3-iam-rolesanywhere-session_2.3.0.bb | 12 ++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch
 create mode 100644 meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session_2.3.0.bb

diff --git a/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch
new file mode 100644
index 0000000000..8c61650963
--- /dev/null
+++ b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch
@@ -0,0 +1,23 @@
+From bee363b93f0ddd305b71e1fa1d3dca6ea44c8f80 Mon Sep 17 00:00:00 2001
+From: Frede Braendstrup <frederikbraendstrup@gmail.com>
+Date: Fri, 17 Oct 2025 15:55:07 +0200
+Subject: [PATCH] fix: remove license classifier
+
+Upstream-Status: Submitted https://github.com/awslabs/iam-roles-anywhere-session/pull/22
+Signed-off-by: Frede Braendstrup <frederikbraendstrup@gmail.com>
+---
+ pyproject.toml                                     | 1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index c001045..cd83a8f 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -20,7 +20,6 @@ requires-python = ">=3.8"
+ 
+ classifiers = [
+     "Development Status :: 4 - Beta",
+-    "License :: OSI Approved :: Apache Software License",
+     "Programming Language :: Python :: 3",
+ ]
+ 
diff --git a/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session_2.3.0.bb b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session_2.3.0.bb
new file mode 100644
index 0000000000..c27c9b4ec8
--- /dev/null
+++ b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-iam-rolesanywhere-session_2.3.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Boto3 session creator for IAM Roles Anywhere"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+DEPENDS = "python3-setuptools-scm-native"
+SRC_URI += "file://0001-fix-remove-license-classifier.patch"
+SRC_URI[sha256sum] = "718a7cb43c191f2801467a53405b829ce878ac58b3cb8868caa5782ecc3f20e5"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "iam_rolesanywhere_session"
+RDEPENDS:${PN} = "python3-boto3 python3-botocore python3-cryptography"
-- 
2.52.0


