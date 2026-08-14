Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A83C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24509.1786747596907602866
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fip2tJeA;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceab75934dso19390255ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747596; x=1787352396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87+iZrjUuSUJ0SLbKjh3BqnMq4ydBDTLTFUA4g1VAo4=;
        b=Fip2tJeAbNLqj/PyPyeMXqN++m8qdfo7nmO8x1FENwaFlQHNhLfn8IfiJBLszOZLnX
         LUOmkKaddZjyuARxhBB19gnAlYd76RXSxuJUHkHLcVqhUA91HGOynZCAYvyQWKbCyY1a
         25L4Wwfb0zoz5ZVRNpZ/fXIAMu7SZ8/iI2m2TscuNKc+vZxl/9IS5q/6Tmda6SYug5gp
         TCsbdTZeMl6VcQdDmQIKrLQ+FB7rEkb9easM+KtlFvsWqwnZ+GoVp1Q2iN2ryE6zi9z1
         51lOGNNuPCf7CM2+Cv3Q3o643rnYe/28IZ2Ix0kIlNQFG2gDNUhPH84aUOEIalII+M4+
         zemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747596; x=1787352396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87+iZrjUuSUJ0SLbKjh3BqnMq4ydBDTLTFUA4g1VAo4=;
        b=tYQKl0RfK0lxX0YoZoT1rtULHcu4l2OtK4ejmU4fCXyP2aecn2IXR18UPD3TekUfux
         8OqDduHrifMCwhxNTlWVc0u/pMgpenRTbzNqgkdhE0l9cqPOPN8CH7AjYyA53+7oqyof
         8S7Dm0OmLtLfgc0JrvMvIDdejA6wVRpqlBoTJJwcq+zqTz1r9A7YKea8KtXv79RXJSan
         5tvgiXL3KNhfgIbXoeluks1tFW5WL3ejVkQlYqJ7i7MHlM9yYhbwQlvM0nvz6MNQGlO/
         Yi/3FjJgn/2Fi56PJOEIwNJdAoj7zj8sD0U+OJ0sK4w6DMLH77MMXzHn7Yi/rLFGK55l
         cW7g==
X-Gm-Message-State: AOJu0YzsFcTT61Q1AMeDL4CFkgRUV4kIOPXh6jHAuwSV0/LaJMwBR7bQ
	eCibYmokzx3Q9sw9hUZtEnYa9WyLNU6kBcBGrZV6/d2NFSt5shniswjxw6hIF9hf
X-Gm-Gg: AR+sD13YYazX8kpYpUg0Juv+JTEnfxkbRycTTy5NigsUsuU8fU8YFCwowzsliBNQ3+M
	evKFW4jhGajhhJI4xKMw0Y5YL29kFEoRnigeW3npGP8+bAvs5TIuqA8VUDn6UCPUyCRmKGbO8eP
	shxFSvbjeGRS0c02spadY/8iDsQrwobXFNajAZFbcgjOEcXHkcfPkcZ/4Dp0sS7zXnAmC63fVYW
	zrYNIlNKNPPcfwKLNSiiT4fji9c/XVTwp8WXFghz2uyQ41BIZV1ea4hr8X0MDGdhIDDB/mFaIcq
	9Zb9ozFUwuL7EPq/BlFdDg+ulgM0Br7aXQXOZswhBDnpwOV6+/ykNkcCxwZJFqLdEyn70aWxBsI
	SQ9UkmNMQF75Jvwy3K5qCmxOGHscmvqltYrZE107bEYXErDuOao0MjLqYqUg/YQfKMJ4EjGDHE7
	el+fGVAni5kXRjXLTVnuV4taf1FHte24ZjJccer8hWEsnGWFL2QjLKJs9yMIRw2UTJlo3QnAaNH
	85yx8XirRoZEXw8lt7KK0FhTFC3Mjl9JwgIztbctuP21c/BBMVa85iwMkNDj5CnYvFVx8iem4Zr
	r9jeWhqY1pi5I3xmg2EQOxq3QTAeZIZCJpjTJcAN7HZysDuWDP7xEsMnVxzKpK0GeTDgb4NSm4p
	FN9wVFPrTlW9uDGlGEDpK6TpOvMWmU/+3TNOtfnwXIw18zA==
