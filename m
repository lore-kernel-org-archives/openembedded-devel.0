Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDBD260745
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 02:32:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBU2Wx4m001574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 18:33:00 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 29 Dec 2016 18:32:59 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Dec 2016 10:28:40 +0800
Message-ID: <20161230022840.28300-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-vcversioner: empty the RDEPENDS for native
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
X-List-Received-Date: Fri, 30 Dec 2016 02:33:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The RDEPENDS for native package is not needed,
and it will fail since there is no provider for
python-subprocess-native:

| ERROR: Nothing RPROVIDES 'python-subprocess-native'

so empty the RDEPENDS for native package.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
index f4a6009..cd6fa8d 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
@@ -20,5 +20,6 @@ do_install_append() {
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-subprocess \
     "
+RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
-- 
2.8.3


