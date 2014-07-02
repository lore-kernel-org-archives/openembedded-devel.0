Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB8F65CB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:57:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626vuFA016291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:57:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:57:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:56:49 -0700
Message-ID: <1404284261-42377-23-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 22/74] rfkill: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:57:55 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index 62634c2..a9f523c 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
 PR = "r1"
 
-SRC_URI = "http://wireless.kernel.org/download/${PN}/${P}.tar.bz2 \
+SRC_URI = "http://wireless.kernel.org/download/${BPN}/${BP}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
            file://dont.call.git.rev-parse.on.parent.dir.patch"
 
-- 
1.7.9.5


