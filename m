Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF5AC61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:31:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.39999.1700573481518139837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W63mlUbu;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso4919416b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573481; x=1701178281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3zrA4rBOWeHOLMIMVpXBPZCtw46zYdX5qA/RlluiPc=;
        b=W63mlUbuxbJO1PeaMoWkkfiSERtvQ5rO7hJtvU6ISsOAfoxmGlvAcbXywrdezjeMnT
         G8aVFKABJXfGqJX0S5TdXwC21AqPaIPfuofapQsUzbBaGwMIAYmRsFe5rO7Us4S9wSnv
         ORLqSCkHuFlw4dK1YmMtgm/jSOfqo/A24W0kPYbv136IrzNo/Yw4zutiARZ8YQUq2j6t
         3OmbiQ3HymS2tCkxj4KfLBQOBw7CaIHs/E7LPALJYVL81LJ+NPLGHZs5RxnLqQ8wzwzd
         odbBgk2UFpVYWGzfwDi3mxCpc8fbHl9uUhXwu6k2Z+bufBMHO84a2hlah1PxKtfe+btZ
         yVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573481; x=1701178281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3zrA4rBOWeHOLMIMVpXBPZCtw46zYdX5qA/RlluiPc=;
        b=SYPGxaoYzuKnzjhVc+HmoUYW03aeiWbJLpvwrVQCJtdG9FoeoEo3dV/7x+NRlez+JC
         8lFJ0BGYQjZvOt1A7Cv/codo06jG4tkVws5K3FVf/2n24OcPF2cluPEpPOVtaoEvLATT
         ezFGXLYHfQ9F6JGKqANEK8S/d5kfVm0SY9VZL1FEiHHnOStc4fd1RasGd2/h3Kxvq7tu
         vE2IxTLhJYNOR3u8vaUqF+vqwsmlHFLn5NNFKU7vkMYCLoQz/EpZ60GIXBC65DsSp8pD
         CZeDxVK2MgKTIKXtYY4Nlc2bOXjbd5uQIjRG3iIZbC9EkpYdCIkFgm9hXiUxR7W1G9bf
         1JIQ==
X-Gm-Message-State: AOJu0YyKKQ541j9aqVc0dqCXQij/1p9FfES8HPOyXaq3W7aTXNEQkJ9d
	Y9GNxD6AsHM0D1nwMvyfVv9XZUk8cyA=
X-Google-Smtp-Source: AGHT+IEnqTXANK5ALuDuSBOdC7oqAlCvcvCs/wdp0PTEntXL18nBALCkegjS1LnQnCswiZ2pvfzzHA==
X-Received: by 2002:a05:6a20:e186:b0:189:ca96:aa1b with SMTP id ks6-20020a056a20e18600b00189ca96aa1bmr9198195pzb.53.1700573480809;
        Tue, 21 Nov 2023 05:31:20 -0800 (PST)
Received: from L-14805.kpit.com ([43.231.237.137])
        by smtp.gmail.com with ESMTPSA id js20-20020a17090b149400b00268b9862343sm9083729pjb.24.2023.11.21.05.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:31:20 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][kirkstone][PATCH] sdbus-c++: Update ptest path
Date: Tue, 21 Nov 2023 19:01:13 +0530
Message-Id: <20231121133113.934123-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 13:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106981

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Update ptest path to run sdbus-c++ ptest

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
index 76fd6b65b..6fd826cbb 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
@@ -39,6 +39,11 @@ do_install:append() {
     fi
 }
 
-PTEST_PATH = "${libdir}/${BPN}/tests"
+PTEST_PATH = "${libdir}/${BPN}/ptest"
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${B}/tests/sdbus-c++-unit-tests  ${D}${PTEST_PATH}
+}
+
 FILES:${PN}-ptest =+ "${sysconfdir}/dbus-1/system.d/"
 FILES:${PN}-dev += "${bindir}/sdbus-c++-xml2cpp"
-- 
2.25.1


