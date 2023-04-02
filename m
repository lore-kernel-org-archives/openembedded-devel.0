Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7114BC76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 17:06:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.49402.1680455177630463694
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 10:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Opyri/4e;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id z19so25883393plo.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680455177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYROHEJ1kGI9Nfa2nJqg9mvOrWM8uUzOLY1RH28zAfk=;
        b=Opyri/4eAVbktn0JGVXQsXZ9hmtrxJ+1LGclWCq+H4vyyzyq1zJX1wNk+tlCNKcvPq
         psp3YKen3pAsdz2RkQKFEGbQeEe/0b89BR4GRbi10+5A4aqydjD2WSrd4ciR/piAgKB9
         D8AYuMzMaanHtafv8p91Xw1cWz4q6EGgE56TEZm2McyzHIZ/ziMmB9CPnPT/zmqc6Qb+
         GHhf3/WHZwdUK1jVQGWxG5u1OOVRTeEZTUASpvsPOHpnj8N4zZvcC1J0WUucuAfE4yQj
         y94fdKMdw0LUSmFj5t1zM7WhG0NHKfibVgvwr63Gbp2LCLbgxogIvqN7bgSMOk3/ZMTD
         Whbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680455177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYROHEJ1kGI9Nfa2nJqg9mvOrWM8uUzOLY1RH28zAfk=;
        b=7y1rvRZNYN3fahcSIqHnUJQFlftZfvCzmviprGORI5DOpadmU/22zfJoLl0Et+CuUf
         XAniNsQ3XgB410tH+IEisq5qMABjtGqZqipB+HKqc03Co51+RzChefai3SLN+ynpkI8k
         14Nl7RFmfIBcp3K6UougXVpR59Y/+y1UEzNlx1K1l/CzIJCjs3rRCjXjx7grrFwbTZxK
         /WMZOxIQ19Zh4DY/IBFsS/2dwMggQCqqtKLUGBrcBZReZq+NDeFiCYlJ5lq8A1W1DEua
         htyzx0AvOjvAsvMNdHMXx0cTbf0hWtE1B7S2Y7sIrSf+FLQfwy3oXSKH9WbIyLIdkGxr
         7dCg==
X-Gm-Message-State: AO0yUKUEhNWz/mKSY06Z2EQdMYm9BrHZ008fjqKgLWf9TdXCGa0Ry6c4
	VJnzdsDNEljvBbL7opMw09/zkir8TJE2zw==
X-Google-Smtp-Source: AK7set+8hGRW5SldsVbPQTjBGqJpNUNzP6ot5ZhDbWO0ZYno5V3zUuxh4R6T3bB7ZAPk3+ynIg8gBA==
X-Received: by 2002:a05:6a20:bb09:b0:d6:e295:7dbd with SMTP id fc9-20020a056a20bb0900b000d6e2957dbdmr30753525pzb.28.1680455176780;
        Sun, 02 Apr 2023 10:06:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::17e4])
        by smtp.gmail.com with ESMTPSA id r18-20020a62e412000000b005a8ba70315bsm5322047pfh.6.2023.04.02.10.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 10:06:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] fwknop: Fix AS_IF configure syntax
Date: Sun,  2 Apr 2023 10:06:10 -0700
Message-Id: <20230402170610.2128019-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230402170610.2128019-1-raj.khem@gmail.com>
References: <20230402170610.2128019-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 17:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101875

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure.ac-Fix-missing-comma-in-AS_IF.patch | 29 +++++++++++++++++++
 .../recipes-support/fwknop/fwknop_2.6.10.bb   | 14 ++-------
 2 files changed, 32 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch

diff --git a/meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch b/meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch
new file mode 100644
index 0000000000..f3e1707408
--- /dev/null
+++ b/meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch
@@ -0,0 +1,29 @@
+From fee4cb0ae2d1fcd012cb7f501c3db0d8ec910798 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 Apr 2023 10:01:51 -0700
+Subject: [PATCH] configure.ac: Fix missing  comma in AS_IF
+
+this is flagged with autconf 2.72
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 47a069e..9cdfd3f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -744,7 +744,7 @@ dnl
+             IPFW_EXE=""
+             IPTABLES_EXE=""
+             FIREWALLD_EXE=""
+-          ]
++          ],
+         ]
+       ]
+     ]
+-- 
+2.40.0
+
diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
index d3753217c7..a1f56cdf16 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
@@ -8,25 +8,17 @@ inherit autotools-brokensep pkgconfig
 SRC_URI = "http://www.cipherdyne.org/${BPN}/download/${BPN}-${PV}.tar.bz2 \
            file://0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch \
            file://0001-Use-pkg-config-to-find-gpgme.patch \
+	   file://0001-configure.ac-Fix-missing-comma-in-AS_IF.patch \
           "
-SRC_URI[md5sum] = "47a9c7c214c40dceb5dc2aa8832e4f32"
 SRC_URI[sha256sum] = "f6c09bec97ed8e474a98ae14f9f53e1bcdda33393f20667b6af3fb6bb894ca77"
 
 DEPENDS = "libpcap gpgme"
 
-EXTRA_OECONF = " --with-iptables=/usr/sbin/iptables \
-               "
+EXTRA_OECONF = " --with-iptables=${sbindir}/iptables"
 
-do_configure () {
+do_configure:prepend () {
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/config
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/config
-
-	aclocal
-	libtoolize --automake --copy --force
-	autoconf
-	autoheader
-	automake -a
-	oe_runconf
 }
 
 PACKAGES =+ "${PN}-client ${PN}-daemon"
-- 
2.40.0


