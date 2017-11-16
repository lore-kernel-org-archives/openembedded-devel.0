Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F22A478775
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:19:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAGFJs3C016381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:19:55 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 16 Nov 2017 07:19:54 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Nov 2017 10:19:49 -0500
Message-ID: <1510845589-10848-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] meta-webserver: apache2 allow SYSTEMD_AUTO_ENABLE to be overwritten
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
X-List-Received-Date: Thu, 16 Nov 2017 15:19:54 -0000
Content-Type: text/plain

The current assignment does not allow a bbappend to be used to
overwrite the SYSTEMD_AUTO_ENABLE value in order to have apache2 auto
start. You would have to resort to 'manually' creating a link in
do_install or a postinst. Using the '?=' assignment will correct this.

One might argue that if apache2 is being installed it would be
desirable to have it auto run, so this setting should be removed in
favor of the default in systemd.bbclass (enable). In order not to
surprise users of this recipe with this change in behavior we opt to
keep this as disabled but overwrite-able.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
index f0298b9..60fc411 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
@@ -32,7 +32,7 @@ S = "${WORKDIR}/httpd-${PV}"
 inherit autotools update-rc.d pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "apache2.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+SYSTEMD_AUTO_ENABLE_${PN} ?= "disable"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.7.4


