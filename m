Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFE5C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 13:52:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.11943.1636033922930244394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 06:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bSecWwXU;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id s24so7394231plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z8oCOdkFhyUzGWRkdeift6pmHnbnRGAyLpXEa9FpZs8=;
        b=bSecWwXUoKp4kEEXiNYPaiQ1hD94DBT2WVLuP+2n544Dq5+Q9WriHJwo6AGGhHLv+n
         86XQYstdTuzRvd6MVladHiUWbIpMohSwU6E9Ky76F3MxbSpw54pf4Nj5pWbMoUyR0j7b
         3uWR8Kjh5unzgauvrEs7cQjFHzsW9LLYSAuJ4rMBohnQVD0QoW8rVlO2zjAdbpU8d/zB
         4tx1L5kEog9ShQejSBy3hQaBXboK//DY31lQVnyt0FgxmdYURvhpjN6pmqi0KjJJeBXv
         NTB+EmWwU4BZ+ezj7k3kiPttQnnFhBo10GFxTyOTBO0c155SQontClq1wTdtmvkCqPse
         AR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z8oCOdkFhyUzGWRkdeift6pmHnbnRGAyLpXEa9FpZs8=;
        b=cRQbg6p1mLwcE+uuai5JZt8neCm+3rx0Iiiq/lnbe0coRWUgR5Ao+cRaSkyRN/ypJQ
         gwm0eewdsyxdSvcs+I3a/4XGCcgysp6N0fDAL49TzrDuZ/vrpNq0yEM7VGnH6NiMqTTA
         SGMFXTc4KwREN83ltRlf7HEXnK+GkPAxwIyJt/HD0KMpA55QUBI5Exs/9kFw8iuNU2OB
         GtNjg11P8cGmvGbIoNjtbw+OWdL/7GZCfV0EbIOiBpviQd7qjocjXd4xx7ci9GUOtBnV
         NQMDhXn279HUJuZxzFN5RBeXqlusrhASQvXa0htKGFvONpFXtzbfrioqsKR4NZ2UzsWj
         aSMQ==
X-Gm-Message-State: AOAM532dI0iX33ZGZxouOmE9dlEMNHydzXQC3VpVrea4jdVUy3IJ7jY/
	s/kuPZqW0IYukrZjSyw37xj4nbUtp40=
X-Google-Smtp-Source: 
 ABdhPJwFD0OI9xGlj7B17ox164Ie82xUMAl0951cHM0VTPy7o5MDdwuMPHu92OoH9eVlWtDDeGWZqw==
X-Received: by 2002:a17:90b:1e06:: with SMTP id
 pg6mr17025452pjb.137.1636033921880;
        Thu, 04 Nov 2021 06:52:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id 8sm7476509pjt.46.2021.11.04.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 06:52:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH v2 1/2] monkey: Keep /var/volatile empty
Date: Thu,  4 Nov 2021 06:51:58 -0700
Message-Id: <20211104135159.2379714-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 13:52:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93818

/var/volatile is populated at runtime as it can be mounted from a
different partition, therefore its better to keep it empty and only
populate it during runtime.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Limit the change to /var/log and /var/run

 .../recipes-httpd/monkey/monkey_1.6.9.bb      | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 1386770c8a..fff406a3f2 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
 
 EXTRA_OECMAKE = "-DINSTALL_LOGDIR=${localstatedir}/log/monkey/ \
-                 -DPID_FILE=${localstatedir}/run/monkey.pid \
+                 -DPID_FILE=/run/monkey.pid \
                  -DINSTALL_SYSCONFDIR=${sysconfdir}/monkey/ \
                  -DWITH_PLUGINS=* \
                  -DWITHOUT_PLUGINS=mbedtls \
@@ -38,10 +38,18 @@ inherit cmake pkgconfig update-rc.d systemd
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
@@ -56,8 +64,7 @@ PACKAGES += "${PN}-plugins"
 
 FILES:${PN}-plugins = "${libdir}/monkey-*.so"
 
-FILES:${PN} += "${localstatedir}/www/monkey/ /run"
-
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 
 CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/sites/default \
-- 
2.33.1


