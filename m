Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57534.1795451462252605963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=Um8Wcrxz;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FF96441EA;
	Mon, 23 Nov 2026 16:31:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795451460;
	b=jaVF/7ExhikNtulwXKu2A3k610f8c+TZaiqTDng/WikWm4cOjOaPITgRC4iTErTLoBS7
	 z9q4MvC0PM7LBlq3RZ/hm1sfhNwntVjoTbKKDE6jcg9qIqafOL+KnVG95O83qnswOtS01
	 ayiTu64S5FvMbsp96rrYITjQPDdqMyjVL3afa3z6c4VgnBQmYYhfn7Hn5myG4tepLhA6C
	 wtDwHff4hLvl3NQsArk8npv3S1bqWZFL4x00nlckTHBiy7KJTmDG1BqP1E668Ct0rDUk4
	 wq8J4HEA0pTh6RShvLfoO2GYX05YYWTSHD501bt5K55wgeduralQX/zRDmTjPA6O8yg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795451460;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LJ0LwEFfTgFwUQ56VR7KTpZe8TxoHT0lMvh5l7gdGQo=;
	b=2ReUQ7fE6XdRsLFcrKoeDboiDmvzXVNjBeEUypHY9TRjHY2Cvox1pw87g0kbSd7CBF2z
	 gJCQk70Z+N1D6IqUgGL8jl667v+MOlwo16hSk5ZBuDetvRoG4yExo8oyDpCXYUiLWBxLX
	 3jv4lerNRCdOvfaeS0F1Ga1C5z1+rdM1khUFgfntnka153Nyc1n7Z737SRHjoT6XU75qO
	 bgUk9tVofZD0xmBc3LZ1owTY7WELBFV+gFO/lwI15uffMS/ZjWdC8OFLYQyc5Jsu7RqjM
	 CkF7NNTXqNq3iYNbFe2e7c9pvA09v2bUIkyovSHdQs5Sf+WxxcS9OADInDzhXWOR4dw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDD311F000D3;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451460;
	bh=LJ0LwEFfTgFwUQ56VR7KTpZe8TxoHT0lMvh5l7gdGQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Um8Wcrxzp8JusPePD+jL5RsA2XYgMJrVNQ3vkEQ4v9YT2RHvOyaxWhb5ZEAohbo65
	 i4i5zKA5mAK8Am92uBXzMJl5UCGdEmwWZelj3Nk/Z3UO7Uxi+v2+gtsOp324mTknJT
	 yz9n/ua740ACXeZFpj3PQ+b2ABiOgmoLdDCx1Q9P8HrCOEA74/JN5Fv847qLUYNbr5
	 hYbXhoYI5DLCn5iRnS/rs1HcSkmf7btucpncrJBrai3U2dVeM4PrI4Yzbqzxnc4SHW
	 GR2/kqn/3uFswdYRULDuxnaSfXFs9zoshxfuHkpC5P4jRXwNMuhWM4CrIhrLjVFY8r
	 nFpbZFo3IT3nQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5D5AB4C564;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Mon, 23 Nov 2026 17:30:42 +0100
Subject: [meta-webserver][scarthgap][PATCH 3/5] nginx: fix for
 CVE-2026-123633
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-fix_nginx2root-v1-3-1b30332ed757@belden.com>
References: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
In-Reply-To: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795451453; l=3503;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=8ne8Hq06KrKlw3C0lbV9QNheDv1YKDvPDzLvmEPxz9o=;
 b=9nej8tvsik2E5fs8WUY68Yzp8ceoOkN6xh6NmpOuXy44JgoT2Kh6MQRiaJPh6aitm4AVsur4z
 3NBJ999awAKCSwB8TMpqe22sda+C+zAUjV3TP1NBxitGDlNBwwK5h5H
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132903

From: Patrick Vogelaar <patrick.vogelaar@belden.com>

Pick patch [0] as mentioned in [1].

[0] https://github.com/nginx/nginx/commit/0c87dd1db413e440a4e3ef7ee8acc518509e8809
[1] https://security-tracker.debian.org/tracker/CVE-2026-123633

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 .../nginx/nginx-1.26.3/CVE-2026-123633.patch       | 52 ++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb |  1 +
 2 files changed, 53 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123633.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123633.patch
new file mode 100644
index 0000000000..2656fdb2fd
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123633.patch
@@ -0,0 +1,52 @@
+From af325f83ebfa3ed843f691c2542d58e321b8faad Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 17 Sep 2026 16:10:11 +0400
+Subject: [PATCH 02/10] HTTP/2: reset reusable connection status on stream
+ creation
+
+Previously, an HTTP/2 connection could be reusable while having streams.
+This could result in an attempt to drain the connection while processing
+one if its streams, for example when connecting to an upstream.  After
+recognizing that the connection has streams, an attempt to send the
+GOAWAY frame was made.  On send failure, the connection was immediately
+closed and its pool released.  This triggered a use-after-free up the
+stack.
+
+Having an HTTP/2 connection with streams registered as reusable became
+possible after 76672e650.  A connection with no streams and a partial
+frame read from client was registered as reusable to avoid DoS attacks.
+So if a client sends only the first HEADERS frame byte, the connection
+becomes reusable.  Later, when the remaining HEADERS bytes are received
+and a new stream is created, the reusable status is not reset until the
+connection becomes idle.
+
+Fix is to mark the connection non-reusable upon stream creation.
+
+Reported by Albert @ Vexera AI.
+
+(cherry picked from commit 0c87dd1db413e440a4e3ef7ee8acc518509e8809)
+
+CVE: CVE-2026-123633
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/0c87dd1db413e440a4e3ef7ee8acc518509e8809]
+
+Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
+---
+ src/http/v2/ngx_http_v2.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index 7ab97bbf9..4a7395227 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -3091,6 +3091,8 @@ ngx_http_v2_create_stream(ngx_http_v2_connection_t *h2c)
+ 
+     h2c->processing++;
+ 
++    ngx_reusable_connection(h2c->connection, 0);
++
+     h2c->priority_limit += h2scf->concurrent_streams;
+ 
+     if (h2c->connection->read->timer_set) {
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
index 2b392fd6d6..5d9fae672b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
@@ -11,6 +11,7 @@ SRC_URI:append = " \
                   file://CVE-2026-123007.patch \
                   file://CVE-2026-123634-01.patch \
                   file://CVE-2026-123634-02.patch \
+                  file://CVE-2026-123633.patch \
                   "
 
 SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"

-- 
2.43.0


