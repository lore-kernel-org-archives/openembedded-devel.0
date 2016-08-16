Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2A587320F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:32:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7G9WuKN018472
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 02:32:57 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 16 Aug 2016 02:32:55 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 17:32:03 +0800
Message-ID: <1471339923-30097-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tnftp: tnftp20130505 -> tnftp20151004
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
X-List-Received-Date: Tue, 16 Aug 2016 09:32:57 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Upgrade tnftp from tnftp20130505 to tnftp20151004

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-support/tnftp/{tnftp_20130505.bb => tnftp_20151004.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tnftp/{tnftp_20130505.bb => tnftp_20151004.bb} (89%)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb b/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
similarity index 89%
rename from meta-networking/recipes-support/tnftp/tnftp_20130505.bb
rename to meta-networking/recipes-support/tnftp/tnftp_20151004.bb
index 7d1c515..4516345 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
@@ -29,8 +29,8 @@ ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
 FILES_${PN} = "${bindir}/tnftp"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
-SRC_URI[md5sum] = "66e218d02ec7d9fc39ab70ba2900305a"
-SRC_URI[sha256sum] = "6f650e25f6fd51538f677b789b49379f367ae9f1dee74c94cfe24d92abc2cffb"
+SRC_URI[md5sum] = "a49fbe752318d5a7893f900046ea00d5"
+SRC_URI[sha256sum] = "c94a8a49d3f4aec1965feea831d4d5bf6f90c65fd8381ee0863d11a5029a43a0"
 
 PACKAGECONFIG ?= "openssl"
 PACKAGECONFIG[openssl] = "--enable-ssl, --disable-ssl --with-ssl=no, openssl"
-- 
2.8.1


