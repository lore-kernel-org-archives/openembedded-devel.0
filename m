Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED94FEC0FC
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 19:26:08 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5494.1774380367150856129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 12:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=szNxVQIk;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so15372825ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774380366; x=1774985166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZY4jymrW5YMieVyNrLMkTody8QvAKp5Xf3qMmHx5zg=;
        b=szNxVQIkBLZdVxX7WjLV9p39utXWzSXsmIcraBCWKYRPmFrFEIWLdtIfsG6oH46p08
         /6fJeX4qFyGiKBK7DfrlF2eElwdRr2LmY5t5a32/SbuLtPB+/ohWJEpmgz6KGyga/uBS
         SBGAqh18zYJ+KM/lGrDVSZl+BHrIeuEXqm0wlJOCln+eUoxWm57bheMtgZWneY0V/0mt
         KeilW24KQ/PA9jigb/2/m5ciRLimlQwWo7rTwLcUh5FO2Hs6DYELWR2IlQBGgoIuHqDw
         hwOrt/HCxgC96wBZO+88wJ2MuSlyFheey28WxMXCKJpLoTLMAJ20tqeaA5yzeYYDAWzJ
         u6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380366; x=1774985166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZY4jymrW5YMieVyNrLMkTody8QvAKp5Xf3qMmHx5zg=;
        b=TAw5EkapycRCw0sBm7+F5ogCuH4WXp9UEkWYb7JPwPwb41RMqMp2623F/Pgbv9mrzs
         KKzG+ndD3yz/bqs0NdcoYhQ/4cPa5/eiItuhKC+9IYQLq9B7k74OoF+Nb0QMIjR7i86C
         k/skf24acBTBwyGfZIXmA3AGpJX0o4g+XaWbc06i2RPkiUQVDNMOYhMg0b0rqwdGTLFL
         ZXn4wyRNjpELAgVbbBzKgRmI34QVVZs1VkS+U2RM6m+gQoZ1t3N6R3hRwW2A4+kpkwsg
         6bfT9JILNNZIZ7Tn3Euu0yg52lup7ibJMWc0rEFWR764TlFf7ezBaco+HOm+qi51s0xq
         b7aw==
X-Gm-Message-State: AOJu0YwyHuxJb1kzNf2eVQ8pejMGI7tqhA2lPEFAKK9xts0Ye2LlgNpt
	P350f49Wr3wL9ZPAf2d2jiSFydDdUW3Ushj1bYkv4sq6Jb3A1VL2joDgNX9GyPHs
X-Gm-Gg: ATEYQzwca2t73/UBFXdN80ILugPYj/kHeO6HLqHAlYALIzJFlf7xnFGfZJGKVO0BmY+
	RaN1VVYatH3L3jKJoZMkt8FV/NTQzBFsLpIgmfTBEFRC3B+/y+/Nbxxzf1qEfYBWrxftg39sFGU
	brrt+9uPA0zdh8aehW/Vb9kRmxZTjeG4nYanPxv0PrD+jDwa0lFvYxCH9ZetYidTocHA+lMH2H+
	buRMTvc0Kc8lvDFvj1C20K1c2r/rSU/4e2EXJgT0dhnoW/d5ZISMGS3zDOrH6smdhER7Fa+Mq1T
	6ogwnhdCugJug0786LyL2+NjsDn4uhdfO3ys84gCgkSMMyo0dGKUgohYOUetZfkdnsFg4lduE42
	KYPx9Wgau80FNh9ok/1NIWVbqtavbJ20YDvIwBH15a5XgU7y2Z+eDIzhVJ4aMY9JNOG2PSb8ScL
	G30LbecJ+p8u6qZWihKyfc3GhGjbP3u3P344I=
X-Received: by 2002:a17:902:f693:b0:2ae:4847:cace with SMTP id d9443c01a7336-2b0b0a7fb7cmr8345435ad.28.1774380366153;
        Tue, 24 Mar 2026 12:26:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm143752935ad.13.2026.03.24.12.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:26:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] freerdp: upgrade 2.11.7 -> 2.11.8
Date: Wed, 25 Mar 2026 08:25:53 +1300
Message-ID: <20260324192553.2628357-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324192553.2628357-1-ankur.tyagi85@gmail.com>
References: <20260324192553.2628357-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 19:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125586

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped 0001-Fix-const-qualifier-error.patch
* error no longer reproducible with clang

