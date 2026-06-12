Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A894CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73416.1781278468812735400
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=InoWmJ6N;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b3637b90so8706175e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278467; x=1781883267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE6Q2BCvmN5jHmGLVxkrFjn7rZllJd0d5yqNGu4YHvg=;
        b=InoWmJ6NCAHGT7gPsl8SCwaq90n0XJ+LZ1USRm+5aFqmZ6JzF+uk2uB163hwhykfwA
         Dikv4GUdODrUZoBBk7+mwFMVq4BdAlBxZuapxIkJAWOY6a/mnJsVkg6GTmBRtMhqlqDS
         J3uBexqN3MnuA5FKiX/wzR2YfwA4FiTXgIZNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278467; x=1781883267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE6Q2BCvmN5jHmGLVxkrFjn7rZllJd0d5yqNGu4YHvg=;
        b=sMjI3DK75CLa25wNB1c0ZVTh3z5sQ1Prk1mE1WfuS6yta0cpdUWYlPZxDWzpJYVOLe
         fWTibOlIkBfwc0jS2s2g96ZF+VY+prw7u2AT4YZ45nnwidRYMzPLCtOgXEdFFHH0qL2o
         g4RR4L8nCdjiE87g2mfxrUiz+4UH8DqyT3aZAEuCE1u0iaOgooQ8miIPVV8SMXXz8xMu
         xBG8aGvVTAVzUYrb4lYKl7pFvtMqg+3Q3q+1GA8Mbn799jRkrfZyoP3PZtCYivJ2aLdI
         8CubQk5ky+3k1w38Ou5U5KvfyDdc//0n0ezvTlgRWMILJyHjafFw7sJUwbwau/ywhLSC
         QaSA==
X-Gm-Message-State: AOJu0YzIrv2zbm5I/c1WvJwtsfB5PCIvIf5jdhgIu+I/QdJrft3ptkZ0
	7rhpEl03/Ci/eigWCKVwC7haP1CFPfjj+tvKqJk/72mAP0F5aDu79/sGOP+QPlmk68RkayQZdSP
	0/P2u
X-Gm-Gg: Acq92OHx4nWHRDo3mil5LjJz6yOlpBeyovH/jn5FeipFVk/9wXT/6mbGw/0SLnbnqNC
	QMLKvxahPu7c7EqMpWwW9e4TnfjpfI1ySczAecIeUwq8whDr15fv1AR3D3N4CgqzAcsD5bNIkiK
	l1JLcgjgtfCrkifJ3AS4Jfkjq6mmb0yTlfF7Arqg3LYgeqfzm5aIP+iOJyBvofnYO4G8iCye74i
	VqiLPZvAc3g6i52b6Pi6WwzpFzPD4vrebXVViZqYUtwpBPqxz5LJouSOdtPtYWuI1DTTcYlYA62
	bORnK/lcZOAaXIsy1iFX2BMcopUfknC8EnUsC09EN108tYf6ETGFY4A6VnAoMB6Iw1+O5XvAD+E
	ZvizVc8FA16cmWSIKguR9Ndbq2SBWhd1sOUOJmQ7bLfDgmMSp04rQglhNIvZgZT+fWoxJhXzx4x
	EgYesAr4kITItnk+T/6sNttmnWkPVRXQzcTsbf
X-Received: by 2002:a05:600c:4f47:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-4921eed3fd1mr4396195e9.26.1781278467043;
        Fri, 12 Jun 2026 08:34:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/8] python3-httpx2: Add recipe
Date: Fri, 12 Jun 2026 18:34:03 +0300
Message-ID: <20260612153404.3213552-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127549

Add recipe for release 2.4.0:

- Add HTTPXDeprecationWarning, a UserWarning subclass shown by default
  so deprecations are visible without enabling warnings.
- Limit the number of chained Content-Encoding decoders to 5.
- Allow version 15 of rich in the cli extra.
- Parse an empty Digest auth realm without crashing.
- Decode IDNA labels in non-leading host positions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-httpx2_2.4.0.bb            | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb
new file mode 100644
index 0000000000..35f9d91c84
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "The next generation HTTP client."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
+
+SRC_URI[sha256sum] = "32e0734b61eb0824b3f56a9e98d6d92d381a3ef12c0045aa917ee63df6c411ef"
+
+inherit pypi python_hatchling
+
+DEPENDS += " \
+    python3-uv-dynamic-versioning-native \
+    python3-hatch-fancy-pypi-readme-native \
+    python3-jinja2-native \
+    python3-tomlkit-native \
+    python3-dunamai-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-logging \
+    python3-h2 \
+    python3-idna \
+"
-- 
2.47.3


