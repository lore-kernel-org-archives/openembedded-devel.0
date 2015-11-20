Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E81D602D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:05:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKA5F78023100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:05:15 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 02:05:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 02:05:08 -0800
Message-ID: <f3454647898cfda69231e31aec1b8b4b684d801b.1448012203.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448012203.git.liezhi.yang@windriver.com>
References: <cover.1448012203.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] lldpad: fix installed-vs-shipped
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
X-List-Received-Date: Fri, 20 Nov 2015 10:05:15 -0000
Content-Type: text/plain

Fixed when multilib:
lldpad-0.9.46: lldpad: Files/directories were installed but not shipped in any package:
  /usr/lib
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lldpad: 1 installed and not shipped files. [installed-vs-shipped]

This is because /usr/lib/systemd has been moved, but /usr/lib was left
in multilib, use "rmdir -p" to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-daemons/lldpad/lldpad_0.9.46.bb        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
index b191df5..b66344f 100644
--- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
+++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
@@ -23,7 +23,7 @@ do_configure_prepend() {
 do_install_append () {
     install -m 0755 -d ${D}${systemd_unitdir}
     mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
-    rmdir ${D}${prefix}${systemd_unitdir}
+    rmdir -p --ignore-fail-on-non-empty ${D}${prefix}${systemd_unitdir}
 }
 
 FILES_${PN} += "${systemd_unitdir}"
-- 
1.7.9.5


