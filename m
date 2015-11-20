Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 183246011A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 07:50:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK7oWhT029206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 23:50:32 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 19 Nov 2015 23:50:31 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 15:39:48 +0800
Message-ID: <1448005188-9317-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH] apache2: fix host-user-contaminated warnings
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
X-List-Received-Date: Fri, 20 Nov 2015 07:50:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It shows warnings when build apache2 such as:

| WARNING: QA Issue: apache2: /apache2-dev/usr/share/apache2/icons/small/movie.gif
| is owned by uid 1785, which is the same as the user running bitbake.
| This may be due to host contamination [host-user-contaminated]

Set the owner and group to root to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
index b62fd8c..48c448e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
@@ -95,6 +95,8 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
     sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
+
+    chown -R root:root ${D}
 }
 
 do_install_append_class-target() {
-- 
2.6.1


