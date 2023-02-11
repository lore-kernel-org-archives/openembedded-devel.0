Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B2AC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:16 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.13402.1676135166825713635
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 09:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLLmkBgN;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id bi19so7055459oib.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmkziysIAno7nDQTD67dT5bm9W8Gr/nJKgn563QiyZc=;
        b=jLLmkBgN7b9eYUuR5zUrdgp/bg5MNpR1aixJe18XFCPE13RXusrdIVIK9Fj7o92nSB
         GeIAUrQNFBdrE7DuhgQXsg8B9puAHrjRQB3KktfxmcXvpnOPX7o/HtMYo3Lm1VWM80Vk
         gin07Q7i1o5wtHWE02g6guMKHTxM+2sfni92pAHLCBIlqwMXXRFHuMQUWXJNdp5vDPGq
         Lqc7UNYfgwO+qMyW3ShSOhcNgPLSHF4Sv3va1qPdCKLosSLvnsGOEMN4EgAeThdUEU6j
         /kFTJpImvhp5IsizDYh32qDd3n241qxxaBzPTh/iEXtIvHNcp/msS2UM5C7GadPCnRfP
         N3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmkziysIAno7nDQTD67dT5bm9W8Gr/nJKgn563QiyZc=;
        b=x6osz/uEucSsjoE3C+deiuwa4sZzUzHc0XHKWv+V3ZOzg1+UpeFiSrjNzplG4d+jd9
         E6Ez1h/h7aDwdjYSS/GLWy0idZvaL2OkRPVxMFmP57D/3OORKI4jb34VgpjU8SEa8eir
         l1tVjZ3VJ2e9MvITu67v2mBkPHq50K8Qv2rdapjyBQx66CEN6m2FeAMpmkQkU+K3Ct7v
         pci7vuX4Of++/LMR/MQeL5Gr3LBY6e7UNmNPL1wPScYMdxr6gD1FRRsUrd5JXBgfhRyd
         qTsvsUh9+GomWOVSke94+0TQK4xVW6kjxapO65kFmtITwXfkz76eeEQQY5qGL4bJqxSo
         1Jkg==
X-Gm-Message-State: AO0yUKVn0he0AeEnW2G4SKRGWMoMypPDLi9PZtl32tGJAnjc5GhWCy41
	y2Tzt7APs/MQn4JZswVYqgmGzN6/sT0=
X-Google-Smtp-Source: AK7set/te2p4q/rh41X+JfUlSNYVzuoUAQ/ER4m8RXuJUn2fju5vDX0Sz2wAvmkCZ/SZnRTXTA5cdA==
X-Received: by 2002:aca:1217:0:b0:37b:4f74:d3c7 with SMTP id 23-20020aca1217000000b0037b4f74d3c7mr8608615ois.37.1676135169277;
        Sat, 11 Feb 2023 09:06:09 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p203-20020aca5bd4000000b0037d8670526esm275932oib.52.2023.02.11.09.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:06:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joe Slater <joe.slater@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 5/6] phoronix-test-suite: fix CVE-2022-40704
Date: Sat, 11 Feb 2023 12:06:00 -0500
Message-Id: <20230211170601.3988339-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211170601.3988339-1-akuster808@gmail.com>
References: <20230211170601.3988339-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 17:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101040

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


