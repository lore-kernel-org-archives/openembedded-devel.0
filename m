Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57684.1795451466371296757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=TMNxdMzc;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E69EE42AF2;
	Mon, 23 Nov 2026 16:31:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795451465;
	b=krVhhlIMEAVCQIIzdOmqW1GHwvk7LOqjPj+Hv57XwSZhXh83VbSA9DNfxs3PSqJKHSp+
	 EKLzAB62Z3WObRIg8dvHOR2//2SbJPYCAysPkjHaSQ940JtPno7Hmkc8tHKrJK7bcsEgZ
	 Zw2jG9lPdNxMLnnBL1KLa+w8/cXHzZZUoQRvdgaaYicHkmw23UBWoN2vHrnK/3SSWTnGD
	 FV42vKORlb+1PJAkRBaYdQcrAt/n23h41AIv7L5siOaR/n9S+W9HYDOu26wGlQQdz9yO8
	 GZ/Xn0FF8wL2niHuYiMmOcKQ/4kDzaJVESXF9lgA4uR2YkMcyOyWN/mJpdz3boUrOCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795451465;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HegcwButHpsN3X6gbpI/xw1W9zMTK2gzTlgSwZLDK7o=;
	b=J6B/1/kNpRO9YJRSKPLWCKRV4yEQ7if263WZgZ/5mB2adlzVMeHgYIHpFr6AKF+Wc5qe
	 cfq1fcY9pGy9XFkuu+oEHe88KuZChtdfZ6BN5pwiSh8nU9J7py4PjVoCt3UXxBNoW/Bnt
	 Rf8JpRXtxf2tEW/qjfEmo0APkP64uLPMJfZ+jIKizOnUmh2x1OpKyX3CHLMq0jKEhyD6m
	 GLCkerc1VYvBPE1q3tbmptewl+qodmCyRA83wiUOAuIXmQf/jN+00az9pphB9pDULHnI7
	 POxpkvcqNemZLWBK6DXcROvAEJNIQgtAAv+5GE0AmgMzACgva3UP+Eco/VM7TqC9QPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E84401F000D4;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451465;
	bh=HegcwButHpsN3X6gbpI/xw1W9zMTK2gzTlgSwZLDK7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TMNxdMzcWb29Her8fL5nCyhsOXRSWzu8AsxlSAG30AXJpL/ma4jbJhEqur7vOcbDJ
	 WdW6XtcdLvsiUH+5aTWfImwvziW5f046I2SLvYQOsDaXCR5DUHyYShRA94PaLCGGqe
	 ZPbT2raP+JsRp00ZkrgXkeHrQh2WeWOz2B/XIA/ejzqXpk7cth6SU9IpSVs3iVpxBP
	 SL300oiv1iI0ZQuDTVy6fhk+Nl+BDDxHJ1r2XAEEXLWDAO24pTwivvtnTjzLRC7aU9
	 1zSlpkce1FMzU8NTtQyA/7ve/M6J7aASy59KhivVcOfo+axBoCO/x4y7+cs/8QgDG+
	 U4bE7QFy3b0IA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 782354C568;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Mon, 23 Nov 2026 17:30:43 +0100
Subject: [meta-webserver][scarthgap][PATCH 4/5] nginx: fix for
 CVE-2026-121810
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-fix_nginx2root-v1-4-1b30332ed757@belden.com>
References: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
In-Reply-To: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795451453; l=4251;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=18cQc14sXjcoz9SOGDhlCsgkBBPFKk//JMh2eLUdK9A=;
 b=pC1SRYzhL3vC17QEv7HRKy6oX63q72HNN9G+HFGcQoySIFVSv6IjV0jCZFLwZzUeARoPQlSMe
 PqDX1PZrBn5CCXSPazhB8FMaBDWdInmBTYo8PJ7iBoCw+sHVmIUdoFP
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132905

From: Patrick Vogelaar <patrick.vogelaar@belden.com>

