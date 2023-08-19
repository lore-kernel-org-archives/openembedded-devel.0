Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8725AEE49A3
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 17:34:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.14110.1692466437540772467
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Aug 2023 10:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B8sslc2c;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68871bbfe33so1512597b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692466436; x=1693071236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HQMkMODGk2GRQCuf0juyH8dIi+mf7Lom28FGYV0TxM=;
        b=B8sslc2cfQ8JUx5IbP9f/3G/rnocITQ71FIwA5gYUk5v/sH7s9FaqIgtOgk+bg3cGD
         FcURONxCRGRGZdOZOvxvOfP9ET0DeYtMTqLmMNStdSDYpIRtUcS6WHCLMIzANhEv+1xV
         knRLJZpaTRdUndkcj2t5zyC1h65TX6FH0Zl/+cxC6w/+t72wJLdBMaP/5BvJfRtZeK4V
         w5OBSTYOVtoqNIAJ6/XmOnC8H/1X490BLbrfF9edrlapLW2EYUJT7T9dQiqAGL4UTm9a
         eKtDLcP3GzzzoeBnX/dm7e3dPZC0t2ydifUGLX/6V2AR40fHFHHsxGqnsaTdUCkjro/R
         0Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692466436; x=1693071236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HQMkMODGk2GRQCuf0juyH8dIi+mf7Lom28FGYV0TxM=;
        b=Lat0CfvVX4XCP2NEEW90sioZBNNl+n5J6B92CEQdPtIwq1Tyd55IykMW7pfxN24yuC
         fDtDD7Dglgr/qCNmak5VMJwi/sErlZQMk2xXK8h+gILSxRt2f+fCVwi/NLrxy34hnkK8
         Y8UYmFoBDYttZp8IvtxCV+wBml/EsX0q8HPGjCMVOpvRtpnbxb3RRAw02hCuo2pdZ9k+
         L3e36xL38+nZciHZdnpbKRovU788lZq+cMqAwPAShzj4Fbvt4F1PwNshqxsSOxxCrScZ
         Sl4vnqEON6C5Op/7kIUO2XfxNy3pXyl2J3t7+P6CEZxNgF49z1PTH4SNYXTBEOdrMfYc
         B9OA==
X-Gm-Message-State: AOJu0YwWTVyEBNlKdmYE80RdhyTrHKFeUMgJ5hVtCy12Eu780bbFhmth
	VmyKNFnzr//+7dwsr7JhEL9hfzH4KNT7pg==
X-Google-Smtp-Source: AGHT+IEAxA+U47U2vTvy3t7KzmJQR4HyObJv++g6Uo9zwKDdlxhTFqaNZu0aMml2c4vg0xkCQkbS1A==
X-Received: by 2002:a05:6a20:f3af:b0:148:2b6d:de1d with SMTP id qr47-20020a056a20f3af00b001482b6dde1dmr1948266pzb.30.1692466436446;
        Sat, 19 Aug 2023 10:33:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id r21-20020a170902ea5500b001bb99e188fcsm3913295plg.194.2023.08.19.10.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 10:33:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] librelp: Fix ptest installs to work with dash
Date: Sat, 19 Aug 2023 10:33:52 -0700
Message-ID: <20230819173352.113882-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230819173352.113882-1-raj.khem@gmail.com>
References: <20230819173352.113882-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 17:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104499

Suggested-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index 705452734a..9d949c6303 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -41,7 +41,7 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/${TESTDIR}
 
     # copy source tests/*.sh and python scripts
-    cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}
+    cp -f ${S}/${TESTDIR}/*.sh ${S}/${TESTDIR}/*.py ${D}${PTEST_PATH}/${TESTDIR}
     # install data files needed by the test scripts on the target
     cp -f ${S}/${TESTDIR}/*.supp ${D}${PTEST_PATH}/${TESTDIR}
     cp -rf ${S}/${TESTDIR}/tls-certs ${D}${PTEST_PATH}/${TESTDIR}
-- 
2.41.0


