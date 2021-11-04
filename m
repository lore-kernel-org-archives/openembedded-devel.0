Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B399C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 05:53:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.8060.1636005196934248661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 22:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KTb2FcOX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id s24so5563637plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 22:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Du/hhsfyxWcxpgQGpllaOp8Y/c4cCcxaVQMJwvnkKk=;
        b=KTb2FcOXr1TvwtUsCnX6eSMN2yPbY+u91q7CuK4vCyXG6ncADyQ8Fo+nQDVwQ5sv6t
         pnU8/n/VWDmkPXwwdcS/w81vBLU5RR11TzZQ+k8CpmD7Bi34cXWnn5gxI+GKUsXTAqwg
         Weurgvmj/rbxHcUGxJYni/qjpHFdtMnfaPwOJM1XXA7PUUCciFW90vhtxeH2Q7Aa8Zrp
         qFliyH0UWYt+66vX1Fe6Fwh1cHl1egUDTclg+0fLq/QC5y2RWnZKZlTwqitNBwXpA00h
         Z9SDLRAe9PJF7oAWXlYvbtnfc/HsmNh110U/mGNiRygVQIYVRDqT/LQticNSklaykw6R
         hJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Du/hhsfyxWcxpgQGpllaOp8Y/c4cCcxaVQMJwvnkKk=;
        b=5jt2BuEWd3hnCTfLReuO9XHaFEDKxYosUyHNFV6kar3aBE+7/w9tmn71CEbIc9N8Se
         3AFUYXB4hHU+1+echsWfigsEocCXr74Z2+aURj31U7zdDz0PnJiZ6tao7wNuoYECTEbR
         4E5EHa5XAVBFFyRZOo3NMpTrWdCntrM8R7Yt7Msviont764GOWVWnYh0pguMhoI6L6Xk
         /u5oDpRVAO1fqWcJyy53/iPdkhINz5w96Xq1Mgrmks+z9Eo/KN6rJKbfdEhMWQsTeel9
         mTrGqbcv6d5W0uaBf7S2SMqH8HcZJwoMrnA+KQVMGTSaSh3XYref26w4DMABPDapbQHP
         DyZw==
X-Gm-Message-State: AOAM533dlox1fpnyJxro5zbfP6aXR+IOTJKI0bJCWxZTn9CnbswVtFj0
	U2z9VtMwL/MSuj6bfgQW6ppufFCoS4I=
X-Google-Smtp-Source: 
 ABdhPJw6GQSOhcrYqJozRksk0i5MxlBvUWxxAWymMvyeyGBYnIaesnmZILxxUnzLArlRs9APg2YlZA==
X-Received: by 2002:a17:902:ecc7:b0:141:e920:3b4c with SMTP id
 a7-20020a170902ecc700b00141e9203b4cmr23946538plh.64.1636005196237;
        Wed, 03 Nov 2021 22:53:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 c3sm4087742pfv.25.2021.11.03.22.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 22:53:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 2/2] monkey: Move content away from /var
Date: Wed,  3 Nov 2021 22:53:09 -0700
Message-Id: <20211104055309.117524-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104055309.117524-1-raj.khem@gmail.com>
References: <20211104055309.117524-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 05:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93814

/var is r/w sometimes populated at runtime as it can be mounted from a
different partition, therefore its better to keep it empty and only
populate it during runtime.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-httpd/monkey/monkey_1.6.9.bb      | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 1386770c8a..bd09bcfa64 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -17,7 +17,8 @@ UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
 
 EXTRA_OECMAKE = "-DINSTALL_LOGDIR=${localstatedir}/log/monkey/ \
-                 -DPID_FILE=${localstatedir}/run/monkey.pid \
+                 -DINSTALL_WEBROOTDIR=${datadir}/www/monkey \
+                 -DPID_FILE=/run/monkey.pid \
                  -DINSTALL_SYSCONFDIR=${sysconfdir}/monkey/ \
                  -DWITH_PLUGINS=* \
                  -DWITHOUT_PLUGINS=mbedtls \
@@ -38,10 +39,18 @@ inherit cmake pkgconfig update-rc.d systemd
 OECMAKE_GENERATOR = "Unix Makefiles"
 
 do_install:append() {
-    rm -rf ${D}/run
-    rm -rf ${D}${localstatedir}/run
+    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/run ${D}${localstatedir}/log
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
     install -Dm 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
-
+    # Create /var/log/monkey in runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} 0755 ${BPN} ${BPN} -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d ${BPN} ${BPN} 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system/monkey.service
     fi
@@ -56,8 +65,7 @@ PACKAGES += "${PN}-plugins"
 
 FILES:${PN}-plugins = "${libdir}/monkey-*.so"
 
-FILES:${PN} += "${localstatedir}/www/monkey/ /run"
-
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d ${datadir}/www"
 
 CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/sites/default \
-- 
2.33.1


