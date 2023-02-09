Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338D0C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 07:25:30 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.8715.1675927520445265894
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 23:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KTR/m6fo;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so1442199pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 23:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gpOMyy3UZD8POVWWN9wC2RspvBPZPD7f5IaX98k49Q=;
        b=KTR/m6fo/5zda4su4pmAb3ZDUQ4is1TSdKCH5Si891bZaIaX5xekvQTt5myMwxYc5Z
         2sc/iAPNLAs91tvxieTAlYL/cj9NJ66pUGRRbtB+HbTPCZum14Cp1T4G8WRMym4POqe7
         x92CJ5mtee8e9EAy+I77wgUWpjbThPf0jkZ52kNnO86Olt2T3PrRMPUqeQGyoqAMfE0R
         GzHvZff4rLHzq00iueW2eWCD8Ld/tjTCHW48XpEjtS7gi0+r5zS6FnMYQ53tY6rO5rBO
         rwbhm1/x9P8UMljOsWcgojvYQbOPPGSqWNzdUW7XmsrQk/dTARA3oNMB/jTi1noMBPSX
         KUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gpOMyy3UZD8POVWWN9wC2RspvBPZPD7f5IaX98k49Q=;
        b=1T/ZLSefF/FmMaiAM0ylTiNSb/qAbxi4rwUqlS0EXHQw/drlsv0IRo3+q/NVehVZ4R
         g42PB1DfjpYct2d/80Jzs4tlYq3U2R8LgaDDvxmxbiIUcwvOiBBzJTZ1gZQQAW1ma3Ur
         6PbnTu80klszlCUBodhIxAAdZ0MaJ/c5PEFghU5279FJWn5K1BCXruK4HvA6TejPhmdf
         tgzKuo9XJLLC276Q7sYWZGUyWLfVrVOvgJgmJH0i4sp2xSSlW7nxE3tDJi27SpJMsI9R
         1FaOOr1/UOEc3yUalc+dCWM0YQ8wWwZXzoF4EW2Vy07HofIxK72DRbzZLw88GyYIBj0N
         28PA==
X-Gm-Message-State: AO0yUKXO8yvFufoWtpTXQKIfeKkfKsccLOmTpq1bvvqitSfKAWKyOBj/
	4A7uHm+BhEPIL0pHJIXv92zzgtiqA5o=
X-Google-Smtp-Source: AK7set8LxZrpEDLMAbwXUbhumxfUFyRuTFskaGg6Tu/Ns4LEp0pYbrwry3YMH7lPuDB3fUbyAUPspw==
X-Received: by 2002:a17:902:b902:b0:199:12d5:5b97 with SMTP id bf2-20020a170902b90200b0019912d55b97mr3904951plb.12.1675927519258;
        Wed, 08 Feb 2023 23:25:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b00198f36a8941sm681387plk.221.2023.02.08.23.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 23:25:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-cson: Make PEP440 compatible version scheme
Date: Wed,  8 Feb 2023 23:25:16 -0800
Message-Id: <20230209072516.2463104-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 07:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101006

- Update to latest tip of trunk
- Fix build with latest setuptools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...poke-at-git-describe-to-find-version.patch | 40 +++++++++++++++++++
 .../python-cson/python3-cson_git.bb           | 10 ++++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-extended/python-cson/python3-cson/0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch

diff --git a/meta-python/recipes-extended/python-cson/python3-cson/0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch b/meta-python/recipes-extended/python-cson/python3-cson/0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch
new file mode 100644
index 0000000000..dc3f8657ec
--- /dev/null
+++ b/meta-python/recipes-extended/python-cson/python3-cson/0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch
@@ -0,0 +1,40 @@
+From 0d0ffab004306b1379f247016200ade381d1d181 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Feb 2023 23:03:47 -0800
+Subject: [PATCH] setup.py: Do not poke at git describe to find version
+
+OE uses git snapshot and git describe --tags will emit a string which is
+not PEP440 compliant version scheme. setuptools 67+ is strict about it
+and fails to build. Therefore inject a static version.py from OE
+environment and use that for version number based on PV
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index a77138f..df675cd 100644
+--- a/setup.py
++++ b/setup.py
+@@ -28,14 +28,8 @@ def main():
+    # Also, when git is not available (PyPi package), use stored version.py.
+    version_py = os.path.join(os.path.dirname(__file__), 'version.py')
+ 
+-   try:
+-      if sys.version_info < (2, 7) or (3,) <= sys.version_info < (3, 2):
+-         version_git = subprocess.Popen(['ls', '-l'], stdout=subprocess.PIPE).communicate()[0]
+-      else:
+-         version_git = subprocess.check_output(["git", "describe", "--tags"]).rstrip()
+-   except:
+-      with open(version_py, 'r') as fh:
+-         version_git = open(version_py).read().strip().split('=')[-1].replace('"','')
++   with open(version_py, 'r') as fh:
++      version_git = open(version_py).read().strip().split('=')[-1].replace('"','')
+ 
+    version_msg = "# Do not edit this file, pipeline versioning is governed by git tags"
+    with open(version_py, 'w') as fh:
+-- 
+2.39.1
+
diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index c4fcc61ec0..f9b4b64a50 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -7,8 +7,10 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7709d2635e63ab96973055a23c2a4cac"
 
-SRCREV = "f3f2898c44bb16b951d3e9f2fbf6d1c4158edda2"
-SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https"
+PV = "1.0.9+1.0.10"
+SRCREV = "69090778bccc5ed124342ba288597fbb2bfa9f39"
+SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https \
+           file://0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch"
 
 S = "${WORKDIR}/git"
 
@@ -19,5 +21,9 @@ inherit setuptools3
 
 PIP_INSTALL_PACKAGE = "python_cson"
 
+do_configure:prepend() {
+    echo "__version__=${PV}" > ${S}/version.py
+}
+
 BBCLASSEXTEND = "native"
 
-- 
2.39.1


