Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D206C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:09 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31919.1788776647104488116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pNb55apF;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso4187658a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776646; x=1789381446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoZWQ6ygMclgKLKRfspTV7c1jd5UDBOL1bIpZJulkDc=;
        b=pNb55apF/I+xeinsW3d7gCOiCGQgMencM7sIRBelH4nNyXlgqTl2Lq57hEmDVgAfYD
         HWCa1L3tO2bNJnM06wFmr4zxI5vqeJSe3hJuxgJvMPsalsaR9SUKJU330dNUY+x76zoE
         JJLevMHoaVja727TD6clerbJXVVwjTABltHKIjEl1WTmSn/kfYUDivVaz4+l1X/u//o0
         swdGxXRJIRsyfQmW7Z2UXgfZyzlGRoO4kfG+xaz03Z9aEUqft9+MNgOkk8hwfKH9XtLq
         bPEvIFggVbcnTWGZ59PFT3BUHfRfiTWRxNSnMBlBYEXQNIb88q405revyDzRWZB+vu10
         cwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776646; x=1789381446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoZWQ6ygMclgKLKRfspTV7c1jd5UDBOL1bIpZJulkDc=;
        b=NPDKAtfFXe3gCOEvzFS4OPonZV/ebb/1yUISzytgZsv48MGsvLSw+aAZAdC1wwzXtZ
         AxYfewLCrF0L1VheYK8eGmUoXnljBlJ5caAjJI1RbpQ5wd3s9+0Xaa1WEH9J25htw/1H
         tLpTmZrIt2L6D4HaiAi8KH7fzeGqOswHxwU/xxNo2F+flhie7O1BOMVt6eqpLBQaUV9C
         IQbJJCDogWdTqoK0PbKRUQjTeafAw8GleEoGfjGw4C0645hlqw3RR2m1zXq+K/bQzNIl
         HOcvMMtX6LsgQ2qowjPZ7ZeJVpN2qMJiA0cmArzu2IoHR+pOArSaa03ABCj7R1RAUr6S
         cDYg==
X-Gm-Message-State: AFuF++nhjVz6Y6uv3rl/q+7w4YqutMT40NEAGXY7dXUJzF95reGdj6zq
	5jR80A6mxP349sbY2Xhu8RD1poKkqa1h54a7axP7vOW0iO2G8rzYsg0m++F1Iw==
X-Gm-Gg: AYBFou0FNpoZPaSNTak7+gpJhdWRAT1n3lVDF6N1V7jWq2qRa1XCiRVSaA/Srl84dsu
	Yv6uMTR84tQrM1MDiYLeYSseP3LWx8z3Ra68Z5E0flybvECYMVw/ZyZ4PPrJmRYsA2skLvfFfNX
	TtiO7nwkSrXfDkysDXdcdl4uDmV0Z441yXvNF3iur1VaSbHvQgN/NbbdVuURFMIAUUFNeQq5dNj
	izu/OWXE05tYHLK6xqorbc/j+i/bnATWddHWN4c0uUnhh7xt0z7BBgaBv9BHAugjIRzpA4Uq3Xs
	OmT+OxDs6cK4R16EHKgGEuHTQyqoyBo97wajGBggxQPo/7O7ctbB7Ocfkq2Z6QnAKo3HmJM3GvP
	moEocMDs3werem0ghGE2RHvwqyCq9fAQ/8LMnHBmBj9iRPGRNnkvN6REg9u32N68sL85PLUh9+p
	bKWMVZuJKDf6TVw+kQXoF6k1WliTXkTGZdtQFuCEK5dt7t+Dp9S4e5j+MMe7GJ9r3DtebGP+Sz
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr33729839a91.15.1788776646360;
        Mon, 07 Sep 2026 03:24:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 14/33] tinyproxy: patch CVE-2026-55202
Date: Mon,  7 Sep 2026 22:22:58 +1200
Message-ID: <20260907102318.2459883-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129826

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55202

