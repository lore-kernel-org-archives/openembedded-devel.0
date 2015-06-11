Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07290756A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9H8TY014220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:08 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:07 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:50 +0800
Message-ID: <79d1e47ef6978f0610f87a88a762bcc88edc3e26.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 3/9] sip: fix PN -> BPN for multilib
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:08 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/sip/sip_4.16.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sip/sip_4.16.4.bb b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
index 780ccdc..032d125 100644
--- a/meta-oe/recipes-extended/sip/sip_4.16.4.bb
+++ b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
@@ -49,6 +49,6 @@ do_install() {
     oe_runmake install
 }
 
-FILES_python-${PN} = "${libdir}/${PYTHON_DIR}/site-packages/"
+FILES_python-${BPN} = "${libdir}/${PYTHON_DIR}/site-packages/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
 
-- 
1.7.9.5


