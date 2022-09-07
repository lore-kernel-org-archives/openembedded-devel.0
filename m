Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6184C6FA82
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.2846.1662594074260466241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=djtT432H;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 z9-20020a17090a468900b001ffff693b27so534429pjf.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tA3T7B+CovJYC8LTUtosWYaEjfrtozA12kZJB0wwMlA=;
        b=djtT432HGevk0MoQuMnhkWMhi14WGnD5tGRqVsla+fwxzQ/NBwHp/MMXWa0ktexeT0
         M2cNQDl05DAInBzy6M6/arK4R4Ex+EgWfjYm7buuE5DaBTiLhFbQIt/LXStHklblwCd8
         MylR1hrTai4mWTZgBmkNS0zOmFCRkIV2vqiGP7B3VFsHq1bpZ9dHZCAj6dM6ctlJPfMM
         uACQhWQl0WCpLrpoILvg+tfpRkMaJnkelTL5qmAInmum0wJiXHUmSFd7kw42TBmKEs2q
         6BIC9PJ454mkvrj81eqN2vGqOiMdMzLMxudI6MQpryAhzvR3z3ZIo34/U0mLaqTJJhon
         GTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tA3T7B+CovJYC8LTUtosWYaEjfrtozA12kZJB0wwMlA=;
        b=4nBG9TnF6arP8mAZj9CiHlIrs/DOJwzAeXCjMPHVrL6vV1yKLA8hxpD63fz4hbJOoM
         /waRGM3tHgYCqr8TDPqv1QzfBllKigdJv2ERObx2MyA4oI8A+PfbIpHN2ceuKkmpE4hN
         7MvLU7Ivh5RFi/m9jbtpGbwnlIrUIfpYnLpBhn7eIopyYWWja24hnwOFQlnVQXgv8iih
         Mx6qcdDpKu8ZwgX8epC0rp5AorOiHEpIRCmnzmtzvYLIo6jR0dhrG9bFYiI4w/nk7r08
         LIsYtXi0riRIk7Ci1p2AmaWrWDGVMC9jKfTT8xMVCyt8DTmUeBDwHGbVDUatpXaEIkps
         b6PA==
X-Gm-Message-State: ACgBeo3KmpaYMEa4KnALGh6/PWb9FPU/nPICqAhvNc96iR77jTzGDkW1
	QKWyd68H/6oX255By0lfsiG/HXgWe3vkVg==
X-Google-Smtp-Source: 
 AA6agR4IZ1gQZSaBLPuLfy+f46nFuGsoLOCfABAPNCRAMwcAGJBWU5qq4ou1SjQMNyN4E/0hmjGN6A==
X-Received: by 2002:a17:902:d501:b0:174:c4c9:9b77 with SMTP id
 b1-20020a170902d50100b00174c4c99b77mr6217102plg.67.1662594073492;
        Wed, 07 Sep 2022 16:41:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/22] netkit-telnet: Add time.h from
 strftime/time prototypes
Date: Wed,  7 Sep 2022 16:40:51 -0700
Message-Id: <20220907234102.3312797-11-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98701

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...time.h-form-time-and-strftime-protot.patch | 27 +++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-utility-Include-time.h-form-time-and-strftime-protot.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-utility-Include-time.h-form-time-and-strftime-protot.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-utility-Include-time.h-form-time-and-strftime-protot.patch
new file mode 100644
index 0000000000..a5e634caab
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-utility-Include-time.h-form-time-and-strftime-protot.patch
@@ -0,0 +1,27 @@
+From 23b068e695881be0e8205ecccadf775fc3d5889d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 21:25:50 -0700
+Subject: [PATCH] utility: Include time.h form time() and strftime() prototypes
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ telnetd/utility.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index 4811f14..b539777 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -40,6 +40,7 @@ char util_rcsid[] =
+ #define PRINTOPTIONS
+ 
+ #include <stdarg.h>
++#include <time.h> /* for time() anf strftime() */
+ #include <sys/utsname.h>
+ 
+ #ifdef AUTHENTICATE
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 56860ea098..6d60c6fbbe 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/netkit-telnet_${PV}.orig.tar.gz
            file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
            file://CVE-2020-10188.patch \
            file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch \
+           file://0001-utility-Include-time.h-form-time-and-strftime-protot.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
-- 
2.37.3


