Return-Path: <phong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC037EE97
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2019 20:01:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x92K1fp5005483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Oct 2019 13:01:42 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 2 Oct 2019 13:01:41 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21010)	id 0B1621FF65;
	Wed,  2 Oct 2019 16:01:41 -0400 (EDT)
From: Peiran Hong <peiran.hong@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Oct 2019 16:01:10 -0400
Message-ID: <20191002200110.36242-1-peiran.hong@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] zabbix: upgrade 3.0.9 -> 4.2.6
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
X-List-Received-Date: Wed, 02 Oct 2019 20:01:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This update fixes the following CVEs:
    - CVE-2016-10742 (ZBX-13133, refer to 'Changes for 3.4.4rc1' in ChangeLog)

and addresses numerous bugs as well as improved frontend messaging
usage.

Added libevent, libpcre and zlib to DEPENDS as required dependency
to build 4.2.6.

Added --with-libpthread to EXTRA_OECONF as default configure option
since it is turned on by default in the new version.

There are also new optional features available in this update that
could be but are not yet added as PACKAGECONFIG.

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
---
 .../zabbix/{zabbix_3.0.9.bb => zabbix_4.2.6.bb}      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_3.0.9.bb => zabbix_4.2.6.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.6.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.2.6.bb
index bab5a6ae6..33c0a82b8 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.6.bb
@@ -19,7 +19,7 @@ HOMEPAGE = "http://www.zabbix.com/"
 SECTION = "Applications/Internet"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
-DEPENDS  = "openldap virtual/libiconv"
+DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "489d21b464277c0d412155c7e5611a8f"
-SRC_URI[sha256sum] = "4445f26c025009681c29c9b350aa6c4ee7b124ddcaf1609ae36c55997bcb8cf2"
+SRC_URI[md5sum] = "6cd55cd743d416d9ffbf2e6fdee680ee"
+SRC_URI[sha256sum] = "646b1f29a768e3123a00a9afadf382b4d0dfd54e20fb31023f0d6da066da0864"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
@@ -55,8 +55,12 @@ EXTRA_OECONF = " \
     --with-unixodbc \
     --with-ssh2 \
     --with-sqlite3 \
+    --with-zlib \
+    --with-libpthread \
+    --with-libevent \
+    --with-libpcre \
 "
-CFLAGS_append = " -lldap -llber"
+CFLAGS_append = " -lldap -llber -pthread"
 
 do_configure_prepend() {
     export KERNEL_VERSION="${KERNEL_VERSION}"
-- 
2.21.0


