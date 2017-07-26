Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id A732871ABC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:34 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id q85so74329809pfq.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7wdcIQ0Iox7XvAzfWhPXuq1Ts+YPcKeSJzFOIQ3l5QM=;
	b=k77dprNGkRovvdmJPnn4wJBlQe5KsVd48Ps9Ff5rBls0dmcozu9z5pQ2U1+W9Vjf//
	hnaqNaGh91aBJJrXcgn0Wih8YRjwwzIRmtZz1vPlQhliiZGRvJdasTP7msguFuslQMWy
	farxMMIUSZKSPnkUCZw76R382RAwRJh3l0aFu/JiSRb6JvH13HsgD+Th4AvSpPSBH/Tv
	kmTzUmKu6kYMBIhL84tLH7YSn7qVDaWxLwrSL79pGev9s/aqU6MKpv+f0vRXQ0yhbTQo
	l6GXPomeCgL0eUZ/cl/ZssBL8cxQCIcoL1TRCQQAzVfmx7d1P86Ht/S/VRi87AP2Ri+u
	ynjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7wdcIQ0Iox7XvAzfWhPXuq1Ts+YPcKeSJzFOIQ3l5QM=;
	b=f0Tw42J3J8X95SEK1crtmDmenBhpzSO2j5ctvnh3OJfGzM0aLHTS/zTyNZEDX9bflB
	WT23tVMCHZUz1TdAXiL+KLc0mXIfN4UmqnKyv4tN+ih2cI2CRwkc93Fh0mTnqR/rTiGF
	Vnx98KIME2KQwpREzmDVrICB0os9OB98OFfJVkmQKCbq+flkuYUyruMNj0SPAbUXbD6z
	seTBFAcgqtrdGWdjXOCxaXDfEdCJ75gMLCkzp8hkMp74lAcKT+QVoiu75orbIjln9+iu
	kmcta/ilctRyx8XzdjuPy8bg3W4UREw5UwWOBTMsQ1M5BL0MxEZZ5hT6j//i4GnwGJdm
	eYyQ==
X-Gm-Message-State: AIVw110xuqjy7NS8xJvOrntiYVOU06PJMISgPLI/ZPRWfeRlHsPd7aWP
	O7LCmQ5+4ItT+Gmk
X-Received: by 10.98.74.141 with SMTP id c13mr1725005pfj.69.1501095515468;
	Wed, 26 Jul 2017 11:58:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:13 -0700
Message-Id: <20170726185815.8898-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170726185815.8898-1-raj.khem@gmail.com>
References: <20170726185815.8898-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] dbus-daemon-proxy: Fix return value from master_filter_cb()
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:34 -0000

Use github for SRC_URI
Reorder the linker flags so that we can remove disabling --as-needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch | 30 ++++++++++++++++++++++
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb |  8 +++---
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch b/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
new file mode 100644
index 000000000..2c4ca057f
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
@@ -0,0 +1,30 @@
+From 8e6d1f590b1cb437dc67c51298ef1722a7266d35 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 18:37:58 -0700
+Subject: [PATCH] dbus-daemon-proxy: Return DBUS_HANDLER_RESULT_NOT_YET_HANDLED
+ from master_filter_cb() if DBusConnection is null
+
+So it can be passed on to other handlers since this could
+not be handled here
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dbus-daemon-proxy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus-daemon-proxy.c b/dbus-daemon-proxy.c
+index 009e4fd..f3f0d80 100644
+--- a/dbus-daemon-proxy.c
++++ b/dbus-daemon-proxy.c
+@@ -115,7 +115,7 @@ master_filter_cb (DBusConnection *conn,
+   guint32 serial;
+ 
+   if (!dbus_conn)
+-    return;
++    DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
+ 
+   if (verbose)
+     g_print ("New message from server: type='%d' path='%s' iface='%s'"
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 4571b447f..42cd032c2 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -6,15 +6,15 @@ SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
 PV = "0.0.0+gitr${SRCPV}"
 PR = "r1.59"
 
-ASNEEDED_pn-dbus-daemon-proxy = ""
-
-SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy"
+SRC_URI = "git://github.com/alban/dbus-daemon-proxy \
+           file://0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch \
+           "
 S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
 do_compile() {
-    ${CC} ${LDFLAGS} `pkg-config --cflags --libs dbus-glib-1` -o dbus-daemon-proxy dbus-daemon-proxy.c
+    ${CC} ${CFLAGS} -o dbus-daemon-proxy dbus-daemon-proxy.c `pkg-config --cflags --libs dbus-glib-1` ${LDFLAGS}
 }
 
 do_install() {
-- 
2.13.3


