Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5249F65CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 03:26:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9S3Pxi6003113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 20:26:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 20:25:59 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Oct 2014 11:27:34 +0800
Message-ID: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntp: make daemon run under ntp:ntp
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
X-List-Received-Date: Tue, 28 Oct 2014 03:26:05 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix the service so that the ntpd daemon is run under ntp:ntp.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp/ntpd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service b/meta-networking/recipes-support/ntp/ntp/ntpd.service
index b7c4268..0e3d7cd 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntpd.service
+++ b/meta-networking/recipes-support/ntp/ntp/ntpd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
-ExecStart=/usr/sbin/ntpd -p /run/ntpd.pid -g
+ExecStart=/usr/sbin/ntpd -u ntp:ntp -p /run/ntpd.pid -g
 
 [Install]
 WantedBy=multi-user.target
-- 
1.9.1


