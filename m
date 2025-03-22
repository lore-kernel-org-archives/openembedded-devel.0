Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB17C36001
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 00:09:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.690.1742602164380133007
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 17:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TG56X+YA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: joaohf@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224172f32b3so4518065ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 17:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742602163; x=1743206963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFGmZ3x0IT1+MQadmdDFdrQLIqNXeTW8nCDnmH+0bmA=;
        b=TG56X+YAFhmsocnrdJxIxIQyCupfNFjqFUbydXNWWvi56BgwCD9X4OQSqrqNJLvHcd
         A0d2xmrxy10W7DkFOBGCTjZ2vvglX07B9xdGtrTYHFk8OihGnQ+aIA7eu1xQbKK7+L3Y
         DdurYrlyNks1B9pJbOAcfYP0fGpUoYpre/Hs/gS8rqpYC8dxy35SKyUtIMyFAVoEH1kH
         BWvS1rJj7Epd4+BHDtqkKb/WTldAs7Tru0BDt7yA4geX/xlLi3/HtYZ5LAGFo2d/2IqP
         c7Q6HBoW90BLSMgFDzUqOfeYrZx1vDPSEDp/G3TmPDbZw9jmyFi6jwMaAQTBBhNkOTJj
         PkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602163; x=1743206963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFGmZ3x0IT1+MQadmdDFdrQLIqNXeTW8nCDnmH+0bmA=;
        b=hBpK6/T3a4ot+E82TYIotZwM52SPy4PkLGfFpd0EBfG8McGscCzOYNZLTVcCnRIr+M
         Kv1QFTlCIEgRBSLrDeq6TvsXcZYOY1U9oHO2As17Z5jcMSZtowANaqufANBZo8GeBx7/
         mg34uHn/CO9GEwbK7FvxDFTTtax7+xyOI7wffoDC+hUBVqbwabCYYmUwnJ1/qtW1uMjj
         Pjr+TQ11xI56zp+RId79S6/ShrPwlegcd2FITMItpr8WkCXP0LLUCZCXCOgVjIqmZLtd
         7Z4Smt3sZZvt23P9WqXTSQ01NUtHO12uIsFrZ1Fr7wS4OOdaCbXUGggYcG/1DiFDTmQ9
         gDqw==
X-Gm-Message-State: AOJu0Yzl4O7b69VkQt1jrkLDOEyj9A/vudaZNhQ+lWpPWrlVaNEVPz+E
	01emxblq19yp0uHQNW5Fa1Wg4QHa7ftbqkoxt7O7lUg5jaECKyBO5bmPIA==
X-Gm-Gg: ASbGncvMAHEXvL5vuouVWPcFd7hBSFj6BkhqUaMCksBDd0HTzN106dcrSdSktS3Zw3E
	9IIu9nxXHhaxG4IzM3L/Ajxn3et6D1uFU28YgnX2elwvt0g41AUxsmgj+akkofDAoUUqDNFIiVR
	v97MuBe1Ro1QxcdoopQHK/PxPF+s27lk6jeaHjx/4948qBWPQWOj4W5s0umhfwrxMNNskeOSDkk
	7epUnLdmdRpvMQIkmII4HrCXFOU++62DcaFR/98cVPsjkl7L5QgWSEBDq2+rl0RyuLXivclHopc
	RfEOFfOMYGtPGkYwc2QJk4TqK/jj/DxYfOs=
X-Google-Smtp-Source: AGHT+IHfUOPjxSSC+UPVb5Av0k1qilUIkob0AFlvY3XExkNbYyn+iSCozjuCaGHjydnZMIcuWb9i4A==
X-Received: by 2002:a17:902:fc48:b0:21f:1365:8bcf with SMTP id d9443c01a7336-22780de63a0mr36725625ad.10.1742602163155;
        Fri, 21 Mar 2025 17:09:23 -0700 (PDT)
Received: from porco.. ([189.79.243.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811d968asm23816015ad.162.2025.03.21.17.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:09:22 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [PATCH] iwd: add systemv-init script
Date: Fri, 21 Mar 2025 21:07:54 -0300
Message-ID: <20250322000754.563211-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 00:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116192

---
 meta-oe/recipes-connectivity/iwd/iwd/iwd    | 42 +++++++++++++++++++++
 meta-oe/recipes-connectivity/iwd/iwd_3.3.bb | 11 +++++-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/iwd

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/iwd b/meta-oe/recipes-connectivity/iwd/iwd/iwd
new file mode 100644
index 0000000000..89fc75c9ab
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/iwd
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+DAEMON=/usr/libexec/iwd
+PIDFILE=/var/run/iwd.pid
+DESC="iNet wireless daemon"
+
+if [ -f /etc/default/iwd ] ; then
+	. /etc/default/iwd
+fi
+
+set -e
+
+do_start() {
+	start-stop-daemon --start --background --name iwd --quiet --exec $DAEMON
+}
+
+do_stop() {
+	start-stop-daemon --stop --oknodo --name iwd --quiet
+}
+
+case "$1" in
+  start)
+	echo "Starting $DESC"
+	do_start
+	;;
+  stop)
+	echo "Stopping $DESC"
+	do_stop
+	;;
+  restart|force-reload)
+	echo "Restarting $DESC"
+	do_stop
+	sleep 1
+	do_start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
\ No newline at end of file
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb b/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
index 84b1795995..9d5b3658ae 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
@@ -7,10 +7,11 @@ DEPENDS = "dbus"
 
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
+           file://iwd \ 
            "
 SRC_URI[sha256sum] = "8189e15e701112f871fb5f5e9351f007c9098754b4168ed43cc5422a3adc0255"
 
-inherit autotools manpages pkgconfig python3native systemd
+inherit autotools manpages pkgconfig python3native systemd update-rc.d
 
 PACKAGECONFIG ??= " \
     client \
@@ -24,6 +25,9 @@ PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
 PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
 
+INITSCRIPT_NAME = "iwd"
+INITSCRIPT_PARAMS = "start 04 5 2 3 . stop 23 0 1 6 ."
+
 SYSTEMD_SERVICE:${PN} = " \
     iwd.service \
     ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)} \
@@ -36,6 +40,11 @@ do_configure:prepend() {
 do_install:append() {
     # If client and monitor are disabled, bindir is empty, causing a QA error
     rmdir --ignore-fail-on-non-empty ${D}/${bindir}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${UNPACKDIR}/iwd ${D}${sysconfdir}/init.d/iwd
+    fi
 }
 
 FILES:${PN} += " \

