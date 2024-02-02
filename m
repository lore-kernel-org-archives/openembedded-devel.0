Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5611C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:21:26 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.2709.1706905277045627330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bec19b893aso1340642b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706905275; x=1707510075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcrQBGlUFYJQUe/nptMPGWbUImpbLwyhBzlhwUgMVdg=;
        b=wfAGHDUyuXKmoyF/CEtZz2Iv3BldtEgByvum81ZFvmRLoy2+HcBlCxsNUIsFHnGiBn
         YHGdtoRss48PjTbWiGJysBZOy7DEDavJVnet5Al7GGyAc1m5Xy8LT3bq8mPFjQ09Py4q
         xdDh5/5fVC/0RfaRfiMyXj5/PA+A4UC4vx7/LqVXbgIRKyV3/W0yfpD6Hx0okp2vI+qE
         vmtmSBOZAptRHg8ajd0ufLesYjDkG/sMJWC3VmcSbOcd42UFPgo+yKrR6DWep4TeXWTe
         RgrDVBJ1oUTFERbOKYNEClYdBKHzZTmyPh6nUXmv2cI9CroLtSxhTqXBelr4q4h63Phs
         V7yA==
X-Gm-Message-State: AOJu0YyTpkRn53CCECQwgjb+m/nZlzw1ZTT2SBk7ScSqM2Z+BcmeZZgz
	BwMpirdkYtw3VBaS1m/h9OgMdTeLhNO1jxQ8G7tiVdszJV1YogCRbAo1sgXn1IGY9g==
X-Google-Smtp-Source: AGHT+IFw0sXaEyWtcbX1+mXWELROeqlwwYuYYiYhCcDlDEnK3pSjN/PRZsR2DdVsa1is8tRXp3afJw==
X-Received: by 2002:a05:6808:148d:b0:3bf:bebe:43fe with SMTP id e13-20020a056808148d00b003bfbebe43femr3359853oiw.10.1706905275565;
        Fri, 02 Feb 2024 12:21:15 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id kt2-20020a056808704200b003bece079d7csm463772oib.55.2024.02.02.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:21:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-jsonrpcclient: update to version 4.0.2
Date: Fri,  2 Feb 2024 20:21:05 +0000
Message-Id: <20240202202105.1573952-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108542

Leverage the github repo as src is not published in the latest pypi release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...onrpcclient_4.0.2.bb => python3-jsonrpcclient_4.0.3.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcclient_4.0.2.bb => python3-jsonrpcclient_4.0.3.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
index 08ee15a92..459726199 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
@@ -3,9 +3,12 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcclient"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10f3d7679914df805c98fb351172e677"
 
-SRC_URI[sha256sum] = "c0d475494b3e1b591ecdee7883739accaf5695edb673f16b7383b8c6bbdb1ca3"
+SRCREV = "e5dd11736925a9a8e463fc9420eab95235f181e3"
+SRC_URI = "git://github.com/explodinglabs/jsonrpcclient.git;branch=main;protocol=https"
 
-inherit pypi setuptools3
+inherit python_setuptools_build_meta
+
+S = "${WORKDIR}/git"
 
 RDEPENDS:${PN} += "\
     python3-json \
-- 
2.34.1


