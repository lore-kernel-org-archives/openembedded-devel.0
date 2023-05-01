Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DFBC77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:36 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.87637.1682921128826313386
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZdqceyJC;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64115eef620so24817716b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921128; x=1685513128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPSCVFVylbRLIba9XzTMNdQpHJafBKbwvI/YLYY8yys=;
        b=ZdqceyJCcGeNQd54c3+QkpTI4YI763bNjfqF0tErsk0pMT9bY5gp3BfxbuL/TYQgXA
         GTu6e/kEzvPc8LH5pjoA4thaCx+Frp3Z3e/3tS+fLLhSS/KskynyrVbLJDwFpVlgH9h9
         gcWha21Q8chCVDgz8Gc00OSUBdHGXq3kVGatI48Eo5d5JSOmF8+qsA9hCffOz/yUbxeD
         W7ZXXB5W6Uy0Gs/2YHx06TwcijflVDP/O90QNMleXeGU2NlSqIZ9x5Nval1fRzXr2HC3
         N9ZKPRJ2GSw3qkF/AJW7iofBdcu2cLK+HFtykZR5h+N2+isklVCovKx50LdYV4XXGXmp
         LlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921128; x=1685513128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPSCVFVylbRLIba9XzTMNdQpHJafBKbwvI/YLYY8yys=;
        b=HATWoX59u3T33dz8NcmBC2Zs6kE8Jlo44DLpFWYJQRxaYaJQ+MWrHYdDIsAAJ3p2mx
         IbFduDbJyco9bUCvPVTkIBVQvlX4uq65Nno8OUH4hN6+pT0UPc85DY+S0dlIBY7oaue1
         FPmeSrpBLbWjFYuFXb9CvAsUT6WGQlBWoQACV5ooUmAAEa3M/tEUZ3fMNIWEAuIdy0F1
         ZSM2zX5amhvCmQYmsB/XGX580XY3msuCWF9y8BalwSxroCPWIpvnGgvCpJ7GLLs/P6oo
         A+333rFhm71nvUKbsdbe8MAUnABZ+d4d4kwN1duZ2ASqy10Ed9bxwpLONWqb1p4PHstx
         sgvA==
X-Gm-Message-State: AC+VfDyvgigoepnxBlNFGeTM/OEf3mR+ThmSJvifp+99p3tYJk4V4SZt
	j7yyPAXD9wD/L+MAjBU4cti+4YyI+U9M2Q==
X-Google-Smtp-Source: ACHHUZ6lFkF7+KuUAuNlgzilsm111LSJIhRJmWC5I9aRUWYy086wliKObooPPNvHeYh2YKDZowhOow==
X-Received: by 2002:a05:6a20:4294:b0:f5:68c9:6fa6 with SMTP id o20-20020a056a20429400b000f568c96fa6mr16792367pzj.17.1682921127857;
        Sun, 30 Apr 2023 23:05:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/13] ttf-mplus: Point to valid download location for SRC_URI
Date: Sun, 30 Apr 2023 23:05:16 -0700
Message-Id: <20230501060518.3505068-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102240

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index d8236ce434..a048075fc4 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
 PR = "r4"
-
-SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 
 PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "
-- 
2.40.1


