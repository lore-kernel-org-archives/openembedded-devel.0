Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36191.1793161455612621385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZSPpezw4;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so291382a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161455; x=1793766255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=ZSPpezw48yyDIJgQGZbreddPQPJoVVrddhXPrQ68O2nPoBx/M0tCnsSdNOOgHnJ971
         UwTTjLQdq41hBalGGEJP9mNi71EVMSPq53Ljk/I9onDftwi0cJ/W3S//hTzJVI6S06D6
         r+7Ap2rK5tmEjS1rvvTZTIHkNeGnns74kjmLnrs7bn3ufrguWRy3n504SRhx9SY4diYZ
         7dPOEVjvpMPXOnvUIdGAoj8gg/3s6/XmWhTTBamdtrTviAP74SfhOYgPiFilikPwxy9e
         +u+28rs831NEggmFcnaJm3U9+RS9opXI51B7JeUwHn+bFIDbNte4xrOnVYP3T0G9TBkt
         mLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161455; x=1793766255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=vS3rSwf6tGlVI12IvN5qGcuawpFMG9zSBwuu8WIVAJzgGuK90N3TpIzhguK1igThlk
         +4akGzjxV4gi3r+WGTh1aqSjmEg7S4V7hx5DI1fb6smPslvBq17G1qivzhwOOkqERlXY
         1UNvY5Y7v1GJJe+Wsd0TqbFrJ2WTbdd+AHaiGaeqqtSCUbU3oS6xXhsO5TM60+jo93/V
         m0+Zyq4bPF4j1Ggvvnk+3raXb9acAlBQzn81nCGIfM6aT7m3jzgWsdJ91hSvsTWCbgEc
         u/NymR/IsnU9N5C04ywLoZxIqM92XT6OSacvQ8JYObiIbTssW4jh9fIbH7dRqLDJ37Px
         t/EQ==
X-Gm-Message-State: AFq9FYJvnMI37riP7P+UlHq1hQXgsgpOVtdIlbzQJV2FKQis+H4nRFiz
	MHSK6LDu0yLK+kDgYLYKrT//9DfcAvOjLerZHs2pX3YGYdXGPctpz6yc5/84Tw==
X-Gm-Gg: AYBFou0YqMlPL8tRK2eiFPahoNwYtUSeG5CfWHVOrdqI5l8TyenflgBnY6OI/l/gR7W
	eAtF6u7dj1YxgiCzUWw4z0ZuBq0iBMJIMiiXEE2z5KsYBsOGDJmpuRrAJyOTffm9Kvp31eHvr+3
	OYe3chdeLJK46BWgIz4JIQ1ZoUuVXqY9ZJtNvEj+q+Bke/JgA8XsF1SEG/RWNg0vN+igjR3g2XG
	ryorLY2+J4SCIogGWLV0F1+hGgsb2s8MhTIHyFrjlPhNkeNCcAWQ75GFrZDNDZy+p5aMX0ZY8vg
	T6eqHTDP5R1qiJe09ms9R3StCEP1+DOJY6MbPPYnlvKkd0vaEpkMcM0xHVqfElLZb+ii8qj7wRz
	l3zi1VPy/Ypoufpny2E/9AqndWU1JcZUsIfBXJqmDSqfvtQvfGMWIt30H/B1TjGu9IQ52fiPkC0
	jSw91BoCyC26V0b3RsAGoiiStqjSXNJTNsv3syXT2IBVaSECVzyE5yjFipNWgF/Iiq0F/gW2Rrs
	dK9VBgW4PZXs6vgH2bO5scd/n4gXsC/pntQb7UrH+Dj+fAHpiClsECovqG5gQ6H1LwCbGKrI8RE
	OnQPS40gdMn3cC5DnigpvRLbYhUMExIhCjXk5zfFXEGgyiORzbXTqfEyk8Q3Nw==
X-Received: by 2002:a17:90b:4ac7:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3ae58161237mr785572a91.43.1793161454853;
        Tue, 27 Oct 2026 21:24:14 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 03/60] tmate: patch CVE-2026-4751
