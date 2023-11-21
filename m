Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C94C61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:29:49 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.39958.1700573388131011370
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4mnPjEf;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c19a328797so3696641a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573387; x=1701178187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=peCYnG5YJsWS9QNbxtHWq2CXCWmPODGQ0UWrm3UdXuY=;
        b=g4mnPjEf46FUHjG71t6+ZyZVrIBmkdjmQu22TscoF5+jiIEu+HwvxBK9zRmdcLG/wN
         xdnGI5KaVliI4fQQVEM7PIGm4ozPQnWxds55KEthMIRy561zESA54PVsjgdORSlY6OFE
         Cp7h2yzPWId6w58RCsrGjQpOyyW342nyqSRRdWp9rxVrdHPbEjlw/0+eyuWXzk6lr6V7
         lSTcwoQHKMe3OtPRwjA1W6z5Q1VimjjyVZpRy7BH08FA3QLWGCdrcegfKxburWM9XKDT
         sa0fR9vdHztB9lig2D5rc4CZ+KikrLVlKuVJ/69nsTKFdsMqZYUMrXxLZfeWWKlQLeNz
         a7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573387; x=1701178187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peCYnG5YJsWS9QNbxtHWq2CXCWmPODGQ0UWrm3UdXuY=;
        b=RDI2VIJKVQHcPxD+VpbwI5a8WUuIAjAY34tVhKhGeLuasMBZe2PWZaAMB7n5B6UTTL
         EtUJ0EvsbjLHVbazIhyqPoQ7rkp+dah9aMrcUGFy8tK/eV206XKXMNAWK0rdSiy+pGFW
         EsU3UeVyWObek4HFxdAF/UoBkoNJ3yRN61I44BfwX5THBuJWQnw77gc/M3T08HUrkXP1
         7ZRE2Q8t4y/ah1wj5Emv3gHYkLk6P9M0owo2KQm2mPnNHeaIZDWnSYkbNYPlaSkAnzi0
         1ajHEuiZLy4DTV6OjzQ6/s7uzMNPz4fdbafJZzhltZ5i74efNkLxNxcPAwwG+7pj3KAk
         plOA==
X-Gm-Message-State: AOJu0YxgbsVnZxUQzaoZL1ka7S5uyisfDrO0yWmXvLpWkVSdW6Txtn8I
	kxbvbrncQcR99DGrpeGWMjXdjh8eE4Y=
X-Google-Smtp-Source: AGHT+IHlJN4exeObyxNKIEYYzJ4xXowhFGhO3dcMRDrvSPcPtdo2Q+QgGQ4n0VSmSz8XofpHflzHKw==
X-Received: by 2002:a17:90b:8cd:b0:283:23d9:2bb1 with SMTP id ds13-20020a17090b08cd00b0028323d92bb1mr7628035pjb.20.1700573387342;
        Tue, 21 Nov 2023 05:29:47 -0800 (PST)
Received: from L-14805.kpit.com ([43.231.237.137])
        by smtp.gmail.com with ESMTPSA id mj10-20020a17090b368a00b002851e283c21sm4054252pjb.12.2023.11.21.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:29:47 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][master][PATCH] sdbus-c++: Update ptest path
Date: Tue, 21 Nov 2023 18:59:37 +0530
Message-Id: <20231121132937.933820-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 13:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106980

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Update ptest path to run sdbus-c++ ptest

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
index faf281485..869bfa951 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
@@ -39,7 +39,12 @@ do_install:append() {
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


