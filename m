Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62ADE60809
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 06:02:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8U62oIU009540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 23:02:50 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Sep 2014 23:02:50 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Sep 2014 02:02:47 -0400
Message-ID: <a28a68062d37967e63ba90bcf1c6245c561d0a5e.1412056597.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412056597.git.wenzong.fan@windriver.com>
References: <cover.1412056597.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-oe] rsnapshot: add new package
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
X-List-Received-Date: Tue, 30 Sep 2014 06:02:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

rsnapshot is a filesystem snapshot utility based on rsync.

rsnapshot makes it easy to make periodic snapshots of local machines,
and remote machines over ssh. The code makes extensive use of hard links
whenever possible, to greatly reduce the disk space required.

Homepage: http://www.rsnapshot.org/

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
new file mode 100644
index 0000000..afd3678
--- /dev/null
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "A filesystem snapshot utility based on rsync"
+HOMEPAGE = "http://www.rsnapshot.org"
+BUGTRACKER = "https://sourceforge.net/projects/rsnapshot/"
+SECTION = "console/network"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+RDEPENDS_${PN} = "rsync \
+                  perl \
+                  perl-module-dirhandle \
+                  perl-module-cwd \
+                  perl-module-getopt-std \
+                  perl-module-file-path \
+                  perl-module-file-stat \
+                  perl-module-posix \
+                  perl-module-fcntl \
+                  perl-module-io-file \
+                  perl-module-constant \
+                  perl-module-overloading \
+                 "
+
+SRCREV = "1047cbb57937c29233388e2fcd847fecd3babe74"
+PV = "1.3.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+PACKAGECONFIG ??= "logger"
+PACKAGECONFIG[logger] = "--with-logger=${bindir}/logger,--without-logger,,util-linux"
-- 
1.7.9.5


