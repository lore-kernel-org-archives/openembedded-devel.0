Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1761.1792434889243942486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MFVpiFeR;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so880949a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434889; x=1793039689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NoWREHNX5ryj5GpX97OJqG3EmZ2w+/qmTSJLU0/mzr0=;
        b=MFVpiFeRA+72pB+U1xVbz3Bu954r1RJN8r2UFYb9bxZQbZ4NEOPfvBm8osmRBHmn8X
         u41AvUkUr/qA3ptXB3/wEah+oo4rFPVSeGgo//08dFJiQEdDeu6yXLvcx3A/SHh8NpEG
         dH61uQd975Utskzcu7RR1/EtFCPKJsqzhuG5EJ5V+Hm6gE8EEFQ4Iu0b2HnJG7GDum+V
         kseRXnAzNQ7I0V3V3gHNV9fIzE8GsFkI7+/quJtHDhyxrtP2wPyihr30v0z0rtxiXN3U
         Hxtc+Tuh11O8ZGGXRW4RVAxXGAOPnckbMiIftv4kgw+dI9YJ/cTBvFRbn36wbgkFQ4hg
         scpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434889; x=1793039689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NoWREHNX5ryj5GpX97OJqG3EmZ2w+/qmTSJLU0/mzr0=;
        b=RbLFb/p39S2bniiFX86tJvKbWfBT91bccUkGWHpcR7A8WpIUeKyYLV4Xz0A1+X8ruX
         Nl4VxkhVL1XkVLiF5diQ6ocefuDdmn9Xen5ajx6wZctA2fl7ERUsDUpQtIe2Absi22Sd
         +eBv+ls781kGA1MxYY/sI/VrhL2EiYGZMpiKKwmhTbU27gvdlAIuOgEN6AGK4feFA5Ns
         F6D9SIPHMphDcP25eeNKqu/8VXqKJXCS9rIro4p05UmHxTqi1DTm7KDcnQhbsjRGmTi/
         5Itrqjfj9yx4NPaIgTd6JzYl0Dfj5RcmM2678z9Z6udoSTXHpguYfK6WGu7IUioIxBt3
         Kriw==
X-Gm-Message-State: AFq9FYLv/7V8/Q5pQVr2V2024moIEefdstt+NtVH48dTtm+nopl44qvr
	P0wuSnDptGlidhurMs87ZW7z+k4clp9yJE8clwE9E3t0s2KW0s4DwNvotFU1zA==
X-Gm-Gg: AYBFou1ugxyHqqwi0g9d7NJw4IweG7hvaO8iaTBe13rc4/ReCWkp68bclqFpaX+oROQ
	H9xkdoJ3yVeM4A/Si5JsQBFOOmoZPWUaFZGtSbT6pqm9GGp/oXbSkNm1MbD8mpQmx44y6+O2XVf
	s77fXRasfK2C/1l0yjOj6oCgX9sL6xI8c6w/tXqQ63Jb2xmNCVUtN3N5rRKu2ab1pFkvWc32+vf
	wUfRuTNqAUDBFgdpJGuiAk4Ue4pG7LxZFjAlCFg1lwqDDu6B7ZLKozEREzWAODe588zXVqMh3Ys
	yyhO3wgvTC9R0ZDRJxL/Eu0Sf6g4EDsJY7w74SZc6zRUtdp5kzyYssPENx7kZI2BtJWC+HFSrjB
	IoKEhUKSbGf1h1sAcumdG1vjC7XBaDntCuzPJtUz99rMDwoap07r1FQ4/RXG1C5ZdPuFxUcTpzd
	IwAioIYZAHrkYbpBb1IPbAHKP69ta30i0hSb1JaifWF3PSaYS8YfDx5KKFLfbQr/ImoHWWNUHuq
	OKeMKZOYmrjE7Pbvt0NGHTkKCR9R6ReDlHF200=
