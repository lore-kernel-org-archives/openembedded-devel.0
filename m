Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B0EC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:58:52 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.9323.1737716328971233628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tLxRKsFy;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf60d85238so339389466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737716327; x=1738321127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+ylDCBuGMwCe9ILgAGqjrV6QZNODv7FRbbxeb3mcNM=;
        b=tLxRKsFysfKVH0404KTTGppJrBFeRDYSCwbaPTirwXF7Zrc7McWbpeAG58y/YOlbqd
         OKohi5tTmu+KUmfK+6ZeMi4on+y5CE1F7VL/LTPOpnpLxeweZupJP7k9HFOsb+UGvPSw
         Z8hc4MecYmmV7AWN8gQUIe9H5TFmSIK+ZJV14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716327; x=1738321127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+ylDCBuGMwCe9ILgAGqjrV6QZNODv7FRbbxeb3mcNM=;
        b=eZc5pJ0GyfEF9tAgW9VD9pRXQD0Oy/tdlx52bLs9PJEPFRXZx4v+phxeLkCgtsG5BN
         hICAhhVnZlX/u8MG+VKM2N2Is93g8EMP5ux7lN7mp13k1ujkZlug3/rPc7xMAZgBc++z
         hxMVuaxXk07JEkyDnJkEGZwzEdg6xrXqL6OycGb8SrteSGbqOT2ow/UQXV9YRBn4L82T
         Dwr8Yt/M+YBedUF0Usag0e05BXEBSf+N6VXE371fd7M7AfHXeRjqstQ6NILrGDWKIb61
         486LkW/l1qIoSlqE5f6Amk/VZxp3r0wxdtFVSRzcAai1kWG1mZC95O2sWXBHxGxY+TmC
         /MGw==
X-Gm-Message-State: AOJu0YzwgBvv2Wk+yD4tcynw0KgYxx1NO/YCFm+U0YGAySAZ5HnRzOL+
	dMdTYTuqzB2shSt8V9P1XmffoNmbv4DJsarmZM63sgd6doea2zjMwljmv/tOffsmJPc09P9ZXKt
	W
X-Gm-Gg: ASbGncu7JmpfSxO2p13Jue+OKsNA2S3V0J+nJKe3CWPAsQ+m71cUipf9S2GWY15PxSB
	YOdxV3NoG5qJ2Xia5KaRZSrdhDUfO/jT16RGqqyTC3zQSQFSeVOMPrJjT1w98wxdUbOSKA3Piz9
	Z3l71tPoRkLghg1EbSAKKg0AphuQdz0d0N9k2TWB7tT66xu1QHD+v1m/s0wmxV2wJiFiW/d6VWA
	/zCAfMt2xFMIR8Qk39UwMetVhM6A870bneoSqyNuVU/WO9EQe1LyCWqP/0I0KgreEarSq4OteDw
	60nrnHEH0PXOJk+3CBo=
X-Google-Smtp-Source: AGHT+IGpev6f1PgvosxpHsI3ig+B6nHhPCEdorcO61Ufpb+nJ2PfU6djPPaqHU+0nBkbKa4G+6F/iw==
X-Received: by 2002:a17:907:7da2:b0:aa6:8a1b:8b84 with SMTP id a640c23a62f3a-ab38b5342demr3058742566b.57.1737716326918;
        Fri, 24 Jan 2025 02:58:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117260sm107842766b.185.2025.01.24.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:58:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-marshmallow: Upgrade 3.25.1 -> 3.26.0
Date: Fri, 24 Jan 2025 12:58:40 +0200
Message-Id: <20250124105843.2035512-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250124105843.2035512-1-leon.anavi@konsulko.com>
References: <20250124105843.2035512-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115052

Upgrade to release 3.26.0:

- Typing: Add type annotations and improved documentation for class
  Meta <marshmallow.Schema.Meta> options.
- Typing: Improve type coverage of marshmallow.Schema.SchemaMeta.
- Typing: marshmallow.Schema.loads parameter allows bytes and
  bytesarray.
- Respect data_key when schema validators raise a ValidationError
  <marshmallow.exceptions.ValidationError> with a field_name
  argument.
- Correctly handle multiple @post_load <marshmallow.post_load>
  methods where one method appends to the data and another passes
  pass_original=True.
- URL fields now properly validate file paths.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-marshmallow_3.25.1.bb => python3-marshmallow_3.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.25.1.bb => python3-marshmallow_3.26.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.25.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.25.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
index ec7eff705c..a421a93e4c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "f4debda3bb11153d81ac34b0d582bf23053055ee11e791b54b4b35493468040a"
+SRC_URI[sha256sum] = "eb36762a1cc76d7abf831e18a3a1b26d3d481bbc74581b8e532a3d3a8115e1cb"
 
 inherit python_flit_core pypi ptest
 
-- 
2.39.5


