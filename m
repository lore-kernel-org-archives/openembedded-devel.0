Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A72E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 05:59:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9E5xOGF010198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 22:59:24 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 13 Oct 2019 22:59:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Oct 2019 13:59:22 +0800
Message-ID: <1571032762-206643-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] kea: fix kea-dhcp4.service/kea-dhcp6.service start up failed
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
X-List-Received-Date: Mon, 14 Oct 2019 05:59:23 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

After upgrade to 1.7.0, path of database file changed from
/var/kea to /var/lib/kea, correct the path to fix service
start failed problem

DHCP6_CONFIG_LOAD_FAIL configuration error using file:
/etc/kea/kea-dhcp6.conf, reason: Unable to open database:
unable to open '/var/lib/kea/kea-leases6.csv'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service | 2 +-
 meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
index f32edcb..b851ea7 100644
--- a/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -6,7 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
 [Install]
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
index 26d2205..0f9f0ef 100644
--- a/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -6,7 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
 [Install]
-- 
2.7.4


