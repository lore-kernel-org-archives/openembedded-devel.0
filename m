Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88817C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 10:18:08 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.94923.1709547481198090106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 02:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l+MstIVm;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d09cf00214so53170331fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 02:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709547479; x=1710152279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bax/48YQc8V1pjhssttirWsrbLaiGQplC2UAqoG3LSg=;
        b=l+MstIVmXy8S1CMuktEypEKETCwlvmfFDZPK6sww5XaUn4xREjLv4sbl5+J0ZZlmPR
         DRmXwl7z1pTVQ247XhUZr2iR8NPS8Zd9zwjLoTQn4CbXBrN51LHVWiWEY0kC9KrX/Mrh
         DkakSFc33huk5dEux4i15SswHozLtSqRsGqSem8ZtWgfAMB77WR+5GzgN1M4/0Dfc+af
         Hlyz49m4orDH2kHon1ATXi5TA9nJ1GrW+H+Xi6qAM4wjcyV0tY0nd6jEopCJwsOmjajs
         SSzz8WUhai1V3TWPqbp3DW9Y4aCxz67yVt8jAyBOushujohXa6iS5PJECk4r/nIOSl9V
         d/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547479; x=1710152279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bax/48YQc8V1pjhssttirWsrbLaiGQplC2UAqoG3LSg=;
        b=VgpeHWCuzF8V1pYDWSZX2dXUVnVSC71wAuoSgAQLT6opkFojZZJBSfZJ4sk4GRHYt4
         yDBCOOCbmmxqsVeYP+E8qrOZbSGyVhxOKv5XkkaMlBJ2gTFN49/o21aVSsV6n5j7y1z3
         wDvMX/UwWW2TQIy5BWp82KgVewJSNbXhqkXx4Wrig+ZFi/xm7tiotIEcvvLoePJsVqQ7
         HoWB2MUxllfWRwy7HOHFTcdqeYudyGr3B1ArdZZt7HQtuYxgRjQ2IviXngBhT7Tm7mCH
         cCGXHdS8OID5PeecQPysRaCp2/eakSePiCt9OAoAvQdxOAhKPGlkLwq1gxPazRO4geqP
         YI2Q==
X-Gm-Message-State: AOJu0YxEQx3eEMvJchcceZ95yb+zYb4vOVWxlRhFsDhn+Lr9TSaJJkYB
	pN40s3CKfFbqt0/nO6sl+Fuk6m+P1HSL8wLjbqxtMOC5DtGfs1DYs9BgL5uMQMU=
X-Google-Smtp-Source: AGHT+IGXmM6y8K+brY4POAKaLO16DO4CPl3WD7akBDw6yiyguDsbARXJN3XeMNQEiQVCqjolhEc4kw==
X-Received: by 2002:a2e:96da:0:b0:2d2:ae55:f428 with SMTP id d26-20020a2e96da000000b002d2ae55f428mr6469302ljj.34.1709547478547;
        Mon, 04 Mar 2024 02:17:58 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c138a00b00412cbe411f0sm1769959wmf.0.2024.03.04.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 02:17:57 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] ptest-packagelists-meta-python: Move python3-xlrd from PTESTS_PROBLEMS_META_PYTHON to PTESTS_FAST_META_PYTHON
Date: Mon,  4 Mar 2024 13:17:48 +0300
Message-Id: <20240304101748.1195916-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 10:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109097

No ptest failures encountered and took less than 30 seconds so moved from PTESTS_PROBLEMS_META_PYTHON to PTESTS_FAST_META_PYTHON

qemuarm64:

Testsuite summary
TOTAL: 83
PASS: 83
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 10
END: /usr/lib/python3-xlrd/ptest
2024-03-04T08:53
STOP: ptest-runner
TOTAL: 1 FAIL: 0
===================
qemux86_64:

Testsuite summary
TOTAL: 83
PASS: 83
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 17
END: /usr/lib/python3-xlrd/ptest
2024-03-04T08:55
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 53934e656..0e6fea4ce 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -66,6 +66,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-u-msgpack-python \
     python3-unidiff \
     python3-uritemplate \
+    python3-xlrd \
     python3-xmltodict \
     python3-xxhash \
     python3-yarl \
@@ -85,5 +86,4 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-pyzmq \
     python3-scrypt \
     python3-whoosh \
-    python3-xlrd \
 "
-- 
2.25.1


