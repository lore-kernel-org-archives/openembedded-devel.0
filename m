Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB83EA3F0B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 05:48:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14057.1770702485473074878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 21:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTo0AiLU;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so5090045e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 21:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702484; x=1771307284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eu3MhzymVoF7Jr+CQJo9zYXTiSu3jfHxCqfk8ggHLtE=;
        b=KTo0AiLUNdK3QNfDPZzVIPGHfxFPXaxLmseh3n4pNK1YHSqyALxBoQtOUg05M5H7ba
         OSpb/SYDfzZyUh/Mw9+I210nb7YUB1MMN5W/BnnmoiyKVsd8AbmckDBXL0aljHwFHuv8
         SvwHwp11GB9baHFf8kDNjakMuclBdJBWXDmESQmH3o6EVh6UWgXz2RPL9YDymkztsbpt
         1EQw5yJTMDVs7VmNYTE/O4RLxtrccATvlnmeKEYrkK5b494zfi/9YFlYXXvCIQFzpEgQ
         gEAOkYcMYZYj+drjhatxxveZBNHv8XTZSZ+nmU9+Ts49zYoJLAE11MaHJU+F6qAUSx6k
         TY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702484; x=1771307284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eu3MhzymVoF7Jr+CQJo9zYXTiSu3jfHxCqfk8ggHLtE=;
        b=wI8STz0KLowdAKlbXOQSYGso1RjIu9835bN6Zk6Vh5a141BAvsoZH0n15ouKhNI3zR
         9sNk++0ZSgfr42e/KqeDbHVLPK7x0TZtcDmmuBjvncTJlXSz5XPPrFc25F/VZtV9JGHg
         3dDkBL4Ed2+XZp/WzsyAZrB91IGWqVKPHTubQfepORhv/CxDcySyw1khDRR7HOgODRPA
         bDYN/bNX9bB4Zh4wujNLt0P9nynQKlbpzztQRvhzWGHVKpFkn73xjgtbipsw6jwD1VPd
         FX1G4OYKWUm7noHSgXBVLmSFz2Iv99xnpJPtZpZqRlR/y7HsHP6hXxcMRlsZrE85rIKX
         c/Cw==
X-Gm-Message-State: AOJu0YyedaYtOSxKC2x9cjtrrHJ+QJRoMR+9cC3f+u7O4Wl0e/oy0SQQ
	kHulZf5Phlr7v0OrrmFn76XkvIQ9fsCgbrQXu+cUkI2HnagwvBDM1Pk3FUaGWg==
X-Gm-Gg: AZuq6aLyoWDljl6Nik8E/dGX3hM+xIqNHkLRNZY0xK3oiFvbogRQXfHhgjNZ803nsLZ
	x08AeDL4+mTnPkYuHnHwzUGBo24Nt/GYU5bqED3/h8nN4p9F0RDUEqtEPhhzX7aTJxUD/Uvobhj
	JXxUg7jOzIZFGvOPYSexHXw4RGLfF0GWXiXTF0fCtqltkfKLrZwsk7Zb5MZJ20DtA9Kri69VSe+
	maYIluU7uZa4gjrNMp9FnAGnk86YCOLfO7YBJMy3bOx2E9yXMGA+5YS6AvX7WH4givXIzRoTvQ/
	zKeAg9rnebWeN56rQoszNl8HUZ2TnWmcbo0SLVSLCOM8MhT6PKpQfN4QYiTA7CgtSM4pxa1Gndo
	4R501hClkUBfcS+z9gu1wgKntFGhq+4eYC28t0191qsDCQwQrBU7LkyL4G2aGMhZKway+HmiZbN
	hplb4uRXiPlmnch509hB7z
X-Received: by 2002:a05:600c:3552:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-48320339137mr213413885e9.34.1770702483774;
        Mon, 09 Feb 2026 21:48:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e74e5sm33821595e9.12.2026.02.09.21.48.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:48:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] freerdp: patch CVE-2026-22855
Date: Tue, 10 Feb 2026 06:48:01 +0100
Message-ID: <20260210054802.3897106-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210054802.3897106-1-skandigraun@gmail.com>
References: <20260210054802.3897106-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 05:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124316

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22855

