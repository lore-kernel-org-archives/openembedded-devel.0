Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14883CED603
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:03:40 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9827.1763463812675483211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XSU7LDND;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29558061c68so62697705ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463812; x=1764068612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYI7JplaOfaSYdeSz8R+IvQc0ED6TyLtRt2CfrSs7Y8=;
        b=XSU7LDND0FsG6qPWrFLkkKaaEHXYvp43mns4aqqT3jQUQAM0IDkbzWJuP5jWoFk5Hn
         nob73D9/bjN4Ss7Sj/dOxOHOHH6V1cOavMz94Dnu0VNBhR2n4jfagFGjfLuT6Ab4PiF5
         T7qmws5Sg8tHj8HBfCRMuhRijgCRrUPmH/BuX/X2C+cPpYRg+w+dFHpYXeg/BjVrEr6q
         pKX/IEceexEz+k1Ptwe+27UO6MoBcsL+SQgjUdW/s/MGlc2vQYqRHFk6mt2USLi+p+z1
         v4+U3w3ApCfL/e5UQlqGi4DrA501E2vBNe6Wet/Jdm9tIgMsA2qr1EkVsEil0MLxi4k4
         BADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463812; x=1764068612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYI7JplaOfaSYdeSz8R+IvQc0ED6TyLtRt2CfrSs7Y8=;
        b=A4VLgsBDjmi9ESNy7SrxcZUvL++7b3RPeHHWGzzWG9JP3OQ8Mm3sJr+MeAXxWanXBn
         MZPfI14COT0NHQLvhe41vImoLvYKPKOWrh7f1VUh2yiYhAxiVL1wK9Yh6mkxczrc4MYp
         fwdZN8HqyZtVoCzdbpy9vMZiyyZATxnV8LM4gtIQqZc3HOlqRd9YkQLE4CGl4A25MeXL
         hQXikRyN35ykgc60zmR8TWRaFKt4fWM9uTvbPK+3M/jIMSrHUjrmdNXun4xyGzSBlmpx
         k7h7+PC0DxfgFKEncI9R0kYiradD6DJzIxAHwxQT1ETFb+3HFKsbp477LwQAGQ86n+Wk
         Vu2Q==
X-Gm-Message-State: AOJu0YzhxsqxzEVFQBSdUeG1nJeTR5DSdWc7E/iE9cgZxLTHkynjCfPF
	AHO2BTCB3JaODN8XUeuGoXJg0kdHXz2nxOWlGtJ3nAwiO+Pt3Am/MbFjjgwfjA==
X-Gm-Gg: ASbGncsHTOjMMQ3mj8NPX4exrP62BvPEsgZ3RjD2CcS+I5m0QYbU30BThUX0Lr/KwE/
	wIFvw9tIz3G/9XdSc31ACAiEWEEjPbAHvdWBUz15rcn+a2fOeYw2GVYvZNKLPexGkDSHoRys/1+
	q9Tg77N5q25pTBk+uenQa1xHUNHj59skbYwAo64ZF4u33bw5UIx6h5/xnuMPKUqndLGle6sz+wI
	QUCsIOs2YbXrpUGAMU4H44Sq8wgmeL+Cxs/cS/G3t85OdwFKFfBQgsZiGnWERLicKFiFGX9BHFG
	XoEpghhEAswhezNUviPFScclwG5UyBZc5uqNS6SW/T1XaMW10Do5JHeDbUrFWow2DWnIjxQCSHx
	xbGJgyKibnoh9Cq08LAc3FclmdsgcCV3ZhrHN/ENpimTh89i6UrHrEZg4M/4ORgCGSjynw3M6NY
	BWVRSvStKDx/aHqYcQkTKCrLP++pa5xIhTrMY=
