Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA927E467
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:24:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8T3Oemh000594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 20:24:40 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 20:24:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 11:24:42 +0800
Message-ID: <8121dd1383d22906019e908a4f6ffd9578a53dcc.1569727253.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569727253.git.liezhi.yang@windriver.com>
References: <cover.1569727253.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] corosync: Fix PACKAGECONFIG flag for rdma
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
X-List-Received-Date: Sun, 29 Sep 2019 03:24:39 -0000
Content-Type: text/plain

Fixed:
PACKAGECONFIG_append_pn-corosync = ' rdma'

$ bitbake corosync
| configure: error: Package requirements (rdmacm) were not met:
|
| No package 'rdmacm' found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-extended/corosync/corosync_2.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
index 23a3d14..e2ab25b 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
@@ -36,7 +36,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
 PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
-PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
+PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma,librdmacm"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
 
-- 
2.7.4


