Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5666B606E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 01:43:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57359466"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Feb 2015 09:40:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1A1h70p026636
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 09:43:07 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 10 Feb 2015 09:43:54 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 09:38:52 +0800
Message-ID: <1423532332-48457-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH] snmpd: instead option -LS by -Ls
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
X-List-Received-Date: Tue, 10 Feb 2015 01:43:57 -0000
Content-Type: text/plain

Option -LS does not work, we should instead it by -Ls as usage said.

 Deprecated options:
   -l FILE               use -Lf <FILE> instead
   -P                    use -p instead
   -s                    use -Lsd instead
   -S d|i|0-7            use -Ls <facility> instead

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
index 10a1eb2..3b336a0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 
 [Service]
 Type=notify
-Environment=OPTIONS="-LS0-6d"
+Environment=OPTIONS="-Ls0-6d"
 EnvironmentFile=-/etc/default/snmpd
 ExecStart=/usr/sbin/snmpd $OPTIONS -f
 ExecReload=/bin/kill -HUP $MAINPID
-- 
1.9.1


