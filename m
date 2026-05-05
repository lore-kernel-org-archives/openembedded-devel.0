Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A4CD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:09:55 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37546.1777982993181779786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 05:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c6js5F0R;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso20323281fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982991; x=1778587791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XEhBKDHWmJQGyGp2ub61QysnKmFthfpLieTvpxkA/X8=;
        b=c6js5F0RwsJqM87LQWgxxnU+5K2OZpbeGJ91oVpQpfsu97N+G+P4pnPli6hbRkud9F
         qdtBHYxLgkO3LL9Zb6daLDEKxX0UwVyG9a4E9VMAdz+cUwHgH8SEiBBh0kjhVy+rzmqk
         t0tkLLYi9iXYK5i6J+t2Y3YSlGWhDy7aazF/qCA5/xUnWB7DOsrQLueWnVFAkzGLrn1l
         RqwmRxwtb+M39h6Iy0d9qznTVk7lT3sr4Rz0+GUF/P0/S60N2rBwbiqKB1DoVEFnISmQ
         0wNbPTBFXl5ZIDyPW1URYyCNzMX/FnY07RN7MPpBv82sVPZ6hcTKNPmIyyoSxJyOQ6pE
         DzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982991; x=1778587791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEhBKDHWmJQGyGp2ub61QysnKmFthfpLieTvpxkA/X8=;
        b=TwfLPfw1z/jyGZSm652B3YUZgh9nGFV9T2WMyFqgVqkJ61oilclc19UydTC0AGmI0h
         TQ0CihXRmUXFotwLuCAt+IACZsz80QJXcS5Df9g9BZ5LOm/+fNDNjYegGOC3n6PwtOgS
         NLzcjsZXP3V0B+xsHnD1e/DasNSSaxUhjVCoLZhTqoj8iLJ59ramjLPTpu2PCXsKzsYV
         OMJPh6b8DcZSyiSjuIecW9UW6/B+yI/ZnwQpnl/RzbrxdD2U3lzQhayIK6AApc61I/R2
         jgcQlqgd2r9rXcW4WmR/QGuYqxA23vp123xyMl+HEm5mzbHYC5pPETMtI77VpaOpwx8h
         tldw==
X-Gm-Message-State: AOJu0YxMkkIp2qpMVVoG6Su8Zz2cWSX6jy1L+LJveppua4g7Npd0eoVJ
	DL0ZlMRsy1a1AI+rFLBg50fs4ag06x6aP58bWw6xrGODvFBAQV/Hwuwsi3n7FA==
X-Gm-Gg: AeBDievXkCOfDVJWMDjnEsqz3vxIftpfXDEqSAhbcw4rZiPuccp+Wc6uMdxlXa+07ZZ
	GjlYw7RErStUAL/l3SUWn9CrT6sfNLwflCqbg+6dyWBbTZxeDtl9E7i6m5KXYUaRs7f19ztywUP
	Ld9y7uctwHaXW22421zhomLAR5WfGI1nql52ux5UOgN/ObDWYZQItUmkxpghmCoEkb+kNg4AEcO
	cdILhjT0ASnvacRlwVCIcA6api9dnfGkFJ11Z3dXSOIxEnsi/7tT/43jn5P411eo8y3TK8FNFNh
	Yx+YWLNW5NSCSKq8QXmToBLdwUTzIHOHVxdn0hrhFnNvY4/wCoKpZEt1kj52alG5fXa0AAN2MO3
	tI3FZp48XRa5K2AGTz6apt4dYxMyiRXECKKBp6pt1uUoapqjnauAAvCBcUzZh0oPd2lD/KLgDno
	NNprBQaNrYzrTCMELRtbIveUgix6ATamoXAtgHSuRs51pGdDfZen1KNIPJQOCnOwNLG0uhEdU/8
	PMzfcxCKPFyig==
X-Received: by 2002:a05:651c:996:b0:38f:f8f3:6c46 with SMTP id 38308e7fff4ca-393b29e0bc6mr13239431fa.8.1777982990711;
        Tue, 05 May 2026 05:09:50 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3939952a2b2sm21969941fa.1.2026.05.05.05.09.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:09:50 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-packageurl-python: add recipe
Date: Tue,  5 May 2026 12:09:13 +0000
Message-ID: <20260505120915.206334-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 12:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126781

Python library to parse and build “purl” aka. Package URLs.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/python3-packageurl-python_0.17.6.bb       | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-packageurl-python_0.17.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-packageurl-python_0.17.6.bb b/meta-python/recipes-devtools/python/python3-packageurl-python_0.17.6.bb
new file mode 100644
index 0000000000..4ae0f3a824
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-packageurl-python_0.17.6.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A purl aka. Package URL parser and builder"
+HOMEPAGE = "https://github.com/package-url/packageurl-python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://mit.LICENSE;md5=ec425c78d8beabdb209b01c5fbcd38e0"
+
+SRC_URI[sha256sum] = "1252ce3a102372ca6f86eb968e16f9014c4ba511c5c37d95a7f023e2ca6e5c25"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "packageurl_python"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


