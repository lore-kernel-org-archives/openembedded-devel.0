Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625EAEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 05:50:38 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.33530.1688968237656623245
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jul 2023 22:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e5xkS7HN;
 spf=pass (domain: mvista.com, ip: 209.85.167.173, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a3b7f992e7so2791688b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jul 2023 22:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688968237; x=1691560237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXAdIMg1Cqt23OBKW5n8/h/Otx9LvGha8GH0NErvPXc=;
        b=e5xkS7HN6XqTpZ9oHeFI6dUqvQ540sRoPlXkt+XJ2cH7TKn18oSRQnW7UWkRUN28n/
         nXuXpj/roxILXLN7ehdpXcUcY6yk6qB6l+TzZKzYKHRtpYUdzZK6zYlexVdYGlGT8ANl
         uiUjUYnBYapDBN7UW1iNY+ou9U0RPlj5emeGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688968237; x=1691560237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXAdIMg1Cqt23OBKW5n8/h/Otx9LvGha8GH0NErvPXc=;
        b=ARcT8XmdJmMxcnrzpgvwvEVAmaFVaVMS7VtWik7eug9vExotP/uS7pn78a+SfqAsDp
         TKucxQW4Z21LYSOx/X/wgYS9pyIlcy1jzMaJrOlxJm5VAHcGMzXWRHA6cyDnrZvTidmS
         xSE557B5q12lWVhwlNjoZFhm6JkI0PdDdGNbfe2E7oqLTYlxAoLPZVjoGGH/ey/tbxK6
         4WocuM9+6vRMaVdTYglHAGTLPAtVn3lW4m6KKJU6DI4dFK2C8Jp4bZA+lUifzaZj4WxS
         KCvso/bE2Ylk5foz/VeWLMzUV9iruRcDEXV/kIIY8Bd5wACaAT0Fa3OXmDoxyMSja3SG
         B5+g==
X-Gm-Message-State: ABy/qLYfjpUQqaYe+yNLKdABSqstnBcqaXPjOpUGyQSJF2Zoo7ardSwG
	77DiPEfHmYGbAznMdTXW+eLfUAF/BTBUtAd+Y+UC3w==
X-Google-Smtp-Source: APBJJlFZoZ83kClMa0KaLwO1Q73sRy85yyfiRPfi1gZxYOYckvfxjMieM2/X7DS4C88ki5mQctJ3lQ==
X-Received: by 2002:a05:6808:1797:b0:3a3:f51e:83c1 with SMTP id bg23-20020a056808179700b003a3f51e83c1mr4781588oib.43.1688968236721;
        Sun, 09 Jul 2023 22:50:36 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.194])
        by smtp.gmail.com with ESMTPSA id r8-20020a635d08000000b00553dcfc2179sm6565180pgb.52.2023.07.09.22.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 22:50:36 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 10 Jul 2023 11:20:31 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] quagga: CVE-2021-44038 unsafe chown/chmod operations may lead to privileges escalation
Date: Mon, 10 Jul 2023 11:20:29 +0530
Message-Id: <20230710055029.42129-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 05:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103720

