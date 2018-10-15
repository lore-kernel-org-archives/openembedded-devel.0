Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7655F79A84
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:44:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9F8hfA7021086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 01:44:12 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 01:43:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Oct 2018 16:30:17 +0800
Message-ID: <1539592217-24508-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] keepalived: remove update-rc.d settings
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
X-List-Received-Date: Mon, 15 Oct 2018 08:44:21 -0000
Content-Type: text/plain

The recipe wants to install a script under init.d but does not
want to it be started by default. It did so by inheriting update-rc.d
and setting INITSCRIPT_PARAMS to "remove". This is not correct.
We could just not inherit 'update-rc.d' to achieve such effect.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
index 36417b7..31c50ff 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "4e2d7cc01a6ee29a3955f5c622d47704ba7d9dd758189f15e9def016a2
 
 DEPENDS = "libnfnetlink openssl"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd
 
 PACKAGECONFIG ??= "libnl snmp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
@@ -41,8 +41,5 @@ do_install_append() {
 
 FILES_${PN} += "${datadir}/snmp/mibs/KEEPALIVED-MIB.txt"
 
-INITSCRIPT_NAME = "keepalived"
-INITSCRIPT_PARAMS = "remove"
-
 SYSTEMD_SERVICE_${PN} = "keepalived.service"
 SYSTEMD_AUTO_ENABLE ?= "disable"
-- 
2.7.4


