Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2914CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32828.1792043059190135930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ps0m88oD;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e940d5d2beso5642075ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043058; x=1792647858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XRQZMRu1IRqhE51CH+TT88hrWKuyBssDXetAC5x1E7w=;
        b=Ps0m88oDNyewk1bxxyyA6GG2pCsSAKfrRWSSMZDrbnum5lioTnu6p1Dm5YGDf2aqYZ
         hDfDATfhnVr4XgrkGNcMzq5erCh7nQnk6hszC6kU1CxWKLG7+vO3lVsv5kVLe9/HcEbL
         Wrr3Rs4wdKE1UlZdAadi+JL8s8ZiwS+A+E6GITlf+irS7o0QM7wFiCMApMLofIrKx09P
         DuI6fs6aEJ8RmE9A3xJFQ4WUBXbhu2kcUrNbt3ynzMieZofVGAtaay8X9FlPn2slME1t
         afGUJtyeY+Ojr1RyaWRj3ECUMoiH68Y5CykbJjQGNbIS646jGOSxc4FP8Q7ADFCUJtGp
         d/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043058; x=1792647858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XRQZMRu1IRqhE51CH+TT88hrWKuyBssDXetAC5x1E7w=;
        b=lH0iejNYQh0Lx9asYReAwWnniCK3eFxslExMlvugekcsy69Sf0D2DULhhAwmN4ie8g
         f9ycerLvqxuz5oFk2DeIHT7XY5lM/WftiM3X74tlBNjda9jv5TysoAYWW8XjNH8It9Jy
         bLAqKwRT+hm/Nd4SYNbzqCOOYNs8nXygzQj+PLx89kPMDzxl7j5HKLv61B+fBeUrBMKx
         ocLTlIbErg53ia1Zfzi+KOLf7+atXONFtUVR8pBktp7v0ln9V/JDml41iyAb3Z0YQ9hA
         tjkCuWnjQmQ8hUC0i33PoHejh5csAFFitxVzAhmT1mZVLqH4dtsBHan8xX/pwEqiZ9KD
         Q7qQ==
X-Gm-Message-State: AFq9FYIF9G1ZPJZ+wIQy/9ssRDZh06nw51GC4ko5fC/0e+Nn/lc5YqzR
	EHfAmPQSn8j3hiJRmx/voDmgi2DdXdws6epFHJ68Lh2pdTCHkJZ4eKKPfzN6MA==
X-Gm-Gg: AYBFou2Bnw4YH1LGAwQyOjESnbAkp81sMttYeTzzahtFoC8Np6V7AHWjCyTRwfseSW1
	Gjn2jsdfHhEJ3cpQXdbavzzP3mEUqB8WSDavnIlujcpDevL4WEqs09vCga/+9zs0BLEKSY+49i/
	ZYVG/Ohw/rSXKvP+T8l1CcouoXFTQyRg8wbYUdYNT+Aa7qJYx2l26N5TbvGe32uw52pBtoetwtz
	fGfojb1FG6E9V2aeuaCW48auV3Ebgo4uxjGt3mnaiI7ObfEYtzf/MEyYaCWdBCvMwYMhrzGfXjS
	Kl3UbJsBOJP0lxy/ulPMg3exZXEZdvEyb9+FDjyQUdwos4Af8ago978fO6oaGSOGYuMkFDp0G4G
	C/n+Pob7Yjh5Q3iCfy/rJDot2WwOsrPEX7Kst2zwPBKFW4B2so29PsI7YuH5/l3gw+zz280FiN/
	hIkrD134MIWMUi8lVuQIF6JOdyI3CeSVe5Rw5eE8R/gh7liO+WXG7KIz0HonYuTwJSZcE5v81j3
	soOvFqVNhwwHz5D3wzX3RI=
X-Received: by 2002:a17:902:d4cb:b0:2e9:3dd0:c7d with SMTP id d9443c01a7336-2e93dd018f8mr35751525ad.20.1792043058476;
        Wed, 14 Oct 2026 22:44:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 41/82] tinyproxy: patch CVE-2026-55202
Date: Thu, 15 Oct 2026 18:41:29 +1300
Message-ID: <7c8cd0805fda2a804d16c22f79b68760a2537a19.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130961

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55202

[1]https://security-tracker.debian.org/tracker/CVE-2026-55202

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 233e6a56e5311eff91c8a46c36a790db1fb38933)
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
index e84aeae53c..25df44301b 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
+           file://CVE-2026-55202.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

