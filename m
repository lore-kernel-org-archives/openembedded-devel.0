Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B11E9DE44
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:42 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126697.1775718580215741835
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JsDBWSx5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso326595b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718579; x=1776323379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phBGia17fX3Di/1P+4br101Fqk6Up2noLFZKO0XKHDs=;
        b=JsDBWSx5+q/WsUikfKWuxAsxmfFAQeY5HUtVPNmfLHolRIrZXMog9S26glAdIfTyIT
         mVvpVayO9HkOaH2nm5s8t3eQsRinwPXdNTknwczdIXCPeMw5mr4B/gteeOx6WkHufdgz
         qU2556A2h1jibENKIO/71FPW6jKRiKHy4ulep2VjyNNkqgdNSECoOtPAGXnEOO5Wsqo8
         TOZ5LoB9J8WzMvyJmoxQpFBOYH9oTgrAoJz2QSK88U0bCf0YWXHbxQVe/8FkFUT7JILp
         T4sl6nab2rOZkBasiRRpgPXCNppK/1fgYL4EDWeaMG87YGoP5hn212+/F8lbkTNuxChN
         JM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718579; x=1776323379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phBGia17fX3Di/1P+4br101Fqk6Up2noLFZKO0XKHDs=;
        b=qI2LrZjxWbce5CEjidpZkTfVudtREVj9wN/Wy7UxTdXaZZR68Z4uSuKZYWO2dF9edX
         2yu4+3bq+aTfl8xEb9cFGp+WC3CUcjl/Ju6gKi27HDO+DRh/1OXTT/HQ69sUjStC+Daj
         g5ZrsJOisz8yG5psYt7XQZujbYptyhXVvXSItoL75wD3dwi/A4K9VsKXdD26R6TjNuWM
         vKE+jgcNxSiKIePHuc14II3FVzQdks+4friueak2wfI6g0C+yHJFlY1E2GbPlcUHjc4j
         GrMSV4nnHbmAW5i7bNjX9Pq2nCbLKV1Dxws3fEYZ6EgB9yc4ViX64wctWxJoZ2iZaJMO
         DJ/g==
X-Gm-Message-State: AOJu0YyBqJZPbJJgledb+Cj4aYQRE4uo94NGATC5AwCrNfT6UBi6xGcN
	V76fCsTIQ4KaxsndQsn3kkmy/GgQEq9OS7RpySwBFgWs24skcultXpiQT8+M6w==
X-Gm-Gg: AeBDiesxrl/Ep4EQPZsyzRL8+qvCwHjXTzGDEoITV5yi+GRI6TXwjCNqHgY2EKLmZMq
	5oWGKeVB8/0+ufUKNcLy6RGoi8cvIUx6BvG60b6ND6PpACpZkuuISrX0V7b+2USCffo00fshi1u
	0SFYHpyHuhLlpMdP37JduSezq6C8KYGWF/hdJjXfV95uixOobrG3RT04lc8EhYalj2osv5RF16r
	ewFDc5cUWwkXAbvoZSE3JQa1LEWlbH1r7nm9aKQvUdu3UeyeJQ9v2QMfcp9H1JT1hNm09rFEeTy
	bmFBd5uyFGb75AILd0J1hKNF6pyDZejkHaLEBNyweKb9WgN1b2ATB+PdXNSJs1HVg/omWf18Bgc
	MQI+IU69bUKmXkTTqiIQ2UdMu+KAhp/DUovWRKTu4mThxAFGG4tGNu3qyANHLYGETi5idfuzxs3
	gOEO42YEdDIPQ59is4LwhDZD8KWQQ7VeI2rFc=
X-Received: by 2002:a05:6a00:888d:10b0:82a:1c99:dce0 with SMTP id d2e1a72fcca58-82dd8a1dc36mr1648592b3a.2.1775718579341;
        Thu, 09 Apr 2026 00:09:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/22] freerdp3: fix CVE-2026-24491
Date: Thu,  9 Apr 2026 19:09:02 +1200
Message-ID: <20260409070919.3968586-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126127

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24491

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24491.patch     | 52 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24491.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24491.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24491.patch
new file mode 100644
index 0000000000..958d030bfd
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24491.patch
@@ -0,0 +1,52 @@
+From ef948ef4659f59c10a71083fa8cb5d5da77e94a9 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:06:29 +0100
+Subject: [PATCH] [channels,drdynvc] reset channel_callback before close
+
+The channel_callback usually frees up the memory of the callback. To
+ensure that there is no access to any of the data structures in it
+invalidate the pointer used to access it before a free.
+
+CVE: CVE-2026-24491
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/e02e052f6692550e539d10f99de9c35a23492db2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/drdynvc/client/drdynvc_main.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/channels/drdynvc/client/drdynvc_main.c b/channels/drdynvc/client/drdynvc_main.c
+index 0b85c0fe3..64c83333a 100644
+--- a/channels/drdynvc/client/drdynvc_main.c
++++ b/channels/drdynvc/client/drdynvc_main.c
+@@ -485,14 +485,13 @@ static UINT dvcman_channel_close(DVCMAN_CHANNEL* channel, BOOL perRequest, BOOL
+ 			channel->state = DVC_CHANNEL_CLOSED;
+ 
+ 			IWTSVirtualChannelCallback* cb = channel->channel_callback;
++			channel->channel_callback = NULL;
+ 			if (cb)
+ 			{
+ 				check_open_close_receive(channel);
+ 				IFCALL(cb->OnClose, cb);
+ 			}
+ 
+-			channel->channel_callback = NULL;
+-
+ 			if (channel->dvcman && channel->dvcman->drdynvc)
+ 			{
+ 				if (context)
+@@ -763,14 +762,13 @@ out:
+  */
+ static UINT dvcman_open_channel(drdynvcPlugin* drdynvc, DVCMAN_CHANNEL* channel)
+ {
+-	IWTSVirtualChannelCallback* pCallback = NULL;
+ 	UINT error = CHANNEL_RC_OK;
+ 
+ 	WINPR_ASSERT(drdynvc);
+ 	WINPR_ASSERT(channel);
+ 	if (channel->state == DVC_CHANNEL_RUNNING)
+ 	{
+-		pCallback = channel->channel_callback;
++		IWTSVirtualChannelCallback* pCallback = channel->channel_callback;
+ 
+ 		if (pCallback->OnOpen)
+ 		{
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index c570e5fb7e..e66a4ed4da 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-25941.patch \
            file://CVE-2026-33952.patch \
            file://CVE-2026-23948.patch \
+           file://CVE-2026-24491.patch \
            "
 
 S = "${WORKDIR}/git"

