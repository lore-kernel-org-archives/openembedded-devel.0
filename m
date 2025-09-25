Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450FBCAC5BA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9942.1758801836769843999
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q6qoIRHD;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b33d2f0f5f4so142500766b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801835; x=1759406635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJYWVDPBz70S7Kzrg2IByHwjvrjFYs/G56b0l6pptg0=;
        b=Q6qoIRHDDJaLPKAVx733E/2EqjeA/wv9Hmc+lZ+x/eQHGVRzR2E08mHzpBlZto/ivP
         sXGWcNBqV0Mc/Nc5sm7dszZ82C0L/5W0a7LBS12OQ3TP5AUvHoLBE1Nm//jRjUVWDcqB
         1RMddaMlCFdncphhNdE1mG1JWX0HwIx3xmj2u+ZIhh3CTmOHhtkTNxAq/xP2vhubi3l7
         5oGdplLXhotGGBAGDOA9wQM1KtD2QDusxb5Lpl1TSryint7mnYgcCxSlW7FskNVjqSVw
         IjwqcA9R3BERL/RfxbBNMg4RUnGJ5JmokdgwaHTDe2RLk3rwEkUOVKvIevj0n1HqUC6n
         1luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801835; x=1759406635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJYWVDPBz70S7Kzrg2IByHwjvrjFYs/G56b0l6pptg0=;
        b=u6dIJ5xfE1daRJxBV80nrjBcVGNRl771x4Akfmxq93Cn9A8GKTJZusK2uTMKBURiXx
         o2zzWBY7DmJ+FllxyiXuNnXYOofj76780s4dPPpm/+zKjVTVPVOR2VJZSmxZfWWw14N+
         Voq/vpcsVnQzQMXv8mBTmS76vzUGZprA8JcZd1hVL8WRsas0tPPYUCkhSLMb56ZxmS9m
         pl8cq6fVpFp4UcFCMg78oTPkuSXR5IfRpO7SkRKBXD+U0KkACbV1PIo2dH6MliC6q8NX
         9iyxV8U3LoRrz2Kx5W8jnTWimJyiapZg43h6zsOOiHTL0BMAdTfWwGX/T0C53TyELAk1
         ZVpw==
X-Gm-Message-State: AOJu0Ywqj4Ufodn969R//QAUbtZ/ANI22/Y9JbYOrQ/opqEGVgHR1m2h
	TH6GZ/Qz6pTi9HeeP5CcQtF1Q/IcTW6NJvdRLyrjLEV8hWj/+KSHWlYxbkfEHBLw
X-Gm-Gg: ASbGnctUohQY80RNjpLQqFS0J5DNyoo4/MdPkRvZI51Rz9mQcvOtM+/QZw4t0o38iWy
	iT9RvSYUvDn3u8FU3uF2cdbLmc6ADC5z13GV7K3Kdf9pEJUmkCalc6/O5cK2xj0a+qL7fLmWE1I
	WrdxXgDXWwZjZaANOLZ0bP+5YApsLG6Mh/N92/YXMYNvJysdBB/0KLZsHyg7N9dB+gskR9hqEZm
	qEaBKMMJ/2YYduJtWS1oaO/AANBuT9GPCZdey09nVqMkPjv2nEvOLEfSw6Dx7R4wdeQILZRi5Rt
	cKygyOteF5YTbTAyfEvzmAAamIuiJxL5nJYI07WfsvP2MFP8PCauRoz60vV9c7MSMiKoBkWv3Bn
	NGTVRxLGuWpdYfBdixMMx
X-Google-Smtp-Source: AGHT+IEq4qbtuXlkLt5bg5qPi0QdjlNYvRTsUSJKNGAwzDTBJQF+BuiT7u2yeTrWj7Zq4O0JvarGiA==
X-Received: by 2002:a17:906:f5a3:b0:b15:515d:e988 with SMTP id a640c23a62f3a-b34bf371712mr351338966b.59.1758801834918;
        Thu, 25 Sep 2025 05:03:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 14/21] opusfile: patch CVE-2022-47021
Date: Thu, 25 Sep 2025 14:03:26 +0200
Message-ID: <20250925120334.1670367-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119874

From: Peter Marko <peter.marko@siemens.com>

This patch is mentioned in [1] and [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-47021
[2] https://github.com/xiph/opusfile/issues/36

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 95b8d055db83af01aed7f6ab98bc08cfa576f15b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../opusfile/opusfile/CVE-2022-47021.patch    | 44 +++++++++++++++++++
 .../opusfile/opusfile_0.12.bb                 |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch b/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
new file mode 100644
index 0000000000..48a7cab3f5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
@@ -0,0 +1,44 @@
+From 0a4cd796df5b030cb866f3f4a5e41a4b92caddf5 Mon Sep 17 00:00:00 2001
+From: Ralph Giles <giles@thaumas.net>
+Date: Tue, 6 Sep 2022 19:04:31 -0700
+Subject: [PATCH] Propagate allocation failure from ogg_sync_buffer.
+
+Instead of segfault, report OP_EFAULT if ogg_sync_buffer returns
+a null pointer. This allows more graceful recovery by the caller
+in the unlikely event of a fallible ogg_malloc call.
+
+We do check the return value elsewhere in the code, so the new
+checks make the code more consistent.
+
+Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
+
+Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
+Signed-off-by: Mark Harris <mark.hsj@gmail.com>
+
+CVE: CVE-2022-47021
+Upstream-Status: Backport [https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/opusfile.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opusfile.c b/src/opusfile.c
+index ca219b2..3c3c81e 100644
+--- a/src/opusfile.c
++++ b/src/opusfile.c
+@@ -148,6 +148,7 @@ static int op_get_data(OggOpusFile *_of,int _nbytes){
+   int            nbytes;
+   OP_ASSERT(_nbytes>0);
+   buffer=(unsigned char *)ogg_sync_buffer(&_of->oy,_nbytes);
++  if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+   nbytes=(int)(*_of->callbacks.read)(_of->stream,buffer,_nbytes);
+   OP_ASSERT(nbytes<=_nbytes);
+   if(OP_LIKELY(nbytes>0))ogg_sync_wrote(&_of->oy,nbytes);
+@@ -1527,6 +1528,7 @@ static int op_open1(OggOpusFile *_of,
+   if(_initial_bytes>0){
+     char *buffer;
+     buffer=ogg_sync_buffer(&_of->oy,(long)_initial_bytes);
++    if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+     memcpy(buffer,_initial_data,_initial_bytes*sizeof(*buffer));
+     ogg_sync_wrote(&_of->oy,(long)_initial_bytes);
+   }
diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
index c775cef5a1..9e1d80e8dd 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
@@ -11,4 +11,6 @@ SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
 SRC_URI[md5sum] = "45e8c62f6cd413395223c82f06bfa8ec"
 SRC_URI[sha256sum] = "118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b"
 
+SRC_URI += "file://CVE-2022-47021.patch"
+
 inherit autotools pkgconfig

