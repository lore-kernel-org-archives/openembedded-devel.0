Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1D6C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 03:55:07 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.3028.1645847706399386195
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 19:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HJ0kCNKE;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id t14so3434919pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 19:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tj++k+qftKl2mHnA8gkNWXDOTMvj2wQ5E7H/fxkvbFw=;
        b=HJ0kCNKEq6+LiwQMoNTTlNh9l/k6mkDyGd+HS9NLclslh6UF7eBBYnP/Fz9j4knnwU
         Nw3zFHfAsN4KA2wYq415Jsc2pURtT9mpinVmRm44gfodAtBwcCxMd7zVAqAXEbIbatDw
         5PBK9+YF28y6T6MTUJWoxJNleDUynAYK5I0r1qpcBHnBjla08Sf0Ce/7BJLsRJeR6r6N
         ALeXirId13dQLMgRvoQul+pPj31az6OsA07BuEgIoCDdcAXdqu503pVdEA9Mu7PnysVa
         nPUKvwQ3Ewy6gli61MnPiOHePQOABB2Qb2DUPlQ/stxBZe4hYpfv2t2PKM7Pjnuu2Fna
         DSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tj++k+qftKl2mHnA8gkNWXDOTMvj2wQ5E7H/fxkvbFw=;
        b=nWQCr1+3LCYaZVsZ+JSK76MFNx+PYOX74wf+segy86xZuTsJPB58RycErRpcOLJKkg
         WsD/v0IttMAtVGDqd0dxPoLWksjLef14Wi8xb/e/O0QTOKDZ1YN7/ky8RjyjB0fB/hBX
         cM1hfYWuk3cPg3Jrx9CM0ICOr7CJKlZ9xEVsecTBud0Xp3+j/qbXpbg4kRdLUqL9wfjv
         WaFEjcVfCBRCZpHgebIwTu3/Ieo4WXHKK70e5u+mGC64CEBGFro9ODI0vPx/2YF+zYwt
         O09xrNKlLi6Wc0u478va1wWHrkKVQ+YrrAhSAV/+dDsPrGGXzwYOTtd/TKfBho/lOF8q
         3QGw==
X-Gm-Message-State: AOAM5302FiMK/G9jXr3pl0abIN/RiNR024oshXj6xWHIl9e7xiXYkrVq
	Nxcr9c/OYzJIvF8sAYNMdB+XS0cMIN0=
X-Google-Smtp-Source: 
 ABdhPJwQpf06rJPOp08kTNZsCMMR6dOoj2qcYDHvMd79JwrHOPA+oGr4sUfNZtjXUPENG15pfQ+yfA==
X-Received: by 2002:a63:5157:0:b0:378:3b1e:55a5 with SMTP id
 r23-20020a635157000000b003783b1e55a5mr3906927pgl.148.1645847705451;
        Fri, 25 Feb 2022 19:55:05 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b004e1bf2f5818sm5210564pfj.87.2022.02.25.19.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 19:55:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-xlrd: fix wheel build
Date: Fri, 25 Feb 2022 19:55:00 -0800
Message-Id: <20220226035500.1388028-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 03:55:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95535

Recipe does not inherit pypi nor would PN resolve to a useful name for
the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Recipe builds wheel in ${S}/dist so set PIP_INSTALL_DIST_PATH
appropriately.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index bd6853e747..da0dc26715 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -17,6 +17,8 @@ SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
 S = "${WORKDIR}/git"
 
 inherit ptest setuptools3
+PIP_INSTALL_PACKAGE = "xlrd"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
 
-- 
2.30.2


