Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93BCC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:11:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.8185.1700212274451439207
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=X+rsw8/5;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4083740f92dso13839065e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212272; x=1700817072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DAXf7mvs5e5W1OzwZNPKi1I/9Ica8AqRUmdN1/fI1c=;
        b=X+rsw8/51xj2eORB70tzYJc8Pn9pi+pzXaazLSzb0wlK+O4vKfdNOQYdyEBdge2THo
         9SgnLJug4kfVApLu0PcN0LjbEFNp+QLOD3RGDMdy2aRq0amErOBxmTiNDzJeYb0c53UI
         VqDZcmRUMqUTPeMqSEQIyu7HY4jmTLkzl1YpME9xvOVOs55AUIzCqLyiuL/RrAdf9Pcw
         +PzHutgVepISL0y284a6mR6xz00DOOngcb1HmHICP391B8WjHq3tNsvqz6L18S0Qry9J
         N8wtsmcawqk8pfc/A9hjMrO3fJWObZjK4P8Fp2k4EKUsKHUcNiAAusWUQ4UYJDKesuNj
         QaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212272; x=1700817072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DAXf7mvs5e5W1OzwZNPKi1I/9Ica8AqRUmdN1/fI1c=;
        b=aI7U0UmiVHh40Xru2DmAZ5sDegLtSsTuu6DFMX+bWVnLDLsg+h3ExDkEyogMhV64Fi
         yFMUdkRGBNa/8eZ31379e51Ux0IBLl5CTCQMbul/tpqoOZfv3+/FMlNaOG5hiIj/P0WU
         awQn1qfYWJI3nZDtOnH6z86SCTkEMQTT0fN302vSCErLUgWy+XTlEVU3oZ68gKbXaS5N
         CnILf+Gm3fLGDgO/g67TCy89VZ3EdyjBkyH35HdMg0poTRVc6dj4PysdPFxKcvcd/lwG
         P9tagy3b2oVRc7SwG0s208AKnubCqtngqj4b1Khaa7lI4yCMFcl+aCI3hDjybO9vIPCz
         4DDg==
X-Gm-Message-State: AOJu0YxUDHOFFng9O9ue2eYmJIOskLi3l8pkg1IeSE/EFQ7oovMjkBfM
	SaEuswdmrZn+sVBCoj1MmYXRKZtSxyNRnzP8Rp4=
X-Google-Smtp-Source: AGHT+IGEsfYo2Xij6zXxFQjGObBjiQDm7W0Mhq0YnitcsSTODFXQLDdjIbMDq0VFAfoIRLz8G+KV+g==
X-Received: by 2002:a5d:6d0a:0:b0:32f:914e:4287 with SMTP id e10-20020a5d6d0a000000b0032f914e4287mr13470214wrq.5.1700212272436;
        Fri, 17 Nov 2023 01:11:12 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d51c3000000b0032da4f70756sm1709341wrv.5.2023.11.17.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:11:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][kirkstone][PATCH] meta-networking: Drop broken BBCLASSEXTEND variants
Date: Fri, 17 Nov 2023 10:10:58 +0100
Message-Id: <20231117091058.449899-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106860

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1b332f2eff7df2336ff87917cd48249edf763a2)
Backport: Adapted modified recipes to the ones generating warnings
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 +-
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
index 0c9ccc810..ea9eb4857 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
@@ -89,4 +89,4 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --shell /bin/false \
                        --user-group mosquitto"
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 004330e1b..341eab015 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -33,4 +33,4 @@ do_install() {
     oe_runmake DESTDIR=${D} netsniff-ng_install
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
-- 
2.30.2


