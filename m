Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C34597C434
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 08:02:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5682deH027739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Jun 2019 01:02:50 -0700
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 6 Jun 2019 01:02:29 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Jun 2019 11:02:26 +0300
Message-ID: <20190606080226.26730-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsprogs: Fix host contamination
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
X-List-Received-Date: Thu, 06 Jun 2019 08:02:59 -0000
Content-Type: text/plain

Currently, the following symbolic links point to the host:
$ cd xfsprogs/4.18.0-r0/image
$ find . -type l -iname "lib*" -ls
./usr/lib/libhandle.so -> /lib/libhandle.so
./lib/libhandle.a -> /usr/lib/libhandle.a

This causes a build failure if the files already exist on the host:
ERROR: xfsprogs-4.18.0-r0 do_package_write_rpm: Function failed: BUILDSPEC
...
| NOTE: Creating RPM package for xfsprogs-fsck
| NOTE: Creating RPM package for xfsprogs-mkfs
| NOTE: Creating RPM package for xfsprogs-repair
| NOTE: Creating RPM package for libhandle1
| NOTE: Creating RPM package for xfsprogs-dbg
| NOTE: Creating RPM package for xfsprogs-staticdev
| NOTE: Creating RPM package for libhandle1
| NOTE: Creating RPM package for xfsprogs-doc
| NOTE: Not creating empty RPM package for xfsprogs-locale
| NOTE: Creating RPM package for xfsprogs
| NOTE: Creating RPM package for xfsprogs
| error: line 175: %package -n libhandle1: package libhandle1 already exists
...

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
index 0a1bacb93..59c67fda6 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
@@ -65,4 +65,7 @@ do_install_append() {
         oe_runmake 'DESTDIR=${D}' install-dev
         rm ${D}${libdir}/*.la
         rmdir --ignore-fail-on-non-empty ${D}${libdir}
+
+        ln -sf -r ${D}${libdir}/libhandle.a ${D}${base_libdir}/libhandle.a
+        ln -sf -r ${D}${base_libdir}/libhandle.so ${D}${libdir}/libhandle.so
 }
-- 
2.18.1


