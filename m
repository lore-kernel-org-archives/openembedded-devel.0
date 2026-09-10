Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D1C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:37 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27849.1789081829294254325
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pvGE4hBa;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so274441a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081829; x=1789686629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPaSuiideSO7RsoEkXuvfVLb8kbd/nD1c3cECf405dU=;
        b=pvGE4hBaGOAqBif6BzXpNqOpQhhyakchYiZo5chcIiD7jugGt54kwktVRVh/eIhzAD
         6sHsPm+O8h9iql5TLO6UYXefO0DexZ5alJ6XSia7TP4psPXJFNa+jXcrqhCxgTIvwhYy
         70uJPHg5iO1p/IaxSI/d4xuk15dyBYLkop0MXqkZY2n79ItT4O2xLd/84Vz6T+CUSfhE
         j2MGo7P7UmDJu+XwAfj3zKuIQHwBm50ljVJdK6l1kg9VE+LUBrmcqZP2heBysNLsF1zZ
         f/tcP9GgfqKmyMObdGRb1tVaKWj7a6kE9RnSY1l4nS0r8nqZjGL5Ty+SOutdSZTKxC65
         iO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081829; x=1789686629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPaSuiideSO7RsoEkXuvfVLb8kbd/nD1c3cECf405dU=;
        b=OQ8eQ/bSICdHqOdux2yYTKtyikO2UOWMC7CKniPHHxE9nemvxEkJEHrrDCp5C2qQE7
         gDXagHF8wubeXAR0YcJCSrrOL0EFp7CKIWns0L/RTqF9wi2q7TljxZEkYQ9rGuxtACpH
         Kq+RQ6whBxlV9kXX2orFT+1Y7TRj3/m8ElOSSjII3/oWtTCagmAcPcZazaZllpsHfA8G
         09KAEGfA3klOTCUyL8wjwDRlBOE3vsE0GQ04+sLQoGNAgjmF7MPi/86kyJsbNDlWXWDI
         7kcE/HLltgcV3PDxDmwBcC8hdtbNpA3TuMg27Z8hBq0WgCW106GGOFJpdm9AcNc/6S5i
         WvfQ==
X-Gm-Message-State: AFuF++kb7pg1nOxAhdxI2Z/0uLV6F9LHAeoY4jq/f6X4/JhT+wGfRY6x
	1clK8R6kmiyPG120yqDK1h9yDRdVvE/vhFeUNrmSb5cK5AT8d43QBubXFQN4BQ==
X-Gm-Gg: AYBFou2hM4Vl92UukCGCi1+Hi58LdxLN2Brrd5qx1IdhXJAYRU7rq7srYOpqZxzRu38
	WM41ZBFP0nR8Gtff17Plc36yx27oamLM2K7zRDDGvJFkQxYGINI8F+ld2gHpUn/vImidogKdoue
	l8L+S5QkC0iUEIJcfkGaumB4gOJG26Xo6p3j7f9/0aHt4W+6JsW2Hbvcin3enOIwEtKu8ErW77h
	p0cbDAKBA1k9qOWd28t2ytrqPaCFskT7tHMav66KnVxFGXCb/qZ8UUciZnEcA1ojd08m9lGDLDa
	rDeBYSZhCOJDuWUvWDeqQ+rzcf7OSNtj70hmPFN5FvdOiyXW6BFiafBqET3hM5+z6a2WGVQk3se
	hFqwUly6qBykhxaNJ3+cTO/AGYlFdcDvP+m6aWGZf6txbipsKqU+Ulvd+PDlxXx8T4346XKRfoj
	0Ztpa57YqRmOMzMTgk+JSrey0EWUA6yBwx7HX47yQtHuKc99QhLStmqtxRtztMvkFhn+kCxQ6iy
	3k5EORTw5DZ9WsuDENspuY=
X-Received: by 2002:a17:90b:4d0c:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39d9b97d29emr1764829a91.0.1789081828618;
        Thu, 10 Sep 2026 16:10:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 16/32] unbound: patch CVE-2026-44621
