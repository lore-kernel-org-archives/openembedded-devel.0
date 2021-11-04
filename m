Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0772DC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 06:30:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.8161.1636007428543705716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 23:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A2guvED/;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id y1so5563614plk.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCmse8KuQESaSagOYnkQCLbnOYDlvzSDM9JJ0PwZ+PU=;
        b=A2guvED//hfQRvv95+H/TjW2q790YYcrsQO2gNDOiT7Llog/jVlpmABnUT34rypxMJ
         eh/OmLau56z3j2RfJ95iATKci1fG2EtzjSH5eJxnxxAE0aFlUKKm54Xd3rt1qIQMhXBR
         W0zWEWz+FJmJmpK4T/VVlmxaoqnZzdCKwaPcxBNn5AbqWa91KSc8TwKtrs3m/ahKuU3x
         LS/zyKMm0EhyXfup5S/DZvZOGNUF9wHNYaDsI57kZr1iFQh7GoB+c4bn4f+atFa+4o0g
         25JLLsX7vo1n4C+2WpOnN0uaCYUKBd0VFAf8unZQJ9+vvFp+QRKbmg1pOuDCv7uCM1uD
         pPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCmse8KuQESaSagOYnkQCLbnOYDlvzSDM9JJ0PwZ+PU=;
        b=id1pL/rk4PervzL6qfnpeS1GN0UCf7cFjVL8PjEb9GJdRISIXgUmv0ipxQ9kEm/W6J
         qTT4EQ43i2kzxG+kJFCz6tmxxl5r6xTFZqtEBg0DJquYz15txU1E8E74m5t27GhneeSa
         oEJ1JdLxLmbattv4CumMa55E3KtMhv5csp0XTXTyiijzpXNBP5v9IkwIDLlrXdaBxUSb
         klnFCI7NH+fSmsoCKjp3y/EDmHby5KvIJXX4q16Pe+ThB6urPFjTgdA23vkeI4/miOQj
         7WVtHj7Wor6DXFAApU58HP4CT/jV7DfzmddbJNYfzDw1MqBkCGeFTmTvkAW3U1M9VBKJ
         4ZIQ==
X-Gm-Message-State: AOAM530/eqXPLmI/qhofxnN9/Mtpt6mTh9zMK8VAq6g9mxtcrmT2Wrjo
	eaWq44ECUh0vzJdjFqdOs/92YFXQtdo=
X-Google-Smtp-Source: 
 ABdhPJzbcRWqEnW6T2wEulUXpcebTeikhoLEsaVsu2kT6Ro+p4+EGCU1Jgrm5uVU9POQTro7uU75SQ==
X-Received: by 2002:a17:902:c404:b0:142:28c5:5416 with SMTP id
 k4-20020a170902c40400b0014228c55416mr5161940plk.62.1636007427919;
        Wed, 03 Nov 2021 23:30:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 nm13sm3242248pjb.56.2021.11.03.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 23:30:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] hiawatha: Create /var/log /var/run at runtime
Date: Wed,  3 Nov 2021 23:30:25 -0700
Message-Id: <20211104063025.151460-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 06:30:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93816

Move WEBROOT to /use/share/www from /var/www
this paves the way to empty these dirs which
then can be mounted freely

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-httpd/hiawatha/hiawatha_10.12.bb  | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index f66ec7d736..ff3c3bf659 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -33,6 +33,7 @@ EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DCMAKE_INSTALL_SBINDIR=${sbindir} \
                   -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
                   -DCMAKE_INSTALL_LIBDIR=${libdir} \
+                  -DWEBROOT_DIR=${datadir}/www/${BPN} \
                   -DCMAKE_INSTALL_FULL_LOCALSTATEDIR=${localstatedir}"
 
 do_install:append() {
@@ -50,7 +51,26 @@ do_install:append() {
         install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
 
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}" "${D}${localstatedir}/run"
+    # /var/log/hiawatha and /var/lib/hiawatha needs to be created in runtime.
+    # Use rmdir to catch if upstream stops creating these dirs, or adds
+    # something else in /var/log.
+    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
+    rmdir ${D}${localstatedir}/lib/${BPN} ${D}${localstatedir}/lib
+    rmdir ${D}${localstatedir}/run
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
+
+    # Create /var/log/hiawatha at runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} - - - -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+        echo "d ${localstatedir}/lib/${BPN} - - - -" >> ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+        echo "d root root 0755 ${localstatedir}/lib/${BPN} none" >> ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
+
 }
 
 CONFFILES:${PN} = " \
@@ -61,4 +81,5 @@ CONFFILES:${PN} = " \
     ${sysconfdir}/hiawatha/php-fcgi.conf \
 "
 
+FILES:${PN} += "${datadir}/www/${BPN} ${nonarch_libdir}/tmpfiles.d"
 FILES:${PN}-dev = "${libdir}/hiawatha/*${SOLIBSDEV}"
-- 
2.33.1


