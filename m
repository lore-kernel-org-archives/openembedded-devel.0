Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00CED60557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:07:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9VA7ud6013397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:07:57 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 03:07:56 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Oct 2014 18:04:37 +0800
Message-ID: <1414749877-23486-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: remove init script for gentoo
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
X-List-Received-Date: Fri, 31 Oct 2014 10:08:00 -0000
Content-Type: text/plain

The configure.initd.gentoo script is used for gentoo, it is invalid for oe. So
remove it to solve the following warning:

webmin-1.700: webmin-module-ajaxterm requires /sbin/runscript, but no providers
in its RDEPENDS [file-rdeps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 recipes-webadmin/webmin/webmin_1.700.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
index 2a363cb..c6523c5 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
@@ -82,6 +82,7 @@ do_install() {
     install -d ${D}${libexecdir}/webmin
     cp -pPR ${S}/* ${D}${libexecdir}/webmin
     rm -f ${D}${libexecdir}/webmin/webmin-init
+    rm -f ${D}${libexecdir}/webmin/ajaxterm/ajaxterm/configure.initd.gentoo
     rm -rf ${D}${libexecdir}/webmin/patches
 
     # Run setup script
-- 
1.9.1


