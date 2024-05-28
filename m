Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782EAC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 15:59:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.25962.1716911948521510237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 08:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sR/t3M8h;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-354f51ac110so964192f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1716911947; x=1717516747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n2aG2a7jP9KYMdJ/eDeN6/gHbLEP07TbPdcVwueCxA=;
        b=sR/t3M8hr26myTtpVr8wD/AroqnmCIJ9vN+VKj0LUWAU65jJWuR1lf8udb/a4EsM3E
         rQJg8RR6Gq97xtF/EHoZ9ApS+m/UHPgrzU0oGaYLcRJwIxySE8Qkq1SpeDqmwG3it4AC
         /Od8FCr8fS91LeCpZWUeLG1aYkLCg43i2YmMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716911947; x=1717516747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n2aG2a7jP9KYMdJ/eDeN6/gHbLEP07TbPdcVwueCxA=;
        b=Da/kkG1/Ol9EFolLrE1l10bDyGRtCEE/2j6t/J7tFzttlHORrP9nT5v4CuZEtqBPKI
         MM+ZB5f3pXCj4rjmeFfy00qLdIYKyNOvc/kX3VW6FdJpFqt6H7Eo1cIR0p5O205gR0GN
         E3P4Rf1y+f26SZwFLYXbJpDKINXcNCNfJeyXRaXQOeJcwbVTYBBtZWTXqHRxC9Irxu+a
         IA6yxPaYoV36eJFhn/2AIFv0XPkvBgWEFUhFYMEhdu4fh5mvDP2shVmRidp1wjP4rLco
         ltBdizNy0x4PgV7a/TzXoeOEwjl0Qv1kNa8Vj7dWFubH2BCZrnH2rxDBeMfBDEIqTKzT
         lORg==
X-Gm-Message-State: AOJu0YzszoBo59DnBlMWASpalwp0UOLr7fEAgXYqBB8rTeb1wDqRn9Xf
	lDs45scIRE8s8zVZn7osgpgmHlNqcGws5HymKL3N0HvTDEu0YfmrQ9yetkveBhTPvncV/C4n574
	n
X-Google-Smtp-Source: AGHT+IFG7KgVQnGAbwMB3i7/A+nLGIDHdUk8cOm2so2kKiPvoqGW/wfgwp0ELw/guhx4gxR/rM5GaA==
X-Received: by 2002:adf:fe91:0:b0:355:2cc:2f3a with SMTP id ffacd0b85a97d-3552f4fd766mr10297712f8f.18.1716911946867;
        Tue, 28 May 2024 08:59:06 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7de62sm12136753f8f.6.2024.05.28.08.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:59:06 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] iniparser: use SHA hash for srcrev
Date: Tue, 28 May 2024 17:58:53 +0200
Message-Id: <20240528155853.1121622-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 15:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110593

A tag was previously passed which needs a network access to identify the
exact SRCREV (SHA1). This network access breaks mirror testing and is
generaly not considered a good practice. See errors at [0].
Thus, a full SHA hash is being passed. Please have a look at [1]
for further information on the use of SRCREV.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/374/steps/17/logs/stdio
[1]: https://docs.yoctoproject.org/ref-manual/variables.html?#term-SRCREV

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
index 4a1c6db15..8c6c60a79 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/iniparser/iniparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 SRCBRANCH = "main"
-SRCREV = "v${PV}"
+SRCREV = "762715ca6cdba9dcf31a5af9297b444f3b5b8c00"
 
 SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
 S = "${WORKDIR}/git"
-- 
2.34.1


