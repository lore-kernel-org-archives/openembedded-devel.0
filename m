Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757D9C5DF70
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:01 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2466.1786762255285553727
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QKw0d69A;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2438281a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762255; x=1787367055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFVW574ww1LzEmohPH8qCdPP5NoNcrMRggCeqDIE6mU=;
        b=QKw0d69AYTxx6ViAmIDlAAQIOZdh3DN/IbK5Bq456lMKJfarwzi6cKaWYqQJQciHvk
         rgSrWz8SrWdKsJO1QcheYRoMgxLMZBMjUZKc+4zCQ+8AW+yNdI/9xt4XE/W4G4gfh2w2
         X9efSnUWZoTaPizMm4q+0vJDnp/5aapuArICLonkIe01b3MEkFFTsF03ft5513mv/yi3
         x9DlA6vk9jgFp7+/8Rtqz/2UeZ67Z0YRJ37J0Bm8u3I9vzeMIRWllJiT7qTCMxsp4sin
         8gGrUO2MlsJq+1WJNZUWZ/LEbDvD9bpokMEKG6d+J32h91VGq0Q7TGPDIty2yOyHW08b
         /09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762255; x=1787367055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFVW574ww1LzEmohPH8qCdPP5NoNcrMRggCeqDIE6mU=;
        b=hwcvSHyG4R/vZBJOCZnRbgqXkW4TnXEjcY5Ti9L7ltU44iO+eSuMjqtxLKJqOmkWHg
         yj2w1j/91zcXUXtnQsbwzMCFZ8wPH98ECZpZ06reFO1k+Fbn5v8Z0GuPLqYZrjh2fyDF
         Xjr1j9+gNfBxiwTheXqpGd1rCt/cNVtau8JYRhn7QH8ofa8IqSLR0uJoQQDkCky0OoOq
         14aDB3RaX6qetd4UpzD2bbuJDo3jtXe5M+GTrgX5UCwk+c+ytxA3CtJIlTVkLkrem2bD
         bPk5+uF/g1ARKpQLQ5h4xlMoXav1xX2ZeeMYNCE3jW/SklTs9e5nZgeqOc/uHrTFDyks
         Kz3g==
X-Gm-Message-State: AOJu0YyohGyosqExZ/s/ydPWrHlghp5FU9xGXRx7NmbRh/Wlx1h2yFoi
	c5b1gYC1wh6CKtFHlRkwEarrptCNHOKE0Bjl/LrebbMlkkWFfhzjo3uJ3WrtokhH
X-Gm-Gg: AR+sD12fgilmSUZbdWigvoeIJZCVXnNBVR6zW9nQjQxCjpJt9Cqk6wPmV0PhI3C+4w0
	kqS4wawYACgP6yI/Bzf2l2tUeuOgck57ot1CJf3RDR7I/2DVajJb0b2Ou7htmePrBpeGKFxpPM2
	T0aqc9ddYq8cvCa8lD0kWsaeDn1Sob8SkQX/vKIZNyiUlHbBODgbQB0GeFN6mbf6L77G/JoiOGQ
	39nwOSvq+M7hO+sCLRylDlNB/OfNWiBf2pOjyhoo9BBCkLMP7+40Othuuk9DGFZyfrHjr6kS3Fr
	PrKvMt/uKgbDwrbs3n3eALTpPtOHcsyRhMMGlCh/uoyP4xZigun2SjlunRZ1+xFXg016mtWfHop
	xcTOTiGMH2VAe3Al2gj5ACi1BnN8E18iieQBOgu30hEH/CqkQnyx8xys8+654vUgsvmK9hghn7s
	ZxyF5aCR1BaZrr1PRv0Dno6s3uE+styEiiQ1Y0BktPVYl1fplLQFe/vRlWmxzBG3j+2SS448mjV
	o8jOXDR56JRmaU53Rx4xFPvCGNpZ95aGvI/k35bgseP04H6RT6fOeRlyESMDtHHzeabWYMPMYuT
	dvsBI09yGcPWMvx8mnOXis+hoAP8X1uqThX3TrwvxM/IR/UaP2/0IlF/Zr4mJXoqnhmXknRS/N3
	cYjI1o2dSdp6BpJ+z6IUVPyDNRqCvS22FL47xY8IE+uiLQA==
X-Received: by 2002:a17:90b:4b90:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3933b874ba2mr10763077a91.9.1786762254588;
        Fri, 14 Aug 2026 19:50:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 105/109] llhttp: add new recipe (9.4.3)
Date: Fri, 14 Aug 2026 19:50:39 -0700
Message-ID: <20260815025044.437694-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129170

restinio 0.7.x drops its bundled http_parser and instead requires
llhttp to be supplied externally via find_package().

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/llhttp/llhttp_9.4.3.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb

diff --git a/meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb b/meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb
new file mode 100644
index 0000000000..98e65bf08e
--- /dev/null
+++ b/meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Port of http_parser to llvm's libFuzzer, and a rewrite of the HTTP parser used in Node.js"
+DESCRIPTION = "llhttp is a HTTP/1.x parser generated from a bytecode-like \
+               instruction set that is smaller and faster to maintain than \
+               the legacy http_parser it replaces. It is used by restinio \
+               (and Node.js itself) as the HTTP request/response parser."
+HOMEPAGE = "https://github.com/nodejs/llhttp"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9e4e583cb28b7e0c2ef8df4832706e96"
+
+# The release/v* tags carry the generated sources and live on the "release"
+# branch, which shares no history with "main".
+SRC_URI = "git://github.com/nodejs/llhttp.git;protocol=https;branch=release;tag=release/v${PV}"
+SRCREV = "0e815792b167a9bd8ace259b95b7da953776c288"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"

