Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 271937F9A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 09:31:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAR9VhOJ018287
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 01:31:44 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 27 Nov 2019 01:31:43 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Nov 2019 01:31:42 -0800
Message-ID: <20191127093142.108012-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] syslog-ng: Fix multilib header conflict - syslog-ng-config.h
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
X-List-Received-Date: Wed, 27 Nov 2019 09:31:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 3aba4473d..8e5368953 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-inherit autotools gettext systemd pkgconfig update-rc.d
+inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
@@ -103,6 +103,8 @@ do_install_append() {
     else
         install ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
     fi
+
+    oe_multilib_header syslog-ng/syslog-ng-config.h
 }
 
 FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
-- 
2.23.0


