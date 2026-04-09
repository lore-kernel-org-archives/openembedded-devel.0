Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED44E9DE4D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127044.1775718600511784501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dk6PEAuH;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82d561b3689so246700b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718600; x=1776323400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugb08wCS9A8Uwmfi61Ch4OYk4J/af59fOo+gX2ILv6s=;
        b=Dk6PEAuH9P2mroNHPC/DKVI9lQYkfZQu1tTpJHZyf+yst7IoI0ZkFEn3RtOIVYtc25
         aI2IBy2STERtRWwtoZD03FE1mav26tEFBGjJR5punsn7q/WGBKOM7dPxbeHaxfYM0nry
         EtAbeh61l8NI7aeWiLbBQxFUVvfEYTzcneMzUnRfeT3oDRtcdpdTZQgcqD0WEbVOXari
         D371mL2TeWYh/nTmqDmyOpxrPeRkOzBdhYj9rZYPxtswS5qQ/pwoQXLNYmLiAMOZIt2n
         DSPWxkuPgRI0oQOMz44JxU26v3JJRlgkbj5fMXPsNrTvMjSYOgdBj1aeI226AVnVLJNO
         e85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718600; x=1776323400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ugb08wCS9A8Uwmfi61Ch4OYk4J/af59fOo+gX2ILv6s=;
        b=lC5SSX8UVnKmRbyMGa1hBqX3s9OLdImh1lAvxi+2spyQNpO/ZmL8G4yjbhYLl0Ciff
         fjz0PV+uXsCYmvdc0kbzXgA+IVsFJcGFh/8cJihjTj68piwwP5DjOVC6QETodtUYhwrC
         +wdfxVFDjfcilRBAwy9GqGFoKSVo0/tqG9wn3jXwHgYIIJTKYZ9NXPXoZbOL4wU6/P/N
         RSy6QnOQ3RzAJPKCgEU86n7blHxHvGk0LlLtKhf5LTzcIzUri+heDvfFM/VpnFMeSyqB
         +RsOO2XeNvnuBneweSDhVO/BfvpnhqkRuS4Y9ADA00iwdkB4hv3TZpEgczTN23HvoYwi
         WCPA==
X-Gm-Message-State: AOJu0YzxnA6+Ma4Kif0wQwJhD6kf1JnaxVmfLjEXE+E5H5s9JvjH2SCW
	1TI3MI3h9U5UHgFS7fy5XS2Jt/SkIl+VUcNF+2dI6Z7w3V3KuyXbRND19ZjzKw==
X-Gm-Gg: AeBDietqb7mPokGw9May4EkGy89PqJCw+uLwEzOmKCO/Z0A28H6D8LIupvlID/gJbz0
	LyqOCx5FjdXqCQpJFB+m87sDTKXn8B8ScIKRnMwWbhx2oB07kn/huMmSI7/zy3mFe6KfMw8V7dS
	w6p9Wl1sqJs4rY4qaS/naJSau0UB1bZ858YzY37xXMOPhcVCCgZi46abRH8yJD8wB40bNx0Ub45
	wI64R4YlcOQxDwyKEogu/uH6UhRk5GMaQBYJw32nt/MxeLsOS/dAna6D5lifJrQZBkTpl6xU7y+
	qVj1EU4zvRO50tJZur1lMLD8eECUhI5vzoXw4qhiYc/2IWBbEi3pw9o2mdGGS8fXfx/z7mjBPoZ
	FqHDM0NiXbL1YROamz53/VIPdzSI1SbMSvzlOJDjjbE2jx6wV0mWTnnyF5r0yosREeQdn5QkbUX
	I3ieKRhvyuEpHJ7MzjWLOKDCAb0H22syhb7Io=
X-Received: by 2002:a05:6a00:748a:b0:82c:ded1:261f with SMTP id d2e1a72fcca58-82d0db71bd7mr19605426b3a.27.1775718599659;
        Thu, 09 Apr 2026 00:09:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 13/22] freerdp3: fix CVE-2026-24683
