Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12434F0181A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 09:52:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66222.1772790733372570126
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 01:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=klDddMuT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439ce3605ecso1233077f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 01:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772790732; x=1773395532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TjiXPU1+JFqc72/Zltp7RuioDRqN028RvlnylJP2JGk=;
        b=klDddMuTXhw0+Id7a0lEzVystLj4iidvqChG8yqJt0uRYVN0I/G/eYHeQ6f+BNmlw7
         kGK3Oo7YyiFmgscbVi92HW21kQMZhenXC0nPTQei6o7wZZ4C9SMBU6uwsREPFNd1RBZm
         TgvdlvSLJAScYNqabgcV0+mCRI1BHPq15ligJ92V28ihR08YdKW6Xodv26vTHBPTh6C/
         PKohi1qSAH6E/iRckMDCKxCNWUj8S9efeCxW95OtsWpPQ8REycs4TI/FrKn6D5DM0YOC
         7k7qSBGIK+vwWMUFfbsGh1HOo3SMpUVmWImyFms2cOWM/qWAEIRm6AU0cB60/ANAsvIm
         kkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772790732; x=1773395532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjiXPU1+JFqc72/Zltp7RuioDRqN028RvlnylJP2JGk=;
        b=Vpx4pTwheUaMF0TB4Wb2NzCoSdKTPUvlLh5Gy2gUcvfcw6PE10VZno3yKzv+08G3SC
         9Ei0Fu0O+Y3m+lgmTIZJvSeRSJc73ARB45b6z9SretDO7vQFTcuSnfumCho/tEBdl1qt
         FSCfLpDP4mQaUekSccD3nZVtpd5Z6sX5HLps4Ld/2vcePgeIIIWW15PfFS9jM/Vxo5UR
         +74CmBidjjkEgtmwMYNpYgz3tGRaZEvXcdCoE0BIcMNUyKRAS10kLMoxWiQrXBmHt+j5
         uvSVWYsWVpK4JKio01oEJ0JaoyilfZc51iyNLEE+pLr+rGeH55XNFmGCXkPBvwqs9f7D
         HINA==
X-Gm-Message-State: AOJu0YyusHby3ImSCMMz9gLgEF5gYsDV67OhSIP+OtBSI7pDY7g9Xeds
	kwnsvC/TP5ylXH9685f2A+KpJyU2wzTEsDYDDe+YyJTcDgPZmNUPK51Oc7sXuXxw
X-Gm-Gg: ATEYQzzUo2LdJotcsjoCNF6F9PUaYPBUijySAcr4hOiMQMrMae/hsHgxel1aPtuivm/
	taFiX1VDBRwDbzi3PwUUbNcskQjXDGr2oONGEwEdpkuovp+ofcMMy5hW4QsAAIHkErK5ww0p4cQ
	qg+ODcixT089htJ83TK4flAVnKtCBrJqBU6V6x/v3MLoDOgZrpWeGggcg7p8gx88rF0fWndSYY1
	H95tn+Gg1vhpqxwZXvGvDA5oCu/s3xEMGCyerTLu0d4CE5WUmutM4CseSLycehG1GiXJWx9WeWx
	6Hz6TUkYhCakha8pzwGDuWaF/xk/gF+ArO0DAdw2laHibHzL+bbhPNGi9Ga+gDwtGIv/uq88qMW
	WEy03v9IBV/BVP+tUBUq+o9xjpmUWhwvwzvDOd4DWZ5NAioxduMqS0vspXHxRHpaburRNrZlkUw
	7mE9Jo4my8CupzNDX4IZmOmlXRAw==
X-Received: by 2002:a05:6000:2211:b0:439:b564:7a71 with SMTP id ffacd0b85a97d-439da64fb62mr2449023f8f.1.1772790731534;
        Fri, 06 Mar 2026 01:52:11 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm2921674f8f.5.2026.03.06.01.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:52:10 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] pipewire: backport fix for build with glibc-2.43
Date: Fri,  6 Mar 2026 10:52:06 +0100
Message-ID: <20260306095206.1242319-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 09:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124901

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
../sources/pipewire-1.6.0/spa/plugins/support/logger.c:121:5: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
  121 |                 s = strrchr(file, '/');
      |                   ^ ~~~~~~~~~~~~~~~~~~
1 error generated.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ewide-fix-some-Wdiscarded-qualifiers.patch | 89 +++++++++++++++++++
 .../pipewire/pipewire_1.6.0.bb                |  5 +-
 2 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-treewide-fix-some-Wdiscarded-qualifiers.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-treewide-fix-some-Wdiscarded-qualifiers.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-treewide-fix-some-Wdiscarded-qualifiers.patch
