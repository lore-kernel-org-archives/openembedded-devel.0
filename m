Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975D2C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 22:05:35 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.32472.1750197928940924765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 15:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFQMm5xS;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad89ee255easo1145169566b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750197927; x=1750802727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak0PkchoLJox34AfXFRFk0bRLq2mZQSvr8dDRWyZgkc=;
        b=OFQMm5xSylQA/ZC2la2OKwsXjEHBdkW1U2ircYjmHoFqhyx7kdokLTC6k+q6X1Phcq
         oIxV+89F7aZvzAz90yCkVLi7KeL8EKNRkqnrNPDvh5Zh3POv/SPyenmubBfvWzOJSRO6
         mXBkU83pZkLZiDaI9zrpBw/2kpuZ7kAp3AcnQoqva8Au8UR3h62GmAPmT1QdmVwTKeTC
         cy0zuCNSIFJP39eGa5RhskVI9UwhYmlwcoCHXGMVppFajY14bWo+sdsi8aUTHYNL3DxQ
         kMsrs2RWMhzdKJfpZFRGegALsFQKB1EtiarJ8Z2Kz5iSF8MlrfsrkUREVDNrmf+WeLLS
         VLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750197927; x=1750802727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak0PkchoLJox34AfXFRFk0bRLq2mZQSvr8dDRWyZgkc=;
        b=gI+PreoCbpfGJNwCZCA166gq3fth8kkB05NM4CT6q+Yi8lsP6B+2vFu35Jtbi9r2be
         w4IEW635LThazIH6Ez+nPPYW3UN6cUu/X74r8YisCsCwyT7A+uHVqDwy/8jc+kKxp6Gn
         WAv3QYRnaIJSNYGwdBy4ZFHryPIsiCNAVCH/Qrnkn+DHDyUiaA9l3s0G9CEz25Svz77r
         Ez3XauPRPyEoAipt4Tuacp0O8E+JXx2/QkelUx6Bqnk8Bi89JB/7KBUn1YrxE6SMMaz3
         hqYCDKY3DfNPPyTVmIG+Z+F7wSHsN983XOwZwEj39koPe3m208ySC8kwNkS0G4X/q0+q
         cSuQ==
X-Gm-Message-State: AOJu0YxK83g5CI/g/VRxVqw+8KWb38BsCBTT8coZTpvevVcEGpCY0ZsB
	deAuNnw/cwVx1xCrHI9cmRZgLE145bKAR76mxyoKxHzh9AOzvUhtbJu1eXQrmGrS
X-Gm-Gg: ASbGncug5NilKlmDYFu7Bf2TUhurQqKDJ8bdOTH0oQmtOl/TYgx9SNLLY9JgbOHMGeT
	SE2vdVVlLgQfYbLxKSNAzRbPxJHbxRBHUsC2OK2Z4bUuHoIqgws0oOnV4NE1tGvsovYRqw5OYUU
	G4KuuhRDRyVMqg+z3WhGrSy9mQA+WZ2cMkXQH+iF7cSFM2T3kcOyUbkVH86ZzRIyuR6nM5MdKmT
	WIL0B1fpAZe1Ct6kD7qg/tuc4bH1fJPRYX/h2qsC9Z12UHlASPcxH/BNW5VGJNmCk2Ev7LJzJSN
	ndJOnWpuNJ3Ra5pJ8Vr9+AyKvHnKwGCjH+Os4+0DHTZawU0ElfeSk4DZCIWMDT1+EFf3FAVOsUy
	bXKVRLd/gWWxlxKvFye+ZsneeJFpmXvVnQxhaixXLTQblsAX80Jw=
X-Google-Smtp-Source: AGHT+IE4RSaKPIYRh3GGQDIItc4mqELhNNHllwpuz3iNAEozSGmLdhdfTOmsMwl9KEQ8qbMVS89AMw==
X-Received: by 2002:a17:907:3d86:b0:ad8:9c97:c2dd with SMTP id a640c23a62f3a-adfad435b42mr1562069266b.17.1750197926594;
        Tue, 17 Jun 2025 15:05:26 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae015d208b2sm55985366b.121.2025.06.17.15.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:05:26 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pillow: 11.1.0 -> 11.2.1
Date: Wed, 18 Jun 2025 00:04:17 +0200
Message-ID: <20250617220415.1383616-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617220415.1383616-2-t.f.g.geelen@gmail.com>
References: <20250617220415.1383616-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 22:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117932

Release notes: https://pillow.readthedocs.io/en/stable/releasenotes/11.2.1.html

---
 .../python3-pillow/0001-support-cross-compiling.patch     | 8 ++++----
 ...{python3-pillow_11.1.0.bb => python3-pillow_11.2.1.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_11.1.0.bb => python3-pillow_11.2.1.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index f96da323ff..f5ef71460a 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 2e59ade9de405e4cdea07bfc7432c76f1e8cb64b Mon Sep 17 00:00:00 2001
+From eee014af3a7cd8a5c3ef8bbb604acb4b53c4e17e Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
@@ -12,10 +12,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index a85731db9..d55eb5324 100644
+index 5ecd6b816..582d1a23e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -131,7 +131,7 @@ _LIB_IMAGING = (
+@@ -134,7 +134,7 @@ _LIB_IMAGING = (
      "codec_fd",
  )
  
@@ -24,7 +24,7 @@ index a85731db9..d55eb5324 100644
  
  
  class DependencyException(Exception):
-@@ -537,12 +537,12 @@ class pil_build_ext(build_ext):
+@@ -542,12 +542,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
index f8341c90f7..4de3687c8f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "4c1aed801e43c6b307e7135279ca1dbc02bbf052"
+SRCREV = "339bc5db93bd95decf65a59fab273f300db6594d"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


