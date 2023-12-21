Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B05C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:52:40 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.2053.1703184756388632882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35fcd6f8aa6so3983625ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184755; x=1703789555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYZfbvmk/vCfDxQVTeerR4O1vUqk+FTRkhce2I9oJEg=;
        b=YrC6aqhnl2nbm1YdatqA8Y7usl72tcyJ0qZazK9lblSblQGDTeiF6pdXBHDP44A+FO
         EXfnI442TasryL/DDbYxtkHyLFq2OZphqCZ+HsO/ePHjyN1HxmLDPjFxXV+qVyP0PfvL
         I9NgH9QSxskrsaCHt131mvWo4uJu7i3PaqP3hlOfktu7gcVerj9j5zUsrRZYmkpfu3Wg
         ss23CUn7UTOoktOaWrd0oNfDVSvjIAg6NHqssTUUDg/tD0nyp3Uh8YPFYTI5SkR/sP5W
         fXlnSwJ9PHjZC5IcwihCxC6UbWRsSquIsUrr77wFjwCK5ruoZuqSd3A/tU6m77lRClaj
         56JA==
X-Gm-Message-State: AOJu0Yyfa4BZs7DkcTcV+y6+2E0RDtxrMIJzwzeCmvqle+xdbIfCFnAH
	Ro+FKyLZ07dVpfMwCU8oUZpAMHlzpaS5Gg==
X-Google-Smtp-Source: AGHT+IFJkE/7riOoxjcWI+Aq/sOt/W7mKOYoQUZx8UKrFXMTDIEzVmDYwztsOSC5e6C5XxDYqdZE2Q==
X-Received: by 2002:a05:6e02:164f:b0:35f:d990:1419 with SMTP id v15-20020a056e02164f00b0035fd9901419mr100110ilu.39.1703184754813;
        Thu, 21 Dec 2023 10:52:34 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ba13-20020a0566383a8d00b0046923a214efsm622600jab.22.2023.12.21.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:52:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-setuptools-scm-git-archive: remove obsolete package
Date: Thu, 21 Dec 2023 18:52:26 +0000
Message-Id: <20231221185226.3929207-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221185226.3929207-1-derek@asterius.io>
References: <20231221185226.3929207-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107735

Upstream project is obsolete with setuptools_scm >= 7.0 which natively supports git archives

See upstream repo for details - https://github.com/Changaco/setuptools_scm_git_archive/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../packagegroups/packagegroup-meta-python.bb    |  1 -
 .../python/python3-ansi2html_1.9.1.bb            |  1 -
 .../python3-setuptools-scm-git-archive_1.1.bb    | 16 ----------------
 3 files changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index a8b4532c3..7b7d7bee9 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -391,7 +391,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-serpent \
     python3-service-identity \
     python3-setuptools-declarative-requirements \
-    python3-setuptools-scm-git-archive \
     python3-sh \
     python3-sijax \
     python3-simpleeval \
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
index 82b8ef37e..e419fdcf1 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
@@ -11,7 +11,6 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
 	${PYTHON_PN}-setuptools-scm-native \
-	${PYTHON_PN}-setuptools-scm-git-archive-native \
 "
 
 RDEPENDS:${PN} = " \
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
deleted file mode 100644
index 2068871d9..000000000
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "setuptools_scm plugin for git archives"
-HOMEPAGE = "https://pypi.org/project/setuptools-scm-git-archive/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
-
-SRC_URI[sha256sum] = "6026f61089b73fa1b5ee737e95314f41cb512609b393530385ed281d0b46c062"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "setuptools_scm_git_archive"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/7e/2c/0c15b29a1b5940250bfdc4a4f53272e35cd7cf8a34159291b6b4ec9eb291/${PYPI_ARCHIVE_NAME}"
-
-DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-setuptools-scm"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