Dropped 0001-Fixed-compilation-warnings-in-ainput-channel.patch
* changes merged upstream[1]

Dropped 0001-Fixed-compilation-warnings.patch
* changes merged upstream[2]

Added 0001-Fix-compilation-error.patch to fix error:

| /yocto/bitbake-builds/poky-master/build/tmp/work/x86-64-v3-poky-linux/freerdp/2.11.8/sources/freerdp-2.11.8/winpr/libwinpr/utils/collections/Queue.c: In function 'Queue_EnsureCapacity':
| /yocto/bitbake-builds/poky-master/build/tmp/work/x86-64-v3-poky-linux/freerdp/2.11.8/sources/freerdp-2.11.8/winpr/libwinpr/utils/collections/Queue.c:169:30: error: assignment to 'void **' from incompatible pointer type 'uintptr_t *' {aka 'long unsigned int *'} [-Wincompatible-pointer-types]
|   169 |                 queue->array = newArray;
|       |

Release Notes:
https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8

Ptests passed:

START: ptest-runner
2026-03-24T19:06
BEGIN: /usr/lib/freerdp/ptest
PASS: TestClient TestClientRdpFile
...
PASS: TestWtsApi TestWtsApiWaitSystemEvent
DURATION: 180
END: /usr/lib/freerdp/ptest
2026-03-24T19:09
STOP: ptest-runner
TOTAL: 1 FAIL: 0

