Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA2DC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 09:52:26 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35675.1789638743633024542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 02:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SzLMTE6B;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: rsangam@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso759955a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789638743; x=1790243543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2i1LhWiRsCyRghUjsPJXH6lvfbpdBZMD22+LHpF8mg=;
        b=SzLMTE6B4QFWg5votyEbLYxEPqm7dlr0Aw0JCnTgRYuNiH7/EnH6kypjaNKKljqoKK
         4F1pi5wLYE+wrtSGRDRVI9yG19es+IJUynh5wvp5TJGuBYfuY95SnU0g1y70e3Rdo+O/
         q/7vGJtP8USYZXAaAkeUm3I/HBhhbt5MlFEis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638743; x=1790243543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2i1LhWiRsCyRghUjsPJXH6lvfbpdBZMD22+LHpF8mg=;
        b=vJgo0BwrZVdR2TZv5uPjW81dSjEVn/neTKOkzJ8r7MydJdfS2Wrw74QNlBdTEaFDkI
         e+vCLBtqnS0i2oD/BDeCp21lZCWU232URYnwPsnRqTE0ZdFWWD/Fkyp9bBj2TQgSzSAO
         4lNzcoDMkCKvBNtCPvaRj+0WVnkkWiPjRt330EvqqnWUkkV7bX+8M7rB9vtDKX8kAell
         zRUDAkDVZCW9H3XFYaFPyNFEdrGY9R5HsfzkK8V9xiDwCsQbPJ0KvXEal9Qw82RGkkOA
         2XzG0KdnILjSSiVFGV/x9n93pXIWfkNCp8w6jskyY07JW1Eu1sJlHKLQgRoxm3/y7j/E
         h3Bw==
X-Gm-Message-State: AFuF++nrlhiIEn9N2UQ9U4hr0MsqbgNqjvA/foKxiBU99V1oCu0mLsau
	Y2S4y28OBFgc5e0Gil4eFc6GKLoBR093CX3hFr9DbHAQ5I4rueyrkA9lp6Jc09QDAn6F+MUnreL
	gHrYd
X-Gm-Gg: AYBFou3ZxPS39pSI/BczcOwEl8eOyUACxn78DbuEhOBxCU71qeuePCAFLE7dvW+bSNO
	qi+w6mG742AJrUlB5SyO0rQBKwW8IVKknUo+fFlbTIsstxXncpwWqJkTIB5yYUJtLmJBMwsUAMt
	tkNze0KCWMWs0U+ZApshhx/ot0McZr0yfDgTZftlkxecQHKtbrKl057o1yg1KPKXpXPhP2hH3OW
	IBRtd3EKbt4aDj5MJdHYqUXTIIu0JNv3nRwNMHDWmpPtDkiswQi8Zctk3nHRXmoluAfUop7rvUA
	/GQRB/1L8KAZoG8opHKph1HU3P5PEdx7wH8enN+Fy/zbzRFUxwzaB2S1diyWcdY4+cEhtUltyX9
	f5on3CVtCVDsjKRyJDne1ECRMTkhLaxpY6bpHPAQFJrToDKhl6V5gAK2RCrkrqVpMnz29OethO9
	Q3162AgjjbqC8miVlfG7CHLS/JRml0vI3oRdLrfj3FxLb/PLaaJSWUVNrH32hqFE8kDAZsVfbW0
	uuZ7tcwYCQ=
X-Received: by 2002:a05:6372:a749:b0:3da:f2e4:4ac7 with SMTP id adf61e73a8af0-3dd726e91camr3900107637.26.1789638742713;
        Thu, 17 Sep 2026 02:52:22 -0700 (PDT)
Received: from MVIN00040.mvista.com ([2405:201:d00d:4190:4d82:51b8:3eaf:be4f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm15349099eec.27.2026.09.17.02.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:52:21 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-pillow: Security fix for CVE-2026-59198
Date: Thu, 17 Sep 2026 15:22:13 +0530
Message-Id: <20260917095213.17451-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130096

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/python-pillow/Pillow/commit/eada3cbd7fb9963ee90673fb7b5270124a0d5f4b
[2] https://nvd.nist.gov/vuln/detail/cve-2026-59198

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../python3-pillow/CVE-2026-59198.patch       | 60 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
new file mode 100644
index 0000000000..eb8a6e5a1c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
@@ -0,0 +1,60 @@
+From eada3cbd7fb9963ee90673fb7b5270124a0d5f4b Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 09:46:33 +1000
+Subject: [PATCH] Prevent saving 1 mode images as TGA with run-length
+encoding
+ (#9709)
+
+CVE: CVE-2026-59198
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/eada3cbd7fb9963ee90673fb7b5270124a0d5f4b]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ Tests/test_file_tga.py    | 12 +++++++++++-
+ src/PIL/TgaImagePlugin.py |  4 ++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_file_tga.py b/Tests/test_file_tga.py
+index ff6dab00d..c03282142 100644
+--- a/Tests/test_file_tga.py
++++ b/Tests/test_file_tga.py
+@@ -147,10 +147,20 @@ def test_save_wrong_mode(tmp_path: Path) -> None:
+     im = hopper("PA")
+     out = str(tmp_path / "temp.tga")
+ 
+-    with pytest.raises(OSError):
++    with pytest.raises(OSError, match="cannot write mode PA as TGA"):
+         im.save(out)
+ 
+ 
++def test_save_1_mode_rle(tmp_path: Path) -> None:
++    im = Image.new("1", (1, 1))
++    out = tmp_path / "temp.tga"
++
++    with pytest.raises(
++        OSError, match="cannot write mode 1 as TGA with run-length encoding"
++    ):
++        im.save(out, compression="tga_rle")
++
++
+ def test_save_mapdepth() -> None:
+     # This image has been manually hexedited from 200x32_p_bl_raw.tga
+     # to include an origin
+diff --git a/src/PIL/TgaImagePlugin.py b/src/PIL/TgaImagePlugin.py
+index 401a83f9f..e8fd297cf 100644
+--- a/src/PIL/TgaImagePlugin.py
++++ b/src/PIL/TgaImagePlugin.py
+@@ -191,6 +191,10 @@ def _save(im: Image.Image, fp: IO[bytes], filename: str) -> None:
+         compression = im.encoderinfo.get("compression", im.info.get("compression"))
+         rle = compression == "tga_rle"
+     if rle:
++        if im.mode == "1":
++            msg = f"cannot write mode {im.mode} as TGA with run-length encoding"
++            raise OSError(msg)
++
+         imagetype += 8
+ 
+     id_section = im.encoderinfo.get("id_section", im.info.get("id_section", ""))
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 9f1ef87a46..7e99860055 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://run-ptest \
            file://CVE-2026-25990.patch \
            file://CVE-2026-40192.patch \
+           file://CVE-2026-59198.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.34.1


