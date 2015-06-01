Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED366AC36
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 05:24:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t515OOXW023582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 22:24:24 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 31 May 2015 22:24:23 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jun 2015 13:18:25 +0800
Message-ID: <1433135905-23238-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] webmin: upgrade to 1.750
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
X-List-Received-Date: Mon, 01 Jun 2015 05:24:26 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. Upgrade to fix the CVE:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1377
2. update the patch remove-startup-option.patch

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-webadmin/webmin/files/remove-startup-option.patch         | 2 +-
 .../recipes-webadmin/webmin/{webmin_1.700.bb => webmin_1.750.bb}      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_1.700.bb => webmin_1.750.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch b/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
index 8493af8..d957f4a 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
@@ -11,7 +11,7 @@
  &get_miniserv_config(\%miniserv);
  
 -if (&foreign_check("init")) {
--	&foreign_require("init", "init-lib.pl");
+-	&foreign_require("init");
 -	my $starting = &init::action_status("webmin");
 -	print &ui_buttons_row("bootup.cgi",
 -	      $text{'index_boot'},
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
index c6523c5..b6fbb0a 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://remove-python2.3.patch \
             "
 
-SRC_URI[md5sum] = "e5261114a6a6ed10caf570d3239ed5b7"
-SRC_URI[sha256sum] = "1a6a8aa62c32c04932b902d17fc1864ee8f3fba03012bd25f709aa65e7e9b0f2"
+SRC_URI[md5sum] = "4007c390323d840f26c2e0f43c5c81a3"
+SRC_URI[sha256sum] = "5111f820adc6fbca997a58d4b2fa186dac6cded9cff0e70724f8cae6021123d9"
 
 inherit perlnative update-rc.d
 
-- 
1.9.1


