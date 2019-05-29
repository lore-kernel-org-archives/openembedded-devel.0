Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7985A7D25F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 07:47:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T7lL4i011901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 00:47:21 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 00:47:20 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 May 2019 15:47:19 +0800
Message-ID: <1559116039-168682-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-telnet: add rconflicts
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
X-List-Received-Date: Wed, 29 May 2019 07:47:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:

file /etc/xinetd.d/telnet conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586
file /usr/sbin/in.telnetd conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index db4b1c9..4b035af 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -63,3 +63,4 @@ FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
 
 # http://errors.yoctoproject.org/Errors/Details/186954/
 EXCLUDE_FROM_WORLD_libc-musl = "1"
+RCONFLICTS_${PN} = "inetutils-telnetd"
-- 
2.7.4


