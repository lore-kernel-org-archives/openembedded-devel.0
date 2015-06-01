Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50FE66AC24
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 03:29:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t513TtBN016691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 20:29:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 31 May 2015 20:29:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jun 2015 11:23:57 +0800
Message-ID: <1433129037-23059-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] stunnel: upgrade to 5.17
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
X-List-Received-Date: Mon, 01 Jun 2015 03:29:58 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to include the fix for CVE-2015-3644:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3644

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/stunnel/{stunnel_5.10.bb => stunnel_5.17.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.10.bb => stunnel_5.17.bb} (82%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/meta-networking/recipes-support/stunnel/stunnel_5.17.bb
similarity index 82%
rename from meta-networking/recipes-support/stunnel/stunnel_5.10.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.17.bb
index 5753198..4cf529a 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.17.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} += "perl"
 
 SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "a0edda805eb7d6ea600a230fb0979ea1"
-SRC_URI[sha256sum] = "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423c6b13a61a7c92eb23"
+SRC_URI[md5sum] = "e70f001ee190105c5a10a74f4bd54901"
+SRC_URI[sha256sum] = "c3e79e582621a0827125e35e1c00450190104fc02dc3c5274cb02b05859fd472"
 
 inherit autotools
 
-- 
1.9.1


