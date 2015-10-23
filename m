Return-Path: <Liezhi.Yang@windriver.com>
X-Greylist: delayed 1123 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Oct 2015 08:19:39 UTC
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 97CEF60034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9N80vZj025616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 01:00:57 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 01:00:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Oct 2015 01:00:56 -0700
Message-ID: <1445587256-2553-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netcat: add DESCRIPTION
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2015 08:19:41 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat.inc      | 10 ++++++++++
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb |  2 --
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-networking/recipes-support/netcat/netcat.inc
index 9cb243d..91a24a1 100644
--- a/meta-networking/recipes-support/netcat/netcat.inc
+++ b/meta-networking/recipes-support/netcat/netcat.inc
@@ -1,3 +1,13 @@
+SUMMARY = "GNU Netcat"
+HOMEPAGE = "http://netcat.sourceforge.net"
+DESCRIPTION = "A simple Unix utility which reads and writes data across network \
+connections using TCP or UDP protocol.  It is designed to be a reliable \
+'back-end' tool that can be used directly or easily driven by other \
+programs and scripts. At the same time it is a feature-rich network \
+debugging and exploration tool, since it can create almost any kind of \
+connection you would need and has several interesting built-in \
+capabilities."
+
 SECTION = "net"
 inherit update-alternatives gettext
 
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index 8710c36..d961af5 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -1,6 +1,4 @@
 require netcat.inc
-SUMMARY = "GNU Netcat"
-HOMEPAGE = "http://netcat.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
2.0.1


