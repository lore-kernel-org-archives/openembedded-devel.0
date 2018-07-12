Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B51F876074
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 07:38:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6C7cqlR029698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 00:38:53 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 12 Jul 2018 00:38:52 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Jul 2018 15:38:50 +0800
Message-ID: <1531381130-17517-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] openhpi: close socket in saHpiSessionClose
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
X-List-Received-Date: Thu, 12 Jul 2018 07:38:53 -0000
Content-Type: text/plain

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Upstream issue: https://github.com/open-hpi/openhpi/issues/1918

The saHpiSessionClose doesn't close the socket and leaks the file
descriptor.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openhpi/files/0001-session-close-socket.patch  | 37 ++++++++++++++++++++++
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-session-close-socket.patch

diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-session-close-socket.patch b/meta-networking/recipes-daemons/openhpi/files/0001-session-close-socket.patch
new file mode 100644
index 0000000..2cefd55
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/0001-session-close-socket.patch
@@ -0,0 +1,37 @@
+From b8bc6bfdb5e7fb5b46d3a830e04632939bee6b98 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 9 Feb 2018 16:35:11 +0200
+Subject: [PATCH] saHpiSessionClose: close socket
+
+saHpiSessionClose leaks file descriptors
+
+Upstream issue: https://github.com/open-hpi/openhpi/issues/1918
+
+Upstream-Status: Pending
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ baselib/session.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/baselib/session.cpp b/baselib/session.cpp
+index c5edfc8..4ece1b7 100644
+--- a/baselib/session.cpp
++++ b/baselib/session.cpp
+@@ -126,6 +126,12 @@ cSession::cSession()
+ 
+ cSession::~cSession()
+ {
++	cClientStreamSock * sock;
++	gpointer ptr = wrap_g_static_private_get( &m_sockets );
++	if ( ptr ) {
++	    sock = reinterpret_cast<cClientStreamSock *>(ptr);
++	    sock->Close();
++	}
+     wrap_g_static_private_free( &m_sockets );
+ }
+ 
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
index ecf71d7..596578e 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://fix-narrowing-warning.patch \
            file://0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch \
            file://0001-ipmidirect-Replace-__STRING.patch \
+           file://0001-session-close-socket.patch \
            "
 
 SRC_URI[md5sum] = "4718b16e0f749b5ad214a9b04f45dd23"
-- 
2.7.4


