Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675D6C79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:36 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7005.1788942748712731685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KN8j3mHk;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso6313913a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942748; x=1789547548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcFfUgE0TJ2kWhURQskt5hSX7L1EHQDPcpGaB85yJOI=;
        b=KN8j3mHkdQ/pJ/T0ECJvBcyuHG26atsZBJdAOFwyDBlNjRTQEzLOrZclRcmDMALqTU
         T9dU5cUdLdYTYJwPzQe05NOaBa7JLFbJnifcvTQx5sRe/sosbPzEHG568eBlK/rq91jc
         eEavjv3wIZv6YubVzoMkqUMfCcBWg4+bEemnCNG6ap2ow3j6txPxledWOA7k3V51uOE4
         KWyzewS8lGCptL691h6hZQiwQyEeamT+oPHtY81/8+ZKXU8wlRQIVGDdQcF0q+mVUcLf
         uU3+pt3QOIJfki92NwjX9SzJt1L+H793lND8+wmfs+bpLxkUEl7YImVlIrs7B2sNGdb0
         qCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942748; x=1789547548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcFfUgE0TJ2kWhURQskt5hSX7L1EHQDPcpGaB85yJOI=;
        b=EkGf9yj1K0txvxBCFSm9JgQF8pd9d4SWif7P+Glac5FFIlEMshF/JurrYPn4lvmFA2
         aorP5v7bH5bq7iNOk38JrK4w4J0tIHSSDAVbMJpuFhlPc5LzPHR1IuQ4kv8uvg+I6mrf
         rROcPPZ1GC1ugg++RRc9AEz/AdOw5YHVhsmttpDXqaUQ2I8fluV9XBK8tcQ5xXV0NVy3
         H1v+Slv3hFmWHS6LAN9X3wgfrTsDwTT/ip5xz5ykw4nrNE5IVqFsPfR4inKM0mU2R8B2
         rtxuqMWyZrfo/aZKyN24E+wL0oEM+ky7d4+mG1ulMsUEqsY4dQzH+Y23AOT/MZEm4o4q
         mQ5Q==
X-Gm-Message-State: AFuF++lxnGazFATQgR6S/xZUWjQv1h8K85sfuz1RXkYqFgsiD4gF69xr
	6g0OwqWec4CBqFPDOfdHkJ9P+9YP1FEOzjuzsBf/RN8pJ7yDL9Gdg26M/PAOywc/
X-Gm-Gg: AYBFou1KNgxU6RE5xworySfb3e3FGZ9Isz1wcveT+PcBDmnuwhvp74vgraFbyri37+n
	Tlgg4YVhusUfXjnY2YDZ5flTji2IRYPL3Mz4a6xUkxYNIzkHnofuB2SLyqjmdos7xR08M0BnRVW
	C3hxmIaRAlljDzDZi/NyFL0JyplWt30OMj4nIf5rkOaxwFqunimmaX+JyegqOxMQ2fJyX6/mIQM
	R9CA2p+IDSSpieeiSQI3t7rZexqCzNzNTLkJlHX3d1+8e/I4G2tml3LzY63i5YKHwxnPnbUtzR7
	ED62zJmyOAUt/RuNxDtH4zTviSYlO27Fxjetzu88h6/MxMfUh6w+wHFCYh/a3DsPcOUM4K8qAUV
	ZFPd0CaHVR9ghq0S2SKK3ZsKPY2sQp8dPHbAA1cbLZtvtGvqJHKGWGJ7/jqEBYwetYX00kVBraC
	KCE0oPcLJh1lim1on8grzDb/BOp/WKn2XhRRjmXd82muGUrxjwS1mm069hMJ9H5uOTJAzVa4Blv
	Si48hz+5T5OZ9EZQliMF4c=
X-Received: by 2002:a17:90b:28cc:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39b260e13d5mr49977943a91.1.1788942748013;
        Wed, 09 Sep 2026 01:32:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 13/15] freerdp3: patch CVE-2026-67288
