Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C77197FA97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:53:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l10so10221277wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qSt1Q+jYdTFnZofOtuQtLom8C5g0r3Gxlm8rqiPNZgk=;
	b=LUQ76YDVGr3uXOVXbVG+hiVdB5W3igZ9QlLp/YMc0sXW9NfjWHua1HxOsuPOl6Sh//
	kZliHhUpSwxm+9H0GNxdMeuCYvYgHTKIA8UJ6sjG8XXjigZyKjCB2FEFawnXcMHn1Ipa
	j9unPYttyixm37+Ca68yO10QKRHMHAzbKp2sXoS9gSxvM7MskTfuWntZdR3f9szV4hQQ
	UYKRj8CDIu577jY3KMyHnQfJuGnHnp05pt/aVm2c+UVygKNooor6OaJgpbW40jcAieib
	dHNlXCR5l1FyOw61pfMAvncG4Z2gabIq/i1W4cM8xpB+P1TNSFTIU8lxWbOvhZs4GJ9m
	DcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qSt1Q+jYdTFnZofOtuQtLom8C5g0r3Gxlm8rqiPNZgk=;
	b=s/VQr1xz5ZjBVuQkkO1Br3sKMRqWD5w72rfFUJc4MDUVJcrebV7CaV5cn1d4z9T+xl
	APb1gOFs6RwG8EL+kszNKZ6bWNggWEp26rN6zg5RdqU+0NfhVn3P1eaAQ3/K0JFagzVc
	GBzoen0It8um4fdB3K73eDquXgKsuIcPDwfGw/Sr9nACyyKjAWqc4nBqLhDupf2KEn0f
	9dDo02olGXWDDJF4XdhjqbdxWKOQzZGkBnyYuA0LpOpzMTjKhFRp302QZKo6DsxKWLcj
	FQQWrFRRB4uYc8R0mLki/OIzKnugYByeTbmWGqVGp48cJrlAtSBvT2NLmjDasT4u0sNj
	jlwQ==
X-Gm-Message-State: APjAAAWb/IDVrjcdAnC6BG4LYN/srqGvByJi885iWf6+1LnzW6pftF2M
	TuNaIbnbVc2ELrAgQbHJzjZ7MJtS
X-Google-Smtp-Source: APXvYqxPZigzrfz03ReQabhB3X8UbmzlUd0unKJK/ZGdr/yT8vAwESUgLyoddg9Yph4B2oIJnORjiw==
X-Received: by 2002:adf:afef:: with SMTP id y47mr15172578wrd.190.1572274437966;
	Mon, 28 Oct 2019 07:53:57 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	s26sm12666655wmh.23.2019.10.28.07.53.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:53:57 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:53:50 +0000
Message-Id: <20191028145350.6606-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028145350.6606-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
	<20191028145350.6606-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 4/4] dbus-broker: add patch to fix build with musl libc
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
X-List-Received-Date: Mon, 28 Oct 2019 14:53:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Forwarded upstream: https://github.com/bus1/dbus-broker/pull/214
---
v2: added

 ...04-launcher-fix-build-with-musl-libc.patch | 38 +++++++++++++++++++
 meta-oe/recipes-core/dbus/dbus-broker_21.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0004-launcher-fix-build-with-musl-libc.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0004-launcher-fix-build-with-musl-libc.patch b/meta-oe/recipes-core/dbus/dbus-broker/0004-launcher-fix-build-with-musl-libc.patch
new file mode 100644
index 000000000..0348d9722
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0004-launcher-fix-build-with-musl-libc.patch
@@ -0,0 +1,38 @@
+From fc1d26dd08c48c04fc9883b36a94c219aba2091c Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@microsoft.com>
+Date: Mon, 28 Oct 2019 14:31:38 +0000
+Subject: [PATCH] launcher: fix build with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+../src/launch/launcher.c: In function ‘launcher_fork’:
+../src/launch/launcher.c:378:60: error: ‘WEXITED’ undeclared (first use in this function); did you mean ‘WIFEXITED’?
+         r = sd_event_add_child(launcher->event, NULL, pid, WEXITED, launcher_on_child_exit, launcher);
+                                                            ^~~~~~~
+                                                            WIFEXITED
+
+Include sys/wait.h which defines it.
+
+Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+Suggested-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: pending https://github.com/bus1/dbus-broker/pull/214
+---
+ src/launch/launcher.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/launch/launcher.c b/src/launch/launcher.c
+index 2ec4bda..1f38fcf 100644
+--- a/src/launch/launcher.c
++++ b/src/launch/launcher.c
+@@ -10,6 +10,7 @@
+ #include <stdlib.h>
+ #include <sys/prctl.h>
+ #include <sys/un.h>
++#include <sys/wait.h>
+ #include <systemd/sd-bus.h>
+ #include <systemd/sd-daemon.h>
+ #include <systemd/sd-event.h>
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index a2cb85f8b..71a7a5762 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-bro
 SRC_URI += " file://0001-launch-improve-error-handling-for-opendir.patch"
 SRC_URI += " file://0002-metrics-change-the-constant-used-for-invalid-timesta.patch"
 SRC_URI += " file://0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch"
+SRC_URI += " file://0004-launcher-fix-build-with-musl-libc.patch"
 SRC_URI[md5sum] = "7d2e7e72b45c3cb7c25d21a53ce30c7d"
 SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
-- 
2.20.1


