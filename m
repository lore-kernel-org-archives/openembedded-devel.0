Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE8E605F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 02:46:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t142k5ia012892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Feb 2015 18:46:05 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 3 Feb 2015 18:46:04 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Feb 2015 10:45:59 +0800
Message-ID: <1423017959-7634-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-networking][PATCH] quagga: fix typo in systemd service file
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
X-List-Received-Date: Wed, 04 Feb 2015 02:46:16 -0000
Content-Type: text/plain

Fix typo in systemd service file ripngd.service.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-protocols/quagga/files/ripngd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service b/meta-networking/recipes-protocols/quagga/files/ripngd.service
index 936b81f..72562d5 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
@@ -1,4 +1,4 @@
-i[Unit]
+[Unit]
 Description=RIP routing daemon for IPv6
 BindTo=zebra.service
 After=zebra.service
-- 
2.1.1


