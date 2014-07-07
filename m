Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15AFA7025A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:03:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s67A3eRQ027091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jul 2014 03:03:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 03:03:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Jul 2014 03:03:38 -0700
Message-ID: <1404727418-20199-4-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
References: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking] [PATCH 3/3] meta-networking: fix no newline at end of file
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
X-List-Received-Date: Mon, 07 Jul 2014 10:03:40 -0000
Content-Type: text/plain

Add a '\n' to the last line of the file to fix:

No newline at end of file

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../quagga/files/volatiles.03_quagga               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga b/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
index cfb896a..1f28c0b 100644
--- a/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
+++ b/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
@@ -1,3 +1,3 @@
 # <type> <owner> <group> <mode> <path> <linksource>
 d quagga quagga 0755 /var/run/quagga none
-d quagga quagga 0755 /var/log/quagga none
\ No newline at end of file
+d quagga quagga 0755 /var/log/quagga none
-- 
1.7.9.5


