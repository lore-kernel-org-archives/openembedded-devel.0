Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C80747D557
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 09:02:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,445,1549900800"; d="scan'208";a="62107077"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 May 2019 17:02:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 21A484CD617A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 17:02:09 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 8 May 2019 17:02:08 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 May 2019 17:03:05 +0800
Message-ID: <20190508090305.21149-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 21A484CD617A.A6434
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.19 -> 1.20
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
X-List-Received-Date: Wed, 08 May 2019 09:02:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libnet-dns-perl_1.19.bb to libnet-dns-perl_1.20.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libnet-dns-perl_1.19.bb => libnet-dns-perl_1.20.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.19.bb => libnet-dns-perl_1.20.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.19.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.20.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.19.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.20.bb
index b0be604f8..c37b40d7c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.19.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.20.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8a40402888487b853f861d21433f341a"
-SRC_URI[sha256sum] = "206278bdd9a538bec3e45b50e80cc5a9d7dc6e70ebf0889ef78254f0f710ccd7"
+SRC_URI[md5sum] = "565d3ae163591f3da7e1a20827b73c28"
+SRC_URI[sha256sum] = "7fd9692b687253baa8f2eb639f1dd7ff9c77fddd67167dc59b400bd25e4ce01b"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.20.1




