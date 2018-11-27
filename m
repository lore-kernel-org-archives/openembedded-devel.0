Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B3FCC6D181
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:37:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR9bWTs020737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:37:32 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:37:31 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:37:14 +0800
Message-ID: <1543311437-292979-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
References: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/4] netcat-openbsd: upgrade to 1.195
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
X-List-Received-Date: Tue, 27 Nov 2018 09:37:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{netcat-openbsd_1.190.bb => netcat-openbsd_1.195.bb}     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.190.bb => netcat-openbsd_1.195.bb} (65%)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
similarity index 65%
rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
index defc05c..20ad43a 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
@@ -7,15 +7,15 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=f39e60ae4ea9fdb559c833be2e59de99
 DEPENDS += "glib-2.0 libbsd"
 do_patch[depends] = "quilt-native:do_populate_sysroot"
 
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/netcat-openbsd/1.190-2/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
-           https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/netcat-openbsd/1.190-2/netcat-openbsd_${PV}-2.debian.tar.xz;name=netcat-patch;subdir=${BP} \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20181022T085404Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
+           http://snapshot.debian.org/archive/debian/20181022T085404Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
            "
 
-SRC_URI[netcat.md5sum] = "dd32fd1d7903b541ad8709794539b959"
-SRC_URI[netcat.sha256sum] = "68ccc448392c05ec51baed0167a72b8c650454f990b895d6e6877d416a38e536"
-SRC_URI[netcat-patch.md5sum] = "78058b7af0170654b877b02c37716cdf"
-SRC_URI[netcat-patch.sha256sum] = "88088af3f520c7825e59bc133d65e70fc4a30139d451c6faabbd9f240bc78374"
+SRC_URI[netcat.md5sum] = "219d5e49c45658e229a3bda63063a986"
+SRC_URI[netcat.sha256sum] = "0e283b2a214313c69447cd962c528ac19afb3ddfe606b25de6d179f187cde4c3"
+SRC_URI[netcat-patch.md5sum] = "7eba241989dbef6caa78ec4bc8e35151"
+SRC_URI[netcat-patch.sha256sum] = "c6736fcbab5254cbbc52278993a951da1126e42800a297c27db297e332e2017e"
 
 inherit pkgconfig
 
-- 
2.7.4


