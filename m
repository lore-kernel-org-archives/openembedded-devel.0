Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3857D2D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2019 13:41:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x98DfcXk003936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Oct 2019 06:41:39 -0700 (PDT)
Received: from yow-tgamblin-wbox.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 8 Oct 2019 06:41:38 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Oct 2019 08:41:37 -0500
Message-ID: <20191008134137.16189-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] freeradius: add -latomic for armv5
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
X-List-Received-Date: Tue, 08 Oct 2019 13:41:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

freeradius fails to build for armv5:

| *** Warning: Linking the executable build/bin/local/radeapclient against the loadable module
| *** libfreeradius-server.so is not portable!
|
| *** Warning: Linking the executable build/bin/local/radeapclient against the loadable module
| *** libfreeradius-eap.so is not portable!
path -Wl,/yow-lpggp31/tgamblin/freeradius.build/tmp-glibc/work/armv5e-oe-linux-gnueabi/freeradius/3.0.19-r0/git/build/lib/local//.libs
/arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_compare_exchange_8'
/arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_load_8'
/arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_store_8'
| collect2: error: ld returned 1 exit status
| scripts/boiler.mk:630: recipe for target 'build/bin/local/radeapclient' failed

Explicitly link libatomic to fix the issue.
---
 .../recipes-connectivity/freeradius/freeradius_3.0.19.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
index ded1a67ff..9da15e07a 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
@@ -38,6 +38,7 @@ S = "${WORKDIR}/git"
 
 LDFLAGS_append_powerpc = " -latomic"
 LDFLAGS_append_mipsarch = " -latomic"
+LDFLAGS_append_armv5 = " -latomic"
 
 EXTRA_OECONF = " --enable-strict-dependencies \
         --with-docdir=${docdir}/freeradius-${PV} \
-- 
2.21.0