Date: Thu,  9 Apr 2026 19:09:10 +1200
Message-ID: <20260409070919.3968586-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126135

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24683

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24683.patch     | 114 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24683.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24683.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24683.patch
new file mode 100644
index 0000000000..8d24931b3d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24683.patch
@@ -0,0 +1,114 @@
+From da05a4039644b0821c0a61806d40688ac08f3ce0 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 12:08:48 +0100
+Subject: [PATCH] [channels,ainput] lock context when updating listener
+
+(cherry picked from commit d9ca272dce7a776ab475e9b1a8e8c3d2968c8486)
+
+CVE: CVE-2026-24683
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/d9ca272dce7a776ab475e9b1a8e8c3d2968c8486]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/ainput/client/ainput_main.c | 36 ++++++++++++++++++++--------
+ 1 file changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/channels/ainput/client/ainput_main.c b/channels/ainput/client/ainput_main.c
+index 1a2128dcc..5f66cf90e 100644
+--- a/channels/ainput/client/ainput_main.c
++++ b/channels/ainput/client/ainput_main.c
+@@ -45,6 +45,7 @@ struct AINPUT_PLUGIN_
+ 	AInputClientContext* context;
+ 	UINT32 MajorVersion;
+ 	UINT32 MinorVersion;
++	CRITICAL_SECTION lock;
+ };
+ 
+ /**
+@@ -85,18 +86,15 @@ static UINT ainput_on_data_received(IWTSVirtualChannelCallback* pChannelCallback
+ 
+ static UINT ainput_send_input_event(AInputClientContext* context, UINT64 flags, INT32 x, INT32 y)
+ {
+-	AINPUT_PLUGIN* ainput = NULL;
+-	GENERIC_CHANNEL_CALLBACK* callback = NULL;
+ 	BYTE buffer[32] = { 0 };
+-	UINT64 time = 0;
+ 	wStream sbuffer = { 0 };
+ 	wStream* s = Stream_StaticInit(&sbuffer, buffer, sizeof(buffer));
+ 
+ 	WINPR_ASSERT(s);
+ 	WINPR_ASSERT(context);
+ 
+-	time = GetTickCount64();
+-	ainput = (AINPUT_PLUGIN*)context->handle;
++	const UINT64 time = GetTickCount64();
++	AINPUT_PLUGIN* ainput = (AINPUT_PLUGIN*)context->handle;
+ 	WINPR_ASSERT(ainput);
+ 
+ 	if (ainput->MajorVersion != AINPUT_VERSION_MAJOR)
+@@ -105,8 +103,6 @@ static UINT ainput_send_input_event(AInputClientContext* context, UINT64 flags,
+ 		          ainput->MajorVersion, ainput->MinorVersion);
+ 		return CHANNEL_RC_UNSUPPORTED_VERSION;
+ 	}
+-	callback = ainput->base.listener_callback->channel_callback;
+-	WINPR_ASSERT(callback);
+ 
+ 	{
+ 		char ebuffer[128] = { 0 };
+@@ -125,10 +121,15 @@ static UINT ainput_send_input_event(AInputClientContext* context, UINT64 flags,
+ 	Stream_SealLength(s);
+ 
+ 	/* ainput back what we have received. AINPUT does not have any message IDs. */
++	EnterCriticalSection(&ainput->lock);
++	GENERIC_CHANNEL_CALLBACK* callback = ainput->base.listener_callback->channel_callback;
++	WINPR_ASSERT(callback);
+ 	WINPR_ASSERT(callback->channel);
+ 	WINPR_ASSERT(callback->channel->Write);
+-	return callback->channel->Write(callback->channel, (ULONG)Stream_Length(s), Stream_Buffer(s),
+-	                                NULL);
++	const UINT rc = callback->channel->Write(callback->channel, (ULONG)Stream_Length(s),
++	                                         Stream_Buffer(s), NULL);
++	LeaveCriticalSection(&ainput->lock);
++	return rc;
+ }
+ 
+ /**
+@@ -140,8 +141,16 @@ static UINT ainput_on_close(IWTSVirtualChannelCallback* pChannelCallback)
+ {
+ 	GENERIC_CHANNEL_CALLBACK* callback = (GENERIC_CHANNEL_CALLBACK*)pChannelCallback;
+ 
+-	free(callback);
++	if (callback)
++	{
++		AINPUT_PLUGIN* ainput = (AINPUT_PLUGIN*)callback->plugin;
++		WINPR_ASSERT(ainput);
+ 
++		/* Lock here to ensure that no ainput_send_input_event is in progress. */
++		EnterCriticalSection(&ainput->lock);
++		free(callback);
++		LeaveCriticalSection(&ainput->lock);
++	}
+ 	return CHANNEL_RC_OK;
+ }
+ 
+@@ -155,14 +164,21 @@ static UINT init_plugin_cb(GENERIC_DYNVC_PLUGIN* base, rdpContext* rcontext, rdp
+ 	context->handle = (void*)base;
+ 	context->AInputSendInputEvent = ainput_send_input_event;
+ 
++	InitializeCriticalSection(&ainput->lock);
++
++	EnterCriticalSection(&ainput->lock);
+ 	ainput->context = context;
+ 	ainput->base.iface.pInterface = context;
++	LeaveCriticalSection(&ainput->lock);
+ 	return CHANNEL_RC_OK;
+ }
+ 
+ static void terminate_plugin_cb(GENERIC_DYNVC_PLUGIN* base)
+ {
+ 	AINPUT_PLUGIN* ainput = (AINPUT_PLUGIN*)base;
++	WINPR_ASSERT(ainput);
++
++	DeleteCriticalSection(&ainput->lock);
+ 	free(ainput->context);
+ }
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 8e53c47103..715354768a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24680_CVE-2026-27950.patch \
            file://CVE-2026-24681.patch \
            file://CVE-2026-24682.patch \
+           file://CVE-2026-24683.patch \
            "
 
 S = "${WORKDIR}/git"

