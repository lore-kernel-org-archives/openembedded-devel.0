Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id D6B5A79C92
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:42 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t2so15194980wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ShD4XvX4GK0wnaAXCUEgc0oJQmmjZC9OK0wfxYAIwKk=;
	b=TBZHfSkXLaeE9aE06kVBgphwednS6vz3DuE4af4igZDUx1U5sVBl911BPPBmLiYYLv
	5YMkTxDn0GxPRYuLpqnhyQeY84VLyX12pWMnX12DOlyItSv0VOeW3ja+QIqtkx+SFv6e
	pOSgXYS0GpUIcjIMSP0K5PavUxRDRj1gTkF8G/dI9rBig3intBrVf26ahwjKnMHueWGC
	qE4Q/xvAFJS6+4Lx3w4KwfVMl1E9OUMEAXIK9HUpPV5r0YRdl9n1umI5Ruzt49YwgA7P
	jpVvLnYXEm+aAnnfa3nOjClsjL3kS84fMlHnb51e7u0Jtzt3JkdmIRggL/c9oR/fQOxn
	GWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ShD4XvX4GK0wnaAXCUEgc0oJQmmjZC9OK0wfxYAIwKk=;
	b=iL3SMYmLQakgcSMIYMRZ6VVfZaW9XnfmdmKM5oPpHUgFxZVRafKZDgbkhWVb92535n
	19nIAt3qCG8zN/kGK7EMyMV09XEEdb5cZiPPgm7Old68bjNxRfYY0EYD+hGrMio5cNxW
	1ri9OSd9YwoUPHT1HF429cBnisWTnd/iNfmkPIP69R0DIPwIhxP0n5ZuFo0zpXHRYdno
	CPfWKnApmQI8rkQcxF22dZsa5jumKJ+s7fLBkr6Z7BdNXtggArRrKwTIzBSUkfInlstp
	9ZbCxp43uxCSRodzn+5jBh2FxLY/k720vQLASVJOQN2lmctOyk7udA7jd4Ot/p9dnUtG
	TSfw==
X-Gm-Message-State: APjAAAUbokLCDyAkqx7Htu1i2xg+68G+xXdWVcCzWn+TjufVHVHHeVJO
	f8AxbeERWpQ9Um+95vgS8+Asa59h
X-Google-Smtp-Source: APXvYqzvmkVGc3fXBWPhwR5Nfapf8cSrAlWwYBCMJbFm5J7/QTJbD9+TpbjYy5JbcQNbgXnWSPgnBw==
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr744271wrp.182.1575880603151; 
	Mon, 09 Dec 2019 00:36:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:12 +0100
Message-Id: <20191209083612.23922-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 20/20] accountsservice: Hack musl build fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2019 08:36:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-musl-Hack-to-fix-build.patch         | 36 +++++++++++++++
 .../0002-musl-add-missing-fgetspent_r.patch   | 46 +++++++++++++++++++
 .../accountsservice/accountsservice_0.6.55.bb |  4 ++
 3 files changed, 86 insertions(+)
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
new file mode 100644
index 000000000..c2310fe46
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
@@ -0,0 +1,36 @@
+From 2a1c7103839c20df5ca9ce2fa863535d802f8f3a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 8 Dec 2019 23:42:00 +0100
+Subject: [PATCH] musl: Hack to fix configure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+---
+ meson.build | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4465a26..726c9fe 100644
+--- a/meson.build
++++ b/meson.build
+@@ -82,8 +82,14 @@ if cc.has_header_symbol('utmpx.h', 'WTMPX_FILENAME', prefix: '#define _GNU_SOURC
+ elif cc.has_header_symbol('paths.h', '_PATH_WTMPX')
+   config_h.set('PATH_WTMP', '_PATH_WTMPX')
+ else
+-  assert(run_command('test', '-e', '/var/log/utx.log').returncode() == 0, 'Do not know which filename to watch for wtmp changes')
+-  config_h.set_quoted('PATH_WTMP', '/var/log/utx.log')
++  # musl: This is just a build fix hack.
++  # As usual they know better, consider all other projects crap and offer zero
++  # alternatives: So wtmp is a dead stub only [1] (= /dev/null/wtmp - taken
++  # from musl sources).
++  # Maybe a hero comes along and adds utmps [2] to make accountsservice useful for musl
++  # [1] https://wiki.musl-libc.org/faq.html#Q:-Why-is-the-utmp/wtmp-functionality-only-implemented-as-stubs?
++  # [2] https://github.com/skarnet/utmps
++  config_h.set_quoted('PATH_WTMP', '/dev/null/wtmp')
+ endif
+ 
+ # compiler flags
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch b/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
new file mode 100644
index 000000000..14161804e
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
@@ -0,0 +1,46 @@
+From 820249ea8e38c568e6a36fbd9c852718c7665b56 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 9 Dec 2019 00:12:08 +0100
+Subject: [PATCH] musl: add missing fgetspent_r
+
+Stolen from void-linux
+
+Upstream-Status: Inappropriate [musl-specific]
+---
+ src/daemon.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/src/daemon.c b/src/daemon.c
+index c52bda3..a7676fe 100644
+--- a/src/daemon.c
++++ b/src/daemon.c
+@@ -164,6 +164,26 @@ remove_cache_files (const gchar *user_name)
+         g_remove (icon_filename);
+ }
+ 
++/* Musl libc does not support fgetspent_r(), write own
++ * wrapper
++ */
++static int fgetspent_r(FILE *fp, struct spwd *spbuf, char *buf, size_t buflen, struct spwd **spbufp) {
++       struct spwd *shadow_entry = fgetspent(fp);
++       if(!shadow_entry)
++               return -1;
++       size_t namplen = strlen(shadow_entry->sp_namp);
++       size_t pwdplen = strlen(shadow_entry->sp_pwdp);
++
++       if(namplen + pwdplen + 2 > buflen)
++               return -1;
++
++       *spbufp = memcpy(spbuf, shadow_entry, sizeof(struct spwd));
++       spbuf->sp_namp = strncpy(buf, shadow_entry->sp_namp, namplen + 1);
++       spbuf->sp_pwdp = strncpy(buf + namplen + 1, shadow_entry->sp_pwdp, pwdplen + 1);
++
++       return 0;
++}
++
+ static struct passwd *
+ entry_generator_fgetpwent (Daemon       *daemon,
+                            GHashTable   *users,
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
index bf603b3bc..36fecfe11 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
@@ -13,6 +13,10 @@ inherit meson gobject-introspection gtk-doc features_check systemd
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI_append_libc-musl = " \
+    file://0001-musl-Hack-to-fix-build.patch \
+    file://0002-musl-add-missing-fgetspent_r.patch \
+"
 SRC_URI[md5sum] = "6e4c6fbd490260cfe17de2e76f5d803a"
 SRC_URI[sha256sum] = "ff2b2419a7e06bd9cb335ffe391c7409b49a0f0130b890bd54692a3986699c9b"
 
-- 
2.21.0


