Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D61E574598
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 01:33:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L1XG8d015958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 18:33:16 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 20 Aug 2018 18:33:16 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Aug 2018 09:33:15 +0800
Message-ID: <1534815195-139979-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ntp: Upgrade 4.2.8p11 -> 4.2.8p12
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
X-List-Received-Date: Tue, 21 Aug 2018 01:33:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. Upgrade ntp to 4.2.8p12
2. Disable sntp service by default.
   Default NTPSERVER in config sntp is "ntpserver.example.org",
   just an example, not a valid address, if enable sntp service
   by default, it will startup failed during boot. It should be
   enabled after user set the correct config for sntp according
   to current config of ntpd.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p11.bb => ntp_4.2.8p12.bb}         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p11.bb => ntp_4.2.8p12.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p11.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p11.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
index c698fa0..4254301 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p11.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "00950ca2855579541896513e78295361"
-SRC_URI[sha256sum] = "f14a39f753688252d683ff907035ffff106ba8d3db21309b742e09b5c3cd278e"
+SRC_URI[md5sum] = "1522d66574bae14abb2622746dad2bdc"
+SRC_URI[sha256sum] = "709b222b5013d77d26bfff532b5ea470a8039497ef29d09363931c036cb30454"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
@@ -120,6 +120,7 @@ SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
 SYSTEMD_SERVICE_${PN} = "ntpd.service"
 SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
 SYSTEMD_SERVICE_sntp = "sntp.service"
+SYSTEMD_AUTO_ENABLE_sntp = "disable"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.7.4