The related Github advisory[1] describes the problem along with analyzing
where the vulnerability is in the codebase. I looked up the commit that
recently performed the changes from the analysis, and backported it.

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-rwp3-g84r-6mx9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2026-22855.patch      | 83 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22855.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22855.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22855.patch
new file mode 100644
index 0000000000..ec0c3a75ec
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22855.patch
@@ -0,0 +1,83 @@
+From df1132783e49ebeaa30206a67b70c7a37f3c5650 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 11 Jan 2026 09:03:57 +0100
+Subject: [PATCH] add length validity checks
+
+From: akallabeth <akallabeth@posteo.net>
+
+in smartcard_unpack_set_attrib_call input length validity checks were
+missing.
+
+CVE: CVE-2026-22855
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/57c5647d98c2a026de8b681159cb188ca0439ef8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ channels/smartcard/client/smartcard_pack.c | 27 +++++++++++++++++-----
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/channels/smartcard/client/smartcard_pack.c b/channels/smartcard/client/smartcard_pack.c
+index f70eb4e5d..c0673e066 100644
+--- a/channels/smartcard/client/smartcard_pack.c
++++ b/channels/smartcard/client/smartcard_pack.c
+@@ -98,8 +98,8 @@ static BOOL smartcard_ndr_pointer_read_(wStream* s, UINT32* index, UINT32* ptr,
+ 	return TRUE;
+ }
+ 
+-static LONG smartcard_ndr_read(wStream* s, BYTE** data, size_t min, size_t elementSize,
+-                               ndr_ptr_t type)
++static LONG smartcard_ndr_read_ex(wStream* s, BYTE** data, size_t min, size_t elementSize,
++                               ndr_ptr_t type, size_t* plen)
+ {
+ 	size_t len, offset, len2;
+ 	void* r;
+@@ -125,6 +125,9 @@ static LONG smartcard_ndr_read(wStream* s, BYTE** data, size_t min, size_t eleme
+ 		return STATUS_BUFFER_TOO_SMALL;
+ 	}
+ 
++	if (plen)
++		*plen = 0;
++
+ 	switch (type)
+ 	{
+ 		case NDR_PTR_FULL:
+@@ -181,11 +184,20 @@ static LONG smartcard_ndr_read(wStream* s, BYTE** data, size_t min, size_t eleme
+ 	if (!r)
+ 		return SCARD_E_NO_MEMORY;
+ 	Stream_Read(s, r, len);
+-	smartcard_unpack_read_size_align(NULL, s, len, 4);
++	const LONG pad = smartcard_unpack_read_size_align(NULL, s, len, 4);
++	len += (size_t)pad;
+ 	*data = r;
++	if (plen)
++		*plen = len;
+ 	return STATUS_SUCCESS;
+ }
+ 
++static LONG smartcard_ndr_read(wStream* s, BYTE** data, size_t min, size_t elementSize,
++                               ndr_ptr_t type)
++{
++       return smartcard_ndr_read_ex(s, data, min, elementSize, type, NULL);
++}
++
+ static BOOL smartcard_ndr_pointer_write(wStream* s, UINT32* index, DWORD length)
+ {
+ 	const UINT32 ndrPtr = 0x20000 + (*index) * 4;
+@@ -3427,12 +3439,15 @@ LONG smartcard_unpack_set_attrib_call(SMARTCARD_DEVICE* smartcard, wStream* s, S
+ 
+ 	if (ndrPtr)
+ 	{
+-		// TODO: call->cbAttrLen was larger than the pointer value.
+-		// TODO: Maybe need to refine the checks?
+-		status = smartcard_ndr_read(s, &call->pbAttr, 0, 1, NDR_PTR_SIMPLE);
++		size_t len = 0;
++		status = smartcard_ndr_read_ex(s, &call->pbAttr, 0, 1, NDR_PTR_SIMPLE, &len);
+ 		if (status != SCARD_S_SUCCESS)
+ 			return status;
++		if (call->cbAttrLen > len)
++			call->cbAttrLen = (DWORD)(len);
+ 	}
++	else
++		call->cbAttrLen = 0;
+ 	smartcard_trace_set_attrib_call(smartcard, call);
+ 	return SCARD_S_SUCCESS;
+ }
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 0bdf56938b..3ee4f99c1a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://0001-Fixed-compilation-warnings-in-ainput-channel.patch \
            file://CVE-2024-32661.patch \
            file://CVE-2026-22854.patch \
+           file://CVE-2026-22855.patch \
            "
 
 

