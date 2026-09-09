Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0731DC79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:16 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6998.1788942726247350716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X00nJYFZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso4330817a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942726; x=1789547526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHPNaHW8s7ui+5CvLvKsEiOrbKa0nRIi0A5GlRFZasc=;
        b=X00nJYFZ4iFjXbWF8ug+SYFxD7VZq7HWfW95q7oZkYxFY7KQoxG9y1Kb0ldrHfa5Wt
         vIHNBiv/MjuuIwnrR+GzcLFo9JtCZLwJ5Z2lI/DnuE+eXg34BgC1Kw+eraRfTIs2YCfb
         D1xurxN+RA6jSxOXn/LHuZKMudA5ya8mcw25FG+X35oTBL7SoUjrmnFaQPsUccEM44WI
         NhjrfGajIxSbuSLxQYO9vwU0ErEmlpJnItMrvWHOlPA8kBgKT49LLioCjCznV6eW7xxB
         zF8sZtyESoCkd+xCCbWnW01YFHul6amxyTl5c7uQmaucraLDc62hEHPf06HhE11v6QKu
         MrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942726; x=1789547526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHPNaHW8s7ui+5CvLvKsEiOrbKa0nRIi0A5GlRFZasc=;
        b=BbNVJeH0OaDm+UWdPvXhw45UbtCsH4l7NKb6y5D2QQWLHdGSkT/liRRYzMCDffLMkW
         meppCAbBBRzqgSWrA6SkZhZDkAy5eonpLiiwZkbP+wms905JJ3Mk+8Y5H90rbHl1vNih
         +xrytzkEwVTDpTcXzswPONXp/Mg5cFcEpK8HjTS/38/ZPI8xiQ9p1S1GX/pnnRvbUCKI
         8+ghSsJFTgwjj+fglLGypsNe48kjznh09u6j+uQjh966/ECxPz7x1lyFVSgU53k62JEZ
         X7ZKXOdju/FF9qN8yK7yKveovISrCnoK6nBjfOmbO9FhjP/+n5eouRt0nPZOuaxQXtfw
         V81A==
X-Gm-Message-State: AFuF++n4MFMfY19p2YIN6qjcFyB8zqp7UZVWXcfp/g/+me7O9TyqWIX8
	dcpjnLGLEKiBKLODxHxruLhAEv3OFf+9Ht6OznGRJy9QNohLVOm8wKwbJAnrAZUe
X-Gm-Gg: AYBFou2md7JR6c27n786QcI2JKkNtMi8Tvpzvp9XPKfhbrjS1PcpCndMWwWc4r/KrR0
	1Wnj8GHREHHqwESdWdrfxdu2D9mBiB4WNnBpMggIyr+RGg6bn9/neNa4KDGLCr85AtnjWEP/sSN
	9eOcpo9y4FGrez+MB8wBCDtiMwjAkZqUAkUfNb5o6QGVr2+XSI+kyiAIOt6IknabTnkPqg2hQOX
	atxkPyoW62QOe4kjrNZ0XPprwzYADWIPwuU4d1OvhzPAUmsGSigC9P8WUMkohqPUzoDnO3gfWnx
	xwCUlWjlBD1XJHyfb4narwgPPT7Uv+eKvspkIPGdX0kt/k8Vm73+anNVjhvPAiguOo2nNOFp5vC
	q8eXNqNmcSECuV9jpCCO7nGcAZPkH/dbWb+zVI4AcbNtG1wDODQm1J/bM4AAcHCs6H/ZrKqqC9R
	Xb+BZSt2OaYkVvvp4ePyddjrk/M3UJVLcjOCPui5tWUpHzZE0YxX+uQV1v8qxHKTgsRLkRsyzEr
	gG0KpYWhh8d0mfuUKAWECz3wYaOo/sS0g==
X-Received: by 2002:a17:90b:4fc5:b0:398:9be6:f996 with SMTP id 98e67ed59e1d1-39b262cee58mr55183869a91.21.1788942725337;
        Wed, 09 Sep 2026 01:32:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/15] freerdp3: patch CVE-2026-55194
Date: Wed,  9 Sep 2026 20:31:30 +1200
Message-ID: <20260909083140.2494932-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129876

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55194

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-55194.patch     | 53 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55194.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55194.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55194.patch
new file mode 100644
index 0000000000..da2733ccf0
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55194.patch
@@ -0,0 +1,53 @@
+From 7e828b919a8394abd86a174c4943299618e128eb Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 11 Jun 2026 08:22:26 +0200
+Subject: [PATCH] [core,gateway] ensure buffer size for current write
+
+(cherry picked from commit 9f2da52c2341cc14a96ad12e69c5b83d0bcd8b5a)
+
+CVE: CVE-2026-55194
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/9f2da52c2341cc14a96ad12e69c5b83d0bcd8b5a]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/gateway/rpc_client.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libfreerdp/core/gateway/rpc_client.c b/libfreerdp/core/gateway/rpc_client.c
+index 27f3614f1..59e5781f4 100644
+--- a/libfreerdp/core/gateway/rpc_client.c
++++ b/libfreerdp/core/gateway/rpc_client.c
+@@ -372,7 +372,6 @@ static int rpc_client_recv_pdu(rdpRpc* rpc, RPC_PDU* pdu)
+ static int rpc_client_recv_fragment(rdpRpc* rpc, wStream* fragment)
+ {
+ 	int rc = -1;
+-	RPC_PDU* pdu = nullptr;
+ 	size_t StubOffset = 0;
+ 	size_t StubLength = 0;
+ 	RpcClientCall* call = nullptr;
+@@ -382,7 +381,7 @@ static int rpc_client_recv_fragment(rdpRpc* rpc, wStream* fragment)
+ 	WINPR_ASSERT(rpc->client);
+ 	WINPR_ASSERT(fragment);
+ 
+-	pdu = rpc->client->pdu;
++	RPC_PDU* pdu = rpc->client->pdu;
+ 	WINPR_ASSERT(pdu);
+ 
+ 	Stream_SealLength(fragment);
+@@ -464,7 +463,7 @@ static int rpc_client_recv_fragment(rdpRpc* rpc, wStream* fragment)
+ 		{
+ 			const rpcconn_response_hdr_t* response =
+ 			    (const rpcconn_response_hdr_t*)&header.response;
+-			if (!Stream_EnsureCapacity(pdu->s, response->alloc_hint))
++			if (!Stream_EnsureRemainingCapacity(pdu->s, StubLength))
+ 				goto fail;
+ 
+ 			if (Stream_Length(fragment) < StubOffset + StubLength)
+@@ -472,6 +471,7 @@ static int rpc_client_recv_fragment(rdpRpc* rpc, wStream* fragment)
+ 
+ 			if (!Stream_SetPosition(fragment, StubOffset))
+ 				goto fail;
++
+ 			Stream_Write(pdu->s, Stream_ConstPointer(fragment), StubLength);
+ 			rpc->StubFragCount++;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 4248225379..eefc9ab5d3 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-55191.patch \
            file://CVE-2026-55192.patch \
            file://CVE-2026-55193.patch \
+           file://CVE-2026-55194.patch \
 "
 
 