X-Received: by 2002:a05:6a20:d4b:b0:3c3:68b0:e273 with SMTP id adf61e73a8af0-3cc71d11cdbmr11236912637.15.1786747596082;
        Fri, 14 Aug 2026 15:46:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 047/109] neatvnc: upgrade 0.9.6 -> 1.0.1
Date: Fri, 14 Aug 2026 15:44:33 -0700
Message-ID: <20260814224539.1523174-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129111

Major release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Add-method-to-listen-on-multiple-fds.patch | 309 ------------------
 .../neatvnc/neatvnc/0001-Use-aml-v1.patch     | 278 ----------------
 ...001-meson-Use-new-pkgconfig-for-aml1.patch |  27 --
 .../{neatvnc_0.9.6.bb => neatvnc_1.0.1.bb}    |   8 +-
 4 files changed, 2 insertions(+), 620 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch
 delete mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
 delete mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.9.6.bb => neatvnc_1.0.1.bb} (77%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch
deleted file mode 100644
index 601ddeed93..0000000000
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Add-method-to-listen-on-multiple-fds.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-From a701040581706a2abf3483ea68d19142cbd68bcf Mon Sep 17 00:00:00 2001
-From: Andri Yngvason <andri@yngvason.is>
-Date: Sat, 23 Nov 2024 11:36:06 +0000
-Subject: [PATCH] Add method to listen on multiple fds
-
-Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/a701040581706a2abf3483ea68d19142cbd68bcf]
----
- examples/draw.c       |   2 +-
- examples/png-server.c |   2 +-
- include/common.h      |  15 ++++--
- include/neatvnc.h     |  14 ++++-
- src/server.c          | 122 ++++++++++++++++++++++++++++++------------
- 5 files changed, 116 insertions(+), 39 deletions(-)
-
-diff --git a/examples/draw.c b/examples/draw.c
-index 7fb8fe6..13d5d09 100644
---- a/examples/draw.c
-+++ b/examples/draw.c
-@@ -340,7 +340,7 @@ int main(int argc, char* argv[])
- 
- 	aml_run(aml);
- 
--	nvnc_close(server);
-+	nvnc_del(server);
- 	nvnc_display_unref(draw.display);
- 	nvnc_fb_pool_unref(draw.fb_pool);
- 	pixman_image_unref(draw.whiteboard);
-diff --git a/examples/png-server.c b/examples/png-server.c
-index b8cc015..e35a6f1 100644
---- a/examples/png-server.c
-+++ b/examples/png-server.c
-@@ -68,7 +68,7 @@ int main(int argc, char* argv[])
- 
- 	aml_run(aml);
- 
--	nvnc_close(server);
-+	nvnc_del(server);
- 	nvnc_display_unref(display);
- 	nvnc_fb_unref(fb);
- 	aml_unref(aml);
-diff --git a/include/common.h b/include/common.h
-index e0b87c2..14c0ed9 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -157,12 +157,21 @@ enum nvnc__socket_type {
- 	NVNC__SOCKET_FROM_FD,
- };
- 
-+struct nvnc__socket {
-+	struct nvnc* parent;
-+	enum nvnc_stream_type type;
-+	bool is_external;
-+	int fd;
-+	struct aml_handler* poll_handle;
-+	LIST_ENTRY(nvnc__socket) link;
-+};
-+
-+LIST_HEAD(nvnc__socket_list, nvnc__socket);
-+
- struct nvnc {
- 	struct nvnc_common common;
- 	bool is_closing;
--	int fd;
--	enum nvnc__socket_type socket_type;
--	struct aml_handler* poll_handle;
-+	struct nvnc__socket_list sockets;
- 	struct nvnc_client_list clients;
- 	char name[256];
- 	void* userdata;
-diff --git a/include/neatvnc.h b/include/neatvnc.h
-index 78d9f97..c9303a8 100644
---- a/include/neatvnc.h
-+++ b/include/neatvnc.h
-@@ -74,6 +74,11 @@ enum nvnc_fb_type {
- 	NVNC_FB_GBM_BO,
- };
- 
-+enum nvnc_stream_type {
-+	NVNC_STREAM_NORMAL = 0,
-+	NVNC_STREAM_WEBSOCKET,
-+};
-+
- /* This is the same as wl_output_transform */
- enum nvnc_transform {
- 	NVNC_TRANSFORM_NORMAL = 0,
-@@ -135,11 +140,18 @@ typedef bool (*nvnc_desktop_layout_fn)(
- 
- extern const char nvnc_version[];
- 
-+struct nvnc* nvnc_new(void);
-+void nvnc_del(struct nvnc* self);
-+
-+int nvnc_listen(struct nvnc* self, int fd, enum nvnc_stream_type type);
-+
- struct nvnc* nvnc_open(const char* addr, uint16_t port);
- struct nvnc* nvnc_open_unix(const char *addr);
- struct nvnc* nvnc_open_websocket(const char* addr, uint16_t port);
- struct nvnc* nvnc_open_from_fd(int fd);
--void nvnc_close(struct nvnc* self);
-+
-+void nvnc_close(struct nvnc* self)
-+	__attribute__((deprecated("replaced with nvnc_del")));
- 
- void nvnc_add_display(struct nvnc*, struct nvnc_display*);
- void nvnc_remove_display(struct nvnc*, struct nvnc_display*);
-diff --git a/src/server.c b/src/server.c
-index b94ed0d..ded2dab 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -1981,7 +1981,9 @@ static void on_client_event(struct stream* stream, enum stream_event event)
- 
- static void on_connection(void* obj)
- {
--	struct nvnc* server = aml_get_userdata(obj);
-+	struct aml_handler* poll_handle = obj;
-+	struct nvnc__socket* socket = aml_get_userdata(poll_handle);
-+	struct nvnc* server = socket->parent;
- 
- 	struct nvnc_client* client = calloc(1, sizeof(*client));
- 	if (!client)
-@@ -2002,7 +2004,7 @@ static void on_connection(void* obj)
- 	client->ext_clipboard_max_unsolicited_text_size =
- 		MAX_CLIENT_UNSOLICITED_TEXT_SIZE;
- 
--	int fd = accept(server->fd, NULL, 0);
-+	int fd = accept(socket->fd, NULL, 0);
- 	if (fd < 0) {
- 		nvnc_log(NVNC_LOG_WARNING, "Failed to accept a connection");
- 		goto accept_failure;
-@@ -2012,7 +2014,7 @@ static void on_connection(void* obj)
- 	setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &one, sizeof(one));
- 
- #ifdef ENABLE_WEBSOCKET
--	if (server->socket_type == NVNC__SOCKET_WEBSOCKET)
-+	if (socket->type == NVNC_STREAM_WEBSOCKET)
- 	{
- 		client->net_stream = stream_ws_new(fd, on_client_event, client);
- 	}
-@@ -2182,44 +2184,60 @@ static int bind_address(const char* name, uint16_t port,
- 	return -1;
- }
- 
--static struct nvnc* open_common(const char* address, uint16_t port,
--		int fd, enum nvnc__socket_type type)
-+static struct nvnc__socket* nvnc__listen(struct nvnc* self, int fd,
-+		enum nvnc_stream_type type)
- {
--	nvnc__log_init();
-+	struct nvnc__socket* socket = calloc(1, sizeof(*self));
-+	if (!socket)
-+		return NULL;
- 
--	aml_require_workers(aml_get_default(), -1);
-+	if (listen(fd, 16) < 0)
-+		goto failure;
- 
--	struct nvnc* self = calloc(1, sizeof(*self));
--	if (!self)
--		return NULL;
-+	socket->parent = self;
-+	socket->type = type;
-+	socket->fd = fd;
-+	socket->is_external = true;
- 
--	self->socket_type = type;
-+	socket->poll_handle = aml_handler_new(fd, on_connection, socket, NULL);
-+	if (!socket->poll_handle) {
-+		goto failure;
-+	}
- 
--	strcpy(self->name, DEFAULT_NAME);
-+	aml_start(aml_get_default(), socket->poll_handle);
- 
--	LIST_INIT(&self->clients);
-+	LIST_INSERT_HEAD(&self->sockets, socket, link);
-+	return socket;
- 
--	self->fd = bind_address(address, port, fd, type);
--	if (self->fd < 0)
-+failure:
-+	free(socket);
-+	return NULL;
-+}
-+
-+static struct nvnc* open_common(const char* address, uint16_t port,
-+		int fd, enum nvnc__socket_type type)
-+{
-+	struct nvnc* self = nvnc_new();
-+	if (!self)
-+		return NULL;
-+
-+	int bound_fd = bind_address(address, port, fd, type);
-+	if (bound_fd < 0)
- 		goto bind_failure;
- 
--	if (listen(self->fd, 16) < 0)
--		goto listen_failure;
-+	enum nvnc_stream_type stream_type = type == NVNC__SOCKET_WEBSOCKET ?
-+		NVNC_STREAM_WEBSOCKET : NVNC_STREAM_NORMAL;
- 
--	self->poll_handle = aml_handler_new(self->fd, on_connection, self, NULL);
--	if (!self->poll_handle)
--		goto handle_failure;
-+	struct nvnc__socket* socket = nvnc__listen(self, bound_fd, stream_type);
-+	if (!socket)
-+		goto listen_failure;
- 
--	if (aml_start(aml_get_default(), self->poll_handle) < 0)
--		goto poll_start_failure;
-+	socket->is_external = type == NVNC__SOCKET_FROM_FD;
- 
- 	return self;
- 
--poll_start_failure:
--	aml_unref(self->poll_handle);
--handle_failure:
- listen_failure:
--	close(self->fd);
-+	close(bound_fd);
- 	if (type == NVNC__SOCKET_UNIX) {
- 		unlink(address);
- 	}
-@@ -2229,6 +2247,31 @@ bind_failure:
- 	return NULL;
- }
- 
-+EXPORT
-+struct nvnc* nvnc_new(void)
-+{
-+	nvnc__log_init();
-+	aml_require_workers(aml_get_default(), -1);
-+
-+	struct nvnc* self = calloc(1, sizeof(*self));
-+	if (!self)
-+		return NULL;
-+
-+	strcpy(self->name, DEFAULT_NAME);
-+
-+	LIST_INIT(&self->sockets);
-+	LIST_INIT(&self->clients);
-+
-+	return self;
-+}
-+
-+EXPORT
-+int nvnc_listen(struct nvnc* self, int fd, enum nvnc_stream_type type)
-+{
-+	struct nvnc__socket* socket = nvnc__listen(self, fd, type);
-+	return socket ? 0 : -1;
-+}
-+
- EXPORT
- struct nvnc* nvnc_open(const char* address, uint16_t port)
- {
-@@ -2270,7 +2313,7 @@ static void unlink_fd_path(int fd)
- }
- 
- EXPORT
--void nvnc_close(struct nvnc* self)
-+void nvnc_del(struct nvnc* self)
- {
- 	self->is_closing = true;
- 
-@@ -2293,12 +2336,20 @@ void nvnc_close(struct nvnc* self)
- 	while (!LIST_EMPTY(&self->clients))
- 		client_close(LIST_FIRST(&self->clients));
- 
--	aml_stop(aml_get_default(), self->poll_handle);
--	// Do not unlink an externally managed fd.
--	if(self->socket_type != NVNC__SOCKET_FROM_FD) {
--		unlink_fd_path(self->fd);
-+	while (!LIST_EMPTY(&self->sockets)) {
-+		struct nvnc__socket* socket = LIST_FIRST(&self->sockets);
-+		LIST_REMOVE(socket, link);
-+
-+		aml_stop(aml_get_default(), socket->poll_handle);
-+		aml_unref(socket->poll_handle);
-+
-+		if (!socket->is_external) {
-+			unlink_fd_path(socket->fd);
-+		}
-+		close(socket->fd);
-+
-+		free(socket);
- 	}
--	close(self->fd);
- 
- #ifdef HAVE_CRYPTO
- 	crypto_rsa_priv_key_del(self->rsa_priv);
-@@ -2314,10 +2365,15 @@ void nvnc_close(struct nvnc* self)
- 
- 	free(self->ext_clipboard_provide_msg.buffer);
- 
--	aml_unref(self->poll_handle);
- 	free(self);
- }
- 
-+EXPORT
-+void nvnc_close(struct nvnc* self)
-+{
-+	nvnc_del(self);
-+}
-+
- static void process_pending_fence(struct nvnc_client* client)
- {
- 	if (client->pending_fence.n_pending_requests == 0) {
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
deleted file mode 100644
index 7413316bcc..0000000000
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
+++ /dev/null
@@ -1,278 +0,0 @@
-From 8b95d3c1d5f475668d53cc21a7abf431d9a9822b Mon Sep 17 00:00:00 2001
-From: Andri Yngvason <andri@yngvason.is>
-Date: Sun, 23 Mar 2025 15:55:11 +0000
-Subject: [PATCH] Use aml v1
-
-Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/a4b238241f3f3016ef3ddcd260c1490a9c9e8168]
----
- meson.build                 |  2 +-
- src/enc/h264/ffmpeg-impl.c  |  8 ++++----
- src/enc/h264/v4l2m2m-impl.c |  4 ++--
- src/enc/raw.c               |  8 ++++----
- src/enc/tight.c             | 18 +++++++++---------
- src/enc/zrle.c              |  8 ++++----
- src/resampler.c             |  7 ++-----
- src/server.c                |  6 ++----
- src/stream/gnutls.c         |  6 +++---
- src/stream/tcp.c            |  6 +++---
- 10 files changed, 34 insertions(+), 39 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index a0d7401..b094d9b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -63,7 +63,7 @@ libavcodec = dependency('libavcodec', required: get_option('h264'))
- libavfilter = dependency('libavfilter', required: get_option('h264'))
- libavutil = dependency('libavutil', required: get_option('h264'))
- 
--aml_version = ['>=0.3.0', '<0.4.0']
-+aml_version = ['>=1.0.0', '<2.0.0']
- aml_project = subproject('aml', required: false, version: aml_version)
- if aml_project.found()
- 	aml = aml_project.get_variable('aml_dep')
-diff --git a/src/enc/h264/ffmpeg-impl.c b/src/enc/h264/ffmpeg-impl.c
-index 3bd584c..148b1c3 100644
---- a/src/enc/h264/ffmpeg-impl.c
-+++ b/src/enc/h264/ffmpeg-impl.c
-@@ -415,9 +415,9 @@ get_frame_failure:
- 	return rc == AVERROR(EAGAIN) ? 0 : rc;
- }
- 
--static void h264_encoder__do_work(void* handle)
-+static void h264_encoder__do_work(struct aml_work* work)
- {
--	struct h264_encoder_ffmpeg* self = aml_get_userdata(handle);
-+	struct h264_encoder_ffmpeg* self = aml_get_userdata(work);
- 
- 	AVFrame* frame = fb_to_avframe(self->current_fb);
- 	assert(frame); // TODO
-@@ -453,9 +453,9 @@ failure:
- 	av_frame_free(&frame);
- }
- 
--static void h264_encoder__on_work_done(void* handle)
-+static void h264_encoder__on_work_done(struct aml_work* work)
- {
--	struct h264_encoder_ffmpeg* self = aml_get_userdata(handle);
-+	struct h264_encoder_ffmpeg* self = aml_get_userdata(work);
- 
- 	uint64_t pts = nvnc_fb_get_pts(self->current_fb);
- 	nvnc_fb_release(self->current_fb);
-diff --git a/src/enc/h264/v4l2m2m-impl.c b/src/enc/h264/v4l2m2m-impl.c
-index b9d1236..d286932 100644
---- a/src/enc/h264/v4l2m2m-impl.c
-+++ b/src/enc/h264/v4l2m2m-impl.c
-@@ -511,9 +511,9 @@ static void encode_buffer(struct h264_encoder_v4l2m2m* self,
- 	}
- }
- 
--static void process_fd_events(void* handle)
-+static void process_fd_events(struct aml_handler* handler)
- {
--	struct h264_encoder_v4l2m2m* self = aml_get_userdata(handle);
-+	struct h264_encoder_v4l2m2m* self = aml_get_userdata(handler);
- 	process_dst_bufs(self);
- }
- 
-diff --git a/src/enc/raw.c b/src/enc/raw.c
-index 806f074..2bc8302 100644
---- a/src/enc/raw.c
-+++ b/src/enc/raw.c
-@@ -126,9 +126,9 @@ static int raw_encode_frame(struct raw_encoder_work* ctx, struct vec* dst,
- 	return 0;
- }
- 
--static void raw_encoder_do_work(void* obj)
-+static void raw_encoder_do_work(struct aml_work* work)
- {
--	struct raw_encoder_work* ctx = aml_get_userdata(obj);
-+	struct raw_encoder_work* ctx = aml_get_userdata(work);
- 	int rc __attribute__((unused));
- 
- 	struct nvnc_fb* fb = ctx->fb;
-@@ -163,9 +163,9 @@ static void raw_encoder_do_work(void* obj)
- 	assert(ctx->result);
- }
- 
--static void raw_encoder_on_done(void* obj)
-+static void raw_encoder_on_done(struct aml_work* work)
- {
--	struct raw_encoder_work* ctx = aml_get_userdata(obj);
-+	struct raw_encoder_work* ctx = aml_get_userdata(work);
- 	struct raw_encoder* self = ctx->parent;
- 
- 	assert(ctx->result);
-diff --git a/src/enc/tight.c b/src/enc/tight.c
-index a361974..441df19 100644
---- a/src/enc/tight.c
-+++ b/src/enc/tight.c
-@@ -106,8 +106,8 @@ struct tight_zs_worker_ctx {
- 
- struct encoder_impl encoder_impl_tight;
- 
--static void do_tight_zs_work(void*);
--static void on_tight_zs_work_done(void*);
-+static void do_tight_zs_work(struct aml_work*);
-+static void on_tight_zs_work_done(struct aml_work*);
- static int schedule_tight_finish(struct tight_encoder* self);
- 
- static inline struct tight_encoder* tight_encoder(struct encoder* encoder)
-@@ -428,9 +428,9 @@ static void tight_encode_tile(struct tight_encoder* self,
- 	tile->state = TIGHT_TILE_ENCODED;
- }
- 
--static void do_tight_zs_work(void* obj)
-+static void do_tight_zs_work(struct aml_work* work)
- {
--	struct tight_zs_worker_ctx* ctx = aml_get_userdata(obj);
-+	struct tight_zs_worker_ctx* ctx = aml_get_userdata(work);
- 	struct tight_encoder* self = ctx->encoder;
- 	int index = ctx->index;
- 
-@@ -440,7 +440,7 @@ static void do_tight_zs_work(void* obj)
- 				tight_encode_tile(self, x, y);
- }
- 
--static void on_tight_zs_work_done(void* obj)
-+static void on_tight_zs_work_done(struct aml_work* obj)
- {
- 	struct tight_zs_worker_ctx* ctx = aml_get_userdata(obj);
- 	struct tight_encoder* self = ctx->encoder;
-@@ -509,15 +509,15 @@ static void tight_finish(struct tight_encoder* self)
- 				tight_finish_tile(self, x, y);
- }
- 
--static void do_tight_finish(void* obj)
-+static void do_tight_finish(struct aml_work* work)
- {
--	struct tight_encoder* self = aml_get_userdata(obj);
-+	struct tight_encoder* self = aml_get_userdata(work);
- 	tight_finish(self);
- }
- 
--static void on_tight_finished(void* obj)
-+static void on_tight_finished(struct aml_work* work)
- {
--	struct tight_encoder* self = aml_get_userdata(obj);
-+	struct tight_encoder* self = aml_get_userdata(work);
- 
- 	struct encoded_frame* result;
- 	result = encoded_frame_new(self->dst.data, self->dst.len, self->n_rects,
-diff --git a/src/enc/zrle.c b/src/enc/zrle.c
-index 503c738..c043983 100644
---- a/src/enc/zrle.c
-+++ b/src/enc/zrle.c
-@@ -340,9 +340,9 @@ static int zrle_encode_frame(struct zrle_encoder* self, z_stream* zs,
- 	return 0;
- }
- 
--static void zrle_encoder_do_work(void* obj)
-+static void zrle_encoder_do_work(struct aml_work* work)
- {
--	struct zrle_encoder* self = aml_get_userdata(obj);
-+	struct zrle_encoder* self = aml_get_userdata(work);
- 	int rc __attribute__((unused));
- 
- 	struct nvnc_fb* fb = self->current_fb;
-@@ -374,9 +374,9 @@ static void zrle_encoder_do_work(void* obj)
- 	assert(self->current_result);
- }
- 
--static void zrle_encoder_on_done(void* obj)
-+static void zrle_encoder_on_done(struct aml_work* work)
- {
--	struct zrle_encoder* self = aml_get_userdata(obj);
-+	struct zrle_encoder* self = aml_get_userdata(work);
- 
- 	assert(self->current_result);
- 
-diff --git a/src/resampler.c b/src/resampler.c
-index e24798b..8f4cfa0 100644
---- a/src/resampler.c
-+++ b/src/resampler.c
-@@ -147,9 +147,8 @@ void resample_now(struct nvnc_fb* dst, struct nvnc_fb* src,
- 	pixman_image_unref(dstimg);
- }
- 
--static void do_work(void* handle)
-+static void do_work(struct aml_work* work)
- {
--	struct aml_work* work = handle;
- 	struct resampler_work* ctx = aml_get_userdata(work);
- 
- 	struct nvnc_fb* src = ctx->src;
-@@ -159,11 +158,9 @@ static void do_work(void* handle)
- 	resample_now(dst, src, &dst_side_data->buffer_damage);
- }
- 
--static void on_work_done(void* handle)
-+static void on_work_done(struct aml_work* work)
- {
--	struct aml_work* work = handle;
- 	struct resampler_work* ctx = aml_get_userdata(work);
--
- 	ctx->on_done(ctx->dst, &ctx->frame_damage, ctx->userdata);
- }
- 
-diff --git a/src/server.c b/src/server.c
-index a4f0ad9..099be28 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -210,9 +210,8 @@ static void client_close(struct nvnc_client* client)
- 	free(client);
- }
- 
--static void do_deferred_client_close(void* obj)
-+static void do_deferred_client_close(struct aml_idle* idle)
- {
--	struct aml_idle* idle = obj;
- 	struct nvnc_client* client = aml_get_userdata(idle);
- 	client->close_task = NULL;
- 	aml_stop(aml_get_default(), idle);
-@@ -2013,9 +2012,8 @@ static void on_client_event(struct stream* stream, enum stream_event event)
- 	client->buffer_index = 0;
- }
- 
--static void on_connection(void* obj)
-+static void on_connection(struct aml_handler* poll_handle)
- {
--	struct aml_handler* poll_handle = obj;
- 	struct nvnc__socket* socket = aml_get_userdata(poll_handle);
- 	struct nvnc* server = socket->parent;
- 
-diff --git a/src/stream/gnutls.c b/src/stream/gnutls.c
-index 14661e5..00a7c13 100644
---- a/src/stream/gnutls.c
-+++ b/src/stream/gnutls.c
-@@ -171,10 +171,10 @@ static void stream_gnutls__on_writable(struct stream* self)
- 	}
- }
- 
--static void stream_gnutls__on_event(void* obj)
-+static void stream_gnutls__on_event(struct aml_handler* handler)
- {
--	struct stream* self = aml_get_userdata(obj);
--	uint32_t events = aml_get_revents(obj);
-+	struct stream* self = aml_get_userdata(handler);
-+	uint32_t events = aml_get_revents(handler);
- 
- 	stream_ref(self);
- 
-diff --git a/src/stream/tcp.c b/src/stream/tcp.c
-index 37f139a..95f5aa8 100644
---- a/src/stream/tcp.c
-+++ b/src/stream/tcp.c
-@@ -191,10 +191,10 @@ static void stream_tcp__on_writable(struct stream* self)
- 	}
- }
- 
--static void stream_tcp__on_event(void* obj)
-+static void stream_tcp__on_event(struct aml_handler* handler)
- {
--	struct stream* self = aml_get_userdata(obj);
--	uint32_t events = aml_get_revents(obj);
-+	struct stream* self = aml_get_userdata(handler);
-+	uint32_t events = aml_get_revents(handler);
- 
- 	// We hold a reference here in case the stream gets destroyed inside
- 	// callback.
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch
deleted file mode 100644
index ec47fb61fb..0000000000
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-meson-Use-new-pkgconfig-for-aml1.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c1f4833dc13403882a3efbb8a69de33191fb72c6 Mon Sep 17 00:00:00 2001
-From: Andri Yngvason <andri@yngvason.is>
-Date: Sun, 27 Jul 2025 14:17:54 +0000
-Subject: [PATCH] meson: Use new pkgconfig for aml1
-
-Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/c1f4833dc13403882a3efbb8a69de33191fb72c6] 
-
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e731886..59364a7 100644
---- a/meson.build
-+++ b/meson.build
-@@ -76,7 +76,7 @@ aml_project = subproject('aml', required: false, version: aml_version)
- if aml_project.found()
- 	aml = aml_project.get_variable('aml_dep')
- else
--	aml = dependency('aml', version: aml_version)
-+	aml = dependency('aml1', version: aml_version)
- endif
- 
- inc = include_directories('include')
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.6.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
similarity index 77%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.6.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
index 34cfbf18cc..5946994b53 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.6.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
@@ -4,13 +4,9 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=v0.9;protocol=https \
-           file://0001-meson-Use-new-pkgconfig-for-aml1.patch \
-           file://0001-Add-method-to-listen-on-multiple-fds.patch \
-           file://0001-Use-aml-v1.patch \
-          "
+SRC_URI = "git://github.com/any1/neatvnc;branch=v1.0;protocol=https;tag=v${PV}"
 
-SRCREV = "3295c11b934a83dbcb44beabf3f21a8b885a2d11"
+SRCREV = "4d6d09b544d84b836cf1906735354b4e694a0c1c"
 
 
 DEPENDS = "libdrm pixman aml zlib"

