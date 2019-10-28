Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5547FA9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:58:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q13so10202838wrs.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E/ISlAcdp8VG+ZJgwvVzFRc5CuDLUmCoKv5aWrrDUSo=;
	b=hMcplNdI7PcboKIgzg6oZ3k2+cMUtORYEE9/qVryQW4iFTyY6DzxzHAJF1Nuw7v5Np
	XhH+EIwOZxsHKCsEYnS9tJbhHsKw0SXPFh6WEqhDa+UvmdpzRCfa1TIfrOVQ5aBMrxLG
	uEarKjO4U04zP0f3BA3p8nKRJz5HsL06pUPH3iXFLTc2ie8Ev0KFgCmk23xDQp5XKVnZ
	+8q2GEiK7a913ohZw3DbrIgAKgDVXYBOps0/5Mg8FXaFDTRGW7jIHrEEm42wk+e3mMA2
	E+pv7JJmQ/qypO+ibJGmPx7o1cKiYMcP6WUSHJrgLbW/oBKa05YeBhEqFsTzDHdjia9W
	bBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E/ISlAcdp8VG+ZJgwvVzFRc5CuDLUmCoKv5aWrrDUSo=;
	b=gZKneJhMFPnRAjnl0OZjf7XPchFB2wFOVrCNFcxWrJqH8Mp1rfPtrI1SG7nzYYKkzb
	MpfYgGRpMCEdVzUjKIOO7w5dMZkqcjR4f7Ac43fyXoUO8bA01c/rfskMjKTAK7JU9tmY
	+tCfZaMSaswpMHpqQb+4wUVGbFdBAtEvUAeWxg+Y3sBDUyBgkFv/mbtFq9W8cM44wMkl
	5CO02euckQLaIAAJRLnsx8xzmUyA+kHMjypmye8aSWvpgxmBp8c48tyRTV+JNJT0blcI
	0bSKzQ1N48Bh6+Aao/MCn2u2OR57Dr39Cfq9MYiOErjvuyfRznXc8XdPi+m6FZ41nH1U
	tERA==
X-Gm-Message-State: APjAAAXBijkrcW3/kPpEaYQfKS7JzNA1do6ZsvfueQ4wiWZMaNwFyg8d
	TCZ4bpkJ2/YFwnpDQfRE4aNvqG+q
X-Google-Smtp-Source: APXvYqy1fWxM+qkNu35eMynSl/QPcrUDinyar7cAVC4wI0vCerIJoXFCjkAO6BsoQs5fvuYmCgn66w==
X-Received: by 2002:adf:ab5b:: with SMTP id r27mr16168511wrc.13.1572274710888; 
	Mon, 28 Oct 2019 07:58:30 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	o189sm18134432wmo.23.2019.10.28.07.58.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:58:30 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:58:23 +0000
Message-Id: <20191028145823.7462-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028145823.7462-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
	<20191028145823.7462-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 4/4] dbus-broker: add patch to fix build with musl libc
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
X-List-Received-Date: Mon, 28 Oct 2019 14:58:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Forwarded upstream: https://github.com/bus1/dbus-broker/pull/214
---
v2: added
v3: no changes

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
index c509ff6f2..d2d051070 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-bro
 SRC_URI += " file://0001-launch-improve-error-handling-for-opendir.patch"
 SRC_URI += " file://0002-metrics-change-the-constant-used-for-invalid-timesta.patch"
 SRC_URI += " file://0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch"
+SRC_URI += " file://0004-launcher-fix-build-with-musl-libc.patch"
 SRC_URI[md5sum] = "a17886a92ab1e0bc2e4b1a274339e388"
 SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
-- 
2.20.1


