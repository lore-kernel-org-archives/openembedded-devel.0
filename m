Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA8179AFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 03:13:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA13DI1T004282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 20:13:18 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 31 Oct 2018 20:13:18 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Nov 2018 11:12:48 +0800
Message-ID: <1541041968-19942-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
References: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] vlan: update SRC_URI
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
X-List-Received-Date: Thu, 01 Nov 2018 03:13:17 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

tar on previous link checksum changed, so changed SRC_URI to
get previous tar

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 795c891..4c3d95b 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -4,7 +4,7 @@ SECTION = "misc"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://vconfig.c;beginline=1;endline=19;md5=094ca47de36c20c598b15b32c270ce0a"
 
-SRC_URI = "http://${BPN}.sourcearchive.com/downloads/${PV}-3ubuntu9/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/vlan/1.9-3ubuntu10.6/${BPN}_${PV}.orig.tar.gz \
            file://no-HOME-includes.patch \
            file://0001-Add-printf-format-and-silence-format-security-warnin.patch \
 "
-- 
2.7.4


