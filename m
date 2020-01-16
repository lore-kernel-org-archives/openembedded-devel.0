Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 883D77F88B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 07:44:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,325,1574092800"; d="scan'208";a="81958337"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2020 15:44:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CC8224CE20C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 15:35:34 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 16 Jan 2020 15:44:40 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 16 Jan 2020 15:44:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 15:46:07 +0800
Message-ID: <20200116074607.21509-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CC8224CE20C6.A90F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] zabbix: modify service file
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
X-List-Received-Date: Thu, 16 Jan 2020 07:44:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Fixed a bug that could not exit the service normally.
When using systemd to exit the service, the child process cannot be terminated normally. Refer to the style of fedora to modify it.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/zabbix/zabbix/zabbix-agent.service  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service b/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service
index b18a96f8b..56e506428 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service
@@ -3,9 +3,8 @@ Description=Zabbix Monitor Agent
 After=syslog.target network.target
 
 [Service]
-Type=oneshot
-ExecStart=@SBINDIR@/zabbix_agentd
-RemainAfterExit=yes
+Type=simple
+ExecStart=@SBINDIR@/zabbix_agentd -f
 User=zabbix
 
 [Install]
-- 
2.20.1




