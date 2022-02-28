Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E98C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 19:13:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.1811.1646075604174630249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 11:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=flmuJ4jK;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id o26so11717846pgb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huAxA+AAeuGPN6STHmlkCm+t4W2PtLoQnK9AbW4sVn8=;
        b=flmuJ4jK57+wHJIxcpzZlj3k9dEjM2kayulAhAz0dCa9oZkUNnxRmmwopEhK0qVGQn
         aPXPcHOE2HlaEziqm6G3F+51TpcWtPLJvkniG3r6f32U37e607a9CgoOL9CG/tjh+s+F
         vE2tSuEUucdQPdWlxsMs8SSENgVq4GXp/ofrmLIkGkCFubJg0QKpLqrOIot+vWsSTI4q
         2VFwW3urLo211d5jEUkjUiNt2Oj+ZHHZy7Zw4hz/QLU8dXwd3OUUtUOLivBu/UlhGU+7
         3477mEsfxLFnVOiKthzVNp9oYk9c6psuGmqBalOHWd2fS2O9yv4ywg7Ic0a08CuAngHQ
         Orfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huAxA+AAeuGPN6STHmlkCm+t4W2PtLoQnK9AbW4sVn8=;
        b=oXNCbloRH0JwgI97woKqLtLVzCcVF4SplF9/bf9wUOnERCKHdivkwbpR6ca33EQcYF
         I5oYzkUAQM9U6fceWaIZ8LcH+4CjQC9ve3M0dixqBJ3g3xEe/5Uch5++MW6Y5JGETOnD
         /02u3o7oc7WtnPflqCI538r5BxIpa6Wz/N7sbeAayFR+NQG+dT/o1CMff6hc4/7q2Epm
         BEAq7jKvF3aPgzO2dt3tgrDP7ptdvRw/WSG9H5o28VULGVkcXeTAHSADMjnMvq2U2JOY
         h0SUJ7SHiZbyUvxDedKl7LhoPn8+nEdXmDd7ZNcboGNVQ6i5+UbWsUTTp/S2bY8M70zI
         na/w==
X-Gm-Message-State: AOAM530Mx78nZ3tTahdeUdVGJY6TGSZ9ltvuFdQ3VxcrefZ+X0+0++Wp
	daJONd6Xbgy6mg8JHHogEdI5ROAo1A/RKQ==
X-Google-Smtp-Source: 
 ABdhPJx/sHwkgbjHWAQ4asL0O6y98DeQlG2M2EHsYLPSjLj17FSHyqJ9O5wprW05wv/sRwrN29szFg==
X-Received: by 2002:a63:2c14:0:b0:373:7200:d07d with SMTP id
 s20-20020a632c14000000b003737200d07dmr18438815pgs.617.1646075603382;
        Mon, 28 Feb 2022 11:13:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 b187-20020a621bc4000000b004f3c8f3b560sm13194754pfb.129.2022.02.28.11.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 11:13:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-networking][PATCH] cyrus-sasl: Fix ptest builds
Date: Mon, 28 Feb 2022 11:13:20 -0800
Message-Id: <20220228191320.2795124-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 19:13:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95594

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mple-Rename-dprintf-to-cyrus_dprintf.patch | 91 +++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
new file mode 100644
index 0000000000..4c6d61dfc7
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
@@ -0,0 +1,91 @@
+From ade70f39c4aa5a8830462d9ccf3b8f8dd968c0d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 28 Feb 2022 11:10:26 -0800
+Subject: [PATCH] sample: Rename dprintf to cyrus_dprintf
+
+This avoids shadowing the dprintf implementations in glibc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sample/client.c | 12 ++++++------
+ sample/common.c |  2 +-
+ sample/common.h |  2 +-
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/sample/client.c b/sample/client.c
+index e723c6b7..6a04f428 100644
+--- a/sample/client.c
++++ b/sample/client.c
+@@ -241,9 +241,9 @@ int mysasl_negotiate(FILE *in, FILE *out, sasl_conn_t *conn)
+     int r, c;
+ 
+     /* get the capability list */
+-    dprintf(0, "receiving capability list... ");
++    cyrus_dprintf(0, "receiving capability list... ");
+     len = recv_string(in, buf, sizeof buf);
+-    dprintf(0, "%s\n", buf);
++    cyrus_dprintf(0, "%s\n", buf);
+ 
+     if (mech) {
+ 	/* make sure that 'mech' appears in 'buf' */
+@@ -262,7 +262,7 @@ int mysasl_negotiate(FILE *in, FILE *out, sasl_conn_t *conn)
+ 	return -1;
+     }
+     
+-    dprintf(1, "using mechanism %s\n", chosenmech);
++    cyrus_dprintf(1, "using mechanism %s\n", chosenmech);
+ 
+     /* we send up to 3 strings;
+        the mechanism chosen, the presence of initial response,
+@@ -276,7 +276,7 @@ int mysasl_negotiate(FILE *in, FILE *out, sasl_conn_t *conn)
+     }
+ 
+     for (;;) {
+-	dprintf(2, "waiting for server reply...\n");
++	cyrus_dprintf(2, "waiting for server reply...\n");
+ 
+ 	c = fgetc(in);
+ 	switch (c) {
+@@ -303,10 +303,10 @@ int mysasl_negotiate(FILE *in, FILE *out, sasl_conn_t *conn)
+ 	}
+ 
+ 	if (data) {
+-	    dprintf(2, "sending response length %d...\n", len);
++	    cyrus_dprintf(2, "sending response length %d...\n", len);
+ 	    send_string(out, data, len);
+ 	} else {
+-	    dprintf(2, "sending null response...\n");
++	    cyrus_dprintf(2, "sending null response...\n");
+ 	    send_string(out, "", 0);
+ 	}
+     }
+diff --git a/sample/common.c b/sample/common.c
+index 712549fd..d138e450 100644
+--- a/sample/common.c
++++ b/sample/common.c
+@@ -127,7 +127,7 @@ int recv_string(FILE *f, char *buf, int buflen)
+ 
+ int debuglevel = 0;
+ 
+-int dprintf(int lvl, const char *fmt, ...)
++int cyrus_dprintf(int lvl, const char *fmt, ...)
+ {
+     va_list ap;
+     int ret = 0;
+diff --git a/sample/common.h b/sample/common.h
+index 819d0101..cd56907a 100644
+--- a/sample/common.h
++++ b/sample/common.h
+@@ -43,7 +43,7 @@ extern int send_string(FILE *f, const char *s, int l);
+ extern int recv_string(FILE *f, char *buf, int buflen);
+ 
+ extern int debuglevel;
+-extern int dprintf(int lvl, const char *fmt, ...);
++extern int cyrus_dprintf(int lvl, const char *fmt, ...);
+ 
+ extern void saslerr(int why, const char *what);
+ extern void saslfail(int why, const char *what);
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 95a093cd11..98899dfd5e 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -10,6 +10,7 @@ SRCREV = "7a6b45b177070198fed0682bea5fa87c18abb084"
 SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=cyrus-sasl-2.1 \
            file://avoid-to-call-AC_TRY_RUN.patch \
            file://debian_patches_0014_avoid_pic_overwrite.diff \
+           file://0001-sample-Rename-dprintf-to-cyrus_dprintf.patch \
            file://saslauthd.service \
            file://saslauthd.conf \
            file://CVE-2019-19906.patch \
-- 
2.35.1


