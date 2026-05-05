Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53621FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:09:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37549.1777982994351854831
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 05:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OKc0L3qa;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so27108421fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982992; x=1778587792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH9V6gLcAM0fJzNlgzrJeWFNfBuNgUKNEI7PJaBkfvI=;
        b=OKc0L3qawHOljTtfJV/0hEwZMhiDO4MJp1sbiysvY2V+Nn5nst4KW1Sgaa8BVLesFA
         xaNdYIwXldk3gK2Bj+3+qrz2cWfSeH/ZF/yWR2owf7DjHbB60Luz7TiNE9ZcQHYaeXli
         ELguORszfxY16M2APprWwdcIeyLlQuQzyR/LqwjbSi9QJ0MwXNL1zFTtJZwdFgbYpCyw
         y7bQhgOfNdRhIu7Pg7zrfdvWvdUYJ6hsHmERvw7AOWt1Yi7ZdnpsOxS78Ko8+MBqBRRw
         S3fjDxZwcMgrvvWrIgfqFP/6xkzXKXRzD4BMyHajh/2LMZgkdLOuDnTm1BCdo91HVDcp
         IaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982992; x=1778587792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DH9V6gLcAM0fJzNlgzrJeWFNfBuNgUKNEI7PJaBkfvI=;
        b=jSi9fEEMzhdhuGIbutYSJMN7RRmFuky/CaZ2vxsYIHDtkXwxmdNfaxuSuiMJmJWT5J
         q806gVH2qfQMjEbSo+QilPjk+hog/TqjCjfjIWEwjKlBkdrFzDJSZ9JFB5kJSQxSaFw0
         ABgORMmJyGhYqyPeSaHlt2LpVB9t/5M3qTGigXzLK2vh5bV99rxSYi4D6vrgOjAbfdW0
         x+q7XaESMyNLdEnJxaCRePfQkHvnSZka8fwUr+GcSLwZx/xJDzKzotjQQ/CI5Mr1Ht2s
         OHFaNyyywUPGXIOR1mQ1WsuFrQY6Q1VGrKS5ynzRs2O+PaDTCFwGaSGfTEc3neBNNdHC
         jTSg==
X-Gm-Message-State: AOJu0YxgZHGHYBF89SHDGIJKg1DnNZeafVV9FD8aVFrCpR/rO6eoVSW8
	qdx3E6x+ZG84ob917KXZ9/zM2lfImV1JWCY1T84eZEW2b3HGc5XhIbuK8VRZpQ==
X-Gm-Gg: AeBDiet4CxdynKJqChGJVpFCpmT0qYxdIypV2RKKqFboGcbUPiGwH6Sn5HnHuSceP2I
	PccVvqNi8rpEiWvese/7//92CTSEuQZY8XoB4xDyLsBSf7lkn5E6OQM96TrILN+BRZTh23V1CDM
	lWosiuKwNWtXU78HwjkxBE7uGXnJ4zQ1OgQertbvQrLDro+GnK8z3Hn10KEEmg7rh5cfIJNrI/Y
	T1Db8SR8i6bQ4vrF+GcKrHXmHrWp79AnNu2S+6RF/uieC8CW8PKFLfGMDu2+Xg4Sr7VgTOMY1E1
	zpqJFvABQ1v0JX3dbtJGo1NDjUdoaNR5xrkF/0kP0IPQ+bPoJQE44KavFpQKDhXUYr5swoYG61w
	R9P6Eyt/Ix9sp3tYfw/AuUzuW519OuVXR8QyHrfyracTnQ/MQ2tU0aT6oGrt5lgRKmKM0ilB612
	Av4NI7rcU2OdiRQ0R23pn2TgrJ1WS59bMxV/jqwW6EGDtj3IHbZtkegtIUWzZbjLWolsoI5qvpR
	56R3KQBj8BfPg==
X-Received: by 2002:a2e:bc10:0:b0:393:93c1:b7d8 with SMTP id 38308e7fff4ca-393b4d23b6bmr11966671fa.28.1777982992076;
        Tue, 05 May 2026 05:09:52 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3939952a2b2sm21969941fa.1.2026.05.05.05.09.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:09:51 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-cyclonedx-python-lib: add recipe
Date: Tue,  5 May 2026 12:09:15 +0000
Message-ID: <20260505120915.206334-3-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505120915.206334-1-samuli.piippo@qt.io>
References: <20260505120915.206334-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 12:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126783

OWASP CycloneDX is a full-stack Bill of Materials (BOM) standard
that provides advanced supply chain capabilities for cyber risk
reduction.

This Python package provides data models, validators and more,
to help you create/render/read CycloneDX documents.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python3-cyclonedx-python-lib_11.7.0.bb    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb
new file mode 100644
index 0000000000..56c108c6fe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Python library for CycloneDX"
+HOMEPAGE = "https://github.com/CycloneDX/cyclonedx-python-lib/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "fb1bc3dedfa31208444dbd743007f478ab6984010a184e5bd466bffd969e936e"
+
+inherit pypi python_poetry_core
+
+PYPI_PACKAGE = "cyclonedx_python_lib"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} = "\
+    python3-py-serializable \
+    python3-sortedcontainers \
+    python3-jsonschema \
+    python3-referencing \
+"
-- 
2.43.0


