Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 50BFE7C2AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJYZ40mZz4v
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548841922;
	bh=SUYuNPZikvywQXUL38foL9iV//wp+4wdJhLS45wtu54=;
	h=From:To:Subject:Date:From;
	b=dinQ7eUGWuxv7DwtE3vG/9KlZTm6xmQgHKq0jAj2fbJRhRENNt9XFSABsgFuLu3Ui
	7doKZbNqXwSdpE7KyufPJYE29ITa6AgQr1QQimEzKy4kjB60ih6KMKNkRGb6cv5Zvt
	a26eHDlDCkLCSwnCksoz92/zpER+i8SyVJNYlOsybIlWv+yePAgb43r4+hB9oug8zp
	1IUp+pvl0DICG1dtwfTR3BiFeRbIeKLL6NNsRNxdc9z6JTOuPlCGdFOalSWOM02RlN
	E6Rn6QueqTotp5i2vDNCKkjzbvK3IEJgfbV6/Qq0AVSM1ry+n1tO9I0UEEDZGGOn9a
	96ohpbzksAYKsQ3CRMWv7jnkyQUcDFdoIB+2R3DTL+MYj8oscSJjmvL0Z80J5eUz4X
	+o6y9XQ+rm+MPnNLDDTdF7yuIBbcp32+2eL07RPE6JZyscXDdRTskR8Jhe0NLU8uRn
	cgpSI+Z5full/lbqRs2jmBmWsySZyaeAejW8l59y1xFFI0qnKE+0lrxIZqJwaHjeGL
	eIyxobG5EkxHbbCsH3SdSdEBbcbdHPyvjjX1xqHdH5DpCQd+hSe3fhp+6SYUnC7CPz
	D7mWMkjiKwgZRF41nv1Bfv8Z8L1jPVYAATu+9NCMWHcytrjE3Db+vSXDgLAcVzJW2d
	FOvN8ViGh9o8MCoZBnZOQ9/E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:51:59 +0200
Message-Id: <20190130095201.11965-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] Split ntpq into an own package
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
X-List-Received-Date: Wed, 30 Jan 2019 09:52:02 -0000

ntpq is the standard query program for ntp,
but ntp-utils depends on perl.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
index 53e41297a..289d2645b 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
@@ -105,7 +105,7 @@ do_install_append() {
     rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 }
 
-PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
+PACKAGES += "ntpdate sntp ntpq ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
@@ -117,6 +117,8 @@ RDEPENDS_${PN} += "libgcc"
 RPROVIDES_${PN}-utils = "${PN}-bin"
 RREPLACES_${PN}-utils = "${PN}-bin"
 RCONFLICTS_${PN}-utils = "${PN}-bin"
+# ntpq was split out of ntp-utils
+RDEPENDS_${PN}-utils = "ntpq"
 
 SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
 SYSTEMD_SERVICE_${PN} = "ntpd.service"
@@ -151,6 +153,7 @@ FILES_sntp = "${sbindir}/sntp \
               ${sysconfdir}/default/sntp \
               ${systemd_unitdir}/system/sntp.service \
              "
+FILES_ntpq = "${sbindir}/ntpq"
 
 CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
 CONFFILES_ntpdate = "${sysconfdir}/default/ntpdate"
-- 
2.11.0


