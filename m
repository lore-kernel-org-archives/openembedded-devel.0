Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45CFC9EC76
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30754.1768216822924118732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 03:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acpXe97H;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so59594845e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768216821; x=1768821621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjJ8YIZs647qDmYpa9qaGRPMb+00zIHbpwo1bMEjel0=;
        b=acpXe97HOpcwZbtPsTCTynV+sWWQlEwWsRA8NC3mpN6cQNjXL8cCpb76kicIujhEp+
         fH7HcCHSDAdLfrX5thKJZwFNOA2h/BU4A68sgK83SV05DZbxZo3VcVVO3xp5wZlDx6QN
         q6Y4E9g5VilR5/Vpe26v3C7TRTxv//wXabipP3T3YMIlxZerKLNp1C6u8Ln8ZflUdW5S
         w8Bw++MZA+W1AmBIo2daW+3Pz3nX+aptNmVy1PTbBCD+9Ws06GIcjI8w6DZ662L70bRe
         IgPRI//3W2vlLZZ6u60oPsyVhgU50MoOupW8/x0bbZ456WVKA/ju4jd4VSOcjCx5+1zy
         0Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216821; x=1768821621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PjJ8YIZs647qDmYpa9qaGRPMb+00zIHbpwo1bMEjel0=;
        b=ZDOsULnUyKONmEaVlg0ERMYwsXdBBR+bdTQ0cSoOoZomvUmVA0YkwXxidjzPj1PCj7
         kwm4tFE+uffgTRw7wYaFaa0qhYOMflFiUFcbCEqkIKz7k4cFxj1zuOqGzOUYG5mADvvz
         5Kax5TpdgT8p2WlbiVRoxxUiuPoHXsE0xIx6OyPWh261yrhX4OhUEXcLSGc1n4sWMGM1
         NK5f1P4sCGojkliHMCJEER87bhsrldB9VM8wSbLGaUlXw6sp+R8VLY+puVJBF/8H1wye
         CdL6WBlwZQJuTaQJ/vuA7FGUXJvtviWmZENbYplVnVYZo3XLaDhEH5SmhbhfAiIbws2m
         nhuA==
X-Gm-Message-State: AOJu0YyZyj5Z1HEp+Tt4/iLCWL/LunztOG0uADUgGZK/AfxB3W7LUR0u
	Q3nkzZA+3tJCwFc0D32Il7CUBaTiobd7GbuQLDyy02CJWwVFiQ8866VxqQwBRA==
X-Gm-Gg: AY/fxX7SMuL7otKfALtUcOnt05ERRIM8ul8O/LKa2RaufkmxcWKYdEokb/QC8cfc4Rb
	bJrT9GD/aNlm9dIYEXdGU33lpmsIq2S7fUsFACSkzPPSSTPY11oZJe+TXnhK7d4tTPSHydxygcT
	rjAHOmWnmOe9J+DhI+YxvJT+5f3Gz2IawiBoNjL8ZbLxkQKnuwPmls3wcHXQh3Tr/9tgoocIvtZ
	XFLG2pWvpvPm9SK6l8wfgauzTC8oSkdqsNeMUMJKF8POl8UMcf02Fvy4NzvgjTn/QAgPug4BEx2
	BwEw8Y0YUKywNDLX9O5AC6kTjmplOFAMf+AszGeGrvUNVn0TN3vXtcpnjT3ePy+hgCiv1uwznHx
	wETNsgosdIw3QJBY8n29vx0g8UzseVqv41Q/Tix8EyTnFu5FqzXhTkcgSk4GILYhRoOyki+du+5
	an9TZPsvSYgNo9paU9Ook=
X-Google-Smtp-Source: AGHT+IGE2DVQqKBD5IaeTBbYND/G5XL5QiL5jqzQD7/kgxs+s8ndHx/MIi4YV6Gowtj3NHbhlszRTg==
X-Received: by 2002:a05:600c:a47:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-47d8e56624emr149841465e9.1.1768216821113;
        Mon, 12 Jan 2026 03:20:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695225sm351382935e9.4.2026.01.12.03.20.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:20:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] raptor2: patch CVE-2024-57823
Date: Mon, 12 Jan 2026 12:20:15 +0100
Message-ID: <20260112112016.515266-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112112016.515266-1-skandigraun@gmail.com>
References: <20260112112016.515266-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123380

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-57822

Pick the patch mentioned in the related github issue[1].
The issue contains fixes for 2 issues, but only the second
patch is related to this vulnerability.

[1]: https://github.com/dajobe/raptor/issues/70

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../raptor2/files/CVE-2024-57823.patch        | 29 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.15.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2024-57823.patch

diff --git a/meta-oe/recipes-support/raptor2/files/CVE-2024-57823.patch b/meta-oe/recipes-support/raptor2/files/CVE-2024-57823.patch
new file mode 100644
index 0000000000..8e5a03379c
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/files/CVE-2024-57823.patch
@@ -0,0 +1,29 @@
+From 8071a8c4f379831d2c975e04a3197d13ec4d44a3 Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Fri, 7 Feb 2025 11:38:34 -0800
+Subject: [PATCH] Fix Github issue 70 B) Heap read buffer overflow in ntriples
+ bnode
+
+(raptor_ntriples_parse_term_internal): Only allow looking at the last
+character of a bnode ID only if bnode length >0
+
+CVE: CVE-2024-57823
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/ece2c79df43091686a538b8231cf387d84bfa60e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_ntriples.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_ntriples.c b/src/raptor_ntriples.c
+index 60fd3aa..c44f8c4 100644
+--- a/src/raptor_ntriples.c
++++ b/src/raptor_ntriples.c
+@@ -208,7 +208,7 @@ raptor_ntriples_parse_term_internal(raptor_world* world,
+             locator->column--;
+             locator->byte--;
+           }
+-          if(term_class == RAPTOR_TERM_CLASS_BNODEID && dest[-1] == '.') {
++          if(term_class == RAPTOR_TERM_CLASS_BNODEID && position > 0 && dest[-1] == '.') {
+             /* If bnode id ended on '.' move back one */
+             dest--;
+ 
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
index d110b8475f..422326d2b6 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
            file://CVE-2017-18926.patch \
            file://CVE-2020-25713.patch \
            file://CVE-2024-57822.patch \
+           file://CVE-2024-57823.patch \
            "
 SRC_URI[md5sum] = "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
 SRC_URI[sha256sum] = "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"