new file mode 100644
index 0000000000..e8e677910b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-treewide-fix-some-Wdiscarded-qualifiers.patch
@@ -0,0 +1,89 @@
+From fa64e2873682180eae5ce5bd02298fa6739cf005 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
+Date: Thu, 19 Feb 2026 20:56:36 +0100
+Subject: [PATCH] treewide: fix some `-Wdiscarded-qualifiers`
+
+Newer glibc versions have made certain `str*()` functions into macros
+that ensure that the const-ness of the argument is propagated to the
+return type.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://github.com/PipeWire/pipewire/commit/e46bfe67b60458e444ee2495209144b49e97d2f1]
+---
+ pipewire-jack/src/pipewire-jack.c | 2 +-
+ spa/plugins/bluez5/bluez5-dbus.c  | 7 ++-----
+ spa/plugins/support/logger.c      | 4 ++--
+ 3 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/pipewire-jack/src/pipewire-jack.c b/pipewire-jack/src/pipewire-jack.c
+index 1bef74283..73627a67e 100644
+--- a/pipewire-jack/src/pipewire-jack.c
++++ b/pipewire-jack/src/pipewire-jack.c
+@@ -5318,7 +5318,7 @@ int jack_set_freewheel(jack_client_t* client, int onoff)
+ 	pw_thread_loop_lock(c->context.loop);
+ 	str = pw_properties_get(c->props, PW_KEY_NODE_GROUP);
+ 	if (str != NULL) {
+-		char *p = strstr(str, ",pipewire.freewheel");
++		const char *p = strstr(str, ",pipewire.freewheel");
+ 		if (p == NULL)
+ 			p = strstr(str, "pipewire.freewheel");
+ 		if (p == NULL && onoff)
+diff --git a/spa/plugins/bluez5/bluez5-dbus.c b/spa/plugins/bluez5/bluez5-dbus.c
+index 21a5e53de..7dfe45911 100644
+--- a/spa/plugins/bluez5/bluez5-dbus.c
++++ b/spa/plugins/bluez5/bluez5-dbus.c
+@@ -720,14 +720,12 @@ static const char *bap_features_get_uuid(struct bap_features *feat, size_t i)
+ /** Get feature name at \a i, or NULL if uuid doesn't match */
+ static const char *bap_features_get_name(struct bap_features *feat, size_t i, const char *uuid)
+ {
+-	char *pos;
+-
+ 	if (i >= feat->dict.n_items)
+ 		return NULL;
+ 	if (!spa_streq(feat->dict.items[i].value, uuid))
+ 		return NULL;
+ 
+-	pos = strchr(feat->dict.items[i].key, ':');
++	const char *pos = strchr(feat->dict.items[i].key, ':');
+ 	if (!pos)
+ 		return NULL;
+ 	return pos + 1;
+@@ -1336,7 +1334,6 @@ static struct spa_bt_adapter *adapter_find(struct spa_bt_monitor *monitor, const
+ static int parse_modalias(const char *modalias, uint16_t *source, uint16_t *vendor,
+ 		uint16_t *product, uint16_t *version)
+ {
+-	char *pos;
+ 	unsigned int src, i, j, k;
+ 
+ 	if (spa_strstartswith(modalias, "bluetooth:"))
+@@ -1346,7 +1343,7 @@ static int parse_modalias(const char *modalias, uint16_t *source, uint16_t *vend
+ 	else
+ 		return -EINVAL;
+ 
+-	pos = strchr(modalias, ':');
++	const char *pos = strchr(modalias, ':');
+ 	if (pos == NULL)
+ 		return -EINVAL;
+ 
+diff --git a/spa/plugins/support/logger.c b/spa/plugins/support/logger.c
+index c6e6ca4b8..6ea5f31b5 100644
+--- a/spa/plugins/support/logger.c
++++ b/spa/plugins/support/logger.c
+@@ -73,7 +73,7 @@ impl_log_logtv(void *object,
+ 	char timestamp[18] = {0};
+ 	char topicstr[32] = {0};
+ 	char filename[64] = {0};
+-	char location[1000 + RESERVED_LENGTH], *p, *s;
++	char location[1000 + RESERVED_LENGTH], *p;
+ 	static const char * const levels[] = { "-", "E", "W", "I", "D", "T", "*T*" };
+ 	const char *prefix = "", *suffix = "";
+ 	int size, len;
+@@ -118,7 +118,7 @@ impl_log_logtv(void *object,
+ 
+ 
+ 	if (impl->line && line != 0) {
+-		s = strrchr(file, '/');
++		const char *s = strrchr(file, '/');
+ 		spa_scnprintf(filename, sizeof(filename), "[%16.16s:%5i %s()]",
+ 			s ? s + 1 : file, line, func);
+ 	}
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
index dea1a169d0..444b3bd633 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
@@ -14,8 +14,9 @@ DEPENDS = "dbus ncurses"
 
 SRCREV = "700cea78dbe7564131d51b21a7795e2567ee048a"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
-SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
-
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV} \
+    file://0001-treewide-fix-some-Wdiscarded-qualifiers.patch \
+"
 
 inherit meson pkgconfig systemd gettext useradd
 

