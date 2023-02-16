Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED89FC6FA99
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.8793.1676550489501495585
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJOyjCOF;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id v17so1855214qto.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmkziysIAno7nDQTD67dT5bm9W8Gr/nJKgn563QiyZc=;
        b=gJOyjCOFq2U3Orj/onYUs3aMc33rUVr6WPQ5GhT+7oG/Vje76a+Phic1sxiUWZFh25
         Wn6/B0KRd/KrnR7tuJbVKZZVHZZbY5k6p2KfG5b+vGy6uqGGZg8a/hGDrUo4tgtriRKl
         V2OBBWnC6WAcXDKbE+uo4sTlUJ/ZwM7tj1a5yFZW4KRQjxpRxp5TtYHIVVUKLPO1VB/9
         tyDuRzy6azCZoJXaO5gR7+RWE67QnZlgEUMpOVXFTljKCmMl2gn+LQCckNfAox0caYeG
         wuTWxYPszmdk1yjUUmi0HN2eARHhy1eqyH3VhHTCU4Xdhtr9B5H6lW1R3gCY5H4T8lcg
         LLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmkziysIAno7nDQTD67dT5bm9W8Gr/nJKgn563QiyZc=;
        b=rvpaQfCVVjllK+fv1FYiRPnQD2DRBXECK7IchxaHeFsTvdmbOPHD0iFH38KH28Ov41
         8YMerhzhPMPIXN5+jTR/ZdHPAmYNv27Lg0vhhkmOCLJRjyjEO4z0rD+nd2VkufBDVFft
         cBm7ZZxo+ke80a9bDMfKQQTJIroJfTBa3SZUYp9cHgtTH1S2AssnKOuiwTu3bVA6CBzF
         VEsGOObEyNVTRJrUV5hJ4FqUxRHisk7UcMe+FmzMbVr5I0B8dfWVpyZfu7UDPYDe0AWD
         AC0QyW489GZ5QJ4RbC8/vr2tjq5A1GOjkDJzPqW5MLpTFBWKpL4PQyGMfeGw46IeSA/7
         Rduw==
X-Gm-Message-State: AO0yUKUodAbX6/Asi/iFdEV7PqGWGpFrNguJ9+qE8KUV06P4/eCXqkNo
	W1vCQuqphirFtNoMJhth4lnuW8BqjhI=
X-Google-Smtp-Source: AK7set8aGMNAHaCSsY1JMlsKSJ2XC/5hmhWufd4+RVKFWW3mqOpBwvnEjPSQa7wn2Eg0QTOQvUGTqw==
X-Received: by 2002:a05:622a:203:b0:3b9:a523:2bb5 with SMTP id b3-20020a05622a020300b003b9a5232bb5mr8822665qtx.14.1676550488416;
        Thu, 16 Feb 2023 04:28:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 12/15] phoronix-test-suite: fix CVE-2022-40704
Date: Thu, 16 Feb 2023 07:27:22 -0500
Message-Id: <97aa7a8d1283f98b9adb9055c7ccfbb18700a6b3.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101114

From: Joe Slater <joe.slater@windriver.com>

CVE fix added after latest release (10.8.4).

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 32a0ff55166ae67931d48825e669893718663040)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/CVE-2022-40704.patch                | 46 +++++++++++++++++++
 .../phoronix-test-suite_10.8.4.bb             |  5 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch b/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
new file mode 100644
index 0000000000..8b6405b4ad
--- /dev/null
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
@@ -0,0 +1,46 @@
+From d3880d9d3ba795138444da83f1153c3c3ac27640 Mon Sep 17 00:00:00 2001
+From: Michael Larabel <michael@phoronix.com>
+Date: Sat, 23 Jul 2022 07:32:43 -0500
+Subject: [PATCH] phoromatic: Explicitly check both $_GET abd $_POST in
+ phoromatic_quit_if_invalid_input_found()
+
+Fixes: https://github.com/phoronix-test-suite/phoronix-test-suite/issues/650#issuecomment-1193116678
+
+Upstream-Status: Backport
+CVE: CVE-2022-40704
+
+Reference to upstream patch:
+https://github.com/phoronix-test-suite/phoronix-test-suite/commit/d3880d9d3ba795138444da83f1153c3c3ac27640
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ pts-core/phoromatic/phoromatic_functions.php | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/pts-core/phoromatic/phoromatic_functions.php b/pts-core/phoromatic/phoromatic_functions.php
+index 74ccc5444c..c2313dcdea 100644
+--- a/pts-core/phoromatic/phoromatic_functions.php
++++ b/pts-core/phoromatic/phoromatic_functions.php
+@@ -37,9 +37,20 @@ function phoromatic_quit_if_invalid_input_found($input_keys = null)
+ 	{
+ 		foreach($input_keys as $key)
+ 		{
+-			if(isset($_REQUEST[$key]) && !empty($_REQUEST[$key]))
++			if(isset($_GET[$key]) && !empty($_GET[$key]))
+ 			{
+-				foreach(pts_arrays::to_array($_REQUEST[$key]) as $val_to_check)
++				foreach(pts_arrays::to_array($_GET[$key]) as $val_to_check)
++				{
++					if(stripos($val_to_check, $invalid_string) !== false)
++					{
++						echo '<strong>Exited due to invalid input ( ' . $invalid_string . ') attempted:</strong> ' . htmlspecialchars($val_to_check);
++						exit;
++					}
++				}
++			}
++			if(isset($_POST[$key]) && !empty($_POST[$key]))
++			{
++				foreach(pts_arrays::to_array($_POST[$key]) as $val_to_check)
+ 				{
+ 					if(stripos($val_to_check, $invalid_string) !== false)
+ 					{
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
index be9756d9a7..8de3314b3c 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
@@ -5,7 +5,10 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
-SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
+SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz \
+           file://CVE-2022-40704.patch \
+          "
+
 SRC_URI[sha256sum] = "1f2092d536c0a3193efc53e4a50f3cee65c0ef1a78d31e5404f1c663fff7b7f4"
 
 S = "${WORKDIR}/phoronix-test-suite"
-- 
2.25.1


