Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10974C54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:22 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.46805.1673191280498950988
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JzMYRuSi;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id m7-20020a9d73c7000000b00683e2f36c18so3903845otk.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huCIkcJu35VZIDVeqSawy0FyQDAg004oPNKZMxQjJac=;
        b=JzMYRuSicC7wvtEBxkAxViEwNbVm1SXecWXxBafoTqirkjtoquWtqB1L3Shz8ZPZLa
         mAhKIXTNgtuB7aIHTBaOEjpg+p1Cjkf/Xy/VE4IlUdioxbhGX3qXxXAeZ0gu2SEbNsG9
         IEgertqomQ/2PVSaK/mW9Kk1g4zlkGOmARHN9XzbilTE7CcrSveFwEIfwWZ7vhoKw3iy
         sF8GtxsXPV2mJQfSQPbvp8PUUJ/fCNAFY5T2JLi4o8rW3onr5z49mnlbEDYMNOCvLLD2
         2v4gHqAXFA1UZ3uHqbM6KXfSxYddpW5kTtDQkZxraTuxbEQES4yx31aOejNKzM8GN7BW
         qgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huCIkcJu35VZIDVeqSawy0FyQDAg004oPNKZMxQjJac=;
        b=JLpGMMaOdI/hh9XQbwOjRvPASnHsN1FyjxSjnYadL2jFEnGncfy5AURlO5pI4+07rT
         LZo7ARRyE8C0/QtHQI5CwqpLllxadwYf0ObGkBw4p/iVw5gIrkuRWn7wzmREe9Jaf8bt
         x9mhdcdD0dP1P0zT0bR9fEJAZk0m00q0s8sY74GqnxKXBEdJBFES9RXbcQqfeRKycI+m
         +oRrdYZvriP0V1/FI7u2JYXwMqs4rWAXJcXJS6IJ0Qr+BTH9JfCwwy1XbnccfcPqHm+5
         h92uKc8RKc3vL2qjeOt6fn5AQWI0ef5cl/cGV/C8+/dYQf7eetCFc/ACnSptOIhTy+cK
         tUtg==
X-Gm-Message-State: AFqh2kptDwAlmxY1CnybazB9mUnPCqMtuNvP7UNb5/K77TN4ohZwhHlI
	kN1afJDIz2dMfsVo1nKAuesuz5+a/to=
X-Google-Smtp-Source: AMrXdXsD+VVMpW4C5XVXIRFpQXmXDmh5Md/NnM2zNBaLRUWm62Q8UGcayh3/QvjddfFB5Pn+jp6otQ==
X-Received: by 2002:a9d:6d9a:0:b0:670:7cf9:5504 with SMTP id x26-20020a9d6d9a000000b006707cf95504mr32214218otp.38.1673191279684;
        Sun, 08 Jan 2023 07:21:19 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 07/26] freeradius: fix multilib systemd service start failure
Date: Sun,  8 Jan 2023 10:20:42 -0500
Message-Id: <c76cc68d151bdaa6b6bccb5a4c80b77e92d21d09.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100452

From: Kai Kang <kai.kang@windriver.com>

It fails to start radiusd.service from lib32-freeradius that the
configure directory is /etc/lib32-raddb rather than /etc/raddb. So add
an environment file to export a variable MLPREFIX for the service file
to make it start successfully.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 172c707251fd1a646b8e63854b5f4c04ff044ce3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../freeradius/files/radiusd.service          |  3 +-
 .../freeradius/freeradius_3.0.21.bb           | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
index 37a2eb3d7d..7969bfb690 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
@@ -4,10 +4,11 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
+EnvironmentFile=-/etc/sysconfig/radiusd
 PIDFile=/run/radiusd/radiusd.pid
 ExecStartPre=-@BASE_BINDIR@/chown -R radiusd:radiusd /run/radiusd
 ExecStartPre=@SBINDIR@/radiusd -C
-ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/raddb
+ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/${MLPREFIX}raddb
 ExecReload=@SBINDIR@/radiusd -C
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 1407b798b5..b459412e04 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -199,7 +199,37 @@ pkg_postinst:${PN} () {
         # Fix ownership for /etc/raddb/*, /var/lib/radiusd
         chown -R radiusd:radiusd ${raddbdir}
         chown -R radiusd:radiusd ${localstatedir}/lib/radiusd
+
+        # for radiusd.service with multilib
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+            install -d ${sysconfdir}/sysconfig
+            echo "MLPREFIX=${MLPREFIX}" > ${sysconfdir}/sysconfig/radiusd
+        fi
+    else
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+            install -d $D${sysconfdir}/sysconfig
+            echo "MLPREFIX=${MLPREFIX}" > $D${sysconfdir}/sysconfig/radiusd
+        fi
+    fi
+}
+
+pkg_postrm:${PN} () {
+    # only try to remove ${sysconfdir}/sysconfig/radiusd for systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
+        exit 0
+    fi
+
+    if [ -d ${sysconfdir}/raddb ]; then
+        exit 0
     fi
+    for variant in ${MULTILIB_GLOBAL_VARIANTS}; do
+        if [ -d ${sysconfdir}/${variant}-raddb ]; then
+            exit 0
+        fi
+    done
+
+    rm -f ${sysconfdir}/sysconfig/radiusd
+    rmdir --ignore-fail-on-non-empty ${sysconfdir}/sysconfig
 }
 
 # We really need the symlink :(
-- 
2.25.1


