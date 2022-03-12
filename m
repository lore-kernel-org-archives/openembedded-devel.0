Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380EAC43217
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 08:44:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.3105.1647074675982474872
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VRXc36V3;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id n18so6889395plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6jGxGH6aupmeuylInFTcJGieTU9VE4WRyN5QMJV/yxw=;
        b=VRXc36V3ibwnpUMbTP42Fl64pXxeakwOcaW0mCCAHeEMvZNi7HCPZip1u86H5RZavN
         mX3yBFq1ndJP4x+JPAjmJ9y7dbD6a+zOi+h6oeKLfdafRTTwJXPzKt+IEw5m2PzJZkW2
         sjX3VGLmOMed7O+wNDAy1p4r8QsDiHo3Stfa7bBfEFd2HIF9g0QGglZyzc6h2y2uPiY+
         I+Xj4i1Z2HMf2bSsvhVeOERmRoOhewlkr37+BD3KnlYF/vWy3zYPKFf/5RdEPCL2wbKG
         q+Li0o+A8nbebZ6AYCZUjUqCoxb7j+7DvH7Z/060b8E68Jw0Y51w7b9XouSTMiE86DjW
         inVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jGxGH6aupmeuylInFTcJGieTU9VE4WRyN5QMJV/yxw=;
        b=AT4NNsce/oB1EChatCT9XwqTnSXFVyLejIBan7mYi/TxKn6+uh3eHKQpI1g6O2zqYz
         kbmiCw5AZAFsysyclKbU+AbAORbKuI4Wo0CSwaLla/ABhbDrrBmTFUC/uPSjtFoO1Ld+
         o1ojzMdS+wbGksyNHWfuQy1FL+6NT+gJFUex1TrtqqHe0OHsCeFjFJpJ6PDYDzLpYvMQ
         zds0Z0lXDWY3ukYnppAHe0psimqzmdGL1JZVJ2jmXZt52m/XQl/86AI5XFOnxTHEdANZ
         1FTGo059njpBh5niIFJWFCbFe+KhyYozmMB/RuB/heKykx7Z+VYTwg93CoozDGNxFohp
         vHZQ==
X-Gm-Message-State: AOAM532CO5b7md4ZfffQv0kiL5o1e+X7N8Vw473UPHDdbv4ubk9zd35F
	Cbd5tb7tIJbbAS82p7v0j+mRQej5kF3/9A==
X-Google-Smtp-Source: 
 ABdhPJzSWoM6BiMwBZ4fgXSE49uuIWNp6peXmin0Op+AN4tB6wfuWMpOmpy4PUnejffqjNEkHOXFTQ==
X-Received: by 2002:a17:90a:fe14:b0:1bf:a3a0:d212 with SMTP id
 ck20-20020a17090afe1400b001bfa3a0d212mr14918845pjb.207.1647074675031;
        Sat, 12 Mar 2022 00:44:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm12803499pfa.77.2022.03.12.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 00:44:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] capnproto: Link in libatomic on ppc
Date: Sat, 12 Mar 2022 00:44:30 -0800
Message-Id: <20220312084431.1123151-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312084431.1123151-1-raj.khem@gmail.com>
References: <20220312084431.1123151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 08:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95960

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
index 36004c53d6..d14bd843ef 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/git/c++"
 inherit cmake
 
 CXXFLAGS:append:mips = " -latomic"
+CXXFLAGS:append:powerpc = " -latomic"
 CXXFLAGS:append:riscv32 = " -latomic"
 
 EXTRA_OECMAKE += "\
-- 
2.35.1