X-Google-Smtp-Source: AGHT+IH+4iLAY9CGjSCYWqrPf9RGVtYiEP6LDP/eFfeZTJjqSxvDAUsUU/t1I5BCTpDj8F2qDkaGvw==
X-Received: by 2002:a17:902:f78d:b0:299:bdaa:a71b with SMTP id d9443c01a7336-299bdaaa8f7mr158824685ad.2.1763463811867;
        Tue, 18 Nov 2025 03:03:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e46sm167431675ad.25.2025.11.18.03.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:03:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/5] freerdp3: patch CVE-2025-4478
Date: Wed, 19 Nov 2025 00:03:18 +1300
Message-ID: <20251118110320.1635988-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
References: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121854

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-4478

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2025-4478.patch      | 60 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-4478.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-4478.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-4478.patch
new file mode 100644
index 0000000000..f1315a38da
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-4478.patch
@@ -0,0 +1,60 @@
+From 36cd5554b50656f3492197f0fc02534dcc6b980f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@gmail.com>
+Date: Tue, 13 May 2025 10:34:08 +0200
+Subject: [PATCH] transport: Initialize function pointers after resource
+ allocation
+
+The transport instance is freed when an error occurs.
+If the TransportDisconnect function pointer is initialized it
+causes SIGSEGV during free.
+
+CVE: CVE-2025-4478
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/a4bb702aa62e4fad91ca99142de075265555ec18]
+(cherry picked from commit a4bb702aa62e4fad91ca99142de075265555ec18)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/transport.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/libfreerdp/core/transport.c b/libfreerdp/core/transport.c
+index a2a899b79..552a28a60 100644
+--- a/libfreerdp/core/transport.c
++++ b/libfreerdp/core/transport.c
+@@ -1560,18 +1560,6 @@ rdpTransport* transport_new(rdpContext* context)
+ 	if (!transport->log)
+ 		goto fail;
+ 
+-	// transport->io.DataHandler = transport_data_handler;
+-	transport->io.TCPConnect = freerdp_tcp_default_connect;
+-	transport->io.TLSConnect = transport_default_connect_tls;
+-	transport->io.TLSAccept = transport_default_accept_tls;
+-	transport->io.TransportAttach = transport_default_attach;
+-	transport->io.TransportDisconnect = transport_default_disconnect;
+-	transport->io.ReadPdu = transport_default_read_pdu;
+-	transport->io.WritePdu = transport_default_write;
+-	transport->io.ReadBytes = transport_read_layer;
+-	transport->io.GetPublicKey = transport_default_get_public_key;
+-	transport->io.SetBlockingMode = transport_default_set_blocking_mode;
+-
+ 	transport->context = context;
+ 	transport->ReceivePool = StreamPool_New(TRUE, BUFFER_SIZE);
+ 
+@@ -1610,6 +1598,18 @@ rdpTransport* transport_new(rdpContext* context)
+ 	if (!InitializeCriticalSectionAndSpinCount(&(transport->WriteLock), 4000))
+ 		goto fail;
+ 
++	// transport->io.DataHandler = transport_data_handler;
++	transport->io.TCPConnect = freerdp_tcp_default_connect;
++	transport->io.TLSConnect = transport_default_connect_tls;
++	transport->io.TLSAccept = transport_default_accept_tls;
++	transport->io.TransportAttach = transport_default_attach;
++	transport->io.TransportDisconnect = transport_default_disconnect;
++	transport->io.ReadPdu = transport_default_read_pdu;
++	transport->io.WritePdu = transport_default_write;
++	transport->io.ReadBytes = transport_read_layer;
++	transport->io.GetPublicKey = transport_default_get_public_key;
++	transport->io.SetBlockingMode = transport_default_set_blocking_mode;
++
+ 	return transport;
+ fail:
+ 	WINPR_PRAGMA_DIAG_PUSH
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index a272ba0ecb..3558697d42 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32660.patch \
            file://CVE-2024-32661.patch \
            file://CVE-2024-32662.patch \
+           file://CVE-2025-4478.patch \
            "
 
 S = "${WORKDIR}/git"

