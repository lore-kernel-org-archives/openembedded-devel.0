Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2EF175A60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:01:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S21qSU024450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:01:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 27 Jul 2015 19:01:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jul 2015 09:59:38 +0800
Message-ID: <1438048778-23663-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] tcpslice: fix do_install
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
X-List-Received-Date: Tue, 28 Jul 2015 02:01:56 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

replace to run "make install" with directly calling install command,
since "make install" asks "bin" user and group, and maybe fail when
system has not;

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
index b887fc7..293760f 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
@@ -29,7 +29,8 @@ do_configure () {
             ac_cv_target=${HOST_SYS}
 }
 
-do_install_prepend () {
+do_install () {
 	mkdir -p ${D}/usr/sbin
+	install -c -m 555 tcpslice ${D}/usr/sbin
 }
 
-- 
1.9.1


