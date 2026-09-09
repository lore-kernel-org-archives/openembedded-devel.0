Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAB1C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:05 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6996.1788942723188007658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FjhSev2V;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so4734007a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942722; x=1789547522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dit5OPoRQ3LL+UPnPe8XGrZtowectMh6HuOW+J/T+A=;
        b=FjhSev2VyaM6qO7+uSgTHc1kLowmS4RwO3eetrwepe2bdk6TfN5/YhdydkT0HqG6Eq
         Cy27piCsY69/tyM+Oe29AFMxhcwkzb5ABhcJPJBIV/IG+MeD04Oo09tXLEx1mDfIoS0f
         afvrVa+tm+IYLuH5M8NLUtSICESpMQU5OJq/eOjosOQqPMxs1UQUH4DzZekXWQ2+4kkp
         A/Sk9avWI9h7xciqFs1wTOgQ2B5d/XSs8D53ROHqfyi+408l9+A2BCyLcb7aM8s6/PFh
         v1WaBDy3yi4dC+5NV6Rb3rSoVriyzF5rCfr6y4/G552PV/DqarA9bPsshD/0Et2xFx0x
         BeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942722; x=1789547522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dit5OPoRQ3LL+UPnPe8XGrZtowectMh6HuOW+J/T+A=;
        b=CLtih0J1OHFMaTbukM/tJu30oxlm8kwFvnR4xlESI9xRGSFnCeuUCxAMn+lidQuuzw
         7jb2lLUnMDMadq7lVRjAWO+vIGVFSZV112T+q7h4BvmrV3OzRKOCireLz+dqA3eeESp8
         9TH19u0/P9ug6yMdGE+17qm1TxD9vCrCQYgc/jRM4ZTnntZglEeaY0B45jBOLhHys09U
         LobO2EsQajQ8Bw2OmvfsEQ0vtxopmyWINtEan2nlnMmkeGWqH8RlOwW6CR4UxwggP7vC
         rFK9AvLHR70x7PrXtWdfqd9HaCl7ov+1DH8r/aZPYJ3NLRtuFEY8G4BwElTHUU6IITTj
         3UMw==
X-Gm-Message-State: AFuF++lO0b4A/eP+JWISGp1PdC0/Vco4MEUqEoW1iq/N95GGJQ0aV1l3
	PvXnE8W3+9xW8xcyOgSJi1f4wGotalajJ8Hg9Xm7sEM19UlNm5AEmPY8UfdG/Q==
X-Gm-Gg: AYBFou2Jbj8ylH1qNRpfBiaJp7/WjZoorQ3Jy7ZkOigeT3Wm3PpDUml4bk9CsfV5pll
	dEI7TbDL9B0g5esMTatPcUyNI4V4tlfAByI+kRDlltbr3y8aMy9xgsHcPoPrBM9fJqCc20yP4Ip
	85CzNPvAJdo0hhoPuVcGkQcYpq3z/CIQhbeO3nWmc4dYn98+dCAOE1MKxs+DtJHB33VcUfR3N4u
	hvnWM9AxYUnwYoBmfB9b5myYnBL28NL6Ig4olnFDAKmLBuk3wps7yv/2KnLvkoT3WaqFtiLxN46
	FWsMnPyboaOwOd+iagIsZVv60WnghSEmTIKrKGB+V5VeezfQE5NXcsXbwfqV85THp90VGjS3XZC
	XUqjYhQgwFXYjOSNPQ+x1owGLYNDYgpx7+HNBXOHXWC6gRi/cjM+anISS85ujelrQk85V6LQwvg
	RcHFsoh7Xlm+arvuFfbvNd0+7ZIvcz9OdbRQsFJ7DL5B0P+WhjBvbQbhLUvpYNeQYzfsNC0xX77
	nVt0K1v8Iejlp2TYQMPeQI=
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr47069218a91.10.1788942722387;
        Wed, 09 Sep 2026 01:32:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 4/15] freerdp3: patch CVE-2026-55193
Date: Wed,  9 Sep 2026 20:31:29 +1200
Message-ID: <20260909083140.2494932-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129875

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55193

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-55193.patch     | 37 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55193.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55193.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55193.patch
new file mode 100644
index 0000000000..5fbd142e49
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55193.patch
@@ -0,0 +1,37 @@
+From b0b560b3c89e46107092cc8d1abe61ae4c4e7c4d Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 11 Jun 2026 08:31:09 +0200
+Subject: [PATCH] [core,gateway] rpc header max fragment size checks
+
+(cherry picked from commit a863ef1cf1cdabf9019280e5658f806e73bb50e8)
+
+CVE: CVE-2026-55193
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/a863ef1cf1cdabf9019280e5658f806e73bb50e8]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/gateway/rpc_bind.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libfreerdp/core/gateway/rpc_bind.c b/libfreerdp/core/gateway/rpc_bind.c
+index cc670d14f..3a055eb50 100644
+--- a/libfreerdp/core/gateway/rpc_bind.c
++++ b/libfreerdp/core/gateway/rpc_bind.c
+@@ -342,6 +342,17 @@ BOOL rpc_recv_bind_ack_pdu(rdpRpc* rpc, wStream* s)
+ 	WLog_DBG(TAG, header.common.ptype == PTYPE_BIND_ACK ? "Receiving BindAck PDU"
+ 	                                                    : "Receiving AlterContextResp PDU");
+ 
++	const UINT16 MAX_VALID_FRAG = 0x0FF8;
++	if ((header.bind_ack.max_xmit_frag > MAX_VALID_FRAG) ||
++	    (header.bind_ack.max_recv_frag > MAX_VALID_FRAG))
++	{
++		WLog_ERR(TAG,
++		         "bind_ack: invalid fragment size: max_xmit_frag=%" PRIu16
++		         ", max_recv_frag=%" PRIu16 ", maximum=%" PRIu16,
++		         header.bind_ack.max_xmit_frag, header.bind_ack.max_recv_frag, MAX_VALID_FRAG);
++		goto fail;
++	}
++
+ 	rpc->max_recv_frag = header.bind_ack.max_xmit_frag;
+ 	rpc->max_xmit_frag = header.bind_ack.max_recv_frag;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 978f950d8d..4248225379 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-40254-2.patch \
            file://CVE-2026-55191.patch \
            file://CVE-2026-55192.patch \
+           file://CVE-2026-55193.patch \
 "
 
 

