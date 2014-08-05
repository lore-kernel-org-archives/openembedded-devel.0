Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAC79609C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 07:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s757NwtH014712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Aug 2014 00:24:13 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 5 Aug 2014 00:24:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Aug 2014 15:24:13 +0800
Message-ID: <1407223453-9512-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] netcf: init script should be installed under /etc/init.d/
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
X-List-Received-Date: Tue, 05 Aug 2014 07:24:20 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

init script should be installed under /etc/init.d/, not /etc/rc.d/init.d

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index d6ca30f..979e45b 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -25,3 +25,7 @@ do_configure_prepend() {
 	./bootstrap --gnulib-srcdir=${STAGING_DATADIR}/gnulib
 }
 
+do_install_append() {
+     mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
+     rm -rf ${D}${sysconfdir}/rc.d/
+}
-- 
1.7.10.4


