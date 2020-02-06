Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6E7260D2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 14:08:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c84so106391wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Feb 2020 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OQmB7GdOaIY5gEMIGb89ahcDQklxdZcYoDf2ko8oT6I=;
	b=KRUR5Tk+YYH8rvfoNILNzM7Ejvbp3cv3JaVOg4Ip/U4XSLCfMQTYZHTgpTvFSTCcLd
	GIf7yqjNUQzyre2DOevO1BQt12ydLZ5X6m1nHM92ARdh2ONtb83zfZ2d/9PaEMVzJB3O
	jP0KUNTkHMmQdt25WO7x/H1cgAcE6zLRkhPP8IBPzXqdo4iDtcA1nA2W/BFHr8OuIovo
	jAghEG6VIR8hujKVONZtAfUd89lih7Q+xSiUTCMGmNGL9kbFJNkLurq5Hvurji14flqF
	oWfDjoglfDlmlAGFvTJ1DtP3TsrXOSdB3Gmz1VgzBh55fIqKmhU+Ue/sv0JpzHmNkhzr
	AAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OQmB7GdOaIY5gEMIGb89ahcDQklxdZcYoDf2ko8oT6I=;
	b=NJsqrWgR9i3ujioIo1nCjeaVoXDDxpy74WZMRdKpT0kqQFz6c8lT7Z6pLbQ4930cGr
	4JrHjIoDHH6djVM8vvXv5/Ohsta3zU/RXrppm25/eI3ZxEI2JEfiVS23YsC9M0vgA5a+
	SddYxyX3whiYrvRqfUxCdl9bEzgiw3rX80qSqa2Y51HX6cMcLleYgwRTHkwb9LigZLUL
	r4keSqPSheA7WBIS5C2oIYS9QKAQrJPau0iaGIZ0ZQEulZfXQmhOJVpz4QDLGC4JXKYI
	K919su9FUs2wBtxgDa2w38oOYWbD2wMjlZ5PcXKOuuM5zUWdL1LtzBzOzNaEQkfiWSQV
	UK1w==
X-Gm-Message-State: APjAAAW8rDJaBMMre7fhQ1iS2cabxuzVJuJu3h8oW0KHfKav+dOQ6gQp
	fnMeMob4s/qKeUiyCK96Cq0lV/asYq4=
X-Google-Smtp-Source: APXvYqwC4BWHY5/8ZUr1mbsq2ZIw0UyFdd4qt/EdGf4q1nQKew6VhkfKqh2cBX5ZOPi+5633Tt2q5Q==
X-Received: by 2002:a05:600c:2c53:: with SMTP id
	r19mr4785522wmg.39.1580998113420; 
	Thu, 06 Feb 2020 06:08:33 -0800 (PST)
Received: from localhost (pat-131-250.wlan.net.ed.ac.uk. [192.41.131.250])
	by smtp.gmail.com with ESMTPSA id
	o187sm4053570wme.36.2020.02.06.06.08.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 06:08:32 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Feb 2020 14:08:24 +0000
Message-Id: <20200206140825.7911-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dbus-broker: backport patches to fix policy with SELinux nodes
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
X-List-Received-Date: Thu, 06 Feb 2020 14:08:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Backport from master: https://github.com/bus1/dbus-broker/pull/213
---
 ...icy-fix-crash-when-importing-selinux.patch | 50 ++++++++++++++++
 ...icy-fix-crash-when-exporting-selinux.patch | 59 +++++++++++++++++++
 meta-oe/recipes-core/dbus/dbus-broker_21.bb   |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0005-launch-policy-fix-crash-when-importing-selinux.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0006-launch-policy-fix-crash-when-exporting-selinux.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0005-launch-policy-fix-crash-when-importing-selinux.patch b/meta-oe/recipes-core/dbus/dbus-broker/0005-launch-policy-fix-crash-when-importing-selinux.patch
