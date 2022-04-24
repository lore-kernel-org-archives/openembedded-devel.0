Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C760AC352A1
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.13896.1650769810297443447
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A2Lqimsu;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id s17so19562683plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lEILUSqKiF1nRtedt+RSsVwkpSi6CY+9Iyrn9PDXO4=;
        b=A2Lqimsu5FfFArr6v3oSc3SUIoER2xe76AMZ5SmlBisCQOkRLS8anNFOMJlYPA0dIU
         0Onmaf9rUHyiwY26WZ/LNtKYMSiKq0m5RojtQxcHyPJ54ZwZzJOHRk8h6pP7kRH3gnG5
         tSlsrzgKAzeztXujwVJGPt2K7WzN2WdTwnsoo0vgtLVSPSXks96ZvjsQQ9DQ4HqoMtjy
         Pq0837+bOg8pWG0mCsOwFjVQ9KjRK86lEqDvdL+HZx3gzToXY6xEECXuN3W0ImoSswSB
         Pe/BPXRWO4CbnSOr4nunTAlnyGiBI0DZnNY7Thrle7SU736aSrboJt4bY7Ppwm6SEUfY
         euvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lEILUSqKiF1nRtedt+RSsVwkpSi6CY+9Iyrn9PDXO4=;
        b=6WYYuoimOWVv9oxIz5vCCInqhWFn7UWMtdpXxEgqu/S+s+rhaibiKkr5Ug1gMJkxrA
         sK1l1nbkNOSiO/dqWC+1Xd+s2WsJ30g9eDYlbMIClIms+Vslnq9ZxvLZrt5oXqmmcee8
         fIhPcsDQciCphOaSqjfQW7YIWu50/A5pONeiqbvJFeeT7qiwt7l8Ua0KOR0QBDhW7s8y
         bfTqUY2tbKAHoR1mXvA4ubFdE1t7Q8DHwbsbZKTmHlElmq+U9672/rUCf2Qe2zIVQMqW
         XTm3WPuIch78l96KvrjJBXH1kN9uJd/ZsVIyjRoB7AmvjrYRJPeUaHhOVBG1HkshnARU
         aKvQ==
X-Gm-Message-State: AOAM530rORWa0KdmtPKKcq1HtswmlEo3hlMFlQjDfcIlVKXd942dkZRs
	u+677BlCwEblexuA4WeKkpL4RS79zNPNHw==
X-Google-Smtp-Source: 
 ABdhPJwY96xoX3yKcd0LMZqPN0LndT9hEDcFShX9ETXZd91cVMz4xI+92ySyvZUaGJnLCA/JKIW0SA==
X-Received: by 2002:a17:902:8f86:b0:15b:4dfa:ba7b with SMTP id
 z6-20020a1709028f8600b0015b4dfaba7bmr11825383plo.43.1650769809594;
        Sat, 23 Apr 2022 20:10:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/12] fluentbit: Fix build with usrmerge distro
 feature
Date: Sat, 23 Apr 2022 20:09:56 -0700
Message-Id: <20220424031004.3209576-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96741

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nit-install-location-with-SYSTEM_DIR.patch | 28 +++++++++++++++++++
 .../fluentbit/fluentbit_1.3.5.bb              |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
new file mode 100644
index 0000000000..b90a62ef19
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
@@ -0,0 +1,28 @@
+From 5571f949fa2048b79c197b5b10a11ecb1891cbe9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Apr 2022 08:24:34 -0700
+Subject: [PATCH] Control sytemd unit install location with SYSTEM_DIR
+
+This helps building when usrmerge is on
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -323,7 +323,11 @@ if(FLB_BINARY)
+       "${PROJECT_SOURCE_DIR}/init/systemd.in"
+       ${FLB_SYSTEMD_SCRIPT}
+       )
+-    install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
++    if(SYSTEMD_DIR)
++        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION ${SYSTEMD_DIR})
++    else()
++        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
++    endif()
+     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
+   elseif(IS_DIRECTORY /usr/share/upstart OR FLB_UPSTART)
+     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 670d596cad..2dd5db0580 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
            file://0001-ppc-Fix-signature-for-co_create-API.patch \
            file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch \
            file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch \
+           file://0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch \
            "
 SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
 SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
@@ -47,7 +48,7 @@ EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
 # Disable Library and examples
 EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
 
-EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','',d)}"
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On -DSYSTEMD_DIR=\${systemd_system_unitdir}','',d)}"
 
 EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
 EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
-- 
2.36.0