Pick patch [0] as mentioned in [1].

[0] https://github.com/nginx/nginx/commit/c58d2a22d12350766185c94f2245bf4be5bcfb7d
[1] https://security-tracker.debian.org/tracker/CVE-2026-121810

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 .../nginx/nginx-1.26.3/CVE-2026-121810.patch       | 70 ++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb |  1 +
 2 files changed, 71 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-121810.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-121810.patch
new file mode 100644
index 0000000000..5a360bcebf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-121810.patch
@@ -0,0 +1,70 @@
+From 834889f29f789880eb68d4a7b824dc7fd247f65b Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Sun, 1 Nov 2026 16:46:22 +0400
+Subject: [PATCH 05/10] QUIC: avoid main connection reuse after creating a
+ stream
+
+Previously, ngx_quic_create_stream() cleared the main connection's
+reusable flag and then called ngx_get_connection() before inserting the
+new stream into the tree.  If the worker was low on free connections,
+the drain inside ngx_get_connection() could close an idle stream of the
+same main connection.  Since the new stream was not in the tree yet,
+that close found no remaining streams and marked the main connection
+reusable again.  Once reusable, the connection could later be drained
+while processing one of its streams, for example when connecting to an
+upstream, freeing it while still in use.
+
+Fix is to insert the new stream into the tree before calling
+ngx_get_connection(), so the main connection is not considered idle.
+
+Reported by Xint.io.
+
+(cherry picked from commit c58d2a22d12350766185c94f2245bf4be5bcfb7d)
+CVE: CVE-2026-121810
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/c58d2a22d12350766185c94f2245bf4be5bcfb7d]
+
+Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
+---
+ src/event/quic/ngx_event_quic_streams.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/event/quic/ngx_event_quic_streams.c b/src/event/quic/ngx_event_quic_streams.c
+index a9a21f578..7fe044750 100644
+--- a/src/event/quic/ngx_event_quic_streams.c
++++ b/src/event/quic/ngx_event_quic_streams.c
+@@ -731,12 +731,15 @@ ngx_quic_create_stream(ngx_connection_t *c, uint64_t id)
+         addr_text.data = NULL;
+     }
+ 
++    ngx_rbtree_insert(&qc->streams.tree, &qs->node);
++
+     reusable = c->reusable;
+     ngx_reusable_connection(c, 0);
+ 
+     sc = ngx_get_connection(c->fd, log);
+     if (sc == NULL) {
+         ngx_destroy_pool(pool);
++        ngx_rbtree_delete(&qc->streams.tree, &qs->node);
+         ngx_queue_insert_tail(&qc->streams.free, &qs->queue);
+         ngx_reusable_connection(c, reusable);
+         return NULL;
+@@ -803,6 +806,7 @@ ngx_quic_create_stream(ngx_connection_t *c, uint64_t id)
+     if (cln == NULL) {
+         ngx_close_connection(sc);
+         ngx_destroy_pool(pool);
++        ngx_rbtree_delete(&qc->streams.tree, &qs->node);
+         ngx_queue_insert_tail(&qc->streams.free, &qs->queue);
+         ngx_reusable_connection(c, reusable);
+         return NULL;
+@@ -811,8 +815,6 @@ ngx_quic_create_stream(ngx_connection_t *c, uint64_t id)
+     cln->handler = ngx_quic_stream_cleanup_handler;
+     cln->data = sc;
+ 
+-    ngx_rbtree_insert(&qc->streams.tree, &qs->node);
+-
+     return qs;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
index 5d9fae672b..06c33d7846 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
@@ -12,6 +12,7 @@ SRC_URI:append = " \
                   file://CVE-2026-123634-01.patch \
                   file://CVE-2026-123634-02.patch \
                   file://CVE-2026-123633.patch \
+                  file://CVE-2026-121810.patch \
                   "
 
 SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"

-- 
2.43.0


