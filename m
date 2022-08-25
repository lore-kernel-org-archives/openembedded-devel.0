Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9360C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 00:03:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.18369.1661385801666090043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpaUhuqv;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id x19so17070373plc.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HVZFm0M8DtM1auFOL1R8g+EDcSTJ/QyesXbyHPnB9YU=;
        b=hpaUhuqvKf3lUUhM5QHXveyZ7NlNsuS0HtigQRdU5bCZsNRPcQZeTia4u89+4J+rwo
         9wLYpQB33iXAyrNqkG/zVxZoBhaJwBGIcT8FQpk8qsn3eauO8O8br4MYpLM2JB0/yeEN
         kd6C91VqlqgkkX0TWFXkM3DRD+esxhjsrokkyJ5q4W6s53KG+KwGe61FscvEIBKJeHxh
         fnvj7tThMluHopN14KumdY1f13hMyIU+3KLkSgFjiyd1pcT655i/xewXZsUHpYXwxlxV
         NrNFgddvfKBrOhHqjgvHmLMZub+M8lsR+WZtO4NQFnbt4nxILzZnuio+dfafA1iNaKeU
         daIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HVZFm0M8DtM1auFOL1R8g+EDcSTJ/QyesXbyHPnB9YU=;
        b=gr3qnNzpDbtySfp1jJ1Fzj4t6c84BwtV2wjm5+ZfDEO4Rj/ewdymbeNfeljrnzRS7K
         Ev5KzrSB2z230mr4D1pvCkE/YE6LNWiilrbl9p59wKkspxqBGcETHhoYx9Wd/Z4DVMqw
         9GyeaG70u8ez7SF9a2aWxI1QAHNxFuG4OYOSLoRkybJYV+CIF7bj3Xn16JquwqtJALzF
         HQcWhfDepQ4rWSPLEqwjnKMb6cj8gzCnNiGBmfF+nTw28u4rQ4vZFCpnqDyvMp1uuOIC
         Q8Opnb3WH6nrcRmnwgmeLu60Jkuvgp8dHdQ89xhnYtLGUOdnq0ASRwQIp4ziK1Js2g+/
         3HyA==
X-Gm-Message-State: ACgBeo3MYjaqqXtO9lb1ZvxNDEFxYcsM9Aw4cNUORDIkrGcgLxjuKmoX
	bJosZ+saZ8EJPMv7KFWZ1GDirlbEbhFqLA==
X-Google-Smtp-Source: 
 AA6agR4lCNPza5yG9NhIgUSpK0WsIXcQ/dhT4r62Kp7VL7DTJc1tvELgY+Uqmu0g0XFwWSgsnqHASg==
X-Received: by 2002:a17:902:a511:b0:172:97a7:6f5d with SMTP id
 s17-20020a170902a51100b0017297a76f5dmr1243138plq.159.1661385800832;
        Wed, 24 Aug 2022 17:03:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a170903244400b00172cdcdc183sm4236373pls.93.2022.08.24.17.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 17:03:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] dibbler: Fix build with musl
Date: Wed, 24 Aug 2022 17:03:15 -0700
Message-Id: <20220825000315.285545-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825000315.285545-1-raj.khem@gmail.com>
References: <20220825000315.285545-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 00:03:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98428

Use _GNU_SOURCE to compile which helps fixing build with musl
add a header reordering patch to again fix another issue with musl
builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-port-linux-Re-order-header-includes.patch | 33 +++++++++++++++++++
 .../dibbler/dibbler_git.bb                    |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch
new file mode 100644
index 0000000000..27a562bf22
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch
@@ -0,0 +1,33 @@
+From cbb33e1548fe526c3e7dead294617bde1f087ae3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 16:40:38 -0700
+Subject: [PATCH] port-linux: Re-order header includes
+
+linux/if.h when included before net/if.h casues duplicate definitions
+
+Upstream-Status: Iappropriate [Upstream is Dead] 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Port-linux/interface.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Port-linux/interface.c b/Port-linux/interface.c
+index 18777e91..19aefb2b 100644
+--- a/Port-linux/interface.c
++++ b/Port-linux/interface.c
+@@ -25,7 +25,6 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+-#include <linux/if.h>
+ #include <syslog.h>
+ #include <string.h>
+ #include <errno.h>
+@@ -42,6 +41,7 @@
+ #include <stdarg.h>
+ #include <linux/sockios.h>
+ #include <linux/if_ether.h>
++#include <linux/if.h>
+ 
+ int interface_auto_up = 0;
+ int interface_do_message = 0;
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index bdda35a24b..f57767e9b8 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -9,6 +9,7 @@ SRCREV = "a7c6cf58a88a510cb00841351e75030ce78d36bf"
 
 SRC_URI = "git://github.com/tomaszmrugalski/dibbler;branch=master;protocol=https \
            file://dibbler_fix_getSize_crash.patch \
+           file://0001-port-linux-Re-order-header-includes.patch \
            "
 PV = "1.0.1+1.0.2RC1+git${SRCREV}"
 
@@ -29,6 +30,7 @@ inherit autotools
 
 DEPENDS += "flex-native"
 
+CFLAGS += "-D_GNU_SOURCE"
 LDFLAGS += "-pthread"
 
 PACKAGES =+ "${PN}-requestor ${PN}-client ${PN}-relay ${PN}-server"
-- 
2.37.2


