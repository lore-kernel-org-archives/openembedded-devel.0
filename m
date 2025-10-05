Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE0BCAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 11:56:09 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.9194.1759665363375055292
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 04:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hVjGyiwY;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so7688855a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759665362; x=1760270162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWeeusWVlHcjwwV4obIz/BRTCuNPG/0Q7s/I8jCgp1k=;
        b=hVjGyiwYOG0lRTqaOjLwO40F/YD/KprxoM4OdeY2mOn7/igD0ckDoWMzIyZUIU+ucU
         cKMXOKdAmqHSP5lP5XQztg1N7pLpCG4QLXuwtMYx7TBslho0XpfG1BzCD3E4JfKbmOwN
         C067Dd8ARPOTsFA2Ep5qLgwCYSl4Wf0UxlwBC3bV0Q4c4UvolhpID38KNN1guNNgFoyR
         5TRkL0NTJ4FHLt4MeLVsRnyB+XKKyKi5nhkJ1zhMRWvFD4+XTL5sfzilbKsl2LkmIG9f
         eQrV1ltg7IVOGndEFDe+yca7T8cwBGLfeubyFOG7wLL4Lm9SPjcIlWfpcOacF4ri7PVn
         u29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759665362; x=1760270162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWeeusWVlHcjwwV4obIz/BRTCuNPG/0Q7s/I8jCgp1k=;
        b=JFVX2vYDwbI26tF/9pK/FyNs/GDsh5QL+kKcDUz/VrvE+XHHr15yHmaD6bWfCbgcLl
         8gujTsAj3e7Vy8btqwZVuTmbyHxZoo7UMZz3Q6PxZeZCVtezQvNcJpGlF9xiiCPsSUum
         GelIkp3Wn2IJEvxO3gPGkqJxETxy1AHInbXo/J+tM/D2hLUrOWjbRnISZ904ygCjZ/Lx
         qGyp9PeljmpErofz4RTWCSTYbBly/Gv0HvVVmP+bf5aJSHqGLgo5QC/yN+rAksNxxGYr
         mtb9rcKCjpVGmEIMxYxauGzniUSp7r6YH4xbofce498lnx7gpEpB9RutbfHiZfSKcbqI
         2P5w==
X-Gm-Message-State: AOJu0YwMviuXMwndrua3oDhtTmeCDXrAn64cSjDCBoT9DaYYGkm8Jb/5
	NdbSNBniiGyd/Ob7GASAh/3t7Dt7XvHyB1qGIsyeWCuiiSvsI0DJcdQwV7+/ow==
X-Gm-Gg: ASbGncvZ2wW1iddpHYyYzay+h+iLZQdgeJJqRNwrRznof4KkE9NDUoi62FqV1RG1ZBJ
	k5Bi7oz4QrtNtFdfSNdspf8GR6yS/fDDPr1lyT3Jw1YozdCaS5JwEH8LCk6+VfE9sjCP51n/4dH
	WACgQj0HnSlTRY3DJnjZVgNr3OHMRNb+QB3SGd1JeiinOLy3OCMIOxmdgNGTO8z/dqKiShEAO5Q
	6sJINNLo2ofadlU7TEaVUt5O4MS8q7TlViCrUDpN96tF8AMEyj8uxjybO2bL9nEqJH3YOw3k6Td
	ZXtAbypoLUglAvy5XE0Yz3+OvyDlx/DFCa3uV4Vyy1AXjo6M92cDGikCP7ZljpqpylwlxF88dmS
	vqxRy5DGQgq6pgXdeLEzqK/MrDY9+5f0dv33bk1THJwvZ
X-Google-Smtp-Source: AGHT+IHg27ZH3iMdnnTVWpzqXY3FAvvCxE80KMd1srRXP36V2XAwuoM0fbyqGILSc9JrScViyTpkvA==
X-Received: by 2002:a05:6402:12cb:b0:637:e581:714b with SMTP id 4fb4d7f45d1cf-63934fd1202mr6851132a12.21.1759665361254;
        Sun, 05 Oct 2025 04:56:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637880ffdf7sm8089044a12.28.2025.10.05.04.55.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 04:56:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] dovecot: patch CVE-2021-33515
