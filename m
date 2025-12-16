Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25955D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:15:53 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16739.1765869347152435494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmqJWyTY;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7f121c00dedso5262346b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869346; x=1766474146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG6HvPbd5Duy2HwO6Nlu33YDPJ8QdpxkR8Z6t7W94Oc=;
        b=lmqJWyTYsC/UIkFFP6Sf+HEmhbyYnO5pj80lymqsjmdkxtVoHnGk7v8GGsX39G8T13
         EZCHLLDjiSAfGFaaU0n/6KhmaBcLlh4UqFQoZO0M+e7GtvL+k4WsHGbzu3UQdagFqtB0
         H0YzHht/6OcmwiuYu5EUxeollg3KQX2GEsP38fyiGFdTfpoef4gjucDLAYSLpapFVtOb
         FCbyojFxoZOKMemSzi2QeiLDQscDieieTxbhmIBnUqi14ngzI85neHjzvufzvpWD6/rt
         9lN5hrk4kAZrBfSDPCQLvAdrFqd2zTCvLbOzEiBMvK6Kv93wJMExb6ofHWrNlgtGPW5+
         bQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869346; x=1766474146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rG6HvPbd5Duy2HwO6Nlu33YDPJ8QdpxkR8Z6t7W94Oc=;
        b=Cj6UehBQ10qO0tE1ADKMjf5+WfvqB3EHDiKgYUsp73Jsc9BsNSgw4hbBKun7KDlaxr
         c7YekEw5yMCxRIoezrz6rTVJGZgGzpmjn6yEpYRCxOQqMysMgKKQcMryfVEdEpBUrEls
         KZFoXVKZ5RVNJOgdBH4wCI69FXWOC1GdJBt0T545VFw0iL0BICKjHrdlqRx3F7W99Apq
         4N0b5XfpGlRfOTfVRS4w9ipqneCDimELpvR2dmolfPAPctDXlgJrXGD7J77CbVTMZrrl
         aoaYvCJoCVX4l4mo6xyjAwdsU5PX8Kfqtp3E30mJN1GEYi/V2egT9LpMk9AreROJ3cZW
         5BNg==
X-Gm-Message-State: AOJu0Yyny9ztttZrBC6NsinUzgCbvqU/zw8hGTEqWT2PYieb6l5YpPn/
	Yjwxxii9ibRAVHCyz3HA7oAsPCLHBpoQzsKh8o7b0rgk/83EkBnh/3ye6aOgcQ==
X-Gm-Gg: AY/fxX7Pk5B/FMbJc8rXBkBxbbD+oZfU76OZqvq3HA61Xl/0y5XviWPv2jSzIjTIWLN
	uuok6nPh9Q58uq1bZozHiLjQ7AswBwt6spKjgjeYzx+pZrA4yqJEmAXi4X32Lh+W+GJSfNNIwsw
	V0jh2JVsiX+MshWtBlAphWxZvkT/lwp4ANs3mPcKZrb05eyC2gmB6bHuxrj+rXQsmr6HpB5HW7I
	HfgnY4is3+hBdAK4aANuXc0U1LcEMggs3q0FuTjbQ05NOhV6g+YpEpe5n603uD286Pi0JWtH9xk
	AHhkvTo+wlGFMMf322V+4XKazCw542YDJNZZ72VdYs8UZwH0c7jGHFpoungvtPVD5ECYrMzyxSH
	pJ8C1kstwX4tul8P0gBI2bn3oFSvcrsn5VNq541/gKWB7/RnSa0emnlupkD5FDvcINIML3L/y+A
	EB3kpbqDOz1PLluqLxCk2XNNjm
X-Google-Smtp-Source: AGHT+IFlyXr4o6dcYFFvMmaiQ0yL60wE55l4NeHAUCJuMkhSUwkjds9UZaOYHTX6zCRQZF/h4LHbsw==
X-Received: by 2002:a05:6a20:9389:b0:366:23a6:c962 with SMTP id adf61e73a8af0-369adfb4f07mr14180135637.29.1765869346230;
        Mon, 15 Dec 2025 23:15:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm14471448b3a.30.2025.12.15.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:15:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/6] fetchmail: patch CVE-2025-61962
Date: Tue, 16 Dec 2025 12:45:33 +0530
Message-ID: <20251216071537.3174578-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
References: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122681

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-61962

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fetchmail/fetchmail/CVE-2025-61962.patch  | 51 +++++++++++++++++++
 .../fetchmail/fetchmail_6.4.38.bb             |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch b/meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
new file mode 100644
index 0000000000..e7555021e4
--- /dev/null
+++ b/meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
@@ -0,0 +1,51 @@
+From 7860cf0689f8bd828bdd6e7116c6670416ead6d7 Mon Sep 17 00:00:00 2001
+From: Matthias Andree <matthias.andree@gmx.de>
+Date: Fri, 3 Oct 2025 13:11:59 +0200
+Subject: [PATCH] Security fix: avoid NULL+1 deref on invalid AUTH reply
+
+When fetchmail receives a 334 reply from the SMTP server
+that does not contain the mandated blank after that response
+code, it will attempt reading from memory location 1, which
+will usually lead to a crash.
+
+The simpler fix would have been to check for four bytes "334 "
+instead of three bytes "334" but that would make malformed
+replies and those that don't match the expected reply code
+indistinguishable.
+
+CVE: CVE-2025-61962
+Upstream-Status: Backport [https://gitlab.com/fetchmail/fetchmail/-/commit/4c3cebfa4e659fb778ca2cae0ccb3f69201609a8]
+(cherry picked from commit 4c3cebfa4e659fb778ca2cae0ccb3f69201609a8)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ smtp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/smtp.c b/smtp.c
+index 8295c49a..9a89ef09 100644
+--- a/smtp.c
++++ b/smtp.c
+@@ -92,6 +92,11 @@ static void SMTP_auth(int sock, char smtp_mode, char *username, char *password,
+ 		}
+ 
+ 		p = strchr(tmp, ' ');
++		if (!p) {
++			report(stderr, "%s: \"%s\"\n", GT_("Malformed server reply"), visbuf(tmp));
++			SMTP_auth_error(sock, "");
++			return;
++		}
+ 		p++;
+ 		/* (hmh) from64tobits will not NULL-terminate strings! */
+ 		if (from64tobits(b64buf, p, sizeof(b64buf) - 1) <= 0) {
+@@ -145,6 +150,11 @@ static void SMTP_auth(int sock, char smtp_mode, char *username, char *password,
+ 		}
+ 
+ 		p = strchr(tmp, ' ');
++		if (!p) {
++			report(stderr, "%s: \"%s\"\n", GT_("Malformed server reply"), visbuf(tmp));
++			SMTP_auth_error(sock, "");
++			return;
++		}
+ 		p++;
+ 		if (from64tobits(b64buf, p, sizeof(b64buf) - 1) <= 0) {
+ 			SMTP_auth_error(sock, GT_("Bad base64 reply from server.\n"));
diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
index cc23d5a34e..6474cabd51 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ee6b9f41d9324434dd11bd8a38f1b044"
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
+           file://CVE-2025-61962.patch \
            "
 SRC_URI[sha256sum] = "a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905be609d9"
 

