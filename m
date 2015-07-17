Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5E1A73E3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:45:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98544983"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jul 2015 10:49:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6H2hqrx019904
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:43:52 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 17 Jul 2015 10:45:38 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 10:45:20 +0800
Message-ID: <1437101120-1624-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20150716185219.GD4432@mentor.com>
References: <20150716185219.GD4432@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for openhpi
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
X-List-Received-Date: Fri, 17 Jul 2015 02:45:41 -0000
Content-Type: text/plain

opensaf support for the HPI, So provide a PACKAGECONFIG option for openhpi

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index 3d0175e..6ad8a3d 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -36,6 +36,8 @@ USERADD_PARAM_${PN} =  "-r -g opensaf -d ${datadir}/opensaf/ -s ${sbindir}/nolog
 SYSTEMD_SERVICE_${PN} += "opensafd.service plmcboot.service plmcd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'openhpi', 'openhpi', '', d)}"
+PACKAGECONFIG[openhpi] = "--with-hpi-interface=B03 --enable-ais-plm,,openhpi"
 PACKAGECONFIG[systemd] = "--enable-systemd-daemon"
 
 do_configure_prepend () {
-- 
1.8.4.2


