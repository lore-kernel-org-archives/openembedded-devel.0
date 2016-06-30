Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B76E60616
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 19:46:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5UJkgm6029837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 12:46:42 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 30 Jun 2016 12:46:42 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <liezhi.yang@windriver.com>, 
	<randy.macleod@windriver.com>
Date: Thu, 30 Jun 2016 12:46:42 -0700
Message-ID: <1467316002-12489-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] openconnect: PACKAGECONFIG certain dependencies
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
X-List-Received-Date: Thu, 30 Jun 2016 19:46:43 -0000
Content-Type: text/plain

Some items now in DEPENDS are configuration options,
so we create PACKAGECONFIG[] entries for them.

We do not select pcsc-lite by default because it is
GPLv3.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../openconnect/openconnect_git.bb                 |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
index 6d3c252..e81165c 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -2,8 +2,17 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-DEPENDS = "vpnc libxml2 gnutls lz4 krb5 libproxy pcsc-lite"
-RDEPENDS_${PN} = "vpnc"
+DEPENDS = "vpnc libxml2 krb5"
+
+PACKAGECONFIG ??= "gnutls lz4 libproxy"
+
+# config defaults
+PACKAGECONFIG[gnutls] = ",--without-gnutls,gnutls,"
+PACKAGECONFIG[lz4] = ",--without-lz4,lz4,"
+PACKAGECONFIG[libproxy] = ",--without-libproxy,libproxy,"
+
+# not config defaults
+PACKAGECONFIG[pcsc-lite] = ",--without-libpcsclite,pcsc-lite,"
 
 PV = "7.06"
 
-- 
1.7.9.5


