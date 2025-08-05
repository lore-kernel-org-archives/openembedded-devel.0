Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BBDC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:59:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.21747.1754474359819714723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AW4SIzQD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754474360; x=1786010360;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ksYgo8QZZWRBkWw3/3zTXDYoRUmIKkVid1bUVxmluZU=;
  b=AW4SIzQDSTym+PfbObTDFGTO8fRNOhhRGE5bkHP5UTYuXrxtN4sGGBvQ
   AQi550bbqKqdkFxknZBIhO8S/tns0S5u0p9NhrHJmxa+sOI3r8TLCJ+db
   4BqUVwGxq3PU5Uf2Xfiz5OcBID0ZtbbXBSws/bMklWhED8mSg2D12vgpa
   3S6XAPylQzE8PoFetaf6neEHdzoF16vWXuNRmfm5LVmztPFBCJa1jAbLe
   WGqF/2dwQfA3HBX/ASPhGY+mXQ35T+mvqJ4V/3hDfT6yucETAFoTDivcB
   7YJI+39aY1pX8fVSnasi43Gwv4Cx7ufxeqKEWBjrDx/eQHOHl0Qv8XQ4s
   Q==;
X-CSE-ConnectionGUID: jfpmwB4sTtCpLIl7JCjXmg==
X-CSE-MsgGUID: 49PmSNgORrSXpf1CGP7Y+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="211924138"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="211924138"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 18:59:18 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EEE811C000B7
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Aug 2025 09:59:17 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A3D861000448
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Aug 2025 09:59:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 54D1814000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Aug 2025 09:59:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3CE951A0104;
	Tue,  5 Aug 2025 16:57:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] neatvnc: upgrade 0.8.1 -> 0.9.5
Date: Tue,  5 Aug 2025 16:57:15 +0800
Message-ID: <20250805085715.215-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 09:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118892

From: Wang Mingyu <wangmy@fujitsu.com>

compatible with upgraded aml 1.0.0
0001-meson-Use-new-pkgconfig-for-aml1.patch
0001-Use-aml-v1.patch

dependency patch of 0001-Use-aml-v1.patch:
0001-Add-method-to-listen-on-multiple-fds.patch

