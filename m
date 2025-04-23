Return-Path: <fleuryhugo7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A4EC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:35:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.10362.1745418949176957896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QU3meXTN;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: fleuryhugo7@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2473186f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745418947; x=1746023747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fS2s9xe7rS5zX6sN29LfjgZ0VB3W268JW2a19XUX3Gk=;
        b=QU3meXTNWHzljyH1X547AXKM2lA4hEJnFZ6zRqh2krGTV9ZQgvekHDzZKn/6ZoAe0p
         RUfJThAQwHxmnh4r10n84vibQZbjoQbd6l8/XgcYpKPZyBKn9EX3SRXDv7EgQO5qp27S
         jnzqV1LGy81jDZP3bYz3J24ygBFjxjsx0/vPXXNdrHecRx7POIj+8OoCCGDbPhDyX4WH
         NJHdNKtnL4uCJ/3hotsLT68VaDdhZvwmaLEhWIORIf1yA0+mkDuiq1VhBKPXsIzJmxJG
         yVMbZ3cq25DhkK3czdx4vOqWlBnwPsqDPDavpw51P2wZneu5D27iiUkzDc4fvUDgphvX
         L4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418947; x=1746023747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS2s9xe7rS5zX6sN29LfjgZ0VB3W268JW2a19XUX3Gk=;
        b=PntjsIO28k2KmTA2PTP1fPC2fBPENyB8hH3/5q1KPnTwNW1toA/d8zSSznASjJ1OF/
         apJYH9EjI9iMcOhM6FPg1shRvyk9jOb0rzE1MJHvH8vzw+kHGtLsELbmFBF+OK77jlYm
         UEJG76QXajKyulP3TKj/MHsm3g/aHzINscfj8mXf5DWnM4dLrgYRyL5pPvZGJ1vSXY8k
         nNOTsJ+MSHCL07IW7hSkHf3KOIIj+Z/U2KTaVAEnpH7muAki0U8DPlFcyU/d17sjSCcR
         sXSm/3zNRuCgJQRp6StzutzMkyyTOC17Eobg/jgNph8qqCCFzGUDNwCKh1p0iPMAINDE
         aeWw==
X-Gm-Message-State: AOJu0YzaRn39YjR7KkJ/nX1FFtyr/gDJpf2fVSPLBVBoRga9TV+qvrqM
	W/dcr5l8hKegM0QUdS7712gRY3Ywm+4vjs2cM0BsLMjHKJZ0RBDnyhRh3Qcz
X-Gm-Gg: ASbGncu/2sN38lzIV27CpVugeJ4j15VLZAm3gctGD/SK701GAsfzG7Q6Z2C8CptoI2B
	mcv3zmQPlNFk0dt3Wppjh2pP9GMc60TNAAqH5rpI9qhkvuCE8Il1Z13N9FF08V9Bw/Z1Sw0gALQ
	9M2JCuEH/Ac4UIgR7+Nq98H7ZMgrVJvM0rzUkxj9w/AGi6/wfm0lvXHKax1RBqqkKiuuf66PVZ4
	B9pVuPcM/6BV1iCza5LPdAhxlvw346+o2KDFZesIxob1V1Cic99cb8GuyVqWJjs6dWSCuH9CgQf
	gkOR785Njr2HK8KrHINn49u1y1g9b9BQEr5L6v6LMWk=
X-Google-Smtp-Source: AGHT+IFBWyiV6PW2kAiAX8GOZPjqQfK4mS1KsJPbPga9c2qAbE94SSyD2nZezS9C+t5lJix/5g3idw==
X-Received: by 2002:adf:e6cc:0:b0:3a0:6ac1:93a1 with SMTP id ffacd0b85a97d-3a06ac193d4mr523364f8f.7.1745418947350;
        Wed, 23 Apr 2025 07:35:47 -0700 (PDT)
Received: from ixpehess.. ([2a01:e0a:c13:c5e0:56fc:ca67:b1be:cc71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d18197sm28290105e9.7.2025.04.23.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:35:47 -0700 (PDT)
From: Hugo FLEURY <fleuryhugo7@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Hugo FLEURY <fleuryhugo7@gmail.com>
Subject: [meta-python][PATCH] python3-uvicorn: add Uvicorn (0.34.2)
Date: Wed, 23 Apr 2025 16:35:39 +0200
Message-ID: <20250423143540.453271-1-fleuryhugo7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 14:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117079

This patch introduces version 0.34.2 of Uvicorn to the OpenEmbedded build system.

The addition includes the necessary recipe to build Uvicorn from PyPI.

Signed-off-by: Hugo FLEURY <fleuryhugo7@gmail.com>
---
 .../python/python3-uvicorn_0.34.2.bb          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
new file mode 100644
index 0000000000..2b3c362463
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Lightning-fast ASGI server implementation."
+HOMEPAGE = "https://www.uvicorn.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
+
+SRC_URI[sha256sum] = "0e929828f6186353a80b58ea719861d2629d766293b6d19baf086ba31d4f3328"
+
+inherit pypi python_hatchling python_setuptools_build_meta
+
+PYPI_PACKAGE = "uvicorn"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-typing-extensions \
+    ${PYTHON_PN}-click \
+    ${PYTHON_PN}-h11 \
+    ${PYTHON_PN}-anyio \
+"
+
+S = "${WORKDIR}/uvicorn-${PV}"
-- 
2.43.0


