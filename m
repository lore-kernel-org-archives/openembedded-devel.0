Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1U5qEr-0002tW-Dd
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 05:16:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1E2HGjU029024
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 18:17:18 -0800 (PST)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 13 Feb 2013 18:17:15 -0800
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r1E2HCvL010795	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT);	Wed, 13 Feb 2013 21:17:12 -0500
Received: (from jch@localhost)	by schlepp.honig.net (8.14.4/8.14.4/Submit) id
	r1E2HC5m010794;	Wed, 13 Feb 2013 21:17:12 -0500
From: Jeffrey C Honig <jeffrey.honig@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Feb 2013 21:17:08 -0500
Message-ID: <1360808228-10746-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] multilib: Fix PN - BPN to make fetch work.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 04:16:37 -0000
Content-Type: text/plain

From: Randy MacLeod <Randy.MacLeod@windriver.com>

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel 20130208

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-httpd/hiawatha/hiawatha_8.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-httpd/hiawatha/hiawatha_8.6.bb b/recipes-httpd/hiawatha/hiawatha_8.6.bb
index 2e6955e..837354b 100644
--- a/recipes-httpd/hiawatha/hiawatha_8.6.bb
+++ b/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
+SRC_URI = "http://hiawatha-webserver.org/files/${BPN}-${PV}.tar.gz \
            file://hiawatha-init"
 
 SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
-- 
1.7.9.5



