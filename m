Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1U673n-0005Di-Dk
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 23:14:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1ELvfbh015375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 13:57:41 -0800 (PST)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.318.4; Thu, 14 Feb 2013 13:57:39 -0800
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2013 16:51:04 -0500
Message-ID: <1360878665-17503-3-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360878665-17503-1-git-send-email-aws.ismail@windriver.com>
References: <1360878665-17503-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 2/3] netcat-openbsd: resolve multilib issues.
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
X-List-Received-Date: Thu, 14 Feb 2013 22:14:04 -0000
Content-Type: text/plain

Make recipe changes to enable successfull building
when multilib is being used.

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
---
 .../recipes-support/netcat/netcat-openbsd_1.89.bb  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
index 25cbfa6..00eec3e 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
@@ -2,7 +2,7 @@ require netcat.inc
 DESCRIPTION = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "glib-2.0"
 
@@ -14,7 +14,7 @@ SRC_URI[netcat.sha256sum] = "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4
 SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
 SRC_URI[netcat-patch.sha256sum] = "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
 
-S = "${WORKDIR}/${PN}-${PV}.orig"
+S = "${WORKDIR}/${BPN}-${PV}.orig"
 
 do_configure[noexec] = "1"
 
@@ -27,6 +27,6 @@ do_compile() {
 
 do_install() {
         install -d ${D}${bindir}
-        install -m 755 ${S}/nc ${D}${bindir}/nc.${PN}
+        install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
 }
 ALTERNATIVE_PRIORITY = "50"
-- 
1.7.0.4



