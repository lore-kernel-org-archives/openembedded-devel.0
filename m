Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E41779C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 09:18:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U9It9c025817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 02:18:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 02:18:55 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 16:36:43 +0800
Message-ID: <20181030083643.23691-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-telnet: fix qa warnings of alternative target
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
X-List-Received-Date: Tue, 30 Oct 2018 09:18:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When build lib32-netkit-telnet that multilib is enabled, it shows qa
warnings of alternative target:

| WARNING: lib32-netkit-telnet-0.17-r0 do_package: netkit-telnet:
|   alternative target (/usr/bin/telnet or /usr/bin/telnet.netkit-telnet)
|   does not exist, skipping...
| WARNING: lib32-netkit-telnet-0.17-r0 do_package: netkit-telnet: NOT
|   adding alternative provide /usr/bin/telnet:
|   /usr/bin/telnet.netkit-telnet does not exist
| WARNING: lib32-netkit-telnet-0.17-r0 do_package: netkit-telnet: alt_link
|   == alt_target: /usr/bin/telnet == /usr/bin/telnet

Set ALTERNATIVE_TARGET to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 2fadf0334..de00ba928 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -55,6 +55,7 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "telnet"
 ALTERNATIVE_LINK_NAME[telnet] = "${bindir}/telnet"
+ALTERNATIVE_TARGET[telnet] = "${bindir}/telnet.${PN}"
 
 SRC_URI[md5sum] = "d6beabaaf53fe6e382c42ce3faa05a36"
 SRC_URI[sha256sum] = "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00"
-- 
2.18.0


