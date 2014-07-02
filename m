Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF666028A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 02:34:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s622YqH7012233
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 19:34:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 19:34:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 19:34:52 -0700
Message-ID: <1404268492-3769-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking] [PATCH] memcached: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 02:34:58 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/memcached/memcached_1.4.17.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
index 6a01ec2..8ad264f 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
@@ -17,7 +17,7 @@ inherit autotools
 DEPENDS += "libevent"
 RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
 
-SRC_URI = "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.memcached.org/files/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
 SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
-- 
1.7.9.5


