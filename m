Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 798147F30F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=RbeXFXOhZDb6oXSmksw6sA+C5zlKTlt3rjHlo0bkAMk=; 
	b=fE7br6UM2A7ZxqnZAklo9uKc389hBXGlHSfftx+ijVAAdVP2bBL2hnMgQliqsSlItaPFXcnrGnif7N5/yaoDCxxyw8oYlJcH/gzn0CMAbiaqHqlaPhCC7x99okm89ClFol0MrwK4c+nbM8TKh/CTDj9Tgf6MFmLZv9mLCEfG7Ue1xCDjFV0M1GVplJZFQvaNhTNaYXK+QSmBNvRgriIoQHKkNtkLtH1D5Y3KXDlHIaqtcp5J0cxO4HPdAM9wXzADNqNiIvZUcpccoqjnytpg+odcugqgIfhlxPPYglIB9pDlfyFzHMKXsrq6ofwKmFmoe0A89bhYJsJ5pgwD3Kj7qw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1htTHC-0001lC-9Q
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 10:51:02 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 10:50:31 +0200
Message-Id: <20190802085032.32687-9-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190802085032.32687-1-psaavedra@igalia.com>
References: <20190802085032.32687-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v6 09/10] ibus-table: Fix SRC_URI format
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
X-List-Received-Date: Fri, 02 Aug 2019 08:51:01 -0000

---
 meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb b/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb
index faa331031..30a4c5eaf 100644
--- a/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb
+++ b/meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 SECTION = "inputmethods"
 
-SRC_URI = "https://github.com/kaio/${PN}/releases/download/${PV}/${PN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/kaio/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.gz \
           "
 SRC_URI[md5sum] = "1f7b3fab7271e409c9ef4c43f5c3fc78"
 SRC_URI[sha256sum] = "017bcd1cb9f5a79df46d1e4ac28f166ce2338938a2037ebe86783da0abca0c24"
-- 
2.11.0


