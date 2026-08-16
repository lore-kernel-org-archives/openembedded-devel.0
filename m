Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4D3C5DF79
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:13 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19635.1786922644845667786
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mpkYNQOd;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2651911a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922644; x=1787527444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JyJj4xed3MX/8EgLkkcLy+J+vI6FRnib5bvgcxc6aw=;
        b=mpkYNQOd0tj+rbA9G8+EAFjvdwzjwxSA2z0N5WrK2rqlnpyzDSKQQl8ruJG0GxJ/DR
         Ju6mQeg0X/WsM7e5ignly1EXKnFiEWBQb93F9viWO6f/ZQ8oWo2hyqvq/Ccz9elDTo3/
         xPZlMmH5AYTCbj9+uMbHT+v9m71BTYylfJwDx7/uH54bKRmf5B3lujFYbqHswINAltVz
         Dw9RZ4vHeeEejMDBN+ymKl+CaKYi3MCT1KcPmR8Qv2soC66bg7OKMiD44r809gZXMpcl
         DzWfMCzNNnHD4FPsVdVQwSSqTnOsO5uULGxx5wRXaLVlobS9idWNDWvyoPV0LguVmQHt
         o8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922644; x=1787527444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JyJj4xed3MX/8EgLkkcLy+J+vI6FRnib5bvgcxc6aw=;
        b=pQDL940rTxb6iB7c+gDW7oDjwJjgx6Sp6vGT73UznURTzr2UuhJtztnxLbra+k3v79
         tb6xPCJrGJ5xxAcH9XbY402MFvEeVW1uhvoXImm/N8l+6Q152o1ivauNJ0syWjBjs140
         yRcO7gxxqLSJltx3LC/ucnz6ZzRHP8WcDpWKcvSnFvAZOm17AByNRvg1FRQHUDgbkSJM
         JBM8djOODHSJt2GN515bZBrYPvF/oST+dgOVFgTs4++nM+YomlPAzQ7vMSXaR8ypxIIT
         5muhgnrQQxde9gc2A/Mb1QMlWXoqkzq79zm/lwK88Kzoscf3fIELUqnxGxr7LkurP5zA
         l6Qg==
X-Gm-Message-State: AOJu0YxWlYklvOJUoLkYH+sIYNqueIVuOi4gnRjm0aOaIAMN4NY0SpDR
	xl1b1PcqS1r9fjeXaEnPOesYMxHFREbOcZpHAHDt2GTvrMQzTv9IEYKpt+sreVCk
X-Gm-Gg: AR+sD12jHeUEpT5mKTGrng+uJqTnpPtJyR3uQRuwJCslP5MhvB+lrlH/L8+mC7lcSFt
	JicG4MaCClFCnQwoXyiog5Io+VlDDBKHNpo1WB4zUrh6uVNRKRLqm8CioijviVQFc/T/ez3wO9D
	H6EX61N3DWLAJIsZ1sCIJs8dHosKP1ce4xV371A8fb2ZQTpNsnhpWSM91Y22jcJexJ7hmc1d5Yw
	QVvboBagKeSPZ+KOwzFpq7RJyaYUpkZztv+p5QMWIWc0kITC9c6T0BcmUoe0jo10h75np2r6Ll8
	bwPGja0guaS/XCuULSkz3unrbp0cfbMgoPbPcOaD3gqdl0dhqSu/MthNhiEq+7mRhsBC076g3QZ
	Mx6Fil+UujNNuXASfZfItghjZ+nQbyjcR++3EyYyH43LwqFiUR8ed8HTxiAebALAgYTcgVCd5Tg
	CCi6w7TKfojQJL8CictS5xMzB09HyRg1/WzQ9rdZUO+RkQOQeNmB2375kcLAq30qREongqM1Vk4
	gXfLI/bGkvQeNBYirqoQoB5Wbh6jr/cLg8dTUIe2jwY4VD1z/Y+OQC+2Z1hza6V3ljbFUBMR074
	VW9Tz5fQHfAgb56TqdKY3cIvNC0RSyXRUhivVvkTYzwH3G5+vT0TWMUaqKaSWTmqAB0Rfc9a0HV
	m1E0WqYbmJDSYmtnFiiotMCOLPg45hYqjhprrkXO+rLDcBA==
X-Received: by 2002:a17:90b:224a:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-3933b786507mr20444867a91.3.1786922644045;
        Sun, 16 Aug 2026 16:24:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 02/12] python3-faker: add codecs/misc RDEPENDS for ptest
Date: Sun, 16 Aug 2026 16:23:48 -0700
Message-ID: <20260816232358.1947922-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129179

From: Khem Raj <raj.khem@gmail.com>

Needed by faker's ptest suite.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-faker_40.36.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
index 196a8f6357..f0d0207a23 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
@@ -36,7 +36,9 @@ RDEPENDS:${PN} += "\
     "
 
 RDEPENDS:${PN}-ptest += "\
+    python3-codecs \
     python3-freezegun \
+    python3-misc \
     python3-validators \
 "
 

