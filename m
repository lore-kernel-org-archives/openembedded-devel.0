Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D065DD49213
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11034.1765540682365672324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEZh7SK0;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso1565556b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540681; x=1766145481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzomywuGiiy3DMbtjjueyzdnWw6uQ8BBZ/fPwuMd708=;
        b=KEZh7SK0Uqn8/YwLUrUKObiYTT2Vgl1inUzcw3q0n0QcIdqFdlBmHWGvC+F3NOu0z6
         TN8aokD4p3zUY2W2uw0bCl76nZEn2GF6F80abt3b6fzL3bayAb6V6XYCX0/V8kWUBZbV
         hI4Oidzl/zUNnIlT9IrEXOSNQHClVvYhvG35Ft6945aAt4C8k8H9nyU6QgXC5aOw0MtD
         nJh15QguA03cIsYVEVzcDluZu2UxIEpZ4b/OIEcGv35Vxr/MA8kicg4+FxXktNEXh1y8
         aA+bbEL77qxNJvykqlJXx7KSrObV7PFqrMcmMGxyuEs4wibEZZNH4nCEYRJs/QefCFE/
         yyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540681; x=1766145481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzomywuGiiy3DMbtjjueyzdnWw6uQ8BBZ/fPwuMd708=;
        b=wezervEUcSiGW/n/+5ilX3LAyhY7ShkbMPv4EGl6EUpVNA2Pbe9lm+K3aTvx41t7yJ
         ln17oZB54KIZwmq+J9th/xqxn2TXyr5Oht6ha+RN/0ImW+OSwMHCiJussWa3gZSmQpQN
         8AwutXZRskTjAqzIdiBxS81bXGdDgLqVsWy6HstRZ6cIpiOqTUGxjVreDKPSeF3p9wgz
         YWfzWRXYJ3VSdu375OeDYVBImuqnEvqe2DEZuZkx+VaizC9ZEFdByQXoZn5sre+YtR/v
         yeXyOUa85nJMhz3GVGavjmQ4Y9qhBjy7XtxZlsQxKel/17X0i+FTIdOIrHyAdRXVrlig
         cifg==
X-Gm-Message-State: AOJu0YyBlTOSpoP1FXVL6GSi/rsuLcBjEtEulKjcdlPNO++Yb+mZEd8V
	clm9ny2ckZyiDK5UjO631S3VcwsYjQyjzZnxS1G1B2RexCBJR0VrJB6KOTusOA==
X-Gm-Gg: AY/fxX5uzdsrj47w56y3I8XwR9oCK2wlHbfGnqpDfYR5hYcu6P/9zVqb96YUc0BB6nE
	YoFQ8rjxBnHGT5YJeu2sMQQlEQoNCvz57kARekd65Fd50t+SC/1tiyR4V1WKL4Oz6X/+xItrudL
	Dnoxdd+Z6nCNWYy7/ixHs9NHHPJdz+ireVoMXRcJPCYZEUBmLLxl+hrEK0AXOMoS7stizzUPSRD
	IXDGiMhJ4qzklr/FQ+S+pxgrZTIxul2+zujXxJ+IHrvrlm00dM4v0E5YckCEFj4v8FQMD4WMQtA
	uMe3SQgzrkHK1WTYnInteUOSx7/1hYyleVK4Ft1XlCYt8N41+KutuxbDoKCGUBm/mWAemWvegN8
	bMOI3VxAiPFC5t6YIUtBthLP49GhOrdCMGsh1ONnOZVvvWdAKk1gS0brvb0uOZSEG4rSMIYByiM
	+Av6PHN5wNct4EWwXURmFYfDg=
X-Google-Smtp-Source: AGHT+IFHo3eGykseysbKqxwdNYVWTKJvqzT9nn1bRM4ZUGZ4DVAgMpYGWmf5Xf7lZcO/eZaRofT+Ww==
X-Received: by 2002:a05:6a00:6caa:b0:7e8:450c:619a with SMTP id d2e1a72fcca58-7f6696a343cmr1608241b3a.49.1765540681564;
        Fri, 12 Dec 2025 03:58:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 06/15] python3-pillow: Add nativesdk to BBCLASSEXTEND
Date: Fri, 12 Dec 2025 17:27:35 +0530
Message-ID: <20251212115744.569676-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122606

From: Leon Anavi <leon.anavi@konsulko.com>

Add nativesdk to BBCLASSEXTEND because python3-pikepdf requires
nativesdk-python3-pillow.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9245fda941a140931086f51c9701214843aa5aa9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
index 4db5db1572..0730ac7d32 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
@@ -64,4 +64,4 @@ CVE_PRODUCT = "pillow"
 
 RPROVIDES:${PN} += "python3-imaging"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

