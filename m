Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9609DF557FE
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15999.1776677608257631929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WDYtnw6/;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1859990f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677606; x=1777282406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N2xlaeLp2/CMKm1isWlWPF6H1MIDOwPC80NytbQfSI=;
        b=WDYtnw6/c/CUP1XVm++t3SkoPn3vVJMJoFfcFbH6sM4GSq9ogazr2Vjos/vmvDFYFe
         VvauaHSfln/9HpNORrDkMrIh0uuS+HBsh3uTpyN6MEC476idVnripXU3l1lxfCc4K9x7
         CAshjWfDaqyGkggI9WKdWv5N+UVwiOT44+Guh7amF79bjmXZsMseaQrmss2vH0a/2QSs
         KLgpsOYmC2wApQp645peSLbB+mejvFVPIckysdG0mtZe+l+x9L4ydwiBgNNYV4UKZzZW
         G5xFIKeAIpckakJZ7cvnN9Af+ZFdr3s0GD0UN0haSkPsGwOX8/8gB+jHrONh+cUm/kZb
         Hc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677606; x=1777282406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4N2xlaeLp2/CMKm1isWlWPF6H1MIDOwPC80NytbQfSI=;
        b=YOI65yQ9A6eIHkk2gZnnd7Qnfi94PIe8CZZhPXK6+IgcyeV+u2TeDMteYBHnityuOm
         lO7zJF5wN/sanaNoK5UvETJF3GeXzjp2ycFcspPmJiDNRR/KFSTdRIR9qZrIXfb27ugP
         psw/GXa6a2xggEZxM8+lLbbBDluQCxUO7YFfrpmtdP6nkCCHRknj3IPkkCfgywNt5PeS
         NpG8txDW1hntFUJVHYP1s8hULLMNbRvijUF/eZ0v0S6qRvDMyPTws1BZ8qmkbSyXoiyu
         Jz5LIGNUUdoq9I/wOAjTbHlAD+JsXZYUg6CJ0yE/7BmpXY1jdJM4d+s3CRqw+OSSdSSV
         P3hA==
X-Gm-Message-State: AOJu0YxLF6omwHXxIZtZmVAANziSMj6qy2n1/sJpIaywgeyvE3AY+QaH
	TJ7WjxFrEjN6JvSWcrLWTvmco2qJg7Fy0wXh+APAH/GrDppMZbO+nLAOI7/qKg==
X-Gm-Gg: AeBDietEPP/ET1Url+Xy7z2Fv4htztMdRoqEsKtzSx+YyQIAqdwcUPDItvw2gOyKNgT
	V2peJNz1pJ+VWmSPBnCHM9uzcRnd1HOagpKKftIYbfKldrVn+XSoLJ0jaW3CnKcMDOOITF3umTP
	rzINLe4Bqyv50kiep2B5653/gs5k5WpnR/OvaAEUwvGOHpeUWLRcZvoOzLRld7FGfmAF93lRuKS
	u47eq1fztHgyIbBJ/i+AsZQIRb6kI6KQBfo5ULgR4rfgHau2uyHWewGMVj3fVDSRlyXbpAyC1V0
	7xcdgxEaLepGV5r/Kf8nFCBy7Cv3mMqxZzdwCNHKPZQWLDs6fcpK9OQyWEeviRlhpNwKnsFxZbP
	RKnxnp25ZgoC4EFIRICc0wA5B2BTNGBcSwT1RoI2sPfnv5BWU4XQANCsYn9jOAAYKWfIuBHudiF
	dCa1Gln9DI6m1d4J1z8ZH/sVjbvRTZFGc=
X-Received: by 2002:a05:6000:25c7:b0:43d:77a8:3bb5 with SMTP id ffacd0b85a97d-43fe3e1134amr17790589f8f.37.1776677606392;
        Mon, 20 Apr 2026 02:33:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/8] protobuf, python3-protobuf: ignore CVE-2026-6409
Date: Mon, 20 Apr 2026 11:33:18 +0200
Message-ID: <20260420093323.357053-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126489

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-6409

The vulnerability impacts only the PHP library component, not the
cpp/python one. Ignore this CVE due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb           | 1 +
 meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
index 4af48b0b99..880dd82b1d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
@@ -29,6 +29,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
 CVE_STATUS[CVE-2026-0994] = "cpe-incorrect: the vulnerability affects only python3-protobuf recipe"
+CVE_STATUS[CVE-2026-6409] = "cpe-incorrect: the vulnerability affects only the php library"
 
 inherit cmake pkgconfig ptest
 
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
index bbc713442b..0595ec2a47 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
@@ -14,6 +14,7 @@ SRC_URI[sha256sum] = "a6768d25248312c297558af96a9f9c929e8c4cee0659cb07e780731095
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"
+CVE_STATUS[CVE-2026-6409] = "cpe-incorrect: the vulnerability affects only the php library"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto

