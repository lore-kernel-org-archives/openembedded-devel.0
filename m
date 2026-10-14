Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576A2CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:50 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10242.1791973363259192866
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PXsBleJy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso2479778a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973363; x=1792578163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=PXsBleJyh2q5oem4WKMsSKoybpPhCVfS5pzUiWYmjWOf7SjDAaMuy51Dyw5n5/z0cC
         KcRgt7wvQM5UyP6Iq0vTK/lR12tMfRIT9HOnEEesZi9AYuj9xOesABbHy+FEbsPGyGNO
         MHgfNgVaxbOGaT6cfp/4WZNKjorDrLK8r2UgRkWrXABui+DXHETzWlDxf4DCvpLcjpT3
         Adv+nEcwGnZrANtJY4NYPcvDerhBPUCeawrqtquHw44prliyh1xMRPSRRn5G7CSqAxLE
         zH9K49GvUeauYRLYASc0eHISKNN5RtYxsMmXu/jo5AIbL6OsG963IuiW4RgF13Flfo8c
         Vahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973363; x=1792578163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=PFgdd+fxdI5TwL8lR12TpMxO4dAUNuV6q8TpDZhLBB+DyiXdgiVw/3WDG4QWP4B66c
         8rhdm8iySCbTHX1dgJbz8A2HsV0RNesc3zpIxh7yZGePmBQ2pPZKhSQzoisTEoLIj/FU
         sgLvAle0gs4bv/cei5zek4MqHAMSEewCAFXNGPTGLPgUqrexOrD23VaEVHIOpBV67TRI
         IZPOADw8Mb0IQSv6z2y5klarrXlWROx2QZF080sxSsTyx+P5L31KoMANxJjOhU035wCS
         /kZ86mb0okzmqbRTpVI484OSZWaCbrrePIIimANUx2/2MVqAZCs1ng4kA6Zb6rRm14OE
         aO2A==
X-Gm-Message-State: AFq9FYLcu0I9PC5SAr31R56h+U9zazq5SJE1sNCSVHJT/lndVV1YtdPp
	nezxmNMGyY05vYlmiUgczOoI6Lm6hZY9hX5q3saIEtnLTr1d2NsjRcMRexc6UQ==
X-Gm-Gg: AYBFou2APdB7SEiQXf7vdhGEUwJ3qLjK/6z1B1BOivnc2olfq3v/vJUmomW5jHztByN
	qV8wzx1WrBF3zdMHpMV6KR/7EuGyJwnsAG43CPxFU3yg4Pr4Fbb+YssW+yAuatdlttZGBc0rvEi
	w3tYskWx2Un/eLJva29nwI7x1JC48HivYfagv+O/A2c0NaiMd7kRWAy56Z83TbvL4NO0meTZe2g
	J5Pb8Py3z+OPoK50QEEml7dNj75JsqzQW6K2AWB0XrC2D/griqfUC92D/JLcELe+sErhyoZtNHP
	mwx+9WI0XXHv0m2fTcqhxlo+QOH2M2cyRqj6vgFFTManH1mlJRu0wa/YvGo5r1yE7QhxbL8PE9l
	60nLF69BR0GyoK9OgqUa1Xzl1dRSY9OZMRb2rnJ8jrjL0nK2X+Ajuj+tlzBwQ6i++GzVO7D6VEB
	tXLVeCBgkINErmvIdiF4dnTGuLwpauntXsWrAE8W8Hct24kALtkb5cb7i2I1c+S/Zf59Wqfyx8b
	j+5YfMxeBwQa5FNCN4dLakWtN8B+nK79PKOa/8=
X-Received: by 2002:a17:90b:3143:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3abe588fa64mr8323348a91.5.1791973362604;
        Wed, 14 Oct 2026 03:22:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/11] tmate: patch CVE-2026-4751
Date: Wed, 14 Oct 2026 23:22:14 +1300
Message-ID: <20261014102218.880640-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130894

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

