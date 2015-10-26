Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B162E6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 04:08:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102271197"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Oct 2015 12:10:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9Q47QZS012697
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 12:07:26 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 26 Oct 2015 12:07:58 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Oct 2015 12:07:42 +0800
Message-ID: <1445832462-1614-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-networking][PATCH] net-snmp: Modify snmpd.service
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
X-List-Received-Date: Mon, 26 Oct 2015 04:08:04 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

Add "-a" parameter in snmpd.service,it is needed to address logs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
index 3b336a0..447683f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
@@ -6,7 +6,7 @@ After=syslog.target network.target
 Type=notify
 Environment=OPTIONS="-Ls0-6d"
 EnvironmentFile=-/etc/default/snmpd
-ExecStart=/usr/sbin/snmpd $OPTIONS -f
+ExecStart=/usr/sbin/snmpd $OPTIONS -a -f
 ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
-- 
1.8.4.2


