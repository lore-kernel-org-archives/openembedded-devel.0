Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5280EC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 08:44:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.3220.1647074674603102621
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kyjgLAdd;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id cx5so10203935pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tV8ESACGJZOAPcT0cX/PSapscJA4/PVwMzxcIIgfFA4=;
        b=kyjgLAdd/8MWFb0MzQaQSn4ItSAcas4rshbiu4zuB5l4K4FWumboMBMpz/HaPp85ou
         ZBZQ5tZlcqwyfL8NTf3wdwxEJzQj+Ukhc6haI6sT6GId4bS7wRnZMafLvTZwx3v19/Mo
         /5+gNU+6JrPaxLN0fiLnhm0T7two+XioXUajqHlh+m8+yVDXWxMqzToc0YUk5xiPCkZa
         CtYQLduScE7TRFP11UP9c+Pq+549bdLJ4TE3Dtmq2IcHy0jPZJpl1qhEQUUIOFA64wQI
         bUcjf9otumtVM+b/M6co2XRMri8u/neI8LYGwkJhfec0FaxGdkmChvxVgQxYNfh+73xU
         CI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tV8ESACGJZOAPcT0cX/PSapscJA4/PVwMzxcIIgfFA4=;
        b=S3tAhjgLmeC7/LqJ5n7WhFhkeL++nzsPkotUGs6PgNtf8+B4OnZro0L6z1ntTpTNEg
         NIlynbwfVbkBPgz+cTBlQdVJkYkdwqNF22vLWtB1XEFnb53HfMO2ahMEQAqrl7C8/WCN
         0w+FgsQHPb5C4k1VSMC7Nr+Vvz0p8KtNKTmGy1SQ6yYvk1FQEv6jzcsr+TdQNL3rH9BO
         dnzyw1eb50iivrUBpeJz8mM8nBoWIC4dgbEYWTk0L5/2vYSNo5IkSwdZWmASZS6XIIvq
         4L768f46w8Ieunjn+Eniou0PDZzUmoOoluWD0TS1LYBlNSuQhDgBna6YQz/cicKSk4eP
         5oiA==
X-Gm-Message-State: AOAM531afBDlIYpgZQgTaTT/j8IZzSTDh+gVPM4Nxx0NuRLEGbkqvUvO
	5Q0unCTkaCs9xmHfiveBOVolQRVw1TnVhw==
X-Google-Smtp-Source: 
 ABdhPJwrupLJzJsYZh70K+9WFPxVlZaGYHiqzjNF6VzRUKzMgBplBYKyDMnbVhIM948jWRgUqqS+AA==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id
 oo15-20020a17090b1c8f00b001b8c6dcca61mr15077854pjb.13.1647074673532;
        Sat, 12 Mar 2022 00:44:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm12803499pfa.77.2022.03.12.00.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 00:44:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] nodejs: Disable for powerpc
Date: Sat, 12 Mar 2022 00:44:28 -0800
Message-Id: <20220312084431.1123151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 08:44:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95958

Fixes
../deps/v8/src/objects/code.h:564:2: error: #error Unknown architecture.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
index 7b9644ec8d..0ab68cc608 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
@@ -15,6 +15,7 @@ COMPATIBLE_MACHINE:mips64 = "(!.*mips64).*"
 
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:powerpc = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
-- 
2.35.1


