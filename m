Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 856E77827F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:40:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v596ebwg009100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:40:37 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:40:36 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:40:30 +0800
Message-ID: <02236121048c01c4fc7867bcf65387817e1c1f05.1496990155.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496990155.git.jackie.huang@windriver.com>
References: <cover.1496990155.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] agent-proxy: add new recipe
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
X-List-Received-Date: Fri, 09 Jun 2017 06:40:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

agent-proxy is a simple, small proxy which is intended
for use with kgdb, or gdbserver type connections where
you want to share a text console and a debug session.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-kernel/agent-proxy/agent-proxy_git.bb  | 25 +++++++++++++
 .../files/0001-Makefile-Add-LDFLAGS-variable.patch | 43 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb
 create mode 100644 meta-oe/recipes-kernel/agent-proxy/files/0001-Makefile-Add-LDFLAGS-variable.patch

diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb
new file mode 100644
index 000000000..8e370f962
--- /dev/null
+++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Proxy for UDP/TCP debug connections"
+DESCRIPTION = "The agent-proxy will forward tcp or udp connections as well as allow for script multiplexing of terminal sessions."
+HOMEPAGE = "http://kgdb.wiki.kernel.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SECTION = "devel"
+
+EXTRA_OEMAKE = "'CC=${CC}'"
+
+SRCREV = "e6c9d3d996bd55e7ab14dbd74deb7841e0c3a4f1"
+PV = "1.96+git${SRCPV}"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git;protocol=git \
+           file://0001-Makefile-Add-LDFLAGS-variable.patch \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 agent-proxy ${D}${bindir}
+}
diff --git a/meta-oe/recipes-kernel/agent-proxy/files/0001-Makefile-Add-LDFLAGS-variable.patch b/meta-oe/recipes-kernel/agent-proxy/files/0001-Makefile-Add-LDFLAGS-variable.patch
new file mode 100644
index 000000000..5eec91d72
--- /dev/null
+++ b/meta-oe/recipes-kernel/agent-proxy/files/0001-Makefile-Add-LDFLAGS-variable.patch
@@ -0,0 +1,43 @@
+From 1beb0dad6f8b99eb3bf1b9982e0b49e81ff77bbc Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 23 Nov 2016 19:17:31 +0800
+Subject: [PATCH] Makefile: Add LDFLAGS variable
+
+Add LDFLAGS variable to make sure the extra linkder
+flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e20918f..25d92d3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -51,7 +51,7 @@ $(CROSS_COMPILE)agent-proxy: $(OBJS)
+ 	$(CC) -DAGENT_VER=$(AGENTVER) $(LINKFLAGS) $(CFLAGS) -o $(extpath)$@ $(OBJS) wsock32.lib
+ else
+ $(CROSS_COMPILE)agent-proxy: $(OBJS)
+-	$(CC) -DAGENT_VER=$(AGENTVER) $(CFLAGS) -o $(extpath)$@ $(OBJS) $(LDLIBS)
++	$(CC) -DAGENT_VER=$(AGENTVER) $(CFLAGS) $(LDFLAGS) -o $(extpath)$@ $(OBJS) $(LDLIBS)
+ endif
+ 
+ 
+@@ -61,9 +61,9 @@ clean:
+ 	rm -f $(extpath)$(CROSS_COMPILE)agent-proxy $(extpath)agent-proxy $(extpath)*.o $(extpath)*.obj $(extpath)*.exp $(extpath)*.exe $(extpath)*.ilk $(extpath)*.pdb *~
+ 
+ $(extpath)$(CROSS_COMPILE)%.o::%.c
+-	$(CC) -DAGENT_VER=$(AGENTVER) $(CFLAGS) -c $< -o $@
++	$(CC) -DAGENT_VER=$(AGENTVER) $(CFLAGS) $(LDFLAGS) -c $< -o $@
+ 
+ $(extpath)%.obj:%.c
+-	$(CC) -DAGENT_VER=$(AGENTVER) $(CFLAGS) -c -Fo$@ $(TLSPATH_INC) $<
++	$(CC) -DAGENT_VER=$(AGENTVER) $(CFLAGS) $(LDFLAGS) -c -Fo$@ $(TLSPATH_INC) $<
+ 
+ 
+-- 
+2.8.3
+
-- 
2.11.0


