Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2DDC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.26026.1651346363402208727
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cHQvxNW2;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c23so9740179plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ggLPP8Yxi1tskPTj4u0l5pf8hGNllU4zxhhj76N4mUo=;
        b=cHQvxNW2j3J6jGYNgK6oPsnWePi/1+XuRpNEhlQjT+uKpvA3KpO0RctfZBblXYPziW
         Nq7z3A8wyWE48Qdg7ebezxXUWz42Po/uvZK+0F7VtWEMQzMdO+ngYHhO20PDsptlv99W
         /cMuIALNaB1RJBHkfIuNilrM9gZ2jG0Mfv0bsfBBwZfJ1cS5pkK/RsiDTg74rEmDWZ0R
         pEuqsxgNgbsYEvgRqz3v3E+3Eg7AS0ht8ukfQkI+9imVUyYaP87SCb69SthRhG3Ia68W
         B82Ib6M53RQ+8GmVojRxh6ULwPbh0NlLM+Fom+ASI/uqvErH9Ee577zkprNseoGt5XAH
         dWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggLPP8Yxi1tskPTj4u0l5pf8hGNllU4zxhhj76N4mUo=;
        b=qWoUdKcQEMFQySB7SFQoOJsa6Jgf6jua90BgdVJnlh4tLFNv8wna8dX2iVi7CmS/h0
         7VMkdT8uZHglPJ7nx9wz0RTIH+tmKozVTZ6oxE47xuWmlwJRPQS4dD8mKoks6rRguWBo
         YJHDf1KukXCAvzreKO8fFzYB47wwy47f9TmRLQeoeuSjITzFUAUk5LpEgQX9Df87zNzg
         Gj6cK4OcYRSLbY+zBrYdTcBBr9zBp+6oYDWRSHaSlrEOovpijZETGor8OwimwbvmRdgA
         s3kz/ZOWj66grfmbON0FsWe92rFY/Iw08PHGMyN4qDrlV7ZRcjB5Jv+taqj2iAD1QJHH
         2ejg==
X-Gm-Message-State: AOAM530lK5SXjQ43iS3fY9ANXseUnogQgrdR0HCV/XEXW17hCdWnzZY1
	7aKoTlGeWC5a7zZWAonwwJJ8pqjCUxOghw==
X-Google-Smtp-Source: 
 ABdhPJzcy3VRJy5wKjYfrN2ybUZCDOvmWCC15gLFBvc2CAMlTsEcmwoksDNc7ihuBJwr1jgEVRKbEg==
X-Received: by 2002:a17:903:2043:b0:15b:f6ff:79ed with SMTP id
 q3-20020a170903204300b0015bf6ff79edmr4694319pla.15.1651346362590;
        Sat, 30 Apr 2022 12:19:22 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 35/39] lirc: Delete systemd unit files on non systemd
 distros
Date: Sat, 30 Apr 2022 12:18:15 -0700
Message-Id: 
 <8fc9b551f97fed044ccbad3c555d7dacad75b02b.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96902

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5255b6a0d93daeccc4238dee5148686168d52a06)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index f2b751928a..fe9685924b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -68,15 +68,16 @@ do_install:append() {
 
     install -m 0755 -d ${D}${sysconfdir}
     install -m 0755 -d ${D}${sysconfdir}/lirc
-    install -m 0755 -d ${D}${libdir}/tmpfiles.d
     install -m 0644 ${WORKDIR}/lircd.conf ${D}${sysconfdir}/lirc/
     install -m 0644 ${WORKDIR}/lirc_options.conf ${D}${sysconfdir}/lirc/
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -m 0755 -d ${D}${systemd_unitdir}/system
+        install -m 0755 -d ${D}${systemd_unitdir}/system ${D}${libdir}/tmpfiles.d
         install -m 0644 ${WORKDIR}/lircd.service ${D}${systemd_unitdir}/system/
         install -m 0755 ${WORKDIR}/lircexec.init ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
+    else
+        rm -rf ${D}/lib
     fi
-    install -m 0644 ${WORKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
     rm -rf ${D}${libdir}/lirc/plugins/*.la
     rmdir ${D}/var/run/lirc ${D}/var/run
     chown -R root:root ${D}${datadir}/lirc/contrib
-- 
2.25.1


