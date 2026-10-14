Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93860CC6B1F
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:37 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9248.1791969931787819223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GJVt/a1k;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2116865a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969931; x=1792574731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=GJVt/a1klefbCGzuVoEprK1yTive7HGcJK8RbbkiUEmQi8v3cfwGbtHa3Bt1kM4bGA
         sTY29SutKB5s51jFzWq5jQzJByG2xcvU+a0szEtapYM+cS8puobh5JOQ5umM7BrtKoC9
         HaSGfK7EKLDqv+3izn4IsJXxHCD/tvuUf/ha9n837CJAfeak6K7d7l0ncTGYPeiRW6b3
         +Kwr1mJjj73DR28CyirRSfosBMxoxz/vccRqSfqQ2RJn0bIXItrpjT5IWKIs51ySOmmS
         OrENf5cJffmU/F2XaCPjVAbZN5jTn6j0RcITSxQKoxME/wghcYNTIGcXccbXbIJoJKZj
         ivvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969931; x=1792574731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=FjWv7d8mkPJjC2qj0fHVKMUaTVKH/avK1UALTyhPJhr4dc5UgeyzDBjVjdcVun2yHW
         DdK8LDi1dhNqUBkUw1LD1S3/FUybgg+4g2OaNq86+Cn15A2yA1P1BgRVfAJXSwVb/CXV
         tuiUF+s/uEmjqNkRIN3VG7nEnp+zuf8HWj5EodBWnvf4aBcR6FPNPfofpEBLbCPQ4rqv
         gQtzG2wlmox3ifQLv4DN0lCZTU44lHCQcaZcT3QJTX6+RvqGY3cdTF8eoNaUhLJc6Nw+
         AZJLWSAXUS/839vcRkAvdSx9L/jOea7yjEjnv9tUkdrXNLZHhcdgKUUqctNDohDyk+d7
         fvHQ==
X-Gm-Message-State: AFq9FYKkI4o7ntJ0OuNlGB41VN0P2M3Sf0cnHpGMo54jIrAmSFAlL92y
	X1U/6jMxAZdLnnflpyYhizfnsdiD8bVDBAkYtDKITP/epw88ntYIsdJJoe3vQA==
X-Gm-Gg: AYBFou2J6TkX5XNxk+DcYciXn1QzjpsivvH/BpEHt+7NOk5xoEQLHMx7W4isYW8KSe6
	7hjsq7AUHnlnU3iuX8wAOqR9w//hmYq17wk/3ES7E3osQKPQI9tz5hDAaXJWqX2K/zbkN183BUd
	C0hOCifzK1zsxpqkyXA5deL0kYFl24GFiKuSUMx+lkJI3CZdzylaeiWlyy50TCenlpE7RWCWPIe
	I/ugEFfS5XoHKL6UMhxU9QNrrQqwXjjufPJjgkgv8lbCjtueLPNe+8zZzuzQh22uQcT1y0MHplP
	iqFhA45QoWWNTucd2fW+IF2umq4LkwzLRk/DZtw2n6Q0PEKDMGmPxO7Topa3UXfdmHOZXzx+Tdc
	LOE6btoJkWflBQtdLOr53waWCxqjlx/ffymBdmYX6JFstyh7uEOw07qVnSL2ohA4u5/xEVzFRpx
	gc63FlWAatifRo87/RxXbjklX0DWz0wcASnxrvHRj9XvtEHAOiujypXK4we7W383+bGJ2hr8OLO
	uheZ6G3ow7CgpMMczSJDGIeNOee6nObfejbHrI=
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr16057346637.18.1791969931016;
        Wed, 14 Oct 2026 02:25:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/17] tmate: patch CVE-2026-4751
Date: Wed, 14 Oct 2026 22:24:59 +1300
Message-ID: <20261014092514.454505-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130871

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

