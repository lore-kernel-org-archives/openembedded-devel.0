Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C11C4321E
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.26117.1651346328495144678
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lABp3cTf;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id i24so9461479pfa.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iBJwm8jo8PRrLMtkLMTwJefLQVM+G/+IzZ2dMMBIICs=;
        b=lABp3cTfyIsJiL7lA7SKvSET8+lE2ZoLNUCMSe1SR2FgGTItP2Aij+8N7bECEDxmPE
         K+futesKbvMaC6eV167mbgm9kxIvNaBEAIQE2xYXqiPlzb6QPaquMbLj7P802lNrpsJr
         3jWUlZ0Mx5qdnrocfqA04FgQjVKT5K5PPffAWLAx0moelFBAbLbRqUDHHyYXdtonh+N9
         jIw66gLgoLansPJ0tM0hk/31HB+HEIGdcRoRVDqnJXHBg6ZJnJ+Ym92paydEEXCeCIbL
         1t6AlvwT9CiDup8gSQi9BEDRSEHRQde/mBkbXAGB2D3NrJs528qEGWUNpSPZO8+XUXYt
         HMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iBJwm8jo8PRrLMtkLMTwJefLQVM+G/+IzZ2dMMBIICs=;
        b=dJ6kje9mPSZnMdw/luUaoIU98g0xHo+zR5kuohLU6bFePXmXt5ZJbSwYstrcPGyemG
         KbwFgsC463EOnfOEXIPlFY8poqRQv2RQM9PQqOmBx3Jn/NpICPrbcjg6saX47Nl6BtNg
         geQ+uu8I2vZ+jS5FGuAfjqeqHHMo5487LBq+pmRwm41tdPKt4seJuaR2eX4m/9EmXdQI
         2LwvBWqa2hAWZsltdcGrN/EXQd4VYXdBRuq4/YYiw3zJK6Y/hmw0jTU+LPtAKzhA0X7S
         XrGAITx3Oy8eTCA9eeVFP4vCL7WDAnW8r6LyuTot6Cxm9xL6AZgxGNj/SejxHRaKjgjb
         u6BQ==
X-Gm-Message-State: AOAM533k9Y6QQmxSGii8rryU6H4hOvX1IsOvIoNlxK/wUEwoEHKPcKhq
	RDqQK3CqtP8yhIRni8NE6ko+VghtFxAPrA==
X-Google-Smtp-Source: 
 ABdhPJxa76479SEPt53uXjUyRyLi6KH7nkzVnL4NBtO/BofVo8/bQvWTWBFJdQqI6gnL+NFExtfuZQ==
X-Received: by 2002:a05:6a00:8c6:b0:4fe:10df:1cfe with SMTP id
 s6-20020a056a0008c600b004fe10df1cfemr4543221pfu.18.1651346327713;
        Sat, 30 Apr 2022 12:18:47 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 14/39] boinc-client: Do not overwrite same file when using
 usrmerge
Date: Sat, 30 Apr 2022 12:17:54 -0700
Message-Id: 
 <a33240dcaa97610034f6d0f9661bfcc44f29cd5e.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96881

From: Khem Raj <raj.khem@gmail.com>

in case usrmerge is enabled, unit file is already in expected location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8e97f5b2a11c0d4be9f61821aead402780a4be7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index 5e991d3099..abcb304d30 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -76,7 +76,8 @@ do_compile:prepend () {
 }
 
 do_install:append() {
-	if [ -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service ]; then
+	if ! ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)} -a \
+            -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service; then
 		install -d ${D}${systemd_system_unitdir}
 		mv \
 		${D}${nonarch_libdir}/systemd/system/boinc-client.service \
-- 
2.25.1


