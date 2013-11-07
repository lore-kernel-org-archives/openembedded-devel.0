Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 653806D552
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 02:10:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA72Aqlj020929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Nov 2013 18:10:52 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 6 Nov 2013 18:10:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2013 10:10:47 +0800
Message-ID: <938ba7c6374320f101e870e1c5e97d51f1252875.1383789890.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383789890.git.hongxu.jia@windriver.com>
References: <cover.1383789890.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] accel-ppp: fix qa issue 'found library in wrong location' while multilib enabled on qemux86-64
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
X-List-Received-Date: Thu, 07 Nov 2013 02:10:51 -0000
Content-Type: text/plain

While multilib enabled on qemux86-64, accel-ppp-lib should be installed to
'${baselib}/accel-ppp', but the accel-ppp's CMakeLists.txt hardcoded
to install to 'lib/accel-ppp', such as:
...
INSTALL(TARGETS log_file
        LIBRARY DESTINATION lib/accel-ppp
)
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
index a7c10f7..dde1f43 100644
--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
@@ -30,3 +30,12 @@ PACKAGES =+ "${PN}-libs"
 FILES_${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
 INSANE_SKIP_${PN}-libs = "dev-so"
 RDEPENDS_${PN} += "${PN}-libs"
+
+do_install_prepend() {
+    cmlist=`find ${S} -name CMakeLists.txt`
+    for file in $cmlist; do
+        sed -i -e "s:LIBRARY DESTINATION lib/accel-ppp:LIBRARY DESTINATION ${baselib}/accel-ppp:g" \
+               -e "s:\${CMAKE_INSTALL_PREFIX}/lib/accel-ppp:\${CMAKE_INSTALL_PREFIX}/${baselib}/accel-ppp:g" \
+               $cmlist
+    done
+}
-- 
1.8.1.2


