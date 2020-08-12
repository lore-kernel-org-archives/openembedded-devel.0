Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.292.1597264897249210204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tz1un9VF;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d22so1611329pfn.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/aAA3PkyETrri6jArqpLb38lAcPdcwa0Fj60iKA64Mw=;
        b=Tz1un9VFYPB5KIR1f6bu9QyE83KixlzQtjopXhoAszhtyCoBBSCrQblSdHgHiUGtNd
         pgN8OFEKjrKzv0F1outHNpuU+904ulucUNfFk6hEJ+gNxjXsD4vSv95MEGnpQbq65/lp
         4eIA1QzgEar+uLj7beKQUXtnjx76Q9fKTxMqZ8DGiA8fIJyD7p9XF0LhSLrU0ZluML6U
         8Q1vNdLTg8g00cl8ihYL9PHXcJbLO8xM5xldP0HXc9UnRIKp89ljOtGlY2v8jDmjHdyY
         4BXOKVxtA0KdSu2wBBRRAqt/46BL6igUpfzcsh4gK47lgonP+hFjiyJsFa29LfPobsNE
         8rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/aAA3PkyETrri6jArqpLb38lAcPdcwa0Fj60iKA64Mw=;
        b=AtH7eDfzly04p8ncyFU54dRitPoe7JzT9W15xYsrDrrJBqOObWNEbOuHStMJSfd+/V
         okf8QtE5IBq8i0iuHjvRdaPKuRKbvRhkm9BB/vjp4hydFhXaI3RCHxxWOf6D04kPoKEe
         bSfS6VfD/cz1qCq/w61avoBvIxOsfyU8xYtmXUsrq4/iBjvvSkuAx95empvzE3M1idv0
         QfqNvKSfUz1u5M368pxc5bodptIlHGbioLk7LJ+GrNrGIimRFb219ChnHxPRFH/bugz1
         Xq4OweMRqvossVi3ukqT8XL7MaAzgkaTud6G8pPHct/bde6RGoqVnLPK3OxA2NnsmJtq
         KHuA==
X-Gm-Message-State: AOAM533wiokWjsMDk87ljjiJuvgOBL4Kj89/KVSVQommhV8hEeS+fDew
	cvFwzyiB9sRDETNPg89Iwmpl2KqNpGI=
X-Google-Smtp-Source: ABdhPJxVrUjGUz29XYoGkDp0f99Ixc6jfIQaDWMrHzFSXzr6l9X3DtjD87+40xMJVSWN17FW3JIfkQ==
X-Received: by 2002:a63:1b0b:: with SMTP id b11mr831269pgb.447.1597264896183;
        Wed, 12 Aug 2020 13:41:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 05/18] netperf: Fix build with -fno-common
Date: Wed, 12 Aug 2020 13:41:17 -0700
Message-Id: <20200812204130.1012160-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-duplicate-variable-definitions.patch | 37 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/0001-nettest_omni-Remove-duplicate-variable-definitions.patch

diff --git a/meta-networking/recipes-support/netperf/files/0001-nettest_omni-Remove-duplicate-variable-definitions.patch b/meta-networking/recipes-support/netperf/files/0001-nettest_omni-Remove-duplicate-variable-definitions.patch
new file mode 100644
index 0000000000..08376417ba
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/0001-nettest_omni-Remove-duplicate-variable-definitions.patch
@@ -0,0 +1,37 @@
+From 6dd5b2b1f3ae3479647e2ef66e390d031066defe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 09:57:23 -0700
+Subject: [PATCH] nettest_omni: Remove duplicate variable definitions
+
+These defines are already defined in nettest_bsd.c and exported by
+nettest_bsd.h this should fix build with -fno-common
+
+Upstream-Status: Submitted [https://github.com/HewlettPackard/netperf/pull/46]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nettest_omni.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/nettest_omni.c b/src/nettest_omni.c
+index 852eeb1..862088a 100644
+--- a/src/nettest_omni.c
++++ b/src/nettest_omni.c
+@@ -458,14 +458,6 @@ static int client_port_max = 65535;
+ 
+  /* different options for the sockets				*/
+ 
+-int
+-  loc_nodelay,		/* don't/do use NODELAY	locally		*/
+-  rem_nodelay,		/* don't/do use NODELAY remotely	*/
+-  loc_sndavoid,		/* avoid send copies locally		*/
+-  loc_rcvavoid,		/* avoid recv copies locally		*/
+-  rem_sndavoid,		/* avoid send copies remotely		*/
+-  rem_rcvavoid; 	/* avoid recv_copies remotely		*/
+-
+ extern int
+   loc_tcpcork,
+   rem_tcpcork,
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index d48f3aeabd..a084fb4c15 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git \
            file://vfork.patch \
            file://init \
            file://0001-netlib.c-Move-including-sched.h-out-og-function.patch \
+           file://0001-nettest_omni-Remove-duplicate-variable-definitions.patch \
            "
 
 SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
-- 
2.28.0