Date: Wed,  9 Sep 2026 20:31:38 +1200
Message-ID: <20260909083140.2494932-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129884

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit matching GitHub advisory[1] also identified by Debian[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-67288

[1]https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-ph3q-f9w8-7jf3
[2]https://security-tracker.debian.org/tracker/CVE-2026-67288

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-67288.patch     | 69 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-67288.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-67288.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-67288.patch
new file mode 100644
index 0000000000..9be89cf276
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-67288.patch
@@ -0,0 +1,69 @@
+From 833cb82a82ff59d916c86ae1ac90b84bf8e86c47 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 9 Jul 2026 08:34:21 +0200
+Subject: [PATCH] [scard] handle nullptr for LookupName
+
+(cherry picked from commit efe40e15d508f9754b7a3af851de4d2a0b1128d8)
+
+CVE: CVE-2026-67288
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/efe40e15d508f9754b7a3af851de4d2a0b1128d8]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/emu/scard/smartcard_emulate.c  | 7 ++++---
+ winpr/libwinpr/smartcard/smartcard_pcsc.c | 9 +++++----
+ 2 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/libfreerdp/emu/scard/smartcard_emulate.c b/libfreerdp/emu/scard/smartcard_emulate.c
+index 0be4c4c5d..25e0ee179 100644
+--- a/libfreerdp/emu/scard/smartcard_emulate.c
++++ b/libfreerdp/emu/scard/smartcard_emulate.c
+@@ -46,8 +46,8 @@ static size_t g_ReaderNameWLen = 0;
+ 
+ static char* card_id_and_name_a(const UUID* CardIdentifier, LPCSTR LookupName)
+ {
+-	WINPR_ASSERT(CardIdentifier);
+-	WINPR_ASSERT(LookupName);
++	if (!CardIdentifier || !LookupName)
++		return nullptr;
+ 
+ 	size_t len = strlen(LookupName) + 34;
+ 	char* id = malloc(len);
+@@ -2264,7 +2264,8 @@ LONG WINAPI Emulate_SCardReadCacheA(SmartcardEmulationContext* smartcard, SCARDC
+ 		WINPR_ASSERT(value); /* Must be valid after Emulate_SCardIsValidContext */
+ 
+ 		char* id = card_id_and_name_a(CardIdentifier, LookupName);
+-		data = HashTable_GetItemValue(value->cache, id);
++		if (id)
++			data = HashTable_GetItemValue(value->cache, id);
+ 		free(id);
+ 
+ 		if (!data)
+diff --git a/winpr/libwinpr/smartcard/smartcard_pcsc.c b/winpr/libwinpr/smartcard/smartcard_pcsc.c
+index b5cf85e23..58bea94f1 100644
+--- a/winpr/libwinpr/smartcard/smartcard_pcsc.c
++++ b/winpr/libwinpr/smartcard/smartcard_pcsc.c
+@@ -2951,8 +2951,8 @@ WINPR_ATTR_NODISCARD static LONG WINAPI PCSC_SCardDlgExtendedError(void)
+ WINPR_ATTR_NODISCARD
+ static char* card_id_and_name_a(const UUID* CardIdentifier, LPCSTR LookupName)
+ {
+-	WINPR_ASSERT(CardIdentifier);
+-	WINPR_ASSERT(LookupName);
++	if (!CardIdentifier || !LookupName)
++		return nullptr;
+ 
+ 	size_t len = strlen(LookupName) + 34;
+ 	char* id = malloc(len);
+@@ -2991,9 +2991,10 @@ WINPR_ATTR_NODISCARD static LONG WINAPI PCSC_SCardReadCacheA(SCARDCONTEXT hConte
+ 		return SCARD_E_INVALID_HANDLE;
+ 
+ 	char* id = card_id_and_name_a(CardIdentifier, LookupName);
+-
+-	data = HashTable_GetItemValue(ctx->cache, id);
++	if (id)
++		data = HashTable_GetItemValue(ctx->cache, id);
+ 	free(id);
++
+ 	if (!data)
+ 	{
+ 		*DataLen = 0;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 7051cbeacc..edd2fddf94 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-64620.patch \
            file://CVE-2026-64621.patch \
            file://CVE-2026-66401.patch \
+           file://CVE-2026-67288.patch \
 "
 
 

