Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8837F8C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 06:04:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAM641pj025127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 22:04:01 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 21 Nov 2019 22:03:54 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Nov 2019 14:03:53 +0800
Message-ID: <1574402633-254634-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dnsmasq.conf: fix dnsmasq path
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
X-List-Received-Date: Fri, 22 Nov 2019 06:04:00 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

we install dnsmasq under /usr/bin by default, correct
the path in comments.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
index 9e5ab9f..2897b90 100755
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
@@ -2,7 +2,7 @@
 #
 # Format is one option per line, legal options are the same
 # as the long options legal on the command line. See
-# "/usr/sbin/dnsmasq --help" or "man 8 dnsmasq" for details.
+# "/usr/bin/dnsmasq --help" or "man 8 dnsmasq" for details.
 
 # Listen on this specific port instead of the standard DNS port
 # (53). Setting this to zero completely disables DNS function,
-- 
2.7.4


