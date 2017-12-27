Return-Path: <xiao.zhang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89D1671B2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 09:01:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBR90vDu024861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 01:01:00 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 27 Dec 2017 01:00:56 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Dec 2017 01:00:55 -0800
Message-ID: <20171227090055.101755-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [oc-core][PATCH] libnfsidmap: Set the path of plugin libraries
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
X-List-Received-Date: Wed, 27 Dec 2017 09:01:00 -0000
Content-Type: text/plain

By default, plugin libraries wil be installed in
$(libdir)/libnfsidmap in build stage while in run time,
they will be looked in /usr/lib/libnfsidmap. This will cause
error in 64 bits systems. Add a configure option to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index 2565771006..28c670d6d0 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap
 
 inherit autotools
 
-EXTRA_OECONF = "--disable-ldap"
+EXTRA_OECONF = "--disable-ldap --with-pluginpath=${libdir}/libnfsidmap"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/
-- 
2.11.0


