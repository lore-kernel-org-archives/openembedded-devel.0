Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D565CD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:20:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.176.1781623209475421657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SpRAO+FP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ac10e337so31853035e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781623208; x=1782228008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4I9+K9ENU7PlzsO8SK3Ue3Nc4qfzDdRJICXyventeo=;
        b=SpRAO+FPq4RNbAE68lcOgS2zTZWWmVp3e2eZjR2ZVtGaKBaxhj1PPraGzCVxtXlEMg
         cASsgGpRQIQc0MgRsHXg27t8YGn38/qIO4pWjMu5JFc5xkfS3Mkct4MF88dNZCahjTlI
         gZlmBOeSneJQzECn6MFrAJaWojVqszHWs3Gy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623208; x=1782228008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4I9+K9ENU7PlzsO8SK3Ue3Nc4qfzDdRJICXyventeo=;
        b=TWC8D/NlWM+2rfOXZv3MMUD+0xR6q12I1Si9AE7U3O8ybSLS0EconsSmPcj+e4fuxy
         b0tcg5YxLzfsXY0zjEBocpJMC+8nxhEdJFzjkl9zrNI/DIf8tQ8xUAM4J0+fvgSAZjH6
         ueM5BSIwd2Emnm4Jg8jJcP3eETCoMHIbaGzbKUZlXiyyH0oI7p+iR5lfOQtLr5jDBiYh
         bBsh28YEg+BkxLtXXf04WS/Cdt+NnnR9YRdXyOM6XnO6vMNY+lXqFUUaX8WJCAIw4seg
         ixVVyIzeVvNA8WFDYS9hRQpRr9kFJIjLQ2AQBLySSgsU1ssLi1I6pvSiS+YfS7XQSSRp
         veFQ==
X-Gm-Message-State: AOJu0YzTn+ckPxn3XDA52gTmLTkwxVlcsUJnX8t+Jt/sGA1LwbJvzcjZ
	i6ElLX3O3TCAKbo373LGUzMVgwalwIoV9CoXHegOrPWHadDLia9qfLnL6U6FsbLsqwrqdSUJnM/
	AzkdG
X-Gm-Gg: Acq92OEcu+kHk+3e3KyShbZzosWsgtqnjBpQXFbvVpLIihvjLwtlr6kex6JV+glpDDS
	h53qF6F3cjgfmwy1HbfvdpEw7ta+GS4qTesdfO2Ix+nDmwAaLUeVONcOH/F1umjvOAASaWPAQuH
	9ui2iQQrrvncbTT8DmZ4Ho3HXlzl/lBwK51p37A9HL8Mmv5wv/td+mfM056BVXZc4sg09jY8SS5
	5gaOqFgMgg+BOVEIts8SvZkigj2iOb4EpaFuGTT9mPOUkriTsvBfh01EY8fjglBZV9Go0cPNZb8
	85DRkTi4TPXnqMxz61aUFQ2ydVSbae4M0BuTa8FHravfCrtHVz496dqpID9dEapkZgp93mCNvAH
	wrH5dc8f4Z1sBf/PJkjYP6FhVBEblSpEAy6GM6Jm7Ivo0ZuZPE+z76Ets17pWtzfPiEW8NhDvG1
	gYUGSPLqjn9/EJWlNfCpj65gG6NCvgQ/KQn3L6
X-Received: by 2002:a05:600c:314a:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-492200c0416mr198871765e9.24.1781623207551;
        Tue, 16 Jun 2026 08:20:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm17414212f8f.6.2026.06.16.08.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:20:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-discovery: Add recipe for release 1.4.2
Date: Tue, 16 Jun 2026 18:20:02 +0300
Message-ID: <20260616152003.3841838-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616152003.3841838-1-leon.anavi@konsulko.com>
References: <20260616152003.3841838-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 15:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127622

Add a new recipe for python3-discovery release 1.4.2:

- fix: stop symlink resolution at stdlib landmark and framework builds

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-discovery_1.4.2.bb         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb b/meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb
new file mode 100644
index 0000000000..1878829d24
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.4.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Python interpreter discovery"
+HOMEPAGE = "https://github.com/tox-dev/python-discovery"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
+
+PYPI_PACKAGE = "python_discovery"
+
+SRC_URI[sha256sum] = "8f3746c4b4968d22afbb97d36e1a0e5b66e6c0f297290f2e95f05b9b8bf18690"
+
+inherit pypi python_hatchling ptest-python-pytest
+
+DEPENDS += "python3-hatch-vcs-native"
+
+RDEPENDS:${PN} += "\
+    python3-core \
+    python3-logging \
+    python3-platformdirs \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-setuptools \
+    python3-filelock \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


