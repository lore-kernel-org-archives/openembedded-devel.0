Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B493C718EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 02:54:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI2sicN001843
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 18:54:45 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 17 Nov 2014 18:54:44 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Nov 2014 10:54:41 +0800
Message-ID: <1416279281-22578-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [meta-oe] lvm2: files will be over written when updating using rpm
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
X-List-Received-Date: Tue, 18 Nov 2014 02:54:48 -0000
Content-Type: text/plain

If there is no %config micro before the file in the spec file,
this file will be over-written after updating this package
using rpm.
This will make our settings lost.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 recipes-support/lvm2/lvm2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-support/lvm2/lvm2.inc b/recipes-support/lvm2/lvm2.inc
index 1bbb158..42f6e3a 100644
--- a/recipes-support/lvm2/lvm2.inc
+++ b/recipes-support/lvm2/lvm2.inc
@@ -48,3 +48,5 @@ FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
 RDEPENDS_${PN} = "bash"
+
+CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
-- 
1.8.5.2.233.g932f7e4


