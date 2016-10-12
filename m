Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F681719C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 03:34:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C3YWa5006767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 20:34:33 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Tue, 11 Oct 2016 20:34:29 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Oct 2016 11:33:49 +0800
Message-ID: <20161012033349.12452-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-oe][PATCH] arptables: add the directory for default /etc/sysconfig/arptables
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
X-List-Received-Date: Wed, 12 Oct 2016 03:34:32 -0000
Content-Type: text/plain

Solve the potential issue for previous commit
<arptables: add arptables systemd service file>: in a small build where
/etc/sysconfig directory doesn't exist, the action of adding default
configuration file (/etc/sysconfig/arptables) will fail.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../recipes-support/arptables/arptables-0.0.3-4/arptables.service       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service
index fa64342..f9fd56d 100644
--- a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service
+++ b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service
@@ -5,7 +5,7 @@ Requires=network.target
 
 [Service]
 Type=oneshot
-ExecStartPre=/bin/sh -c "if [ ! -f /etc/sysconfig/arptables ]; then /usr/sbin/arptables-save > /etc/sysconfig/arptables; fi"
+ExecStartPre=/bin/sh -c "mkdir -p /etc/sysconfig; if [ ! -f /etc/sysconfig/arptables ]; then /usr/sbin/arptables-save > /etc/sysconfig/arptables; fi"
 ExecStart=/bin/sh -c "/usr/sbin/arptables-restore < /etc/sysconfig/arptables"
 ExecStartPost=/bin/sh -c "touch /var/lock/subsys/arptables"
 RemainAfterExit=yes
-- 
2.9.3