Changelog: https://github.com/any1/neatvnc/releases/tag/v0.9.0
Changelog: https://github.com/any1/neatvnc/releases/tag/v0.9.1
Changelog: https://github.com/any1/neatvnc/releases/tag/v0.9.2
Changelog: https://github.com/any1/neatvnc/releases/tag/v0.9.3
Changelog: https://github.com/any1/neatvnc/releases/tag/v0.9.4
Changelog: https://github.com/any1/neatvnc/releases/tag/v0.9.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Add-method-to-listen-on-multiple-fds.patch | 309 ++++++++++++++++++
 .../neatvnc/neatvnc/0001-Use-aml-v1.patch     | 281 ++++++++++++++++
 ...001-meson-Use-new-pkgconfig-for-aml1.patch |  27 ++
 .../{neatvnc_0.8.1.bb => neatvnc_0.9.5.bb}    |   8 +-
 4 files changed, 623 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.1.bb => neatvnc_0.9.5.bb} (77%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch
new file mode 100644
index 0000000000..601ddeed93
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch
@@ -0,0 +1,309 @@
+From a701040581706a2abf3483ea68d19142cbd68bcf Mon Sep 17 00:00:00 2001
+From: Andri Yngvason <andri@yngvason.is>
+Date: Sat, 23 Nov 2024 11:36:06 +0000
+Subject: [PATCH] Add method to listen on multiple fds
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/a701040581706a2abf3483ea68d19142cbd68bcf]
+---
+ examples/draw.c       |   2 +-
+ examples/png-server.c |   2 +-
+ include/common.h      |  15 ++++--
+ include/neatvnc.h     |  14 ++++-
+ src/server.c          | 122 ++++++++++++++++++++++++++++++------------
+ 5 files changed, 116 insertions(+), 39 deletions(-)
+
+diff --git a/examples/draw.c b/examples/draw.c
+index 7fb8fe6..13d5d09 100644
+--- a/examples/draw.c
++++ b/examples/draw.c
+@@ -340,7 +340,7 @@ int main(int argc, char* argv[])
+ 
+ 	aml_run(aml);
+ 
+-	nvnc_close(server);
++	nvnc_del(server);
+ 	nvnc_display_unref(draw.display);
+ 	nvnc_fb_pool_unref(draw.fb_pool);
+ 	pixman_image_unref(draw.whiteboard);
+diff --git a/examples/png-server.c b/examples/png-server.c
+index b8cc015..e35a6f1 100644
+--- a/examples/png-server.c
++++ b/examples/png-server.c
+@@ -68,7 +68,7 @@ int main(int argc, char* argv[])
+ 
+ 	aml_run(aml);
+ 
+-	nvnc_close(server);
++	nvnc_del(server);
+ 	nvnc_display_unref(display);
+ 	nvnc_fb_unref(fb);
+ 	aml_unref(aml);
+diff --git a/include/common.h b/include/common.h
+index e0b87c2..14c0ed9 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -157,12 +157,21 @@ enum nvnc__socket_type {
+ 	NVNC__SOCKET_FROM_FD,
+ };
+ 
++struct nvnc__socket {
++	struct nvnc* parent;
++	enum nvnc_stream_type type;
++	bool is_external;
++	int fd;
++	struct aml_handler* poll_handle;
++	LIST_ENTRY(nvnc__socket) link;
++};
++
++LIST_HEAD(nvnc__socket_list, nvnc__socket);
++
+ struct nvnc {
+ 	struct nvnc_common common;
+ 	bool is_closing;
+-	int fd;
+-	enum nvnc__socket_type socket_type;
+-	struct aml_handler* poll_handle;
++	struct nvnc__socket_list sockets;
+ 	struct nvnc_client_list clients;
+ 	char name[256];
+ 	void* userdata;
+diff --git a/include/neatvnc.h b/include/neatvnc.h
+index 78d9f97..c9303a8 100644
+--- a/include/neatvnc.h
++++ b/include/neatvnc.h
+@@ -74,6 +74,11 @@ enum nvnc_fb_type {
+ 	NVNC_FB_GBM_BO,
+ };
+ 
++enum nvnc_stream_type {
++	NVNC_STREAM_NORMAL = 0,
++	NVNC_STREAM_WEBSOCKET,
++};
++
+ /* This is the same as wl_output_transform */
+ enum nvnc_transform {
+ 	NVNC_TRANSFORM_NORMAL = 0,
+@@ -135,11 +140,18 @@ typedef bool (*nvnc_desktop_layout_fn)(
+ 
+ extern const char nvnc_version[];
+ 
++struct nvnc* nvnc_new(void);
++void nvnc_del(struct nvnc* self);
++
++int nvnc_listen(struct nvnc* self, int fd, enum nvnc_stream_type type);
++
+ struct nvnc* nvnc_open(const char* addr, uint16_t port);
+ struct nvnc* nvnc_open_unix(const char *addr);
+ struct nvnc* nvnc_open_websocket(const char* addr, uint16_t port);
+ struct nvnc* nvnc_open_from_fd(int fd);
+-void nvnc_close(struct nvnc* self);
++
++void nvnc_close(struct nvnc* self)
++	__attribute__((deprecated("replaced with nvnc_del")));
+ 
+ void nvnc_add_display(struct nvnc*, struct nvnc_display*);
+ void nvnc_remove_display(struct nvnc*, struct nvnc_display*);
+diff --git a/src/server.c b/src/server.c
+index b94ed0d..ded2dab 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -1981,7 +1981,9 @@ static void on_client_event(struct stream* stream, enum stream_event event)
+ 
+ static void on_connection(void* obj)
+ {
+-	struct nvnc* server = aml_get_userdata(obj);
++	struct aml_handler* poll_handle = obj;
++	struct nvnc__socket* socket = aml_get_userdata(poll_handle);
++	struct nvnc* server = socket->parent;
+ 
+ 	struct nvnc_client* client = calloc(1, sizeof(*client));
+ 	if (!client)
+@@ -2002,7 +2004,7 @@ static void on_connection(void* obj)
+ 	client->ext_clipboard_max_unsolicited_text_size =
+ 		MAX_CLIENT_UNSOLICITED_TEXT_SIZE;
+ 
+-	int fd = accept(server->fd, NULL, 0);
++	int fd = accept(socket->fd, NULL, 0);
+ 	if (fd < 0) {
+ 		nvnc_log(NVNC_LOG_WARNING, "Failed to accept a connection");
+ 		goto accept_failure;
+@@ -2012,7 +2014,7 @@ static void on_connection(void* obj)
+ 	setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &one, sizeof(one));
+ 
+ #ifdef ENABLE_WEBSOCKET
+-	if (server->socket_type == NVNC__SOCKET_WEBSOCKET)
++	if (socket->type == NVNC_STREAM_WEBSOCKET)
+ 	{
+ 		client->net_stream = stream_ws_new(fd, on_client_event, client);
+ 	}
+@@ -2182,44 +2184,60 @@ static int bind_address(const char* name, uint16_t port,
+ 	return -1;
+ }
+ 
+-static struct nvnc* open_common(const char* address, uint16_t port,
+-		int fd, enum nvnc__socket_type type)
++static struct nvnc__socket* nvnc__listen(struct nvnc* self, int fd,
++		enum nvnc_stream_type type)
+ {
+-	nvnc__log_init();
++	struct nvnc__socket* socket = calloc(1, sizeof(*self));
++	if (!socket)
++		return NULL;
+ 
+-	aml_require_workers(aml_get_default(), -1);
++	if (listen(fd, 16) < 0)
++		goto failure;
+ 
+-	struct nvnc* self = calloc(1, sizeof(*self));
+-	if (!self)
+-		return NULL;
++	socket->parent = self;
++	socket->type = type;
++	socket->fd = fd;
++	socket->is_external = true;
+ 
+-	self->socket_type = type;
++	socket->poll_handle = aml_handler_new(fd, on_connection, socket, NULL);
++	if (!socket->poll_handle) {
++		goto failure;
++	}
+ 
+-	strcpy(self->name, DEFAULT_NAME);
++	aml_start(aml_get_default(), socket->poll_handle);
+ 
+-	LIST_INIT(&self->clients);
++	LIST_INSERT_HEAD(&self->sockets, socket, link);
++	return socket;
+ 
+-	self->fd = bind_address(address, port, fd, type);
+-	if (self->fd < 0)
++failure:
++	free(socket);
++	return NULL;
++}
++
++static struct nvnc* open_common(const char* address, uint16_t port,
++		int fd, enum nvnc__socket_type type)
++{
++	struct nvnc* self = nvnc_new();
++	if (!self)
++		return NULL;
++
++	int bound_fd = bind_address(address, port, fd, type);
++	if (bound_fd < 0)
+ 		goto bind_failure;
+ 
+-	if (listen(self->fd, 16) < 0)
+-		goto listen_failure;
++	enum nvnc_stream_type stream_type = type == NVNC__SOCKET_WEBSOCKET ?
++		NVNC_STREAM_WEBSOCKET : NVNC_STREAM_NORMAL;
+ 
+-	self->poll_handle = aml_handler_new(self->fd, on_connection, self, NULL);
+-	if (!self->poll_handle)
+-		goto handle_failure;
++	struct nvnc__socket* socket = nvnc__listen(self, bound_fd, stream_type);
++	if (!socket)
++		goto listen_failure;
+ 
+-	if (aml_start(aml_get_default(), self->poll_handle) < 0)
+-		goto poll_start_failure;
++	socket->is_external = type == NVNC__SOCKET_FROM_FD;
+ 
+ 	return self;
+ 
+-poll_start_failure:
+-	aml_unref(self->poll_handle);
+-handle_failure:
+ listen_failure:
+-	close(self->fd);
++	close(bound_fd);
+ 	if (type == NVNC__SOCKET_UNIX) {
+ 		unlink(address);
+ 	}
+@@ -2229,6 +2247,31 @@ bind_failure:
+ 	return NULL;
+ }
+ 
++EXPORT
++struct nvnc* nvnc_new(void)
++{
++	nvnc__log_init();
++	aml_require_workers(aml_get_default(), -1);
++
++	struct nvnc* self = calloc(1, sizeof(*self));
++	if (!self)
++		return NULL;
++
++	strcpy(self->name, DEFAULT_NAME);
++
++	LIST_INIT(&self->sockets);
++	LIST_INIT(&self->clients);
++
++	return self;
++}
++
++EXPORT
++int nvnc_listen(struct nvnc* self, int fd, enum nvnc_stream_type type)
++{
++	struct nvnc__socket* socket = nvnc__listen(self, fd, type);
++	return socket ? 0 : -1;
++}
++
+ EXPORT
+ struct nvnc* nvnc_open(const char* address, uint16_t port)
+ {
+@@ -2270,7 +2313,7 @@ static void unlink_fd_path(int fd)
+ }
+ 
+ EXPORT
+-void nvnc_close(struct nvnc* self)
++void nvnc_del(struct nvnc* self)
+ {
+ 	self->is_closing = true;
+ 
+@@ -2293,12 +2336,20 @@ void nvnc_close(struct nvnc* self)
+ 	while (!LIST_EMPTY(&self->clients))
+ 		client_close(LIST_FIRST(&self->clients));
+ 
+-	aml_stop(aml_get_default(), self->poll_handle);
+-	// Do not unlink an externally managed fd.
+-	if(self->socket_type != NVNC__SOCKET_FROM_FD) {
+-		unlink_fd_path(self->fd);
++	while (!LIST_EMPTY(&self->sockets)) {
++		struct nvnc__socket* socket = LIST_FIRST(&self->sockets);
++		LIST_REMOVE(socket, link);
++
++		aml_stop(aml_get_default(), socket->poll_handle);
++		aml_unref(socket->poll_handle);
++
++		if (!socket->is_external) {
++			unlink_fd_path(socket->fd);
++		}
++		close(socket->fd);
++
++		free(socket);
+ 	}
+-	close(self->fd);
+ 
+ #ifdef HAVE_CRYPTO
+ 	crypto_rsa_priv_key_del(self->rsa_priv);
+@@ -2314,10 +2365,15 @@ void nvnc_close(struct nvnc* self)
+ 
+ 	free(self->ext_clipboard_provide_msg.buffer);
+ 
+-	aml_unref(self->poll_handle);
+ 	free(self);
+ }
+ 
++EXPORT
++void nvnc_close(struct nvnc* self)
++{
++	nvnc_del(self);
++}
++
+ static void process_pending_fence(struct nvnc_client* client)
+ {
+ 	if (client->pending_fence.n_pending_requests == 0) {
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
new file mode 100644
index 0000000000..26c3a0230c
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
@@ -0,0 +1,281 @@
+From a4b238241f3f3016ef3ddcd260c1490a9c9e8168 Mon Sep 17 00:00:00 2001
+From: Andri Yngvason <andri@yngvason.is>
+Date: Sun, 23 Mar 2025 15:55:11 +0000
+Subject: [PATCH] Use aml v1
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/a4b238241f3f3016ef3ddcd260c1490a9c9e8168]
+---
+ meson.build                 |  2 +-
+ src/enc/h264/ffmpeg-impl.c  |  8 ++++----
+ src/enc/h264/v4l2m2m-impl.c |  4 ++--
+ src/enc/raw.c               |  8 ++++----
+ src/enc/tight.c             | 18 +++++++++---------
+ src/enc/zrle.c              |  8 ++++----
+ src/resampler.c             |  7 ++-----
+ src/server.c                |  6 ++----
+ src/stream/gnutls.c         |  6 +++---
+ src/stream/tcp.c            |  6 +++---
+ 11 files changed, 35 insertions(+), 41 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 1017ffd..e731886 100644
+--- a/meson.build
++++ b/meson.build
+@@ -71,7 +71,7 @@ libavcodec = dependency('libavcodec', required: get_option('h264'))
+ libavfilter = dependency('libavfilter', required: get_option('h264'))
+ libavutil = dependency('libavutil', required: get_option('h264'))
+ 
+-aml_version = ['>=0.3.0', '<0.4.0']
++aml_version = ['>=1.0.0', '<2.0.0']
+ aml_project = subproject('aml', required: false, version: aml_version)
+ if aml_project.found()
+ 	aml = aml_project.get_variable('aml_dep')
+diff --git a/src/enc/h264/ffmpeg-impl.c b/src/enc/h264/ffmpeg-impl.c
+index 3bd584c..148b1c3 100644
+--- a/src/enc/h264/ffmpeg-impl.c
++++ b/src/enc/h264/ffmpeg-impl.c
+@@ -415,9 +415,9 @@ get_frame_failure:
+ 	return rc == AVERROR(EAGAIN) ? 0 : rc;
+ }
+ 
+-static void h264_encoder__do_work(void* handle)
++static void h264_encoder__do_work(struct aml_work* work)
+ {
+-	struct h264_encoder_ffmpeg* self = aml_get_userdata(handle);
++	struct h264_encoder_ffmpeg* self = aml_get_userdata(work);
+ 
+ 	AVFrame* frame = fb_to_avframe(self->current_fb);
+ 	assert(frame); // TODO
+@@ -453,9 +453,9 @@ failure:
+ 	av_frame_free(&frame);
+ }
+ 
+-static void h264_encoder__on_work_done(void* handle)
++static void h264_encoder__on_work_done(struct aml_work* work)
+ {
+-	struct h264_encoder_ffmpeg* self = aml_get_userdata(handle);
++	struct h264_encoder_ffmpeg* self = aml_get_userdata(work);
+ 
+ 	uint64_t pts = nvnc_fb_get_pts(self->current_fb);
+ 	nvnc_fb_release(self->current_fb);
+diff --git a/src/enc/h264/v4l2m2m-impl.c b/src/enc/h264/v4l2m2m-impl.c
+index b9d1236..d286932 100644
+--- a/src/enc/h264/v4l2m2m-impl.c
++++ b/src/enc/h264/v4l2m2m-impl.c
+@@ -511,9 +511,9 @@ static void encode_buffer(struct h264_encoder_v4l2m2m* self,
+ 	}
+ }
+ 
+-static void process_fd_events(void* handle)
++static void process_fd_events(struct aml_handler* handler)
+ {
+-	struct h264_encoder_v4l2m2m* self = aml_get_userdata(handle);
++	struct h264_encoder_v4l2m2m* self = aml_get_userdata(handler);
+ 	process_dst_bufs(self);
+ }
+ 
+diff --git a/src/enc/raw.c b/src/enc/raw.c
+index 806f074..2bc8302 100644
+--- a/src/enc/raw.c
++++ b/src/enc/raw.c
+@@ -126,9 +126,9 @@ static int raw_encode_frame(struct raw_encoder_work* ctx, struct vec* dst,
+ 	return 0;
+ }
+ 
+-static void raw_encoder_do_work(void* obj)
++static void raw_encoder_do_work(struct aml_work* work)
+ {
+-	struct raw_encoder_work* ctx = aml_get_userdata(obj);
++	struct raw_encoder_work* ctx = aml_get_userdata(work);
+ 	int rc __attribute__((unused));
+ 
+ 	struct nvnc_fb* fb = ctx->fb;
+@@ -163,9 +163,9 @@ static void raw_encoder_do_work(void* obj)
+ 	assert(ctx->result);
+ }
+ 
+-static void raw_encoder_on_done(void* obj)
++static void raw_encoder_on_done(struct aml_work* work)
+ {
+-	struct raw_encoder_work* ctx = aml_get_userdata(obj);
++	struct raw_encoder_work* ctx = aml_get_userdata(work);
+ 	struct raw_encoder* self = ctx->parent;
+ 
+ 	assert(ctx->result);
+diff --git a/src/enc/tight.c b/src/enc/tight.c
+index a361974..441df19 100644
+--- a/src/enc/tight.c
++++ b/src/enc/tight.c
+@@ -106,8 +106,8 @@ struct tight_zs_worker_ctx {
+ 
+ struct encoder_impl encoder_impl_tight;
+ 
+-static void do_tight_zs_work(void*);
+-static void on_tight_zs_work_done(void*);
++static void do_tight_zs_work(struct aml_work*);
++static void on_tight_zs_work_done(struct aml_work*);
+ static int schedule_tight_finish(struct tight_encoder* self);
+ 
+ static inline struct tight_encoder* tight_encoder(struct encoder* encoder)
+@@ -428,9 +428,9 @@ static void tight_encode_tile(struct tight_encoder* self,
+ 	tile->state = TIGHT_TILE_ENCODED;
+ }
+ 
+-static void do_tight_zs_work(void* obj)
++static void do_tight_zs_work(struct aml_work* work)
+ {
+-	struct tight_zs_worker_ctx* ctx = aml_get_userdata(obj);
++	struct tight_zs_worker_ctx* ctx = aml_get_userdata(work);
+ 	struct tight_encoder* self = ctx->encoder;
+ 	int index = ctx->index;
+ 
+@@ -440,7 +440,7 @@ static void do_tight_zs_work(void* obj)
+ 				tight_encode_tile(self, x, y);
+ }
+ 
+-static void on_tight_zs_work_done(void* obj)
++static void on_tight_zs_work_done(struct aml_work* obj)
+ {
+ 	struct tight_zs_worker_ctx* ctx = aml_get_userdata(obj);
+ 	struct tight_encoder* self = ctx->encoder;
+@@ -509,15 +509,15 @@ static void tight_finish(struct tight_encoder* self)
+ 				tight_finish_tile(self, x, y);
+ }
+ 
+-static void do_tight_finish(void* obj)
++static void do_tight_finish(struct aml_work* work)
+ {
+-	struct tight_encoder* self = aml_get_userdata(obj);
++	struct tight_encoder* self = aml_get_userdata(work);
+ 	tight_finish(self);
+ }
+ 
+-static void on_tight_finished(void* obj)
++static void on_tight_finished(struct aml_work* work)
+ {
+-	struct tight_encoder* self = aml_get_userdata(obj);
++	struct tight_encoder* self = aml_get_userdata(work);
+ 
+ 	struct encoded_frame* result;
+ 	result = encoded_frame_new(self->dst.data, self->dst.len, self->n_rects,
+diff --git a/src/enc/zrle.c b/src/enc/zrle.c
+index 42044dc..e775f34 100644
+--- a/src/enc/zrle.c
++++ b/src/enc/zrle.c
+@@ -315,9 +315,9 @@ static int zrle_encode_frame(struct zrle_encoder* self,
+ 	return 0;
+ }
+ 
+-static void zrle_encoder_do_work(void* obj)
++static void zrle_encoder_do_work(struct aml_work* work)
+ {
+-	struct zrle_encoder* self = aml_get_userdata(obj);
++	struct zrle_encoder* self = aml_get_userdata(work);
+ 	int rc __attribute__((unused));
+ 
+ 	struct nvnc_fb* fb = self->current_fb;
+@@ -349,9 +349,9 @@ static void zrle_encoder_do_work(void* obj)
+ 	assert(self->current_result);
+ }
+ 
+-static void zrle_encoder_on_done(void* obj)
++static void zrle_encoder_on_done(struct aml_work* work)
+ {
+-	struct zrle_encoder* self = aml_get_userdata(obj);
++	struct zrle_encoder* self = aml_get_userdata(work);
+ 
+ 	assert(self->current_result);
+ 
+diff --git a/src/resampler.c b/src/resampler.c
+index e24798b..8f4cfa0 100644
+--- a/src/resampler.c
++++ b/src/resampler.c
+@@ -147,9 +147,8 @@ void resample_now(struct nvnc_fb* dst, struct nvnc_fb* src,
+ 	pixman_image_unref(dstimg);
+ }
+ 
+-static void do_work(void* handle)
++static void do_work(struct aml_work* work)
+ {
+-	struct aml_work* work = handle;
+ 	struct resampler_work* ctx = aml_get_userdata(work);
+ 
+ 	struct nvnc_fb* src = ctx->src;
+@@ -159,11 +158,9 @@ static void do_work(void* handle)
+ 	resample_now(dst, src, &dst_side_data->buffer_damage);
+ }
+ 
+-static void on_work_done(void* handle)
++static void on_work_done(struct aml_work* work)
+ {
+-	struct aml_work* work = handle;
+ 	struct resampler_work* ctx = aml_get_userdata(work);
+-
+ 	ctx->on_done(ctx->dst, &ctx->frame_damage, ctx->userdata);
+ }
+ 
+diff --git a/src/server.c b/src/server.c
+index f172658..61da4dd 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -210,9 +210,8 @@ static void client_close(struct nvnc_client* client)
+ 	free(client);
+ }
+ 
+-static void do_deferred_client_close(void* obj)
++static void do_deferred_client_close(struct aml_idle* idle)
+ {
+-	struct aml_idle* idle = obj;
+ 	struct nvnc_client* client = aml_get_userdata(idle);
+ 	client->close_task = NULL;
+ 	aml_stop(aml_get_default(), idle);
+@@ -2033,9 +2032,8 @@ static void on_client_event(struct stream* stream, enum stream_event event)
+ 	client->buffer_index = 0;
+ }
+ 
+-static void on_connection(void* obj)
++static void on_connection(struct aml_handler* poll_handle)
+ {
+-	struct aml_handler* poll_handle = obj;
+ 	struct nvnc__socket* socket = aml_get_userdata(poll_handle);
+ 	struct nvnc* server = socket->parent;
+ 
+diff --git a/src/stream/gnutls.c b/src/stream/gnutls.c
+index 14661e5..00a7c13 100644
+--- a/src/stream/gnutls.c
++++ b/src/stream/gnutls.c
+@@ -171,10 +171,10 @@ static void stream_gnutls__on_writable(struct stream* self)
+ 	}
+ }
+ 
+-static void stream_gnutls__on_event(void* obj)
++static void stream_gnutls__on_event(struct aml_handler* handler)
+ {
+-	struct stream* self = aml_get_userdata(obj);
+-	uint32_t events = aml_get_revents(obj);
++	struct stream* self = aml_get_userdata(handler);
++	uint32_t events = aml_get_revents(handler);
+ 
+ 	stream_ref(self);
+ 
+diff --git a/src/stream/tcp.c b/src/stream/tcp.c
+index 37f139a..95f5aa8 100644
+--- a/src/stream/tcp.c
++++ b/src/stream/tcp.c
+@@ -191,10 +191,10 @@ static void stream_tcp__on_writable(struct stream* self)
+ 	}
+ }
+ 
+-static void stream_tcp__on_event(void* obj)
++static void stream_tcp__on_event(struct aml_handler* handler)
+ {
+-	struct stream* self = aml_get_userdata(obj);
+-	uint32_t events = aml_get_revents(obj);
++	struct stream* self = aml_get_userdata(handler);
++	uint32_t events = aml_get_revents(handler);
+ 
+ 	// We hold a reference here in case the stream gets destroyed inside
+ 	// callback.
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch
new file mode 100644
index 0000000000..ec47fb61fb
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch
@@ -0,0 +1,27 @@
+From c1f4833dc13403882a3efbb8a69de33191fb72c6 Mon Sep 17 00:00:00 2001
+From: Andri Yngvason <andri@yngvason.is>
+Date: Sun, 27 Jul 2025 14:17:54 +0000
+Subject: [PATCH] meson: Use new pkgconfig for aml1
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/c1f4833dc13403882a3efbb8a69de33191fb72c6] 
+
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index e731886..59364a7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -76,7 +76,7 @@ aml_project = subproject('aml', required: false, version: aml_version)
+ if aml_project.found()
+ 	aml = aml_project.get_variable('aml_dep')
+ else
+-	aml = dependency('aml', version: aml_version)
++	aml = dependency('aml1', version: aml_version)
+ endif
+ 
+ inc = include_directories('include')
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.5.bb
similarity index 77%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.5.bb
index 2b26ec57ae..b83a886f11 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.5.bb
@@ -4,9 +4,13 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v0.9;protocol=https \
+           file://0001-meson-Use-new-pkgconfig-for-aml1.patch \
+           file://0001-Add-method-to-listen-on-multiple-fds.patch \
+           file://0001-Use-aml-v1.patch \
+          "
 
-SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
+SRCREV = "36ef59a83291368d72f471700702a8b6a76f763b"
 
 
 DEPENDS = "libdrm pixman aml zlib"
-- 
2.43.0


