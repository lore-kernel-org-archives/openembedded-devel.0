Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 360E474F87
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 07:04:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40749066"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2018 15:04:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B0C954B41E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:04:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 5 Jun 2018 15:04:41 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 May 2018 14:55:12 -0700
Message-ID: <1527371712-739-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: B0C954B41E80.ACA48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] opensaf:Modified PACKAGECONFIG to fix the following error:
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
X-List-Received-Date: Tue, 05 Jun 2018 07:04:52 -0000
Content-Type: text/plain

| configure: error: Package requirements (libvirt) were not met:
|
| No package 'libvirt' found

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
index 4b556ce..ca0ae42 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
@@ -38,9 +38,10 @@ SYSTEMD_SERVICE_${PN} += "opensafd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 PACKAGECONFIG[systemd] = ",,systemd"
-PACKAGECONFIG[openhpi] = "--with-hpi-interface=B03 --enable-ais-plm,,openhpi"
+PACKAGECONFIG[openhpi] = "--with-hpi-interface=B03,,openhpi"
+PACKAGECONFIG[plm] = "--enable-ais-plm,--disable-ais-plm,libvirt openhpi"
 
-PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
 
 PKGLIBDIR="${libdir}"
 
-- 
1.9.1