new file mode 100644
index 000000000..c5f3092ee
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0005-launch-policy-fix-crash-when-importing-selinux.patch
@@ -0,0 +1,50 @@
+From d28e59c451375e8b08fa431b1d64cb3ce9f078ee Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@microsoft.com>
+Date: Fri, 25 Oct 2019 21:04:36 +0100
+Subject: [PATCH 1/2] launch/policy: fix crash when importing <selinux>
+
+If a policy contains a <selinux> element, dbus-broker-launch crashes:
+
+Oct 22 12:02:51 localhost dbus-broker-launch[885]: dbus-broker-launch: ../dbus-broker-19/src/launch/policy.c:232: policy_import_verdict: Assertion `cnode->parent->type == CONFIG_NODE_POLICY' failed.
+
+Minimal config to reproduce:
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+  <selinux>
+    <associate own="com.example1" context="system_u:object_r:example1_t" />
+    <associate own="com.example2" context="system_u:object_r:example2_t" />
+  </selinux>
+</busconfig>
+
+policy_import_verdict is being called on an associate element,
+but not only it cannot work as that function checks that the
+parent is a policy node (but it's a selinux node in this case),
+it is also not necessary as the selinux node only defines ownership,
+it does not have allow/deny.
+
+Fixes #212
+
+Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+Upstream-Status: merged https://github.com/bus1/dbus-broker/pull/213
+---
+ src/launch/policy.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/launch/policy.c b/src/launch/policy.c
+index a8ba8e7..466e4bd 100644
+--- a/src/launch/policy.c
++++ b/src/launch/policy.c
+@@ -613,8 +613,6 @@ static int policy_import_selinux(Policy *policy, ConfigNode *cnode) {
+         if (r)
+                 return error_trace(r);
+ 
+-        policy_import_verdict(policy, record, cnode);
+-
+         record->selinux.name = cnode->associate.own;
+         record->selinux.context = cnode->associate.context;
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0006-launch-policy-fix-crash-when-exporting-selinux.patch b/meta-oe/recipes-core/dbus/dbus-broker/0006-launch-policy-fix-crash-when-exporting-selinux.patch
new file mode 100644
index 000000000..51f45361b
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0006-launch-policy-fix-crash-when-exporting-selinux.patch
@@ -0,0 +1,59 @@
+From f1cdef4d98ddbfeeb4a688712d54b3adc89bfe26 Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@microsoft.com>
+Date: Fri, 25 Oct 2019 21:05:43 +0100
+Subject: [PATCH 2/2] launch/policy: fix crash when exporting <selinux>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If a policy contains a <selinux> element, dbus-broker-launch crashes:
+
+[   30.048705] dbus-broker-launch[221]: ERROR policy_export @ ../dbus-broker-21/src/launch/policy.c +1142: Return code 1
+[   30.050963] dbus-broker-launch[221]:       launcher_add_listener @ ../dbus-broker-21/src/launch/launcher.c +1130
+[   30.079620] dbus-broker[228]: Dispatched 0 messages @ 0(±0)μs / message.
+[   30.082613] dbus-broker-launch[221]:       launcher_run @ ../dbus-broker-21/src/launch/launcher.c +1389
+[   30.084426] dbus-broker-launch[221]:       run @ ../dbus-broker-21/src/launch/main.c +153
+[   30.085797] dbus-broker-launch[221]:       main @ ../dbus-broker-21/src/launch/main.c +181
+[   30.087208] dbus-broker-launch[221]: Exiting due to fatal error: -131
+
+Minimal config to reproduce:
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+  <selinux>
+    <associate own="com.example1" context="system_u:object_r:example1_t" />
+    <associate own="com.example2" context="system_u:object_r:example2_t" />
+  </selinux>
+</busconfig>
+
+As per the libsystemd API, sd_bus_message_append can return an int
+greater than 0 on success, which for example happens when processing
+vectors.
+The export function is treating every non-zero result as an error,
+which causes dbus-broker-launch to terminate.
+
+Fixes #212
+
+Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+Upstream-Status: merged https://github.com/bus1/dbus-broker/pull/213
+---
+ src/launch/policy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/launch/policy.c b/src/launch/policy.c
+index 466e4bd..f91f11b 100644
+--- a/src/launch/policy.c
++++ b/src/launch/policy.c
+@@ -1138,7 +1138,7 @@ int policy_export(Policy *policy, sd_bus_message *m, uint32_t *at_console_uids,
+                 r = sd_bus_message_append(m, "(ss)",
+                                           i_record->selinux.name,
+                                           i_record->selinux.context);
+-                if (r)
++                if (r < 0)
+                         return error_origin(r);
+         }
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index 8b4101aaf..bad442776 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -11,6 +11,8 @@ SRC_URI += " file://0001-launch-improve-error-handling-for-opendir.patch"
 SRC_URI += " file://0002-metrics-change-the-constant-used-for-invalid-timesta.patch"
 SRC_URI += " file://0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch"
 SRC_URI += " file://0004-launcher-fix-build-with-musl-libc.patch"
+SRC_URI += " file://0005-launch-policy-fix-crash-when-importing-selinux.patch"
+SRC_URI += " file://0006-launch-policy-fix-crash-when-exporting-selinux.patch"
 SRC_URI[md5sum] = "a17886a92ab1e0bc2e4b1a274339e388"
 SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
-- 
2.20.1


