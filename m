Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6025EC61DA3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.44852.1674653493595751910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WRNyP7Xg;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id d16-20020a4a5210000000b004f23d1aea58so3139343oob.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huCIkcJu35VZIDVeqSawy0FyQDAg004oPNKZMxQjJac=;
        b=WRNyP7XgG8Je/5ANEe/+HVzbeNIIhUfJv28WLUwtssZnxzrHf9qeM4RHLmqi/HNjnC
         Qj05XTEHaSt1yC5Zp7CASGzh+YQ2h1+XGidNuPOaSPa5Owevd1UzFtKi60EZP5Tf1lgd
         eV2qC5htRzc/bxxp+bJ5z1mhuyQFdTknPSTC/oJN+HDI8yz3HzsJAsxn0hXiS+E0Gou2
         li7TyVZaUzss/3BfiFp+tuZLAwt7fBxqWBmEC9C2WKnf1G0EAU1EfPRCVvyrQ/8EZM/Y
         Qcr70M0qBSI5DcLzPPPnCjAuLlDYTwRe0sFfQs4sX7AnqraHs3DBBh+vFjRXjUbylJN+
         SsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huCIkcJu35VZIDVeqSawy0FyQDAg004oPNKZMxQjJac=;
        b=R+xMuWz1V0mGN7wDk899e0vsY/BlTiN2UZ3BO9ZA4z0xJakHq4BwE1OouVMTG71wFV
         aUBIzCraDEK7JJeESD8mmuvk6//5ckmlQIx46HSZy326eOUZLhD17b7JjtYRrCWWvKzu
         H90ms5LeuOM5RRZWVSU5BQYZUtYp1tTqdZwRZIReBEc/bckzFsF1sGq49JCso8NQSJ2Q
         MTdFInw89Hc+/w5Rm7Nbe/4cVI386Lt3Esx59oiQXXvYekvpBZ/v8DjEIblwzzirI3Yc
         UlKl7+ug4fRnL2onHoGQ+LTFL5qmGOUHMCJHHI6vyOIgSs1Gr0Ls14cpjsZOGHWLNN1Z
         evVw==
X-Gm-Message-State: AFqh2kqfe8cLGZU9s8FQQXCtd4hEQ8Q8TjANprEipAD5czZa3VuCabPG
	pTiYsQCvrOU5lijSt/GkuM8qGtkMaFM=
X-Google-Smtp-Source: AMrXdXsv2C6YI1kZrhps/iKYShBPFSvsVgQU7YFxlfwG/j6+Xhn36ZOt2f+Wg8LSY70WLJ5pZErkzg==
X-Received: by 2002:a4a:ca19:0:b0:501:5214:d693 with SMTP id w25-20020a4aca19000000b005015214d693mr8524406ooq.1.1674653492794;
        Wed, 25 Jan 2023 05:31:32 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 07/41] freeradius: fix multilib systemd service start failure
Date: Wed, 25 Jan 2023 08:30:49 -0500
Message-Id: <c76cc68d151bdaa6b6bccb5a4c80b77e92d21d09.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100742

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


