Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93EED6ACEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:58:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626wgGr016881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:58:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:58:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:57:31 -0700
Message-ID: <1404284261-42377-65-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 64/74] p11-kit: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:58:40 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
index 67c2c00..e0ebe7d 100644
--- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
+++ b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
@@ -6,7 +6,7 @@ inherit autotools gettext pkgconfig
 
 DEPENDS = "libtasn1 libffi"
 
-SRC_URI = "http://p11-glue.freedesktop.org/releases/${PN}-${PV}.tar.gz"
+SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
 SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
 
-- 
1.7.9.5


