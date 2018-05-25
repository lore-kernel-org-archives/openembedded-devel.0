Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88BFF74A01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:55:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P7teUs010073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:55:40 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:55:40 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:45 +0800
Message-ID: <1527234893-8733-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 04/12] net-snmp: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 25 May 2018 07:55:39 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index faf73a5..6832b07 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -37,6 +37,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
+UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative
 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
-- 
2.7.4