Date: Sun,  5 Oct 2025 13:55:59 +0200
Message-ID: <20251005115559.76550-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 11:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120246

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33515

Backport the relevant patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...rver-connection-Fix-STARTTLS-command.patch | 76 +++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.3.14.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch
new file mode 100644
index 0000000000..3c2835c706
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch
@@ -0,0 +1,76 @@
+From 29a76d549b1d5eaa8a98831ee2968b36791e7806 Mon Sep 17 00:00:00 2001
+From: Stephan Bosch <stephan.bosch@open-xchange.com>
+Date: Sat, 22 May 2021 00:16:38 +0200
+Subject: [PATCH] lib-smtp: smtp-server-connection - Fix STARTTLS command
+ injection vulnerability.
+
+The input handler kept reading more commands even though the input was locked by
+the STARTTLS command, thereby causing it to read the command pipelined beyond
+STARTTLS. This causes a STARTTLS command injection vulerability.
+
+CVE: CVE-2021-33515
+
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/321c339756f9b2b98fb7326359d1333adebb5295]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib-smtp/smtp-server-cmd-starttls.c | 14 ++++++++++++++
+ src/lib-smtp/smtp-server-connection.c   |  6 +++++-
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib-smtp/smtp-server-cmd-starttls.c b/src/lib-smtp/smtp-server-cmd-starttls.c
+index ed1687e..de53b39 100644
+--- a/src/lib-smtp/smtp-server-cmd-starttls.c
++++ b/src/lib-smtp/smtp-server-cmd-starttls.c
+@@ -37,6 +37,13 @@ static int cmd_starttls_start(struct smtp_server_connection *conn)
+ 		return -1;
+ 	}
+ 
++	/* The command queue must be empty at this point. If anything were to be
++	   queued somehow, this connection is vulnerable to STARTTLS command
++	   insertion.
++	 */
++	i_assert(conn->command_queue_count == 0 &&
++		 conn->command_queue_head == NULL);
++
+ 	/* RFC 3207, Section 4.2:
+ 
+ 	   Upon completion of the TLS handshake, the SMTP protocol is reset to
+@@ -107,6 +114,13 @@ cmd_starttls_next(struct smtp_server_cmd_ctx *cmd, void *context ATTR_UNUSED)
+ 	const struct smtp_server_callbacks *callbacks = conn->callbacks;
+ 	int ret;
+ 
++	/* The command queue can only contain the STARTTLS command at this
++	   point. If anything beyond the STARTTLS were queued somehow, this
++	   connection is vulnerable to STARTTLS command insertion.
++	 */
++	i_assert(conn->command_queue_count == 1 &&
++	         conn->command_queue_tail == command);
++
+ 	smtp_server_connection_set_state(conn, SMTP_SERVER_STATE_STARTTLS,
+ 					 NULL);
+ 
+diff --git a/src/lib-smtp/smtp-server-connection.c b/src/lib-smtp/smtp-server-connection.c
+index e4e9ee7..3d34378 100644
+--- a/src/lib-smtp/smtp-server-connection.c
++++ b/src/lib-smtp/smtp-server-connection.c
+@@ -440,7 +440,7 @@ smtp_server_connection_handle_input(struct smtp_server_connection *conn)
+ 
+ 	/* Parse commands */
+ 	ret = 1;
+-	while (!conn->closing && ret != 0) {
++	while (!conn->closing && !conn->input_locked && ret != 0) {
+ 		while ((ret = smtp_command_parse_next(
+ 			conn->smtp_parser, &cmd_name, &cmd_params,
+ 			&error_code, &error)) > 0) {
+@@ -464,6 +464,10 @@ smtp_server_connection_handle_input(struct smtp_server_connection *conn)
+ 
+ 			if (conn->disconnected)
+ 				return;
++			/* Last command locked the input; stop trying to read
++			   more. */
++			if (conn->input_locked)
++				break;
+ 			/* Client indicated it will close after this command;
+ 			   stop trying to read more. */
+ 			if (conn->closing)
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index 4c55c0e081..b9473d0345 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch \
+           file://0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch \
            "
 
 SRC_URI[md5sum] = "2f03532cec3280ae45a101a7a55ccef5"

