Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418D1D277C8
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 23:44:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1257.1768002248931325857
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 15:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JIp116Og;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a137692691so33394845ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768002248; x=1768607048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSfls2iGaeXnM5UtJjdwmuCS/7fjA+ra+/zGk8x6Uo0=;
        b=JIp116OglX3APV86MS/4yZC86b9PSBe46EXR9L2kU7vmsoWHJTIuAHskeZ1W6CRNJa
         2WbE7NQbfeKs9B90mtt96a3vsYoYHQNBp+9iLwOw3xUu5+nKQazJIce9SNiYvVQshmiT
         FPuolyuXOrUPyNoyfKTLceE89K4cHhAeWaqSZXxE3hPfg/LviovcCrGZpvL3v6+g26QP
         VNCXgNuhSTShUQZWXv9AvLiax/Acike3Fh9/p9xbqHz4ZgwEYnrIJTdAW9vt57i73ZRM
         LNxPAMaei3oUwcpTwlK1y6kyolNVjBNKYqpjMdzIgQo/r2U0+n3StaoYGmD/Fbh5hJ2h
         mAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768002248; x=1768607048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wSfls2iGaeXnM5UtJjdwmuCS/7fjA+ra+/zGk8x6Uo0=;
        b=dXmNedjTCto/5PtWiwHSKfEJRa2Kw+5s6vRCxco3SM/TFwckrb206oKYB0T2HdZX6a
         7Z6jBDdJAupgE+w8JfHhpHV4r07NATpLpc+s1Cz3L3herYlwaIx1xQqZ01xXnsaI43Lu
         j6QOWBmp4b2U8jJfMGv0v4AsiQBRedkBcBK65dzt29RHpeS0DB0s293/72h6Br7yspqX
         cwjTDeUMd+y8KKA5EtPaaM9b3vA/Qb6RJN4xtdmHJ+3IFBYipcIr0B1eUaNFicibjAZu
         8hIGj0bVBAGRzb5d1x/fJDJAIMABDyiMHdqPQ6zqWfb89SfDzYdTKxwWLkF25VGvcUj2
         eb8Q==
X-Gm-Message-State: AOJu0Yzjv20FgPH92qm0NlqC2lGQooS6zj4zU5yHZdsMG6aqhQOR7Q6f
	KhW9zdfHWvfwp9ahvMNbxqxLHO1z+exSzgPWmOJG4Xbaw8ySX0ksCuQfN1xR7A==
X-Gm-Gg: AY/fxX40lV7Pt+CvDmwUV2bvd0pUR5o25X6s0dV1MTND1kYXwi2GBddl66iCfJIUp4E
	DcbHi0jZDc7LqOzusfZku5ZhfEt0ChGm4c3KNhmdgDq1DzNksQY8znG1x/j9BzGP+ovDGvPxkdS
	UM2cx+3XHStZ+X4P1aUgZrtrvXiqtxtHXsbICKTBgkeg9ZPAH87oJ4qS3D2I94mNIY0oZRFtzNV
	CEkg7zwyVlQInat6n/jyyf0+cnBve+Gha1h7R+gXFY+Eb5QB3pknsF0rmYphEPy5vLaYMN7pT61
	1Mm0G5XC12PEpFU4/KRpgeY3G35cvbgK8rcAn78VwTEFQcFTSnwPC9GyoZIWbCyPpQPYoRi3LKN
	c05UgvNWKMcZyBQb5bQ89Te0QI24vFqKhakIGlHH8/IE9XqDSBBEwOI48KD6cYNY7rcckwlU1Ib
	kvrFuw7l8m5q4qdnDaKTdkc2w=
X-Google-Smtp-Source: AGHT+IFGiji6NyPlpUG4W9ppqUY7Qm048b5MAILJPPPsVVUH+e2b9/Aah4UlQ9+9Ek9Cgq2YSV7L0Q==
X-Received: by 2002:a17:903:2b03:b0:2a1:325b:2cba with SMTP id d9443c01a7336-2a3ee51215fmr107600725ad.53.1768002248101;
        Fri, 09 Jan 2026 15:44:08 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm113934675ad.9.2026.01.09.15.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 15:44:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH 5/5] opusfile: patch CVE-2022-47021
Date: Sat, 10 Jan 2026 12:43:46 +1300
Message-ID: <20260109234346.3098858-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
References: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123317

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-47021

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opusfile/opusfile/CVE-2022-47021.patch    | 45 +++++++++++++++++++
 .../opusfile/opusfile_0.12.bb                 |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch b/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
new file mode 100644
index 0000000000..f1bf957949
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
@@ -0,0 +1,45 @@
+From 84392e8ce385707de855865dd16d586f9331f2e5 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 0a4cd796df5b030cb866f3f4a5e41a4b92caddf5)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/opusfile.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opusfile.c b/src/opusfile.c
+index 642c784..edda2d3 100644
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
index c775cef5a1..51afce9217 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
@@ -7,7 +7,9 @@ DEPENDS = "libogg openssl libopus"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ac22b992dde6a891f8949c3e2da8576"
 
-SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz \
+           file://CVE-2022-47021.patch \
+"
 SRC_URI[md5sum] = "45e8c62f6cd413395223c82f06bfa8ec"
 SRC_URI[sha256sum] = "118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b"
 

