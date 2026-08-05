Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BA8C56203
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:40 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37822.1785927396938699237
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zn5xlaq7;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so632356a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927396; x=1786532196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKWr7W0aATAI+rbiasdM1acHQ4qLixwNfuv+GD1/8HM=;
        b=Zn5xlaq7oqMavG7K2G73J+iZQirD1MRd1CV7JQeo/fbveIh/tjRivwhllu/i8NWr/f
         lXIcX3GpucmRFiJ4mU/Ip9yCs+a2Ry56LFAbsa5mwDXDI22utV/hvQFuz33byP7rBgK5
         QJSdqXpF/FMTQSZ/3xibliMJjAhDy6birGOkTf9GNF5sWRLGVILo4PZuqqeLHijee2GK
         Cko1+zoqaA0cOygEwSP/C8bKLRIYKu+P0l+/y3jJfh6oo+xJrcYSzXq5DOnQKPabXFzy
         iL7YR7tAxMIpTyssGf3AfCuvePviedQVMC6nBS2rvRalCQSUA7xi5bWvenhBJRKYPf6i
         9byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927396; x=1786532196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKWr7W0aATAI+rbiasdM1acHQ4qLixwNfuv+GD1/8HM=;
        b=FqVFtojljpr3JHW/FtunZvAsz6X5Lg7UeCPvXVI2lzWrtVifET5HYakrXO+g83d1Lo
         70iMnHIEOH7H3hachM/NZ2Us18yXSorG8xk0pE56bx1m+0nvZq3zzaetnQjOjJTw/fy2
         Al0pdvAcLu2ghx+wXMt+oN1LslbT3pqOB8tMDGsY+zcvOtqLvC7gYlgRllYZkGW9rATc
         9zxA+hWbzqriRl670exNw7na0ShSqgWPOL7/UDlMzlcQWc7VAis7/+RYtfHIpwk1Z/DA
         omJs5/Kcco85gNko94i2B+x+vI+NqU4kM4GEZvl1ZVp3KLQTkV2vgKsyvpTxFrLTul7R
         NSiA==
X-Gm-Message-State: AOJu0Yx2NckSdaOVDqMUwVw6o31477itF16fxjKcZKdE1BO6i1G/nU46
	OiXynY/+XTd7lUGilQ6uMafZosKNVhGeQoGSZU+vHhghl4ZUm35kojcCBpPzWA==
X-Gm-Gg: AR+sD104De/8K9a8JmcABNPRVHGtrPoedRdfFcn+Fb3HP5nnijsuPO5JpriG2cxetsH
	CMVMFkQJbiULt+xkwUDj59vSmadxQnIcoP7VEuUaOQHDYVTTb2gQ8fbHTwtPAEHGLp8Zh4Mgv1r
	OIPJYF/coCJt+YX7JCBiJViztba6xwk5oYlQzwJcPg+Aa3PC4D4B8ohjHDm8NvxBf080ilt3OKw
	GlkJQJpF1aVX6dnVA0/IJQZZGb/npSu+710H8EV4DzNoL1bVQGNxKhIgFTkFmggKGfVzGRT325w
	c0lST+kACRc9NA6SC70BwjsgqlPMmB1e0DrYRxCYRXOVOMAOxOMy9X03cQg1CfoAl7InOdQYgmy
	GW134Fmu5++dOKZPTfBCGk9wgkanFxxApj8BSt36Mi//y0Dvw/NtRnbE0ylGKhbFsUtRCGpdezp
	FTfql3BHhp4jiQHU53TUrmI8QeMW5RFdzLzjj0i5z9wtOPEgLIGjAmdxfBopH6M2GEkOVGhegn1
	Q==
X-Received: by 2002:a17:90b:3c84:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3903c54ac31mr5982059a91.8.1785927396235;
        Wed, 05 Aug 2026 03:56:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/8] apitrace: upgrade 13.0 -> 14.0
Date: Wed,  5 Aug 2026 22:56:11 +1200
Message-ID: <20260805105612.1648951-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128817

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

Changelog:
https://github.com/apitrace/apitrace/releases/tag/14.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apitrace/{apitrace_13.0.bb => apitrace_14.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/apitrace/{apitrace_13.0.bb => apitrace_14.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
rename to meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
index 436404c61d..b4b1d710d1 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRCREV = "ed44bd4c6cce224e2d64533d197bea6ca4fee266"
-SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
+SRCREV = "18cfd388ac47a9e00978b34d6c20341f3e2cdb56"
+SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=${PV}"
 
 DEPENDS += "zlib libpng python3-native"
 

