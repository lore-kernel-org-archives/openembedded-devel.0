Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29720CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:34 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3508.1791763890616700873
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AjN1UyfZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a5aad413so613502a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763890; x=1792368690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8GN4om8v5rdFSVZdGpD+ZsZwPq5HhaGQ2mhYesOgWg=;
        b=AjN1UyfZAP1lU7teptCxBuTaoZbj94+Nkv8ODPoNbfZJBG4ECGLITvChPgE2eY2vnp
         Z1qFZNYxdSU1Sx5O/k2Ttx88Pjwqd/tQyxZBRmLv+emLTIXvtnKxoV7btTd4m8Djd2kP
         ORK9y95vYTWZS0cMyMQgMQqQKswBGu7rSazEq7X5PLrXdd2lA9TBF/dnhnWsM+eYsj67
         Yz8DCUoGITVmK6WIsMTIpRvYEd/DYsBxu9Fwd9SKgEkIi/VRJ0QBzu8O5EKMsG45+L/P
         UlCuEwsXlOR1apA7/+K+PdmPjFUV4ViG6uED3D8QL9NFTR9FWqM9izSHLFY74Sl3fdvw
         htag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763890; x=1792368690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8GN4om8v5rdFSVZdGpD+ZsZwPq5HhaGQ2mhYesOgWg=;
        b=GQJEpqv2TPw41pX16W6TfGXKaWAC/z6PnshNthRrTPO8SZU1fdMsL1HD3E9Yh37t0k
         6Fx4k3kJMpBWnzN+Kj9IbqHQVwnFYzhV9Di6NelfhmqYWpCDGTupPXPe2wixP7oFiybP
         iOek9I6E/8DG+eHxIXrwGaEmozg+ai+AqHMcE/XJo3+bk9SbiOdgHdqw7wZwYzBVUH5q
         pNwbIOzdHPuRRANBQrFuqZgItC9aXzn6zeO72J2mXDPyBhdhOggnHONdxpH2lYt8m3QV
         Gyd4Uxts3lgfDVSYDCEXvrbXvFqBrHOovcBKNzp22fZcUdD19G7nd0lr60904ETfT36u
         YMtw==
X-Gm-Message-State: AFq9FYIByaQ1An4RGpO88ObDuQvONBy6jUWHaJrHwwISJDxrzF3k0E6e
	akLNWT8cZGckgUgQ0HTss2wLWC4g9Hdk89ASpFtGMIRWoS7G7CGwsW1Q03LzG+k11pk=
X-Gm-Gg: AYBFou24rzS5L5Z1/hPv00qg0Lkerq9kCukBB8zhf/p3Av3XMmFMZSR4ZdyH4In6lMn
	ALBkJ/kn2syKFlxa/veX/ikxDRJvXO7tC0BSOLrkvhi5UOyXd58lo9chp1iSmgOV8dDqrkxyTLH
	GtVTDtAXeooNXHXiku9lJZQzpONDkhB1e+PU1ZFZ1VI23l3cUrRTiVyzPUs/krrdafaP97S3x/g
	qTon53ovFuvvjM4a/hg3xikTt6v67s9fTUqXGh4qhGjsc8EZOr82WAM19lhUdPznlwWIxBIbGW7
	k/p7/q8ZHCgqvFZlO5+xIgkAPkwvpanwyagDlTwrrUU2fXGjOUVz14xtjt9Li9tM094Qwo/iloo
	F5SsJUJUaO00quFFikcc0X64GLDBvboIXJyXUpGuQslOICJQneN2rDNyjW+tig6ZXHP6VE6Oh9e
	lZ5PlG04Ai0jVVLXTQNP85voQoaya4RnglXbr409lWb+XTlr+ekx2Zp8HdbcZ2H28VKxbYJ6/Lh
	UR/9GXJaVTgCfh1gdTCi/OwfOkO/zqQo20evSw=
X-Received: by 2002:a17:90a:d2c7:b0:3ab:1b19:78f0 with SMTP id 98e67ed59e1d1-3ab3a8e1d1bmr6449619a91.41.1791763889949;
        Sun, 11 Oct 2026 17:11:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 28/28] tinyproxy: patch CVE-2026-55202
Date: Mon, 12 Oct 2026 13:10:06 +1300
Message-ID: <20261012001007.2541673-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130753

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
index 00000000000..4e446542e27
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
index e84aeae53cc..25df44301b6 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
+           file://CVE-2026-55202.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