X-Received: by 2002:a17:90b:580c:b0:3ac:c03a:38ad with SMTP id 98e67ed59e1d1-3acee276f1fmr7947309a91.5.1792434888530;
        Mon, 19 Oct 2026 11:34:48 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 14/20] opensc: patch CVE-2026-103531
Date: Tue, 20 Oct 2026 07:34:00 +1300
Message-ID: <20261019183407.1037972-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131140
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-103531

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 27b41701a04a46e498f7f3f6212ac2a5e2bc8d1a)
---
 .../opensc/opensc/CVE-2026-103531.patch       | 54 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.27.1.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2026-103531.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2026-103531.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2026-103531.patch
new file mode 100644
index 0000000000..22776e525b
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2026-103531.patch
@@ -0,0 +1,54 @@
+From 4b0f46d922866d9453e3631ff5e0a24900fae8dd Mon Sep 17 00:00:00 2001
+From: wanglanlan <wanglanlan@users.noreply.github.com>
+Date: Wed, 2 Sep 2026 08:36:47 +0000
+Subject: [PATCH] setcos: Fix buffer overflow in setcos_construct_fci_44
+
+The FCI construction copied type_attr, sec_attr and prop_attr of the
+file into a fixed 64-byte stack buffer without checking the length.
+Malicious or corrupted attribute lengths (e.g. prop_attr_len > 64,
+reachable through fuzz_pkcs15init and attacker-controlled card
+responses) caused a stack buffer overflow (write).
+
+Return SC_ERROR_INVALID_DATA if any attribute exceeds the buffer size.
+
+Found with the fuzz_pkcs15init fuzzer.
+
+Co-Authored-By: Claude <noreply@anthropic.com>
+(cherry picked from commit ad730304052937c32b4eb489a06835ac6123632c)
+
+CVE: CVE-2026-103531
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/ad730304052937c32b4eb489a06835ac6123632c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/card-setcos.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/libopensc/card-setcos.c b/src/libopensc/card-setcos.c
+index 0ebe7c34f..8c7baa3e4 100644
+--- a/src/libopensc/card-setcos.c
++++ b/src/libopensc/card-setcos.c
+@@ -218,6 +218,8 @@ static int setcos_construct_fci_44(sc_card_t *card, const sc_file_t *file, u8 *o
+ 
+ 	/* Type */
+ 	if (file->type_attr_len) {
++		if (file->type_attr_len > sizeof(buf))
++			LOG_FUNC_RETURN(card->ctx, SC_ERROR_INVALID_DATA);
+ 		memcpy(buf, file->type_attr, file->type_attr_len);
+ 		sc_asn1_put_tag(0x82, buf, file->type_attr_len, p, *outlen - (p - out), &p);
+ 	} else {
+@@ -271,11 +273,15 @@ static int setcos_construct_fci_44(sc_card_t *card, const sc_file_t *file, u8 *o
+ 	}
+ 
+ 	/* Security Attributes */
++	if (file->sec_attr_len > sizeof(buf))
++		LOG_FUNC_RETURN(card->ctx, SC_ERROR_INVALID_DATA);
+ 	memcpy(buf, file->sec_attr, file->sec_attr_len);
+ 	sc_asn1_put_tag(0x86, buf, file->sec_attr_len, p, *outlen - (p - out), &p);
+ 
+ 	/* Life cycle status */
+ 	if (file->prop_attr_len) {
++		if (file->prop_attr_len > sizeof(buf))
++			LOG_FUNC_RETURN(card->ctx, SC_ERROR_INVALID_DATA);
+ 		memcpy(buf, file->prop_attr, file->prop_attr_len);
+ 		sc_asn1_put_tag(0x8A, buf, file->prop_attr_len, p, *outlen - (p - out), &p);
+ 	}
diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
index a1930744ea..bcd94dfb90 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -14,6 +14,7 @@ DEPENDS = "openssl"
 SRCREV = "19868984dc4dc697af6a86d65ab32a1f19a43ea4"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://0001-Changes-for-OpenSSL-4.0.0.patch \
+           file://CVE-2026-103531.patch \
            "
 
 CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
