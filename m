Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90D6C65D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:25:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6P3od024877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:25:03 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 20 Apr 2014 23:25:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 14:24:49 +0800
Message-ID: <1398061492-31615-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
References: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/4] radvd.init: fix path to radvd.conf sample
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
X-List-Received-Date: Mon, 21 Apr 2014 06:25:04 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Correct the information that printed by radvd initscript.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/radvd/files/radvd.init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.init b/meta-networking/recipes-daemons/radvd/files/radvd.init
index 5295292..8b26317 100755
--- a/meta-networking/recipes-daemons/radvd/files/radvd.init
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.init
@@ -64,7 +64,7 @@ chkconfig() {
     if [ ! -e $CONFIG -o ! -s $CONFIG ]; then
         echo ""
 	echo "* $CONFIG does not exist or is empty." 
-	echo "* See /usr/share/doc/radvd/examples/simple-radvd.conf for a simple"
+	echo "* See /usr/share/doc/radvd/radvd.conf.example for a simple"
 	echo "* configuration suitable for most systems, and radvd.conf(5)"
 	echo "* for configuration file syntax. radvd will *not* be started."
 	exit 0
-- 
1.8.4


