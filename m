Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.302.1597264903041559164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s58NJwzK;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id f193so1600513pfa.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UrVI+mbAaZzcGuRL9YXSxCLgRCZBnY5DmeSIAFD/ybg=;
        b=s58NJwzKOz69Zc9KzLBcViwKkU1oCeZLP68jbNdg289tO83p7mfpuYmYz8hU8KJHAh
         XdJqC9zqPsY1PWD6Uh/r6AYm6lzrPBzwmssR+ILcjfCisZHB48w3mdXNr7Gu/q+vxc+c
         BnSvWWBOPYBvQ9BRa0IyWxZgWDibS8Si7IavcGi5WfYYyjE0hjLGwqFOkfuCawpZnqRl
         Ng3ctviwHMIQOD7EPlCQQ/rXOzBzSkRWNdHZIohGD9UOgZ3OVLPFpFhkxH+VzmSbrKww
         wRPNXr5biecC4m97azDnVJAL/HS6WStmTZceEfg9kxXm+xzfbHpZnANlpLBKsXYInpkh
         2vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UrVI+mbAaZzcGuRL9YXSxCLgRCZBnY5DmeSIAFD/ybg=;
        b=UVkcpUoMGmfC0/RkmUMgnRG+w75fe6HOgp3sPXTp2B6Ny/0Yt8C7fGo5Q7/ncjPN0w
         DMADPCW9ly0nz4rurbynElBdKHsZ9Bxo6+89nNhn5K0Ppnu36P+zg3TggN7BZJwR1Vc+
         Eo/Jdw+5L521ykhKWVvOvHWlMEIH3Bvfj5zz1IPbyoQxrqSm6octBL3+pyoo2tY7bwfA
         UEQ+LbJVN0bREGTQtaf6PorQAswc61aY9El2WeLJdIkTecbSvFhdW4ARmVgEPrlUb3OF
         3t+b6EzANO1S0HJhh6Z9hHF3ntgjFVO3zeQBwu8IOABp8/hLxUNdiKu2Sg13x0DTK0gs
         pk3w==
X-Gm-Message-State: AOAM5308l4shlB99th1wf00dZxT5F3gUcjQa0IRAyblgcfE4xR3EWqXk
	U9SbB68S2OybSwz+k0xmvo+c/cnVy8M=
X-Google-Smtp-Source: ABdhPJytdzaVF2LtUMRw9wt3f9Wa0WfTvVaeTr64UA11a0D9K6d6BFLYsO4vPouJA7KA7zboABXZpg==
X-Received: by 2002:a63:5c65:: with SMTP id n37mr842913pgm.294.1597264899301;
        Wed, 12 Aug 2020 13:41:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 09/18] tftp-hpa: Fix build with -fno-common
Date: Wed, 12 Aug 2020 13:41:21 -0700
Message-Id: <20200812204130.1012160-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Mark-toplevel-definition-as-external.patch | 30 +++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch
new file mode 100644
index 0000000000..646757c783
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch
@@ -0,0 +1,30 @@
+From 2a12174a5059e84d4ff6fad8f983a4d0f2127e73 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 12:17:31 -0700
+Subject: [PATCH] tftp: Mark toplevel definition as external
+
+Fixes
+multiple definition of `toplevel'; tftp.o:/usr/src/debug/tftp-hpa/5.2-r0/tftp-hpa-5.2/tftp/tftp.c:51: first defined here
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tftp/tftp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tftp/tftp.c b/tftp/tftp.c
+index 9d15022..109848c 100644
+--- a/tftp/tftp.c
++++ b/tftp/tftp.c
+@@ -48,7 +48,7 @@ extern int maxtimeout;
+ #define PKTSIZE    SEGSIZE+4
+ char ackbuf[PKTSIZE];
+ int timeout;
+-sigjmp_buf toplevel;
++extern sigjmp_buf toplevel;
+ sigjmp_buf timeoutbuf;
+ 
+ static void nak(int, const char *);
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 413950be1b..4c62da8181 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
            file://fix-writing-emtpy-file.patch \
            file://0001-__progname-is-provided-by-libc.patch \
+           file://0001-tftp-Mark-toplevel-definition-as-external.patch \
            file://tftpd-hpa.socket \
            file://tftpd-hpa.service \
 "
-- 
2.28.0

