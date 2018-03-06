Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B90178821
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 05:31:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w265Vq3m027687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Mar 2018 21:31:52 -0800
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.163.239) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.361.1; Mon, 5 Mar 2018 21:31:14 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Mar 2018 13:27:05 +0800
Message-ID: <20180306052705.25440-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.163.239]
Subject: [meta-oe][PATCH] eventlog: change SRC_URI because of invalid old address
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
X-List-Received-Date: Tue, 06 Mar 2018 05:31:52 -0000
Content-Type: text/plain

The SRC_URI is too old to be valid, so update it.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
index 59b01b6..13eb794 100644
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
@@ -13,7 +13,7 @@ DESCRIPTION = "The EventLog library aims to be a replacement of the \
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
 
-SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/${BPN}_${PV}.tar.gz"
+SRC_URI = "https://www.balabit.com/downloads/syslog-ng/open-source-edition/3.4.2/source/${BPN}_${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-- 
2.9.3