[1]https://security-tracker.debian.org/tracker/CVE-2026-55202

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-55202.patch  | 107 ++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch
new file mode 100644
index 0000000000..4e446542e2
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch
@@ -0,0 +1,107 @@
+From 04b34f814076d790db26925d7df7c30798910c99 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Sat, 18 Apr 2026 00:03:15 +0200
+Subject: [PATCH] reqs: improve stathost detection (#606)
+
+until now, only the basicauth code checked the host header, regular connections didn't.
+
+- add a new helper function to compare a hostname with optional
+  trailingcolon/port against the stathost.
+- add stathost check via host header before transparent proxy check,
+  else stathost might be misdetected as a trans host request.
+- refactor existing stathost checks to use the new helper
+
+this should make it easier to access the stathost, for example by
+injecting a host header into a curl command line with -H:
+
+    $ curl -H "Host: tinyproxy.stats" 127.0.0.1:8080
+
+the stathost can also be specified as an ip address, e.g.
+Stathost "127.0.0.10" + a separate Listen statement for that ip.
+in such a case e.g.
+
+    $ curl http://127.0.0.10:8080
+
+would work too, even if curl didn't add a Host header (but it does anyway).
+
+(cherry picked from commit 09312a185ae25cc486b4ff5987638a7917a48bce)
+
+CVE: CVE-2026-55202
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/09312a185ae25cc486b4ff5987638a7917a48bce]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 37 +++++++++++++++++++++++++------------
+ 1 file changed, 25 insertions(+), 12 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index e3cfe76..d5037cf 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -316,6 +316,17 @@ static int send_connect_method_response (struct conn_s *connptr)
+                                       connptr->protocol.minor);
+ }
+ 
++/* determine whether a hostname with optional trailing colon/port is the
++   stathost */
++static int is_stathost (const char* host)
++{
++        const char *p = config->stathost;
++        const char *q = host;
++        if (!p || !q) return 0;
++        while (*p && *(p++) == *(q++));
++        return *p == 0 && (*q == 0 || *q == ':');
++}
++
+ /*
+  * Break the request line apart and figure out where to connect and
+  * build a new request line. Finally connect to the remote server.
+@@ -384,6 +395,16 @@ BAD_REQUEST_ERROR:
+                 goto fail;
+         }
+ 
++        /*
++         * Check to see if they're requesting the stat host
++         */
++        if (is_stathost (pseudomap_find (hashofheaders, "host"))) {
++got_stathost:
++                log_message (LOG_NOTICE, "Request for the stathost.");
++                connptr->show_stats = TRUE;
++                goto fail;
++        }
++
+ #ifdef REVERSE_SUPPORT
+         if (config->reversepath_list != NULL) {
+                 /*
+@@ -497,19 +518,11 @@ BAD_REQUEST_ERROR:
+                 }
+         }
+ #endif
+-
+-
+-        /*
+-         * Check to see if they're requesting the stat host
+-         */
+-        if (config->stathost && strcmp (config->stathost, request->host) == 0) {
+-                log_message (LOG_NOTICE, "Request for the stathost.");
+-                connptr->show_stats = TRUE;
+-                goto fail;
+-        }
++        /* check whether hostname from url is the stathost */
++        if (is_stathost (request->host))
++                goto got_stathost;
+ 
+         safefree (url);
+-
+         return request;
+ 
+ fail:
+@@ -1688,7 +1701,7 @@ void handle_connection (struct conn_s *connptr, union sockaddr_union* addr)
+ 
+                 if (!authstring && config->stathost) {
+                         authstring = pseudomap_find (hashofheaders, "host");
+-                        if (authstring && !strncmp(authstring, config->stathost, strlen(config->stathost))) {
++                        if (authstring && is_stathost(authstring)) {
+                                 authstring = pseudomap_find (hashofheaders, "authorization");
+                                 stathost_connect = 1;
+                         } else authstring = 0;
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index b8a508d8d4..f9d425b45a 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
+           file://CVE-2026-55202.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

