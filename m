Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46CCC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:35:23 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.17298.1703226920011245747
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kL863AOs;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2042964b502so1017426fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703226918; x=1703831718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqGY/+0mjP4xn5mlkScJomC6iVxJHlwQRszgHQZFTi0=;
        b=kL863AOsk4H0AS8jBz4rl0PEx6vhyRgIuiPhnJEZoeuGBqsMWf2hkLKqIkwIeN30ht
         49Wd/qx9NyTSybcC0u7RHupUxfP6WnTntspGFnNlawwLy/DV3Nj9szp2QlHedPzO/8MT
         3WaUcrg3/oAE35mRvbEwcUhDZl0NzByZteD4Czn/TlE59DEjTx8Abq5wMXDaHQZf2P1M
         gOi/mWdQjdcGGtg6mKlUURT9bV5eD5i/MKjb9XT/ppEfE+oCwd7T/67siOMYBpbzOHoc
         1fINV3xEkg4js/vMnMlvI1bddQxUtXQDtVsOKSu9kkEZK7pr+GEJudg1LfcL+ezfOvtB
         eXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703226918; x=1703831718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqGY/+0mjP4xn5mlkScJomC6iVxJHlwQRszgHQZFTi0=;
        b=cscm68QNeQOcSfo6sERkrGWCEA221jeWtMc684HXhXdbnqFPArlvPhsmzI2uiQtMuv
         JaIX+l5CyO3j1VTqSFqdPU2mxWyK4qOx6cQBOqWHOBzxCf9v2mMSz7GgoooAD/E1fwWx
         ZuatWLajDUy71/2/zR28sEIRokCP8iZfqLoImF1UV8S7kpQdKyCddLfSKvfXmQG0kwcW
         +fTBulWfjJ7Vh3YL50nhQO943IVqsAaLVY1VfQnFeUVkuYB6Sx0Ao43rExphszPFjwQf
         hEcsDW3uPATwScCArBh6IVudHhfVAcPgkRChR9U1V2TmZ/l8hWFbDiGBzMg48MfyVuZ9
         U3gQ==
X-Gm-Message-State: AOJu0YwuLXZbJGYh36hkonl4XR0Jvr4ZruP3bgLRVAoEHT9Yx14KC+9y
	i777RjfY4pvpMHr02X09Cb7TF6PrUH8=
X-Google-Smtp-Source: AGHT+IHEPRkT+3tW8Ue5CAPuaq5KK9j+xMSlNdyA3FUISg0quIg1yQ6OUFM9MGl40+6ThZSH/CloJA==
X-Received: by 2002:a05:6870:9726:b0:203:64c3:7b86 with SMTP id n38-20020a056870972600b0020364c37b86mr1300814oaq.44.1703226918333;
        Thu, 21 Dec 2023 22:35:18 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c42:9a2:7919:ad63:823a:e702])
        by smtp.gmail.com with ESMTPSA id f29-20020a63555d000000b005c60ad6c4absm2541360pgm.4.2023.12.21.22.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 22:35:17 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	virendra thakur <virendrak@kpit.com>
Subject: [meta-oe][dunfell][PATCH 2/2] opensc: Fix CVE-2023-40661
Date: Fri, 22 Dec 2023 12:04:58 +0530
Message-Id: <20231222063458.2762114-2-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231222063458.2762114-1-thakur.virendra1810@gmail.com>
References: <20231222063458.2762114-1-thakur.virendra1810@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 06:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107745

From: virendra thakur <virendrak@kpit.com>