Date: Wed, 28 Oct 2026 17:23:01 +1300
Message-ID: <a145655a58bba21447ca6469d9e352858296c6bf.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131555
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-4751

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tmate/files/CVE-2026-4751.patch           | 75 +++++++++++++++++++
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch

diff --git a/meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch b/meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
new file mode 100644
index 0000000000..faf3d2a3ae
--- /dev/null
+++ b/meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
@@ -0,0 +1,75 @@
+From 27f07d414949259f17aebc02a61f103629d547f1 Mon Sep 17 00:00:00 2001
+From: npt-1707 <npthanh132@gmail.com>
+Date: Tue, 10 Mar 2026 00:19:33 +0800
+Subject: [PATCH] Fix CVE-2018-19387
+
+(cherry picked from commit 3e12f558c7b71b7135403cdd2df77d38538a695c)
+
+CVE: CVE-2026-4751
+Upstream-Status: Backport [https://github.com/tmate-io/tmate/commit/3e12f558c7b71b7135403cdd2df77d38538a695c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ format.c        | 2 ++
+ input.c         | 2 ++
+ server-client.c | 6 ++++++
+ window.c        | 2 ++
+ 4 files changed, 12 insertions(+)
+
+diff --git a/format.c b/format.c
+index f771c85f..3bbb8cf1 100644
+--- a/format.c
++++ b/format.c
+@@ -468,6 +468,8 @@ format_cb_pane_tabs(struct format_tree *ft, struct format_entry *fe)
+ 		return;
+ 
+ 	buffer = evbuffer_new();
++	if (buffer == NULL)
++		fatalx("out of memory");
+ 	for (i = 0; i < wp->base.grid->sx; i++) {
+ 		if (!bit_test(wp->base.tabs, i))
+ 			continue;
+diff --git a/input.c b/input.c
+index 18c8eb9a..8a66d89e 100644
+--- a/input.c
++++ b/input.c
+@@ -766,6 +766,8 @@ input_init(struct window_pane *wp)
+ 	ictx->input_buf = xmalloc(INPUT_BUF_START);
+ 
+ 	ictx->since_ground = evbuffer_new();
++	if (ictx->since_ground == NULL)
++		fatalx("out of memory");
+ 
+ 	input_reset(wp, 0);
+ }
+diff --git a/server-client.c b/server-client.c
+index 21cccc85..e8614d40 100644
+--- a/server-client.c
++++ b/server-client.c
+@@ -121,8 +121,14 @@ server_client_create(int fd)
+ 	c->cmdq->client_exit = 1;
+ 
+ 	c->stdin_data = evbuffer_new();
++	if (c->stdin_data == NULL)
++		fatalx("out of memory");
+ 	c->stdout_data = evbuffer_new();
++	if (c->stdout_data == NULL)
++		fatalx("out of memory");
+ 	c->stderr_data = evbuffer_new();
++	if (c->stderr_data == NULL)
++		fatalx("out of memory");
+ 
+ 	c->tty.fd = -1;
+ 	c->title = NULL;
+diff --git a/window.c b/window.c
+index 45ec7790..9d95bb77 100644
+--- a/window.c
++++ b/window.c
+@@ -945,6 +945,8 @@ window_pane_spawn(struct window_pane *wp, int argc, char **argv,
+ 
+ 	wp->event = bufferevent_new(wp->fd, window_pane_read_callback, NULL,
+ 	    window_pane_error_callback, wp);
++	if (wp->event == NULL)
++		fatalx("out of memory");
+ 
+ 	bufferevent_setwatermark(wp->event, EV_READ, 0, READ_SIZE);
+ 	bufferevent_enable(wp->event, EV_READ|EV_WRITE);
diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
index 5fb28b0085..9027826ea6 100644
--- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
+++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
@@ -8,6 +8,7 @@ DEPENDS:append = " libevent libssh msgpack-c ncurses"
 SRC_URI = "\
     git://github.com/tmate-io/tmate.git;protocol=https;branch=master \
     file://0001-fix-finding-msgpack.patch \
+    file://CVE-2026-4751.patch \
 "
 
 SRCREV = "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
