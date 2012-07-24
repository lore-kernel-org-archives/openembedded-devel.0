Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1StYEb-0000RK-2A
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 08:04:41 +0200
Received: from gandalf.denix.org ([unknown] [96.240.136.247])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M7N00AEKEW57V32@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	23 Jul 2012 23:52:58 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1FAD32016B; Tue,
	24 Jul 2012 00:52:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 00:52:29 -0400
Message-id: <d4f5768ba2b31e47973535b522cbc4e43f8170ce.1343104879.git.denys@ti.com>
X-Mailer: git-send-email 1.7.8.6
In-reply-to: <cover.1343104879.git.denys@ti.com>
References: <cover.1343104879.git.denys@ti.com>
In-reply-to: <cover.1343104879.git.denys@ti.com>
References: <cover.1343104879.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [2011.03-maintenance][PATCH 1/1] opkg-utils: bump SRCREV to pick up subprocess.check_output fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 06:04:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

There were few breakages related to subprocess.check_output() with Python
versions prior to 2.7 (although I had them even with 2.7.3), most notably
in opkg-make-index:

Log data follows:
| + do_package_update_index_ipk
| + set -x
| + ipkgarchs='all any noarch arm  armv4 armv4t armv5te armv6 armv7 armv7a am37x-evm'
| + '[' '!' -z '' ']'
| + mkdir -p /OE/deploy/glibc/ipk
| + touch /OE/deploy/glibc/ipk/Packages
| + opkg-make-index -r /OE/deploy/glibc/ipk/Packages -p /OE/deploy/glibc/ipk/Packages -l /OE/deploy/glibc/ipk/Packages.filelist -m /OE/deploy/glibc/ipk
| Traceback (most recent call last):
|   File "/OE/sysroots/x86_64-linux/usr/bin/opkg-make-index", line 189, in <module>
|     rc = subprocess.check_output(gzip_cmd, shell=True)
| AttributeError: 'module' object has no attribute 'check_output'
NOTE: package my-image-1.0-r0: task do_package_update_index_ipk: Failed

The following fixes are required:
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=423ecd36b4782327c16f516885d1248249c7724a
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=49cc783d8e0415059d126ae22c892988717ffda7

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
index 997b292..a9c9803 100644
--- a/recipes/opkg-utils/opkg-utils_git.bb
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
 PV = "0.1.8+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.8.6



