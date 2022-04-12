Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365B1C54EC5
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.9402.1649761883091541246
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 04:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=rfNPUGre;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id 15so8789954ljw.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v76Sa4t+GgbGZ5jjV3lpZmaj5YYXa8f06PSmjoHLjqE=;
        b=rfNPUGrexouVMUzub6f3mb9vwp3itzXjmyKibFTDXOwQkrTCSdn+aFC5lz0mVjaddV
         fJrJea2oXp4AJkf+sHzoKiQS8XqQNfONimJdiB6R6dGLsxznxlXDGwwp0QytixhDJ189
         bihwcRDLz2SBts9IlfWhhDw643sL4ueITiW7jejh5OQTb9/j3MUx0JkpBv5cZG/Ockx7
         mwA4koBz4V/iwhR8CIRmrWTpE7rUlRJUOF7SqILP7g/E5jG5v5x3c2pfWKwW7xRRSN5k
         2h58mnonaCjo1cMxvJSYI+m591oLVbXBDfyluG1oN0Yrz0yhBweB3ti3WccdrDRjlC7K
         GRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v76Sa4t+GgbGZ5jjV3lpZmaj5YYXa8f06PSmjoHLjqE=;
        b=iBe27YLo5K9TlAf0tywPmaJyr2HkI1tXVhH3M/3yWucenG4Bq7kBlI6RXyA7SMwiQP
         EO1CHB6YUNeyewh73VHOk3P9LuuKl0YxTeKRuuJv2hBQ3+mlfeu/v4Z6l+Xpx0EzXarl
         kIF6J47owjw4youy9A2K4Vfs2/2TbMFM9pCWQzKmlpTToQ2tGnGnfEzuldoOdooekEER
         5euocEIZUK99KrnfMOjLooRKRzmAoD3AyH1KrhmnQLdlItb+SEQVfAu7YurS095C5WCK
         Z9mCJVdJKo668UqBNEw+EfFVqYragzIUmkOFa1acd+yEZZl75Go6HpYUEWy8xdNhhRik
         7VNw==
X-Gm-Message-State: AOAM531op1EYbNAl4nFfQEQ512nzGn6gqfEY8KevbRN5WRY1KevG92pF
	nefdNynPxgD8NVJOw9PeICM1oAJyIIBFIhzz8YU=
X-Google-Smtp-Source: 
 ABdhPJyYmBP3Au/mJ27F84kB1nUrJZ/Fer5nMyh51SJEsUKNFZ2OgA4ypYDMk1T1iTECoD6hZx99ng==
X-Received: by 2002:a2e:a907:0:b0:249:6747:d8ca with SMTP id
 j7-20020a2ea907000000b002496747d8camr23512590ljq.452.1649761880751;
        Tue, 12 Apr 2022 04:11:20 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 e15-20020a19500f000000b0046bb76678bcsm237743lfb.131.2022.04.12.04.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 04:11:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH v2] python3-imgtool: update to 1.9.0
Date: Tue, 12 Apr 2022 13:11:18 +0200
Message-Id: <20220412111118.4154046-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96584

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/python3-imgtool/cbor2.patch        | 67 -------------------
 ...tool_1.8.0.bb => python3-imgtool_1.9.0.bb} |  4 +-
 2 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-imgtool/cbor2.patch
 rename meta-python/recipes-devtools/python/{python3-imgtool_1.8.0.bb => python3-imgtool_1.9.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool/cbor2.patch b/meta-python/recipes-devtools/python/python3-imgtool/cbor2.patch
deleted file mode 100644
index 3e8c202bc..000000000
--- a/meta-python/recipes-devtools/python/python3-imgtool/cbor2.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Upstream-Status: Submitted [https://github.com/mcu-tools/mcuboot/pull/1190]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From f9c6f31b936d34df9a6551609cb16ed9c348be88 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 2 Nov 2021 11:12:04 +0000
-Subject: [PATCH] imgtool: prefer cbor2 over cbor
-
-The cbor module is unmaintained, with the last release in 2016[1]. The
-cbor2 module however is under active development and was last released
-just last month[2].
-
-As the APIs are identical, we can import cbor2 and if that fails fall
-back to cbor.
-
-[1] https://pypi.org/project/cbor/#history
-[2] https://pypi.org/project/cbor2/#history
-
-Closes #1189
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- scripts/imgtool.nix            | 2 +-
- scripts/imgtool/boot_record.py | 7 +++++--
- scripts/requirements.txt       | 2 +-
- scripts/setup.py               | 2 +-
- 4 files changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/scripts/imgtool/boot_record.py b/scripts/imgtool/boot_record.py
-index ac433aa..6f0045e 100644
---- a/scripts/imgtool/boot_record.py
-+++ b/scripts/imgtool/boot_record.py
-@@ -16,8 +16,11 @@
- # limitations under the License.
- 
- from enum import Enum
--import cbor
- 
-+try:
-+    from cbor2 import dumps
-+except ImportError:
-+    from cbor import dumps
- 
- class SwComponent(int, Enum):
-     """
-@@ -46,4 +49,4 @@ def create_sw_component_data(sw_type, sw_version, sw_measurement_description,
-     #       list because later it will be modified by the bootloader.
-     properties[SwComponent.MEASUREMENT_VALUE] = sw_measurement_value
- 
--    return cbor.dumps(properties)
-+    return dumps(properties)
-diff --git a/scripts/setup.py b/scripts/setup.py
-index a228ea3..692cfb7 100644
---- a/scripts/setup.py
-+++ b/scripts/setup.py
-@@ -17,7 +17,7 @@ setuptools.setup(
-         'cryptography>=2.4.2',
-         'intelhex>=2.2.1',
-         'click',
--        'cbor>=1.0.0',
-+        'cbor2',
-     ],
-     entry_points={
-         "console_scripts": ["imgtool=imgtool.main:imgtool"]
--- 
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
index c957fce3a..1e5efbe18 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
@@ -3,9 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57"
 
-SRC_URI += "file://cbor2.patch;striplevel=2"
-
-SRC_URI[sha256sum] = "4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb77ed96121f59b6e2f"
+SRC_URI[sha256sum] = "7fa7f6bd6bf069b5ffa07ea47478e16b6206bd2fc5b7607def999de0e9134a43"
 
 inherit pypi setuptools3
 
-- 
2.25.1