[1] https://github.com/FreeRDP/FreeRDP/commit/5b2b53b15c9af46b85c4ef0007e7fb59d7608289
[2] https://github.com/FreeRDP/FreeRDP/commit/d2b6771c748e54e659d5f1243a92e499c3beaa36

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/0001-Fix-compilation-error.patch  | 101 ++++++++++++++++++
 .../0001-Fix-const-qualifier-error.patch      |  57 ----------
 ...mpilation-warnings-in-ainput-channel.patch |  72 -------------
 .../0001-Fixed-compilation-warnings.patch     |  27 -----
 .../{freerdp_2.11.7.bb => freerdp_2.11.8.bb}  |   6 +-
 5 files changed, 103 insertions(+), 160 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-compilation-error.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.7.bb => freerdp_2.11.8.bb} (95%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-compilation-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-compilation-error.patch
new file mode 100644
index 0000000000..c2c093bc47
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-compilation-error.patch
@@ -0,0 +1,101 @@
+From 0d48a9cb6e25afa10e76de75232ad32a82806aae Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Wed, 25 Mar 2026 00:04:42 +1300
+Subject: [PATCH] Fix compilation error
+
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/b78cb455cbe847da934c777189b6e7f25267502e]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ winpr/include/winpr/collections.h        |  2 +-
+ winpr/libwinpr/utils/collections/Queue.c | 28 ++++++++++++++++++------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/winpr/include/winpr/collections.h b/winpr/include/winpr/collections.h
+index b8c8d9d66..64705751e 100644
+--- a/winpr/include/winpr/collections.h
++++ b/winpr/include/winpr/collections.h
+@@ -63,7 +63,7 @@ extern "C"
+ 		int head;
+ 		int tail;
+ 		int size;
+-		void** array;
++		uintptr_t* array;
+ 		CRITICAL_SECTION lock;
+ 		HANDLE event;
+ 
+diff --git a/winpr/libwinpr/utils/collections/Queue.c b/winpr/libwinpr/utils/collections/Queue.c
+index bb789b658..6b86f7ab7 100644
+--- a/winpr/libwinpr/utils/collections/Queue.c
++++ b/winpr/libwinpr/utils/collections/Queue.c
+@@ -34,6 +34,16 @@
+  * Properties
+  */
+ 
++static inline void* uptr2void(uintptr_t ptr)
++{
++	return (void*)ptr;
++}
++
++static inline uintptr_t void2uptr(const void* ptr)
++{
++	return (uintptr_t)ptr;
++}
++
+ /**
+  * Gets the number of elements contained in the Queue.
+  */
+@@ -98,9 +108,12 @@ void Queue_Clear(wQueue* queue)
+ 	for (index = queue->head; index != queue->tail; index = (index + 1) % queue->capacity)
+ 	{
+ 		if (queue->object.fnObjectFree)
+-			queue->object.fnObjectFree(queue->array[index]);
++		{
++			void* obj = uptr2void(queue->array[index]);
++			queue->object.fnObjectFree(obj);
++		}
+ 
+-		queue->array[index] = NULL;
++		queue->array[index] = 0;
+ 	}
+ 
+ 	queue->size = 0;
+@@ -124,7 +137,8 @@ BOOL Queue_Contains(wQueue* queue, void* obj)
+ 
+ 	for (index = 0; index < queue->tail; index++)
+ 	{
+-		if (queue->object.fnObjectEquals(queue->array[index], obj))
++		void* ptr = uptr2void(queue->array[index]);
++		if (queue->object.fnObjectEquals(ptr, obj))
+ 		{
+ 			found = TRUE;
+ 			break;
+@@ -217,7 +231,7 @@ BOOL Queue_Enqueue(wQueue* queue, void* obj)
+ 	if (!Queue_EnsureCapacity(queue, 1))
+ 		goto out;
+ 
+-	queue->array[queue->tail] = obj;
++	queue->array[queue->tail] = void2uptr(obj);
+ 	queue->tail = (queue->tail + 1) % queue->capacity;
+ 	queue->size++;
+ 	SetEvent(queue->event);
+@@ -242,8 +256,8 @@ void* Queue_Dequeue(wQueue* queue)
+ 
+ 	if (queue->size > 0)
+ 	{
+-		obj = queue->array[queue->head];
+-		queue->array[queue->head] = NULL;
++		obj = uptr2void(queue->array[queue->head]);
++		queue->array[queue->head] = 0;
+ 		queue->head = (queue->head + 1) % queue->capacity;
+ 		queue->size--;
+ 	}
+@@ -269,7 +283,7 @@ void* Queue_Peek(wQueue* queue)
+ 		EnterCriticalSection(&queue->lock);
+ 
+ 	if (queue->size > 0)
+-		obj = queue->array[queue->head];
++		obj = uptr2void(queue->array[queue->head]);
+ 
+ 	if (queue->synchronized)
+ 		LeaveCriticalSection(&queue->lock);
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
deleted file mode 100644
index 87a456d16d..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 761b4df04a141cc8c9507c741e4046c6c6b00491 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 11 Sep 2023 09:00:39 +0000
-Subject: [PATCH] Fix const qualifier error
-
-Fixes clang error
-error: incompatible function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(void *)') from 'void *(const void *)' [-Wincompatible-function-pointer-types]
-|         obj->fnObjectNew = uwac_event_clone;
-|                          ^ ~~~~~~~~~~~~~~~~
-
-https://github.com/FreeRDP/FreeRDP/commit/6e3c00725aae99d03a0baa65430eceddebd9dee8
-Upstream-Status: Backport
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libfreerdp/codec/rfx.c            | 4 ++--
- winpr/include/winpr/collections.h | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
-index ccbc5af..eec7365 100644
---- a/libfreerdp/codec/rfx.c
-+++ b/libfreerdp/codec/rfx.c
-@@ -153,7 +153,7 @@ static void rfx_tile_init(void* obj)
- 	}
- }
- 
--static void* rfx_decoder_tile_new(void* val)
-+static void* rfx_decoder_tile_new(const void* val)
- {
- 	RFX_TILE* tile = NULL;
- 	WINPR_UNUSED(val);
-@@ -184,7 +184,7 @@ static void rfx_decoder_tile_free(void* obj)
- 	}
- }
- 
--static void* rfx_encoder_tile_new(void* val)
-+static void* rfx_encoder_tile_new(const void* val)
- {
- 	WINPR_UNUSED(val);
- 	return calloc(1, sizeof(RFX_TILE));
-diff --git a/winpr/include/winpr/collections.h b/winpr/include/winpr/collections.h
-index 807f011..b8c8d9d 100644
---- a/winpr/include/winpr/collections.h
-+++ b/winpr/include/winpr/collections.h
-@@ -36,7 +36,7 @@ extern "C"
- {
- #endif
- 
--	typedef void* (*OBJECT_NEW_FN)(void* val);
-+	typedef void* (*OBJECT_NEW_FN)(const void* val);
- 	typedef void (*OBJECT_INIT_FN)(void* obj);
- 	typedef void (*OBJECT_UNINIT_FN)(void* obj);
- 	typedef void (*OBJECT_FREE_FN)(void* obj);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch
deleted file mode 100644
index 62600cddab..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 130094de3244d5039e463e1142e1ec487c1104ef Mon Sep 17 00:00:00 2001
-From: Armin Novak <armin.novak@thincast.com>
-Date: Tue, 22 Feb 2022 12:05:08 +0100
-Subject: [PATCH] Fixed compilation warnings in ainput channel
-
-Upstream-Status: Backport [130094de3 Fixed compilation warnings in ainput channel]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- channels/ainput/server/ainput_main.c | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/channels/ainput/server/ainput_main.c b/channels/ainput/server/ainput_main.c
-index bc1737ee1..17d2ec681 100644
---- a/channels/ainput/server/ainput_main.c
-+++ b/channels/ainput/server/ainput_main.c
-@@ -192,7 +192,7 @@ static UINT ainput_server_recv_mouse_event(ainput_server* ainput, wStream* s)
- 
- static HANDLE ainput_server_get_channel_handle(ainput_server* ainput)
- {
--	BYTE* buffer = NULL;
-+	void* buffer = NULL;
- 	DWORD BytesReturned = 0;
- 	HANDLE ChannelEvent = NULL;
- 
-@@ -389,7 +389,7 @@ ainput_server_context* ainput_server_context_new(HANDLE vcm)
- 		goto fail;
- 	return &ainput->context;
- fail:
--	ainput_server_context_free(ainput);
-+	ainput_server_context_free(&ainput->context);
- 	return NULL;
- }
- 
-@@ -496,17 +496,23 @@ UINT ainput_server_context_poll_int(ainput_server_context* context)
- 			break;
- 		case AINPUT_OPENED:
- 		{
--			BYTE* buffer = NULL;
-+			union
-+			{
-+				BYTE* pb;
-+				void* pv;
-+			} buffer;
- 			DWORD BytesReturned = 0;
- 
--			if (WTSVirtualChannelQuery(ainput->ainput_channel, WTSVirtualChannelReady, &buffer,
-+			buffer.pv = NULL;
-+
-+			if (WTSVirtualChannelQuery(ainput->ainput_channel, WTSVirtualChannelReady, &buffer.pv,
- 			                           &BytesReturned) != TRUE)
- 			{
- 				WLog_ERR(TAG, "WTSVirtualChannelReady failed,");
- 			}
- 			else
- 			{
--				if (*buffer != 0)
-+				if (*buffer.pb != 0)
- 				{
- 					error = ainput_server_send_version(ainput);
- 					if (error)
-@@ -518,7 +524,7 @@ UINT ainput_server_context_poll_int(ainput_server_context* context)
- 				else
- 					error = CHANNEL_RC_OK;
- 			}
--			WTSFreeMemory(buffer);
-+			WTSFreeMemory(buffer.pv);
- 		}
- 		break;
- 		case AINPUT_VERSION_SENT:
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
deleted file mode 100644
index 7fae2703f8..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
-From: akallabeth <akallabeth@posteo.net>
-Date: Mon, 4 Jul 2022 14:34:46 +0200
-Subject: [PATCH] Fixed compilation warnings
-
-Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- client/X11/xf_graphics.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
-index 5aa1fd48b..fe81e0ed9 100644
---- a/client/X11/xf_graphics.c
-+++ b/client/X11/xf_graphics.c
-@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
- 
- #endif
- fail:
--	WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
-+	WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
- 	return rc;
- }
- 
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
similarity index 95%
rename from meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
index dff3f6dafe..2cc8dc6cf2 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
@@ -15,14 +15,12 @@ RDEPENDS:${PN}-ptest += "coreutils pcsc-lite-lib"
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "efa899d3deb8595a29fabb2a2251722f9d7e0d7f"
+SRCREV = "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://run-ptest \
            file://winpr-makecert-Build-with-install-RPATH.patch \
-           file://0001-Fixed-compilation-warnings.patch \
-           file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
-           file://0001-Fixed-compilation-warnings-in-ainput-channel.patch \
+           file://0001-Fix-compilation-error.patch \
            file://CVE-2024-32661.patch \
            file://CVE-2026-22854.patch \
            file://CVE-2026-22855.patch \

