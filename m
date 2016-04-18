Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD176E666
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:34:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3IKYbgR023501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Apr 2016 13:34:37 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 13:34:36 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <joe_macdonald@mentor.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Apr 2016 16:34:36 -0400
Message-ID: <1461011676-31707-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: anders@chargestorm.se
Subject: [meta-networking][PATCH] dnsmasq: get systemd only working again
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
X-List-Received-Date: Mon, 18 Apr 2016 20:34:41 -0000
Content-Type: text/plain

The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
[dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
dnsmasq runtime. No sysvinit scripts are included in systemd only
builds (and should not be) and the dnsmasq executable has not moved to
/usr/sbin.

Reverting to the previous version of the systemd service file. If
folks want the local dnsmasq instance to be queried before going to
an external DNS they should add 'nameserver 127.0.0.1' to
/etc/resolv.conf. Or submit a change which will work with systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/files/dnsmasq.service | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
index c3637e1..549e15e 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
@@ -5,11 +5,8 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/dnsmasq.pid
-ExecStartPre=/usr/sbin/dnsmasq --test
-ExecStart=/etc/init.d/dnsmasq systemd-exec
-ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf
-ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
-ExecReload=/bin/kill -HUP $MAINPID
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecReload=/bin/kill -HUP $(/bin/cat /run/dnsmasq.pid)
 
 [Install]
 WantedBy=multi-user.target
-- 
2.1.4


