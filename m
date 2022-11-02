Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6200C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:42:33 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.3805.1667378550568730892
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UWOzKK6d;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id e15so12005069qvo.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Crlu3AV8xZZ05iRqMGYVAiImMTGpbo9ebHkTx6dr4WA=;
        b=UWOzKK6dqUaeDq7pnIGWhHi5B6JLUl+QDXHJBHM/P6JSYVkfCoi42Spe7/c0SKVVqH
         nAZBbCRgJK9iBMXULe/KBF4TuxENfPq5Eo9xwryYSl8OsFIpb+py6RYylh7qYPnJzrCN
         /SehZ7Km6deNXaBuHB9s/JbgYsIYoHa6v8XVEWauMqXvrJF06mFXHpvcg4PDGfEJeL3C
         7xNMGsDJhE+5/R3ZECs+TWVpk8iuDzSEIY+ZBXvjifJcPBJiRwkCG9hxRJR7jOr4ITdT
         +k8lzbdr4VNlDrs1vq7Kc0kqeIpYGYl36gBhVR6ECkdawoWlgKBm7ek5DFditX+IYDzm
         25Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Crlu3AV8xZZ05iRqMGYVAiImMTGpbo9ebHkTx6dr4WA=;
        b=gi62wRgXNx2N0JVesNOb2ZowwC7FMURFjrKAE6LWhlTa82d1xOEk2xkcG+dQvkx3e1
         HM4vDNiUzjkKZ2RJC7l67KozIiRM55/sEaIpWOSomU8ASDK2L+2CM7jCHqxYgKJZVgYD
         oMmihZFSNpt7nXn0q2KkojeuU668WInm8qFeFbbR3B6ColX2c/iOP/mKsde5mptuSZJF
         eSsALC24JgG2Z99jkW42sfxt0yA+MeyGnTxUsekDYVCBEVROdLEnPNiPVeCglaN4UzCB
         q/xMWZ2gUuOwz1LYjzkpaeVelqIoE0qOqR8Ue76+yImK7SStvVWWwIuGrrPu0+T+O9yC
         s0ug==
X-Gm-Message-State: ACrzQf3EyHE2lkBD8ICQmGPU8wAySPpPdYAzxdTVMUsR5vZuIllv3ZxG
	Z4s82f9etVFXRnexJyYU7a6opLDA1kFL5w==
X-Google-Smtp-Source: AMsMyM4h+b3N9FKxlDWu9mRCDGfPsm+51KUQ3zTWJmq6JzLUef4Ur0LJV9vWYt1jC4khrUpb6+84Pg==
X-Received: by 2002:a05:6214:2528:b0:4b8:2025:5f6e with SMTP id gg8-20020a056214252800b004b820255f6emr20017440qvb.88.1667378549211;
        Wed, 02 Nov 2022 01:42:29 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8259:e903:8d8:7eb0])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a450b00b006fa2b1c3c1esm5631202qkp.58.2022.11.02.01.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:42:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Howard Cochran <Howard_Cochran@jabil.com>,
	Howard Cochran <howard_cochran@jabil.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/5] ufw: Fix "could not find required binary 'iptables'"
Date: Wed,  2 Nov 2022 04:42:23 -0400
Message-Id: <20221102084227.1210486-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 08:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99410

From: Howard Cochran <Howard_Cochran@jabil.com>

Switch from using DISTUTILS_*_ARGS to SETUPTOOLS_*_ARGS to correspond
with the earlier change to use setuptools3_legacy instead of distutils3.

Without this change, you will get the following error if your build host
does not have iptables installed:

Fixes:
  ERROR: ufw-0.36.1-r0 do_compile: 'python3 setup.py build ' execution failed.
  Log data follows:
  | DEBUG: Executing shell function do_compile
  | ERROR: could not find required binary 'iptables'
  | ERROR: 'python3 setup.py build ' execution failed.
  | WARNING: exit code 1 from a shell command.
  ERROR: Task ([snip]/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb:do_compile) failed with exit code '1'

Also, although the build will not fail on a host that has iptables, it
could cause a problem if it is installed at a different path than where
OpenEmbedded's iptables will be installed on the target.

Fixes: 3e2ed1dcc088 ("ufw: port to setuptools, use setuptools_legacy")
Signed-off-by: Howard Cochran <howard_cochran@jabil.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index b6a768e08a..c479eefba0 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -70,5 +70,5 @@ FILES:${PN} += " \
 
 REQUIRED_DISTRO_FEATURES = "ipv6"
 
-DISTUTILS_BUILD_ARGS:append = " --iptables-dir /usr/sbin"
-DISTUTILS_INSTALL_ARGS:append = " --iptables-dir /usr/sbin"
+SETUPTOOLS_BUILD_ARGS:append = " --iptables-dir /usr/sbin"
+SETUPTOOLS_INSTALL_ARGS:append = " --iptables-dir /usr/sbin"
-- 
2.25.1


