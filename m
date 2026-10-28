Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36202.1793161498373583714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KmZZ7iga;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso239571a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161498; x=1793766298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjP+9anJ94NPkccl0oefJjMcU12f05O1kBr3oUuSv5A=;
        b=KmZZ7igaeLaMtAbnitauW5zZJ+ENL/HOE5iiwccvzXjcrT5dqz22SpdrPrnrt9U2Dx
         oOvuWhinT7MHw7m3bmheG+ynBQ/tbUsErKVD9t8JFihsnYY2gA/HF0sR0cc1qO1W/Ku8
         QrCdjBy+xowQYcgOp8KfPdzvxoF2huL6NoM5V+MzqglzhBD4hZLbeVQdOIEklZ6wOaHL
         5LL6HrzMneWhtrBrHuo7+lN7FPIkqJgHd8Y9J4rznuwSCoFPCx8XyH9n2GVq18vfTr8T
         JOM3rXEFKV/jsDexKMuNdj9dq9SGU6rlDQfs0WRSiqYiI/0DdNwrGIdyX+Ac4Y4CyDOM
         bgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161498; x=1793766298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjP+9anJ94NPkccl0oefJjMcU12f05O1kBr3oUuSv5A=;
        b=hQROUh7IPr95605MdwS/XbMBwHIQqXTnsqtmUGRne4JMHcNnANL9vuoDR/xW6inRwV
         AdWngd+/ilSmkdhepvvcnOtuEfKoEtGam6TRWswZzTCpzRD9EIfh8V2YKlSxHpdw7Gr2
         JAQNtz3veO752QazkMER16FNR+JwuNkbXFjaQ1L7xS1gnzbxW69ij2Ro9LRfACaogc9C
         wW+RClFp1rQmrgvnXqRcYTlxfipvfVQc3zeztSkyIiH4k8XuY6lIbNp0rTb6usAd0qZm
         6VRgkuuFRoEND8F3YCVyn8jMR6+1hZovwCTOOnBYvsbv51zzw2TyKL2YoGOPu4kz+mMd
         uAlg==
X-Gm-Message-State: AFq9FYLZIuggFTyYLKn8Y6m/zzG/tHaCXflgoVSGWutmU+0LtmudA8EP
	eh64/Ywl0oViuRH/Zs095fkFsgrbo5xig0CpVXK4GjeOSupnf7F0yg5hyjU6MA==
X-Gm-Gg: AYBFou1C1GIw+SLpGhts5WLLlJCTNEI8U7W3KBwAVJK3m0l8brUuQ4qnYiGy/d0jQw9
	nqbiT0QTH/BaayjAoojR9GkDBWniD0v4Sq/iRRA4eyUOAk5RAMIwBdmhvFMt/n5ZYpiZMM171fp
	6Wt8wlKEh/NT3d0ZpDul7uVlNCeSMRqPxYIPr5cwKakP7zeK3dzKoWg5vRLxN0Cys8XfLr1zCQb
	oIChBH/8bbGJ4kjPb+HErodL1Eb+Wgh1F2CmtDHZNf7n1y3dIEio1oLGyRitHdHvviYUUDPe5Ns
	m3wGRM53OlszLwkIx3/bqhuBNGoBY8YQ/krcJ9WVx7yc3pZF+VZPzSSNb3Dn9zfAtaZ7kE5ymDG
	1pkxiRUWA+zh+gEcqMlqXmGQMeXle0N+xJcBO2o32iVH1Zmswr95ufl+xoVV5QeoiR56sXixDTC
	JLZCQUHP/UPcr8tsBWJitJCJf58YKrGWvlPPGvpNjIMpQHCb3ELq5eXH2DyrelmAElfbyBZMPYD
	gSr7O9GYm/NZ7TEyaSXar1Wf8j/fR1awtqLgn+Z/1ZKmf5iIVoOiP+cv1CKzVkcS20d+iyzM7Hh
	5FO9MxnJ21QrmjqzMAQ/NUemKguQdXvdO/QgbcEuXbDDrjOgO0pg4nL/954y3w==
X-Received: by 2002:a17:90b:2f4f:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3ae57f60474mr863958a91.18.1793161497616;
        Tue, 27 Oct 2026 21:24:57 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 22/60] opensc: patch CVE-2026-103531
Date: Wed, 28 Oct 2026 17:23:20 +1300
Message-ID: <27b41701a04a46e498f7f3f6212ac2a5e2bc8d1a.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131574
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
