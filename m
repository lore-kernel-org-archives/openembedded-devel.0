Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2F387850C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 04:41:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2Q4f5tG031933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 21:41:05 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 25 Mar 2018 21:40:53 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Mar 2018 12:41:38 +0800
Message-ID: <1522039298-25092-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] cyrus-sasl: fix systemd related setting
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
X-List-Received-Date: Mon, 26 Mar 2018 04:41:04 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The service file belongs to ${PN}-bin instead of ${PN}, fix things
accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 64d1a76d6..6dbff87dd 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -75,8 +75,8 @@ do_install_append() {
 USERADD_PACKAGES = "${PN}-bin"
 USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "saslauthd.service"
+SYSTEMD_PACKAGES = "${PN}-bin"
+SYSTEMD_SERVICE_${PN}-bin = "saslauthd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
-- 
2.11.0


