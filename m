Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7531.1792574950966697119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a7+eLper;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so631788c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574950; x=1793179750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=a7+eLperP54YviFkUaTAKIHWURbcRuHLKPu2HQvucp7mNJ2EJrl5iI9P2k3CxjAfoe
         HlT/Ac54OP03kRnbmg6PKJGWq26hF1Tlk9vLjwZkR/ZhUm0+pcA8BQvBH74l+YNEn/RB
         7YgWCW2I/SbqWrzTqW1B1Iykzcd/whaiNkK979SFhL5Li8a+HY0ioOC4GzsnkAUK7Bo3
         KY+nHsZvAF7YhtPA9NTW4Q+CVoE4TLuRiKNE55AaNe9UsDSszSZIdJid7/bcW+Ji0W3B
         AYbCKHnwlkMwFti5wPUmxKo+a+yix98j0jr2ZXTmKeepvOAxz4j5mrJriG2nxBQQLEnN
         YpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574950; x=1793179750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFKa95pacYmxD4fyvvH7JpYlJS5wAUEwj2Ix4xN8Gm0=;
        b=o2fu1KBC2rv6M6KZtVDgjRqOpE+wOv2aKh/1FjSPBjkurxmvPEDVdEzDoZbgPAaE61
         Uhwe0ELKPEMrGCud+aDsNtDtWXer8V2ImmI1e8QAbJVSH+kHwOGpFq4OhKolUcOLgCmd
         2xxoWnsrxgR77ERrL/BpT58oGGEFUgDLRH9S8OXn1fGpA14Ocsv47YyyPqfHr9Lu+KV5
         DDxyVOcRnUwmyA88bTKS0A1IFGJXcPBsnX9YcTO7KIQNEgugjCXe6SwP3slVScfBhuSG
         WGBwzhtlVJ8yuDPQzKn4ceH+0DKWIo/1qb+CnO26Nbmj32TpKmPuBCdY7g6d7rVUkKav
         JJnQ==
X-Gm-Message-State: AFq9FYJjCaXLp+ahIE2r9i+zv5QtyZIyCzXzf9n01AIZp9ZIQwvtsomX
	FexDxfGIPY2NaJcie81VukdL6zYJikt3Sfhe0Z+5LI9Oc2Rk8RdZ3gWuymQ55g==
X-Gm-Gg: AYBFou26hpt6gz4y2ISa1ISofvMXcyx0dU/I3d4CMfLD0YUa12vfFj4/K3pLMeOSIoC
	XAIoOJ2sV1VoJa58ZYmWFfY/y7OddYt/Gktyji2R+9E3HA7MUJKaYRuXBkFEIJw08LBZJbS1ncx
	VPECfJWt2LBa2VvgP+1FiWjcUfJ+6uCQAKsZKOUn0rWWAc30PaG4ytaNZ3Ap5OzU10nQrPPq2oK
	5MUQrQqWtWBEcSVbAGcgHIm452mOPr2bX76TV5LRZT6pww/bjlpnG6end1DM1+MIRGbrZg5dows
	V+PdySpfxQunlaclUysG4Ostu0h9TS2Yx10oQuqYqGMu4C6QxomJeLmlsOh+yEXTXuTh6Fxpkg8
	5Py8vbvsvGREEz8AsFjsvo4ENjTsaVp3wEdCg4aYtjJUgYDACMUGZmiuC4onmeNS4W0zftUb+jX
	XN3LCJ+xCnBz8enC7jARFYm22TJrIM5vrX9bbmmamUJMY6JvqHbUE5TRXIZTKu3aNAyZC/p8Uel
	az1PaDKiziCJxjW/utChxlHc+RYCv6e5N8IDI3I4dEYaBLYu2DAnPMldRIEmvZ/MdnZF1rc8Y6M
	OCxspbZ6IV7mXMYFdxcZEMhqi9k7AvImVg==
X-Received: by 2002:a05:701b:291b:b0:160:6a5b:7edf with SMTP id a92af1059eb24-190a728a5a9mr1624743c88.44.1792574950166;
        Wed, 21 Oct 2026 02:29:10 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 3/44] tmate: patch CVE-2026-4751
Date: Wed, 21 Oct 2026 22:28:16 +1300
Message-ID: <20261021092857.3585453-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131190
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
