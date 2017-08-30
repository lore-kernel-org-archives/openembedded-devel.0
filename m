Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 115AD7833C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 09:40:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U9e0hi018475
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 02:40:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 Aug 2017 02:39:59 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Aug 2017 17:28:11 +0800
Message-ID: <20170830092811.25117-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netperf: upgrade to 2.7.0+ with git version
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
X-List-Received-Date: Wed, 30 Aug 2017 09:40:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The homepage of netperf has been moved to github. The original webpage
www.netperf.org is redirected to github and tarballs are removed. So use
git version of recipe instead.

netperf 2.7.0 was released in July 2015 which is too old. So upgrade to
latest commit of git repo which is on Nov 29, 2016.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../netperf/{netperf_2.6.0.bb => netperf_git.bb}             | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/netperf/{netperf_2.6.0.bb => netperf_git.bb} (89%)

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
similarity index 89%
rename from meta-networking/recipes-support/netperf/netperf_2.6.0.bb
rename to meta-networking/recipes-support/netperf/netperf_git.bb
index 650fdaeed..f0e0f9cf1 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -4,20 +4,20 @@ SECTION = "net"
 HOMEPAGE = "http://www.netperf.org/"
 LICENSE = "netperf"
 LICENSE_FLAGS = "non-commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
 
+PV = "2.7.0+git${SRCPV}"
 
-SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
+SRC_URI="git://github.com/HewlettPackard/netperf.git \
          file://cpu_set.patch \
          file://vfork.patch \
          file://init"
-SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
-SRC_URI[sha256sum] = "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
 
-inherit update-rc.d autotools
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/netperf-${PV}"
+inherit update-rc.d autotools
 
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
-- 
2.14.1


