Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1U19iz-0004gk-1N
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 07:03:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r115m0D7006757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 21:48:00 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 31 Jan 2013 21:47:59 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2013 13:47:58 +0800
Message-ID: <1359697678-31822-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3825>
References: <3825>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] When do_compile, netcat-openbsd needs the dependence of glib-2.0.
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
X-List-Received-Date: Fri, 01 Feb 2013 06:03:46 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
index f83caee..25cbfa6 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
@@ -2,7 +2,9 @@ require netcat.inc
 DESCRIPTION = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
-PR = "r0"
+PR = "r1"
+
+DEPENDS += "glib-2.0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat \
            ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
-- 
1.7.11