Upstream-Status: Backport from https://build.opensuse.org/package/view_file/network/quagga/remove-chown-chmod.service.patch

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../quagga/files/CVE-2021-44038.patch         | 117 ++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc       |   2 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/CVE-2021-44038.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/CVE-2021-44038.patch b/meta-networking/recipes-protocols/quagga/files/CVE-2021-44038.patch
new file mode 100644
index 0000000000..bdb48a3993
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/CVE-2021-44038.patch
@@ -0,0 +1,117 @@
+From b2484f4df6414a6b3dd68b4069b79279c746cc27 Mon Sep 17 00:00:00 2001
+From: Marius Tomaschewski <mt@suse.com>
+Date: Fri Nov 11 09:07:22 UTC 2022
+Subject: [PATCH] quagga: unsafe chown/chmod operations may lead to privileges escalation
+
+Reference: https://bugzilla.suse.com/show_bug.cgi?id=1191890
+
+Patch taken from https://build.opensuse.org/package/view_file/network/quagga/remove-chown-chmod.service.patch
+
+CVE: CVE-2021-44038
+Signed-off-by: Marius Tomaschewski <mt@suse.com>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ redhat/bgpd.service   | 2 --
+ redhat/isisd.service  | 2 --
+ redhat/ospf6d.service | 2 --
+ redhat/ospfd.service  | 2 --
+ redhat/ripd.service   | 2 --
+ redhat/ripngd.service | 2 --
+ redhat/zebra.service  | 3 ---
+ 7 files changed, 15 deletions(-)
+
+diff --git a/redhat/bgpd.service b/redhat/bgpd.service
+index a50bfff..6f46a97 100644
+--- a/redhat/bgpd.service
++++ b/redhat/bgpd.service
+@@ -10,8 +10,6 @@ Documentation=man:bgpd
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/sysconfig/quagga
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/bgpd.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /etc/quagga/bgpd.conf
+ ExecStart=/usr/sbin/bgpd -d $BGPD_OPTS -f /etc/quagga/bgpd.conf
+ Restart=on-abort
+ 
+diff --git a/redhat/isisd.service b/redhat/isisd.service
+index 93663aa..c1464c0 100644
+--- a/redhat/isisd.service
++++ b/redhat/isisd.service
+@@ -10,8 +10,6 @@ Documentation=man:isisd
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/sysconfig/quagga
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/isisd.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /etc/quagga/isisd.conf
+ ExecStart=/usr/sbin/isisd -d $ISISD_OPTS -f /etc/quagga/isisd.conf
+ Restart=on-abort
+ 
+diff --git a/redhat/ospf6d.service b/redhat/ospf6d.service
+index 3c1c978..d493429 100644
+--- a/redhat/ospf6d.service
++++ b/redhat/ospf6d.service
+@@ -10,8 +10,6 @@ Documentation=man:ospf6d
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/sysconfig/quagga
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/ospf6d.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /etc/quagga/ospf6d.conf
+ ExecStart=/usr/sbin/ospf6d -d $OSPF6D_OPTS -f /etc/quagga/ospf6d.conf
+ Restart=on-abort
+ 
+diff --git a/redhat/ospfd.service b/redhat/ospfd.service
+index 0084b6c..6c84580 100644
+--- a/redhat/ospfd.service
++++ b/redhat/ospfd.service
+@@ -10,8 +10,6 @@ Documentation=man:ospfd
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/sysconfig/quagga
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/ospfd.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /etc/quagga/ospfd.conf
+ ExecStart=/usr/sbin/ospfd -d $OSPFD_OPTS -f /etc/quagga/ospfd.conf
+ Restart=on-abort
+ 
+diff --git a/redhat/ripd.service b/redhat/ripd.service
+index 103b5a9..be0f75c 100644
+--- a/redhat/ripd.service
++++ b/redhat/ripd.service
+@@ -10,8 +10,6 @@ Documentation=man:ripd
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/sysconfig/quagga
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/ripd.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /etc/quagga/ripd.conf
+ ExecStart=/usr/sbin/ripd -d $RIPD_OPTS -f /etc/quagga/ripd.conf
+ Restart=on-abort
+ 
+diff --git a/redhat/ripngd.service b/redhat/ripngd.service
+index 6fe6ba8..23447da 100644
+--- a/redhat/ripngd.service
++++ b/redhat/ripngd.service
+@@ -10,8 +10,6 @@ Documentation=man:ripngd
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/sysconfig/quagga
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/ripngd.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /etc/quagga/ripngd.conf
+ ExecStart=/usr/sbin/ripngd -d $RIPNGD_OPTS -f /etc/quagga/ripngd.conf
+ Restart=on-abort
+ 
+diff --git a/redhat/zebra.service b/redhat/zebra.service
+index fa5a004..e3cf0ab 100644
+--- a/redhat/zebra.service
++++ b/redhat/zebra.service
+@@ -10,9 +10,6 @@ Documentation=man:zebra
+ Type=forking
+ EnvironmentFile=-/etc/sysconfig/quagga
+ ExecStartPre=/sbin/ip route flush proto zebra
+-ExecStartPre=-/bin/chmod -f 640 /etc/quagga/vtysh.conf /etc/quagga/zebra.conf
+-ExecStartPre=-/bin/chown -f $QUAGGA_USER:$QUAGGA_GROUP /run/quagga /etc/quagga/zebra.conf
+-ExecStartPre=-/bin/chown -f ${QUAGGA_USER}${VTY_GROUP:+":$VTY_GROUP"} quaggavty /etc/quagga/vtysh.conf
+ ExecStart=/usr/sbin/zebra -d $ZEBRA_OPTS -f /etc/quagga/zebra.conf
+ Restart=on-abort
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 134a33d478..5ef3843b15 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -34,8 +34,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
            file://ripd.service \
            file://ripngd.service \
            file://zebra.service \
+           file://CVE-2021-44038.patch \
           "
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
-- 
2.25.1


