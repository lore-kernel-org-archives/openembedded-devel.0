Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4F966004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 00:46:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5D0kVbT011794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 17:46:31 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 12 Jun 2014 17:46:28 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 08:46:11 +0800
Message-ID: <1402620392-7425-7-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
References: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/14] conntrack-tools: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 13 Jun 2014 00:46:30 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

It needs autotools-brokensep, otherwise do_install error:

install: cannot stat `doc/sync/ftfw/conntrackd.conf': No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
index 6a9c8a6..49ef073 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[tar.md5sum] = "ee737c774e01349f75e935228a2d851b"
 SRC_URI[tar.sha256sum] = "036b032a5c4d180aad686df21399d74506b9b3d3000794eb13ac313482e24896"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "conntrackd"
 
-- 
1.7.10.4


