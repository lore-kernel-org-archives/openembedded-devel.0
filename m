Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGObE-00072P-Vd
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 07:59:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2F6g1lP007599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 23:42:01 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 23:42:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Mar 2013 14:41:55 +0800
Message-ID: <1363329716-14169-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
References: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-networking][PATCH 2/3] netcat: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 06:59:04 -0000
X-List-Received-Date: Fri, 15 Mar 2013 06:59:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/netcat/netcat_0.7.1.bb         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index 8dacdec..2d98122 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://netcat.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
            file://obsolete_autoconf_macros.patch \
@@ -17,6 +17,6 @@ inherit autotools
 
 do_install_append() {
         install -d ${D}${bindir}
-        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
+        mv ${D}${bindir}/nc ${D}${bindir}/nc.${BPN}
 }
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.4.1



