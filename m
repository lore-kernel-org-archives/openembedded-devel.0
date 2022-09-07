Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EA4C6FA8B
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.2769.1662594069926655663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NUhz8u67;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 65so5925512pfx.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vLqPsfTJzJjo4m1ZvVG5W79NzJ9HYrMGClBKMViTv/c=;
        b=NUhz8u67C5AA2gyCZlKz2asIk1iZGIsFhmfpsqEe/QO8HJQyxkWhOLQw9d95MHRMwe
         6I4V3HJKV/M3jhAvToVlTwyqPHeItZjoEy2qtfA7n+gWZjuF5erugw8u0bfmEfxkNY1V
         pmFFFYpJQgC2uqe6zY/FtQyZLmSWcD9PyktxJyYiYTvCQTyjLKr0xz7b8JOnO2HYlgWS
         yDHlkAQZ8Vm15JRmpNm6A5mcjfFzt5bRMhLbA2lDh/WIa31d+OPPNLmPVmxgZAE8TrzI
         AXwPCNgCKEkKl5/e2gLZQTtJ415dhdjAt5UpdeU2tBZjqVk3lUveEcmCPUC5pzOgEbWt
         Axfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vLqPsfTJzJjo4m1ZvVG5W79NzJ9HYrMGClBKMViTv/c=;
        b=eGg1CYnO90ro+4cWiJBvoCy99dwdwNx+wCyo04BAaDZ4TmW4GK1x2Q8/3IK6au/uJO
         I0k8Rra7p5kyjZVl23qACUyyW2piFcvFgJtJvyZhJrdSNpIuv649amaQwAjtMHS9kPA9
         FALE9bMR2arAdAeTOBfqNvj71yI2cQu8Tc0k3Z7fPahta6rxbL8cTatjfI+B9yHWblh0
         XwEdEXBKZZTsIHwghxhrXzl6Mvy1tLFXbfV7lEI12gHxUnD7nPijpmjApHHRWZwIEyNF
         fEuglOX9jzAfsIj/gUmMd7wDHkmz9kCHxtZzoVDuM+o6N9y4045oMwVYPM7gQggUZZ3V
         YHgQ==
X-Gm-Message-State: ACgBeo32K47UPgadelwfoSegC5fSyh/Qd+jOwoE2S215ROayNZ3Lhf1j
	5tp/TXpiBhqIyHTtsEtkXebvdyzEyczenw==
X-Google-Smtp-Source: 
 AA6agR4DxRsFskpNxyitgzVfGN+j+00F7kUqazSIf7vVUgltCmVApFduR56eByZpuP86pOSO6DOzwQ==
X-Received: by 2002:a05:6a00:4c85:b0:538:5500:4873 with SMTP id
 eb5-20020a056a004c8500b0053855004873mr6350957pfb.81.1662594069184;
        Wed, 07 Sep 2022 16:41:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/22] tftp-hpa: Fix includes for
 bsd_signal()
Date: Wed,  7 Sep 2022 16:40:46 -0700
Message-Id: <20220907234102.3312797-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98696

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Remove-double-inclusion-of-signal.h.patch | 39 +++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch
new file mode 100644
index 0000000000..84658d667b
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch
@@ -0,0 +1,39 @@
+From e9ed48d91642d384ce07cbb9bec788f07fc6354c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 14:51:42 -0700
+Subject: [PATCH] tftp: Remove double inclusion of signal.h
+
+Undefine __USE_XOPEN2K8 so we can get bsd_signal definition from system
+headers
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/config.h b/config.h
+index 3ff2915..ae1a14b 100644
+--- a/config.h
++++ b/config.h
+@@ -93,7 +93,6 @@
+ #endif
+ 
+ #include <errno.h>
+-#include <signal.h>
+ 
+ #ifdef HAVE_SYS_SOCKET_H
+ #include <sys/socket.h>
+@@ -296,6 +295,9 @@ char *xstrdup(const char *);
+ 
+ #ifndef HAVE_BSD_SIGNAL
+ void (*bsd_signal(int, void (*)(int))) (int);
++#else
++#undef __USE_XOPEN2K8
++#include <signal.h>
+ #endif
+ #ifndef HAVE_DUP2
+ int dup2(int, int);
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index af42bda93c..565f493ce2 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://fix-writing-emtpy-file.patch \
            file://0001-__progname-is-provided-by-libc.patch \
            file://0001-tftp-Mark-toplevel-definition-as-external.patch \
+           file://0001-tftp-Remove-double-inclusion-of-signal.h.patch \
            file://tftpd-hpa.socket \
            file://tftpd-hpa.service \
 "
-- 
2.37.3