Date: Fri, 11 Sep 2026 11:09:15 +1200
Message-ID: <20260910230932.173913-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129934

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44621

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-44621.patch      | 98 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44621.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-44621.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44621.patch
new file mode 100644
index 0000000000..2c581a30be
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44621.patch
@@ -0,0 +1,98 @@
+From 3abdb762310bb50ef03f1ee0bbd4e09cb814fbb1 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:11:26 +0200
+Subject: [PATCH] - Fix CVE-2026-44621, Libunbound applications configured with
+   'unwanted-reply-threshold' could eventually be abruptly   terminated.
+ Thanks to Qifan Zhang, Palo Alto Networks, for the   report.
+
+(cherry picked from commit f52a9e864bfa0f10d8816b64130586b1d224c474)
+
+CVE: CVE-2026-44621
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/f52a9e864bfa0f10d8816b64130586b1d224c474]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ daemon/worker.c                | 5 +++++
+ dnstap/unbound-dnstap-socket.c | 5 +++++
+ smallapp/worker_cb.c           | 6 ++++++
+ testcode/doqclient.c           | 5 +++++
+ util/fptr_wlist.c              | 1 +
+ 5 files changed, 22 insertions(+)
+
+diff --git a/daemon/worker.c b/daemon/worker.c
+index 8e4a9b3d6..b9fac0406 100644
+--- a/daemon/worker.c
++++ b/daemon/worker.c
+@@ -2560,6 +2560,11 @@ void libworker_event_done_cb(void* ATTR_UNUSED(arg), int ATTR_UNUSED(rcode),
+ 	log_assert(0);
+ }
+ 
++void libworker_alloc_cleanup(void* ATTR_UNUSED(arg))
++{
++	log_assert(0);
++}
++
+ int context_query_cmp(const void* ATTR_UNUSED(a), const void* ATTR_UNUSED(b))
+ {
+ 	log_assert(0);
+diff --git a/dnstap/unbound-dnstap-socket.c b/dnstap/unbound-dnstap-socket.c
+index a01627de9..7d01eb220 100644
+--- a/dnstap/unbound-dnstap-socket.c
++++ b/dnstap/unbound-dnstap-socket.c
+@@ -1725,6 +1725,11 @@ void libworker_event_done_cb(void* ATTR_UNUSED(arg), int ATTR_UNUSED(rcode),
+ 	log_assert(0);
+ }
+ 
++void libworker_alloc_cleanup(void* ATTR_UNUSED(arg))
++{
++	log_assert(0);
++}
++
+ int context_query_cmp(const void* ATTR_UNUSED(a), const void* ATTR_UNUSED(b))
+ {
+ 	log_assert(0);
+diff --git a/smallapp/worker_cb.c b/smallapp/worker_cb.c
+index 92ebe386d..876c7db4e 100644
+--- a/smallapp/worker_cb.c
++++ b/smallapp/worker_cb.c
+@@ -128,6 +128,12 @@ worker_alloc_cleanup(void* ATTR_UNUSED(arg))
+ 	log_assert(0);
+ }
+ 
++void
++libworker_alloc_cleanup(void* ATTR_UNUSED(arg))
++{
++	log_assert(0);
++}
++
+ struct outbound_entry* libworker_send_query(
+ 	struct query_info* ATTR_UNUSED(qinfo), uint16_t ATTR_UNUSED(flags),
+ 	int ATTR_UNUSED(dnssec), int ATTR_UNUSED(want_dnssec),
+diff --git a/testcode/doqclient.c b/testcode/doqclient.c
+index 238a93803..1994cd097 100644
+--- a/testcode/doqclient.c
++++ b/testcode/doqclient.c
+@@ -2671,6 +2671,11 @@ void libworker_event_done_cb(void* ATTR_UNUSED(arg), int ATTR_UNUSED(rcode),
+ 	log_assert(0);
+ }
+ 
++void libworker_alloc_cleanup(void* ATTR_UNUSED(arg))
++{
++	log_assert(0);
++}
++
+ int context_query_cmp(const void* ATTR_UNUSED(a), const void* ATTR_UNUSED(b))
+ {
+ 	log_assert(0);
+diff --git a/util/fptr_wlist.c b/util/fptr_wlist.c
+index c6f3ca24a..3c863d5e1 100644
+--- a/util/fptr_wlist.c
++++ b/util/fptr_wlist.c
+@@ -609,6 +609,7 @@ int
+ fptr_whitelist_alloc_cleanup(void (*fptr)(void*))
+ {
+ 	if(fptr == &worker_alloc_cleanup) return 1;
++	else if(fptr == &libworker_alloc_cleanup) return 1;
+ 	return 0;
+ }
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 5c798c00d3..ac8cd281d6 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-46582.patch \
            file://CVE-2026-32665.patch \
            file://CVE-2026-42955.patch \
+           file://CVE-2026-44621.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

