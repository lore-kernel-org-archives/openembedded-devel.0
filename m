Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B004C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 05:53:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.7822.1636005193697990678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 22:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pOrhC7bu;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id n85so301794pfd.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 22:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2ZraT4cSi41wAUKpMk4a4HGjLJvf3DW0K9cqqu94pE=;
        b=pOrhC7buGTWlytU2WmLk+mt+/4ICaxN7UGGi2nCiqypnV/lJJddpatoKXG2KyFGGBc
         ghAoVydYNGFIWQt+8YNDXcldx/HXvzJk7ozaxq1B0erC9zkHcnuidALfWqCW4WCwr3/F
         7NOh7vWgN5sLf4w6MEEonwNQQT1hhkLlf8uNRa5scu7WTEWTI7AEVi7vXFYsIPetDyLB
         tLn9m6j06M7POx+d1fa4bmXGUQcj0Csi8JYUaGLdNclAiqAbujhz4ZGJajUdO7ryZsk9
         KXnBV1yxUTkAY8VZVt5FlxHTHDCwn5m5QTzsjIGQlkTkA6KsWq6Q3JNL0KW6ejwHp52M
         b1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2ZraT4cSi41wAUKpMk4a4HGjLJvf3DW0K9cqqu94pE=;
        b=SHUU+1BP+iG8mePP6ZcJsZuYgpF1KAJdQZ5IsgA+XWZpBtFpoH7l7xmuPVtl3nbXH0
         bH9oh8FifJ8wEMhhtZQSRI//ik30xBej7spGVpYQV7mJTU5vne9VF5VGrODnjKPa8ogv
         sXY5JpjaY4CQZ4wgPgC24CmDUIgc+BSlddRNTx1AOM9fxeGy8gA0Zemk4PckA8gAzgdW
         cgSZK3R2tuhdEpfXAX7yI4RKUFVxtoKKa2daydkboWJf/Uu0QaQZJt8D512zKNWFH+Vx
         WiADMMcRFsL8JAE/xY4qI3hjky/ujGkFamRXnhBZ1UWSoN7rRkpcmNQtQMJ4BeKSqioC
         /VFQ==
X-Gm-Message-State: AOAM530A1Fp/p/UqCccQ75xth3sSjjhTSDamHjt2jcJNBf+mk1XFRdUj
	UMj1uVCwHZygzvv+a2UUnTAWRHiimcE=
X-Google-Smtp-Source: 
 ABdhPJw6G5Z75+3D+aTQSUECSBUF5YvEUWqVEUL+TB67kfqIPlHbgZ2LybhiXh3pNdmbsI40IPfnBA==
X-Received: by 2002:a63:d756:: with SMTP id
 w22mr32766745pgi.281.1636005192971;
        Wed, 03 Nov 2021 22:53:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 c3sm4087742pfv.25.2021.11.03.22.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 22:53:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] iptraf-ng: Create /var/log and /var/lib subdirs
 at runtime
Date: Wed,  3 Nov 2021 22:53:08 -0700
Message-Id: <20211104055309.117524-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 05:53:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93813

This ensures that /var can be empty during build and populated only at
runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf   | 2 ++
 meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb              | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf b/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf
index 1c79f0d8c3..ebb9d67800 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf
@@ -1 +1,3 @@
 d /run/iptraf-ng 0755 root root -
+d /var/log/iptraf-ng 0755 root root -
+d /var/lib/iptraf-ng 0755 root root -
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
index 115bbf082b..27a0f4441d 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
@@ -41,7 +41,6 @@ do_compile() {
 
 do_install() {
     oe_runmake DESTDIR=${D} install
-    install -d -m 0755 ${D}${localstatedir}/{log,lib}/iptraf-ng
     install -D -m 0644 -p ${S}/iptraf-ng-logrotate.conf ${D}${sysconfdir}/logrotate.d/iptraf-ng
     install -Dm 0644 ${WORKDIR}/iptraf-ng-tmpfiles.conf ${D}${libdir}/tmpfiles.d/iptraf-ng-tmpfiles.conf
 }
-- 
2.33.1


