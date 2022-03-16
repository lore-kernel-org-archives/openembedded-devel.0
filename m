Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41358C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 17:53:41 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.679.1647453219534364551
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XIkTz4se;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id h13so3721198ede.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mukthPzFv7aFF+L3W6+hytNoq8GBMLiEJUOYO3bl758=;
        b=XIkTz4seIxsMW9hn/nAgFODBmB9KIRwHCJG1eJOpvpD5NoyFfCNLdKzNnWGFmJBAsg
         E7s3iVu+PgRAumPVjUy6tjWECFFb82+ibbG9s26QrmJ+bzqe71jN7ByzfJrjnyENb7Wm
         ONcy+A2Uk8nrNMzkNpFYD4yk8t4sEVsVZ+AHS/UtP7R3ryqMtVK+NVClLFF3mRCtUJgU
         3dGhWs4nBmbXzCD2DFRYa7W4V4sbPTD4/kVT09dasywrM/y1g0NSMMJxe/0ERZ1uO0Hq
         V92tPKX2F9xn2ghsEaPw82PXxhExKsOP7aeN6ujZ28O+WWLncTxrzvAJAtja/mKRFXzP
         jWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mukthPzFv7aFF+L3W6+hytNoq8GBMLiEJUOYO3bl758=;
        b=yMA+iYNCZpjpp3oSw5KOZRe8X0dH4LPePSMPDATcTVECH+aNlgAwN3MN0gRDqlWSl2
         nKgUccI7eYsi4a4hJ87pEOtkKo94AOk29ZjWSb7oc/STtX+loQ7Hj86F0wZ1cEbiMIzr
         KIiutGkVsDYKoX/RVkZHgxe30RrQg6ieTrvv6LIdS5E/nH3wb74mhuEZ3BBJZCcuwoiy
         d88MUGs171SvusY9+swaD2fN3Q+JJXX2QsrPpWsOzSy3jeyhpE7UvUkAWbme6eo/Dq8Z
         f+3iSRB/7Rr02Jban3wVvT3KYClwx+BMNrAGWGsSbzyDshrStoyZjaex0nbYxfw9OdfC
         MQag==
X-Gm-Message-State: AOAM530wg/3dQGKI96YyLYEWjO6z4qlOC4RunNojXBBAlBlV9kVkmocA
	mjwUvkMpWFOj9I+c6+OP91kYdVE1LVoIeA==
X-Google-Smtp-Source: 
 ABdhPJwZqv5pStYBmhUUqYvoQLc89ZSppsPVO8wjhmEtXGPOgtWK2w55dECRsA4hgZjzVTfQ8bBYRg==
X-Received: by 2002:a05:6402:2754:b0:418:afad:bc2f with SMTP id
 z20-20020a056402275400b00418afadbc2fmr681460edd.170.1647453217769;
        Wed, 16 Mar 2022 10:53:37 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-242-161.002.205.pools.vodafone-ip.de. [2.205.242.161])
        by smtp.gmail.com with ESMTPSA id
 sg9-20020a170907a40900b006df8c6df89fsm68097ejc.93.2022.03.16.10.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 10:53:37 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++: disable code generation tools
Date: Wed, 16 Mar 2022 18:53:10 +0100
Message-Id: <20220316175310.1245775-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 17:53:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96024

Tools are covered by sdbus-c++-tools recipe. It doesn't make sense to
compile them here too.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
index 0e07868ba..39f0b4c56 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
@@ -21,7 +21,7 @@ SRCREV = "65782bbf435d91e5eb6af9ddab110df406a824a9"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
 SRC_URI += "file://run-ptest"
 
-EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
+EXTRA_OECMAKE = "-DBUILD_CODE_GEN=OFF \
                  -DBUILD_DOC=ON \
                  -DBUILD_DOXYGEN_DOC=OFF"
 
-- 
2.25.1