Upstream-Status: Backport[https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../opensc/opensc/CVE-2023-40661-1.patch      | 47 +++++++++++++++++++
 .../opensc/opensc/CVE-2023-40661-2.patch      | 32 +++++++++++++
 .../opensc/opensc/CVE-2023-40661-3.patch      | 31 ++++++++++++
 .../opensc/opensc/CVE-2023-40661-4.patch      | 28 +++++++++++
 .../opensc/opensc/CVE-2023-40661-5.patch      | 30 ++++++++++++
 .../opensc/opensc/CVE-2023-40661-6.patch      | 30 ++++++++++++
 .../opensc/opensc/CVE-2023-40661-7.patch      | 40 ++++++++++++++++
 .../recipes-support/opensc/opensc_0.20.0.bb   |  7 +++
 8 files changed, 245 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
new file mode 100644
index 000000000..3ecff558c
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
@@ -0,0 +1,47 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/245efe608d083fd4e4ec96793fdefd218e26fde7
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 17 Aug 2023 13:54:42 +0200
+Subject: pkcs15: Avoid buffer overflow when getting last update
+
+Thanks oss-fuzz
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=60769
+
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+
+---
+ src/libopensc/pkcs15.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/src/libopensc/pkcs15.c b/src/libopensc/pkcs15.c
+index eb7fc6afcd..4215b733a8 100644
+--- a/src/libopensc/pkcs15.c
++++ b/src/libopensc/pkcs15.c
+@@ -528,7 +528,7 @@
+ 	struct sc_context *ctx  = p15card->card->ctx;
+ 	struct sc_file *file = NULL;
+ 	struct sc_asn1_entry asn1_last_update[C_ASN1_LAST_UPDATE_SIZE];
+-	unsigned char *content, last_update[32];
++        unsigned char *content, last_update[32] = {0};
+ 	size_t lupdate_len = sizeof(last_update) - 1;
+ 	int r, content_len;
+ 	size_t size;
+@@ -564,9 +564,11 @@
+ 	if (r < 0)
+ 		return NULL;
+ 
+-	p15card->tokeninfo->last_update.gtime = strdup((char *)last_update);
+-	if (!p15card->tokeninfo->last_update.gtime)
+-		return NULL;
++        if (asn1_last_update[0].flags & SC_ASN1_PRESENT) {
++                p15card->tokeninfo->last_update.gtime = strdup((char *)last_update);
++                if (!p15card->tokeninfo->last_update.gtime)
++                        return NULL;
++        }
+ done:
+ 	sc_log(ctx, "lastUpdate.gtime '%s'", p15card->tokeninfo->last_update.gtime);
+ 	return p15card->tokeninfo->last_update.gtime;
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
new file mode 100644
index 000000000..39e729c5a
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
@@ -0,0 +1,32 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/440ca666eff10cc7011901252d20f3fc4ea23651
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 17 Aug 2023 13:41:36 +0200
+Subject: setcos: Avoid buffer underflow
+
+Thanks oss-fuzz
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=60672
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+---
+ src/pkcs15init/pkcs15-setcos.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/pkcs15init/pkcs15-setcos.c b/src/pkcs15init/pkcs15-setcos.c
+index 1b56afe6d9..1907b47f9d 100644
+--- a/src/pkcs15init/pkcs15-setcos.c
++++ b/src/pkcs15init/pkcs15-setcos.c
+@@ -346,6 +346,10 @@
+ 
+ 	/* Replace the path of instantiated key template by the path from the object data. */
+         memcpy(&file->path, &key_info->path, sizeof(file->path));
++	if (file->path.len < 2) {
++		sc_file_free(file);
++		LOG_TEST_RET(ctx, SC_ERROR_INVALID_DATA, "Invalid path");
++	}
+         file->id = file->path.value[file->path.len - 2] * 0x100
+ 		+ file->path.value[file->path.len - 1];
+ 
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
new file mode 100644
index 000000000..7950cf91d
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
@@ -0,0 +1,31 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/41d61da8481582e12710b5858f8b635e0a71ab5e
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 20 Sep 2023 10:13:57 +0200
+Subject: oberthur: Avoid buffer overflow
+
+Thanks oss-fuzz
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=60650
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+---
+ src/pkcs15init/pkcs15-oberthur.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/pkcs15init/pkcs15-oberthur.c b/src/pkcs15init/pkcs15-oberthur.c
+index ad2cabd530..c441ab1e76 100644
+--- a/src/pkcs15init/pkcs15-oberthur.c
++++ b/src/pkcs15init/pkcs15-oberthur.c
+@@ -688,6 +688,9 @@
+ 	if (object->type != SC_PKCS15_TYPE_PRKEY_RSA)
+ 		LOG_TEST_RET(ctx, SC_ERROR_NOT_SUPPORTED, "Create key failed: RSA only supported");
+ 
++	if (key_info->path.len < 2)
++		LOG_TEST_RET(ctx, SC_ERROR_OBJECT_NOT_VALID, "The path needs to be at least to bytes long");
++
+ 	sc_log(ctx,  "create private key ID:%s",  sc_pkcs15_print_id(&key_info->id));
+ 	/* Here, the path of private key file should be defined.
+ 	 * Nevertheless, we need to instantiate private key to get the ACLs. */
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
new file mode 100644
index 000000000..797f8ad3b
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
@@ -0,0 +1,28 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/578aed8391ef117ca64a9e0cba8e5c264368a0ec
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Thu, 8 Dec 2022 00:27:18 +0100
+Subject: sc_pkcs15init_rmdir: prevent out of bounds write
+
+fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53927
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+---
+ src/pkcs15init/pkcs15-lib.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/pkcs15init/pkcs15-lib.c b/src/pkcs15init/pkcs15-lib.c
+index 91cee37310..3df03c6e1f 100644
+--- a/src/pkcs15init/pkcs15-lib.c
++++ b/src/pkcs15init/pkcs15-lib.c
+@@ -666,6 +666,8 @@
+ 
+ 		path = df->path;
+ 		path.len += 2;
++		if (path.len > SC_MAX_PATH_SIZE)
++			return SC_ERROR_INTERNAL;
+ 
+ 		nfids = r / 2;
+ 		while (r >= 0 && nfids--) {
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
new file mode 100644
index 000000000..e173e6557
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
@@ -0,0 +1,30 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/c449a181a6988cc1e8dc8764d23574e48cdc3fa6
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Mon, 19 Jun 2023 16:14:51 +0200
+Subject: pkcs15-cflex: check path length to prevent underflow
+
+Thanks OSS-Fuzz
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=58932
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+---
+ src/pkcs15init/pkcs15-cflex.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/pkcs15init/pkcs15-cflex.c b/src/pkcs15init/pkcs15-cflex.c
+index d06568073d..ce1d48e62c 100644
+--- a/src/pkcs15init/pkcs15-cflex.c
++++ b/src/pkcs15init/pkcs15-cflex.c
+@@ -56,6 +56,9 @@
+         int             r = 0;
+         /* Select the parent DF */
+         path = df->path;
++		if (path.len < 2) {
++			return SC_ERROR_INVALID_ARGUMENTS;
++		}
+         path.len -= 2;
+         r = sc_select_file(p15card->card, &path, &parent);
+         if (r < 0)
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
new file mode 100644
index 000000000..abb524de2
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
@@ -0,0 +1,30 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/df5a176bfdf8c52ba89c7fef1f82f6f3b9312bc1
+From: Veronika Hanulikova <xhanulik@fi.muni.cz>
+Date: Fri, 10 Feb 2023 11:47:34 +0100
+Subject: Check array bounds
+
+Thanks OSS-Fuzz
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=54312
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+---
+ src/libopensc/muscle.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/libopensc/muscle.c b/src/libopensc/muscle.c
+index 61a4ec24d8..9d01e0c113 100644
+--- a/src/libopensc/muscle.c
++++ b/src/libopensc/muscle.c
+@@ -183,6 +183,9 @@
+ 	sc_apdu_t apdu;
+ 	int r;
+ 
++	if (dataLength + 9 > MSC_MAX_APDU)
++		return SC_ERROR_INVALID_ARGUMENTS;
++
+ 	sc_format_apdu(card, &apdu, SC_APDU_CASE_3_SHORT, 0x54, 0x00, 0x00);
+ 	apdu.lc = dataLength + 9;
+ 	if (card->ctx->debug >= 2)
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch
new file mode 100644
index 000000000..858a996ed
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch
@@ -0,0 +1,40 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/5631e9843c832a99769def85b7b9b68b4e3e3959
+From: Veronika Hanulikova <xhanulik@fi.muni.cz>
+Date: Fri, 3 Mar 2023 16:07:38 +0100
+Subject: Check length of string before making copy
+
+Thanks OSS-Fuzz
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=55851
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=55998
+CVE: CVE-2023-40661
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/8026fb4ca0ed53d970c6c497252eb264d4192d50]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Hunk refreshed based on codebase.
+---
+ src/pkcs15init/profile.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/pkcs15init/profile.c b/src/pkcs15init/profile.c
+index 2b793b0282..3bad1e8536 100644
+--- a/src/pkcs15init/profile.c
++++ b/src/pkcs15init/profile.c
+@@ -1465,6 +1465,8 @@
+ 	while (argc--) {
+ 		unsigned int	op, method, id;
+ 
++		if (strlen(*argv) >= sizeof(oper))
++			goto bad;
+ 		strlcpy(oper, *argv++, sizeof(oper));
+ 		if ((what = strchr(oper, '=')) == NULL)
+ 			goto bad;
+@@ -2128,6 +2130,9 @@
+ 		return get_uint(cur, value, type);
+ 	}
+ 
++	if (strlen(value) >= sizeof(temp))
++		return 1;
++
+ 	n = strcspn(value, "0123456789x");
+ 	strlcpy(temp, value, (sizeof(temp) > n) ? n + 1 : sizeof(temp));
+ 
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.20.0.bb b/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
index 3e77b8884..3eb0c1e55 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
@@ -15,6 +15,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRCREV = "45e29056ccde422e70ed3585084a7f150c632515"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2023-40660.patch \
+           file://CVE-2023-40661-1.patch \
+           file://CVE-2023-40661-2.patch \
+           file://CVE-2023-40661-3.patch \
+           file://CVE-2023-40661-4.patch \
+           file://CVE-2023-40661-5.patch \
+           file://CVE-2023-40661-6.patch \
+           file://CVE-2023-40661-7.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.25.1


