Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A99365E54
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:54:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A2skW4025102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 19:54:46 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 9 Apr 2014 19:54:46 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 10:54:35 +0800
Message-ID: <1397098475-17901-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
References: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/3] smartmontools: add PACKAGECONFIG and runtime dependency
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
X-List-Received-Date: Thu, 10 Apr 2014 02:54:45 -0000
Content-Type: text/plain

Add PACKAGECONFIGs libcap-ng and selinux for smartmontools. And add
runtime dependency.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
index 66fdb4d..9b9454c 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
@@ -16,6 +16,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://initd.smartd \
           "
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                  "
+PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
+PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
+
 SRC_URI[md5sum] = "d44f84081a12cef79cd17f78044351fc"
 SRC_URI[sha256sum] = "486f660579bb0fb4f6b927ded7531cb1f99685c666397377761c5b04dd96065b"
 
@@ -29,3 +35,5 @@ do_install_append () {
 
 INITSCRIPT_NAME = "smartd"
 INITSCRIPT_PARAMS = "start 60 . stop 60 0 1 2 3 4 5 6 ."
+
+RDEPENDS_${PN} += "mailx"
-- 
1.8.4


