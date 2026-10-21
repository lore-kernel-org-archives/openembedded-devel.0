Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7512.1792574994763054752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dHpjd1Kq;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so946589c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574994; x=1793179794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjP+9anJ94NPkccl0oefJjMcU12f05O1kBr3oUuSv5A=;
        b=dHpjd1Kq4VnklzqLAbgoW+T4p1kr0Ugi/3zwrQWU59JRXm99wkHwYAuyIXgPY7tH/i
         w0o4ZtLzl1FA91KMuBFXgS7HvS4VEql9aA+i18UrT8Yl9qMGYRnSvh7wcNqrc/F+lJra
         vD/EqedsejPOl11OwFK2/pjkN6Bvq/AXnpEEs2LUUM3W5/fkh5iN3ss7JnQ3At/A3Nm/
         hK4/5imaQiTvLDQNHANU/7kSaenmhG1O2DzFh7M22cstG4dk9YIHOAC7l7Opag+nvSUH
         zrUplngqTVGisNLBujr6Yv9hki0KJumjKqwnmrgK0VuRkNhSl/YPtwclLErvFryycff6
         I6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574994; x=1793179794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjP+9anJ94NPkccl0oefJjMcU12f05O1kBr3oUuSv5A=;
        b=M0nTKtHgpZ36b7xXCZvpUfKJoIB9yiDvtrwgWA/Rile1SDfPh1xo6lKX9ziFsVkjo4
         fceteIXuL8WBcm6iLm1nde75NqnxmKYb3f+IRNUsx5O/S8q5mukCqXryQal5CCylnv63
         2T/8EnfqhTdZgG2khbOx5qTuGRLgfbm9N1mYWZ7kUPRkqbKhqtzq9hLEIohbNBH/9MVm
         UhlCzU4ToDS5rU+6uEa95km29NFNpibEODfXPwNu8yOJXZhihQXBH6rL2SX0WZzZ9K8v
         36kwuDSYqBDmMiMuqtc0sf7f6DgfxGX2OiJGleSH9az0PFus1h+uQaBnWkRl1fifp81V
         BLEA==
X-Gm-Message-State: AFq9FYKp02PvEfn/GBsGrV6Nxvs5HwGlp2Mspkpbfye1Z/pOD4yjwuN1
	12lxhS1+DrB0hjqTc/sAM//Glpmcsx5Lvdf0G4MzkKbt1mJyN/qkA4RZ7V2B9Q==
X-Gm-Gg: AYBFou00nDNspPqtB+6BvHpuTxJB2d/jKIk+agNxfa/LtEqJmNymoOndGpPiKOp8stb
	gFxu1QD/hTLGudHNICzQ0EBuM02D0f7+BPOcyF1lwZpcZ/m2EFIX+w/g+kbAWoz6A3dGh+16FFE
	Ro9uGTsPdN/71NmnrIHx77tzAOJoVX2Tv06a7Zl7fuNIGrktlO5fgXCpPIaQ5P1Xljmf9OSCZcT
	4dXeMgKiiwpmzy3ySy7+QdTVjbL3INQvPN1FgygTlgxN0LU8oJkssrIVJwhay+vydSlYR0OF5SP
	la9aYlo5INO9S6AmfT5VORXQHPE3QNyMEMAdG4zojHULBZSipHVgiI0lclofoP/c3+m/kkiTuGH
	V+Pam6n/vT9k+I06/z8OwuC077nP9x2tgh30xktAN9VAfuylDfkjZubJDK3966BxR3BuPwf3t47
	9q15Igo1XNg7jzjEBVTOfOsFbVnWWgx2hrmN4oVcZiQknKQ/3vt2KYnxguLyhtixpWUdbZ/zOmv
	UE/89XvyksmST6ke2SgYDZC3rD9Dfqt4RyeDwZywi8pXubokhrJrbKaeTRRzO99Xvi7TSqssewG
	fTRCYstvitDGgf8teNVpaqJign15QDA=
X-Received: by 2002:a05:7022:ea55:20b0:166:af48:a2ba with SMTP id a92af1059eb24-19099b86e75mr2028233c88.0.1792574994092;
        Wed, 21 Oct 2026 02:29:54 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 22/44] opensc: patch CVE-2026-103531
Date: Wed, 21 Oct 2026 22:28:35 +1300
Message-ID: <20261021092857.3585453-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131209
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-103531

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
