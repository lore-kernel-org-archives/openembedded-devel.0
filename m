Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8360E7AD62
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137505.1766667103686259309
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfMLi7Q1;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4327790c4e9so424445f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667102; x=1767271902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWIUpaEXTqTeiagGCQoH5twOI2RQ54urHNDt9mtZ2PQ=;
        b=BfMLi7Q1ta6R55McJs9L+ySrf1wDyyPZWxVZFXxK8iTDkJwvB6k0Zc6sStPQqanX+j
         Lu5HmtTGpv+cZa6656DEyrozw5iGbqaNFqLaY/kvZZLRv8Ul2m7l0tgRq4zYytxB9tij
         2oho92nwCiFbczK1oQSPZc2Y7kvWgf2acKa8TCUcOohxcJEhg3PkrhbfKqvgTn5xNAv0
         0fhz7PFByltzIgZeJCcthbENwnT042e2xlAqH8nB0ZGnDxrYO6GTsCELHSGJO0DfCvnd
         NuO+GuqTFTCVWKJWOmKoLRiyPQMemPaZzyQWJv/h1JICTh1XO9tBIffbV0LUL4rG3/4h
         DIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667102; x=1767271902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sWIUpaEXTqTeiagGCQoH5twOI2RQ54urHNDt9mtZ2PQ=;
        b=c1szZ+YD3mOdHn4/Tk/W1FibXvW+MfW8ft8YOR/QoA3cn1/g/O/Wb5+sLORyA53ZAn
         zSG0wBxK+xQjfQ7YM8g4zL363PDTU13WzuMXIxLFyy4Caq50533tOWSCXfg82LxVxi/o
         gHwqqKVZP2ijxvWjFe1tMgN+LHZ8jQwGQms+vvnLRAmeEy7OhFPXGbMcdZI4YcCrjDh8
         MHT02N+ag4KwblO54qGgybcht8Ut40ieRFSGcctSw3wcdSafdi/eAIGw2MEg+CiM+riw
         imjwMyF4+MXzFLYkt4QFDuluozbA1lwAWh0S7XJpyDSvAW3R2NShrtUxOFYF5Nm3yEmt
         qJaA==
X-Gm-Message-State: AOJu0YxIeJ+8fPw/yIOV7PYuhcCLy/Wn6Epj/lggst2V3YVhz6DJ1R2c
	sbUK+6ECAXHX6a7XnJjZisYALiIGHReCbvI8nbHWgQS3HxjSHk87Rco2PhVIqw==
X-Gm-Gg: AY/fxX5oi0mVtNh/XREfTBm2Pm1v+bCdnP9HUm32R30/YVib9IErB1TB/9wX+FrLY2k
	hygHgyxmYlZyfgS6PAxoIeZsQySlw906HAdvBX9Iqr6V9WItmXyi4RW1GjFQ2w+eJqX/hTbGY/I
	NlrfxhF6Yvd9a7N2GpBw2BX4OFoQkI9AZWpADfn5wvaIwD4EjQ/aA/0XVZsQVwI8xXDrKY0M9xa
	kyd/26TscQXMM8C9oNGIZi0IutoFkQfqh5u+bqtLMlmsFZGyVvIJw6KTLVpzqTysd9XSzsWc2aD
	i4sVlFDmEBepZuCxnm5Z/WuXt+75q3g03PeDplorQxUNImVavrVVgsjJCBijz+qp8g7l46ycPVC
	AtVpwf5FkYLYVH5ckgIxnaG4zGpMDl3rVtAF4In0Ovdl9sNkbVAQ7PTBjTPeWL05UGNTQ/wlaeP
	liPxgEg+Ma
X-Google-Smtp-Source: AGHT+IHC/B1XmqGn2OfCibg86MqMAD5ARIXhq0eIb+QXq8EolZnbpMT/KTV6G1DjuLAjgnno059+pg==
X-Received: by 2002:a05:6000:220c:b0:431:752:671e with SMTP id ffacd0b85a97d-4324e4c906cmr25547396f8f.15.1766667101856;
        Thu, 25 Dec 2025 04:51:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/8] nanopb: patch CVE-2024-53984
Date: Thu, 25 Dec 2025 13:51:34 +0100
Message-ID: <20251225125139.2436941-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122914

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-53984

Pick the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nanopb/nanopb/CVE-2024-53984.patch        | 36 +++++++++++++++++++
 .../recipes-devtools/nanopb/nanopb_0.4.5.bb   |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/CVE-2024-53984.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/CVE-2024-53984.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/CVE-2024-53984.patch
new file mode 100644
index 0000000000..c7a0c3f007
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/CVE-2024-53984.patch
@@ -0,0 +1,36 @@
+From 84e8fb3da74d3b83179700284ce47c98a8804ab1 Mon Sep 17 00:00:00 2001
+From: Petteri Aimonen <jpa@git.mail.kapsi.fi>
+Date: Sun, 1 Dec 2024 11:40:38 +0200
+Subject: [PATCH] Fix memory not released on error return (GHSA-xwqq-qxmw-hj5r)
+
+When all of the following conditions apply:
+
+* Compile time option PB_ENABLE_MALLOC is enabled.
+* Message contains at least one field with FT_POINTER field type.
+* Custom stream callback is used with unknown stream length (stream.bytes_left = SIZE_MAX)
+* pb_decode_ex() function is used with flag PB_DECODE_DELIMITED.
+* The input message is corrupted (accidentally or maliciously) in the length prefix.
+
+Then the pb_decode_ex() function does not automatically call pb_release(), like is done for other failure cases.
+This could lead to memory leak and potential denial-of-service.
+
+CVE: CVE-2024-53984
+Upstream-Status: Backport [https://github.com/nanopb/nanopb/commit/2b86c255aa52250438d5aba124d0e86db495b378]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ pb_decode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pb_decode.c b/pb_decode.c
+index b194825..2a22607 100644
+--- a/pb_decode.c
++++ b/pb_decode.c
+@@ -1156,7 +1156,7 @@ bool checkreturn pb_decode_ex(pb_istream_t *stream, const pb_msgdesc_t *fields,
+       status = pb_decode_inner(&substream, fields, dest_struct, flags);
+ 
+       if (!pb_close_string_substream(stream, &substream))
+-        return false;
++        status = false;
+     }
+     
+ #ifdef PB_ENABLE_MALLOC
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
index 4b1853cc80..6edb2f11ce 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 
 DEPENDS = "protobuf-native"
 
-SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https \
+           file://CVE-2024-53984.patch \
+           "
 SRCREV = "c9124132a604047d0ef97a09c0e99cd9bed2c818"
 
 S = "${WORKDIR}/git"

