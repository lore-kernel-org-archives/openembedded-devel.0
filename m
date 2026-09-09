Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E37C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7001.1788942737206226268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YAUL7PfD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db59f54ccfso18752915ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942736; x=1789547536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2oegmJAK+3jfsDFbRRXiNUX9wos2TX79uhaVAsMrIw=;
        b=YAUL7PfDHUBk7ejIwDDzZoPvV/fgSbiXCM76jQ/X6AQvK6lh6qSbeYL/rZ2WQM0gOa
         Gj/qPEYnqnO5YsLzjVbOH+K5ILezXBNC5nAigB87Og2QUCHmpnLe5aZ4xlShGlT9EPS+
         lnZ2Ax5ezJaJ5MYWnivxbOIr7AMN1+Ovns2e4AA998sQXVlXrdZHMUngZI1oAiz8uF6b
         Jbi6Uo9YmlBRKSBoj/m801NqM4dgcVqLXIwT5vgWmPTHVPfE6pTunl8pOuTbIxWNABwo
         5rWccEEYDBgJWZNJpWQOhrX+g7Ac8bAjpN2MNxykM/lhI5I7u9z5la2fXRKf6nRpftDz
         +aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942736; x=1789547536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2oegmJAK+3jfsDFbRRXiNUX9wos2TX79uhaVAsMrIw=;
        b=h6pHwpPDezZ+DLTA0AbvAK8CkgC6KRzqbzq1X9Fd7ccJZGFsm3E/lERt1/Wuruk7Tt
         +BDulM1pxe0MBbwTS9m4HWgKopzFkUEA7za0yYfHxRLKQ3LRvdRtoHyVQI7TAqjYOP8u
         BL9dLkovOEwMie9FOLVTEz5XZeWAKGUmZ3/KzwBgbGygT/Cn7tDjZHV4RZ5l6hjso3bn
         FdiCYJwLSNUJYjGGrHS1tSFOSWaRwgI/SwRZIqeGCrRvkAfFQ8WMgdwnjX/FhEQCUCuq
         jvUeanmt2CB1dVPBqo6Ub5IQXZhavtfHiad6jiMomNGVURW+D22NtidZVim5mtTNBqQX
         9cgw==
X-Gm-Message-State: AFuF++kH+a/P8A1ffFDx+X4fbrNvgbDGuJv3WIoZqBZwkBEDW4T/sLki
	FhHlEnb/PIrqqIf2EovfbWZMkX2LAa46gsrfymusCYHesQ6J865hOvHU3XMJxygZ
X-Gm-Gg: AYBFou2y3dGCe1f8n6SK4dsYT3qwSHeT1laMOOZwz1v4AwJnnc+86mZrV1KF2YFeLZN
	f+9GJmKvJkYObs+5tWjwdrPj5iYyEipa9/s5xEPIalYRF2aUrULKT95H7yizk7DV8wqjcbwW3Tj
	7ClDlJTcaiJtS5LsUbiMnY+LGQ7fMymQejB2BLG2lnaD/lTYqWXBsSN73WaKkGbeJXpCtzEvQT/
	hG0HimqYf+blYyAK7n3yP+p0p4c2PfngZ3OnJl2cWmj3MXu2Pxp1v+Yngj/ynejSL8qTH9qlCzT
	U450KDshUWwRP+NP5fW2NqJF7cS7HsBQAOn8GUrWxWkOkEkSsYTXgfQ6cY6WsHjqWYY2S3I9XTg
	xyN8aNOmR3px+Sz7xQsiJthuN3lNorVxD/pLz4gau96IglupZLoG9S9zyEtPx6lzXuUuzTgPAgb
	NCYaEDTMqerYUNUPrvkxq7dyEQNExZkRMRrnHggu+vh5e1B+h+AP757A3cHz5mf8utmedWwXeru
	it3gMoZfwTIIORuSSBcmx0=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr56961856a91.16.1788942736502;
        Wed, 09 Sep 2026 01:32:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 9/15] freerdp3: patch CVE-2026-63652
Date: Wed,  9 Sep 2026 20:31:34 +1200
Message-ID: <20260909083140.2494932-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129880

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-63652

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-63652.patch     | 53 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63652.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63652.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63652.patch
new file mode 100644
index 0000000000..2e77b09d5e
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63652.patch
@@ -0,0 +1,53 @@
+From d814e663432dcc8fb485ac91f6106c950d003d9b Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 2 Jul 2026 08:02:29 +0200
+Subject: [PATCH] [channels,rdpsnd] fix free of
+ RdpsndServerContext::client_formats
+
+(cherry picked from commit caf653c0ba1c75ec8f298d1baa59770102a5d14c)
+
+CVE: CVE-2026-63652
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/caf653c0ba1c75ec8f298d1baa59770102a5d14c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/rdpsnd/server/rdpsnd_main.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/channels/rdpsnd/server/rdpsnd_main.c b/channels/rdpsnd/server/rdpsnd_main.c
+index 8322704ff..29778bb2f 100644
+--- a/channels/rdpsnd/server/rdpsnd_main.c
++++ b/channels/rdpsnd/server/rdpsnd_main.c
+@@ -181,6 +181,14 @@ static UINT rdpsnd_server_recv_quality_mode(RdpsndServerContext* context, wStrea
+ 	return CHANNEL_RC_OK;
+ }
+ 
++static void rdpsnd_server_client_format_free(RdpsndServerContext* context)
++{
++	WINPR_ASSERT(context);
++	free(context->client_formats);
++	context->client_formats = nullptr;
++	context->num_client_formats = 0;
++}
++
+ /**
+  * Read Client Audio Formats and Version PDU (2.2.2.2)
+  *
+@@ -260,7 +268,7 @@ static UINT rdpsnd_server_recv_formats(RdpsndServerContext* context, wStream* s)
+ 
+ 	return CHANNEL_RC_OK;
+ out_free:
+-	free(context->client_formats);
++	rdpsnd_server_client_format_free(context);
+ 	return error;
+ }
+ 
+@@ -1140,7 +1148,7 @@ void rdpsnd_server_context_free(RdpsndServerContext* context)
+ 	}
+ 
+ 	free(context->server_formats);
+-	free(context->client_formats);
++	rdpsnd_server_client_format_free(context);
+ 	free(context->priv);
+ 	free(context);
+ }
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 054d90718e..86999ffe94 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-55564.patch \
            file://CVE-2026-55648.patch \
            file://CVE-2026-63633.patch \
+           file://CVE-2026-63652.patch \
 "
 
 

