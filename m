Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B43C5DF74
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:13 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19823.1786922646554596672
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dQ7KC4ut;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca80d708489so1462850a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922646; x=1787527446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVhEHWjXsG6GEAjFOXhkyc75byKG6OlwTSr8W/oeJRw=;
        b=dQ7KC4utQwdVCwcTPLAlTBG0GxT37PNccBe7CvAAR8sz0ofDtczLf7PNdUv1uyxWeT
         8/ClxarIjBc7n+SEEGBaCpTFlF0QhyTrrdjzcv0Caf3kcuWrZcPoB64uDjdFKmm5+2iF
         aM3ahCmM3mqmo8GJSqjren3wkfTFnmMalkLR3+6pWL/4WmiPquzU1EGsmbGhxfiP0ER3
         1n/Gz/Mvm41srcVsaTxqQOvHYZJACJrSnyIPqun0x6wnuSO1EOBVMCVMPFvGvOSt/qzr
         He9DzS7Kz3IzwxafstoGWSO3GNoYh8xY/WCMZG6mum7zx+YCyw7YZDkKI6S2PJ/7c6Sq
         QokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922646; x=1787527446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVhEHWjXsG6GEAjFOXhkyc75byKG6OlwTSr8W/oeJRw=;
        b=eeTeWx4c57UMi/1Up22mxXTpEWPodmaQ1kbHx6JmDtPhQh+iplyKB0NiEf/PtiO3N/
         7xcTMz84aR18bmSMN9VGNgY/HNU8Gx9SVYAnDXOONKryaiEEtc7m6gClxpP7br60R/nY
         dqPoBftT0Nlxw7XIAjYUaZI7xRGhhafix/05tlMQXZS10q2SWGJTiBcOrDXyO+Tr7fp2
         p6JTPeLzRvsQP0pNKLkS96uQugiKqrpnnkk+SWbebixL7w63jFsFk+FjTA/bME8/W9zq
         fQj/dTZ7SXcNqJ94KUaswAvFOyPk4EXppNNBxUoYG232zl6RBoVrZ5X1d91sT03jfY9c
         WqXg==
X-Gm-Message-State: AOJu0Ywjuh1b207hu8lCfYiKFfkBAwayeFF+CblIaApQXY5q9t24bLBe
	HCvKl7oQI9F+D/8JtObJUPT3NyRgqPgalEwScGqJNXmdc+e7jl4/pAokpKmUwtk7
X-Gm-Gg: AR+sD10hsmvhpsMSPvn91QUsBSQmQ8CNG6xu99j2m0lAtjSJtgQog2y5/JkZo+XhvZk
	DONXy6HDtqEmb1w1IQI8cg/FKzsN+37/8r+yOcrs7uKrayibT0NTTqRWAhfjmAcTLavc66dLP6f
	jJ0hsRSsrtK/DPi/e3VZKZ+EXNgWcq+nx5IQbf8hobUXGXUO/cONLOVkcoFZFbXNkTZIO6QXThN
	AARAgp+QkXB+DrUQSzJ6kMNj5+vlX04SYsSV79lOezOIKbnNXmkl4JSXpo14HRGnFAZFDyciilR
	2OBgqaKhMBQ4v76uZ5z3wSCMmCa2IscUubYySNJIGtnr28cN88G0wz+98CMkmJrLuH4F+3CwGOq
	95CTWdGMmhLmDRZsrj29QyUTLbM099vLuTCRGontBpIL8Pgw2K7t/NeZdPxWkMcSdVREbwkyF6p
	Rgjs5D8ZooeN/i/m+944By9rf/bvr9g44r1+WdVKxr5SOIEQ1ql93dhcTYADnleUGVZe08e+jZL
	mySYNwneKMZ0wpsOBg0f0IQuAj7gxFDWic2aQXl4nlgn6TH7mR1w9ZoKWrTMr1HK35q37RTXLYo
	mpxuxZ1Wu04KdLVJVZxBN/t7vtBcDgQhQs1pRhKSxDIz2zCLc6wciFSO7FQ0W8djib054JZPOfq
	vsBHl7SMsDuv4OhH8Oo/HAt368n4/vShKie7YLECMqPMe/yjD4VX3GXQx
X-Received: by 2002:a17:90b:1d01:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-3933b09e9e2mr15500802a91.11.1786922645812;
        Sun, 16 Aug 2026 16:24:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 03/12] python3-ecdsa: deselect test with upstream PEM-fixture bug
Date: Sun, 16 Aug 2026 16:23:49 -0700
Message-ID: <20260816232358.1947922-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129180

From: Khem Raj <raj.khem@gmail.com>

test_SigningKey_from_pem_pkcs8v2_EdDSA embeds its PEM fixture as an
indented triple-quoted string, but der.unpem() only recognizes
"-----BEGIN/END-----" markers with no leading whitespace; the indented
END marker gets swallowed into the base64 payload instead of being
stripped, so it fails with "Incorrect padding" regardless of
environment. Upstream test-authoring bug in 0.19.2, not a packaging
issue.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
index 5bb1da85b6..59774a1681 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
@@ -17,6 +17,8 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest:append () {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/src/ecdsa/* ${D}${PTEST_PATH}/tests/
+	sed -i -e "/--automake/ s/$/ -k 'not test_SigningKey_from_pem_pkcs8v2_EdDSA'/" \
+		${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS:${PN} += " \

