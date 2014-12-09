Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6FFB60557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 02:33:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB92XgYm012957
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Dec 2014 18:33:42 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Dec 2014 18:33:41 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Dec 2014 21:33:40 -0500
Message-ID: <1418092420-22953-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rfkill: fix the SRC_URI
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
X-List-Received-Date: Tue, 09 Dec 2014 02:33:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It has been changed to:
http://www.kernel.org/pub/software/network/rfkill/

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index a9f523c..3b2943c 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
 PR = "r1"
 
-SRC_URI = "http://wireless.kernel.org/download/${BPN}/${BP}.tar.bz2 \
+SRC_URI = "http://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
            file://dont.call.git.rev-parse.on.parent.dir.patch"
 
-- 
2.0.0


