Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 139337C2F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 15:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43tWC13c1sz1M
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 16:02:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1549292525;
	bh=SUYuNPZikvywQXUL38foL9iV//wp+4wdJhLS45wtu54=;
	h=From:To:Subject:Date:From;
	b=F4vZy94DGGtyVmKSo2yX3LGMojXAW61NppWZwNeqwdEErT8qsOf+9UrlrDDA6Aqsx
	/o/dDNXEzaJbODReO81Zwy2Cx1KTmDsN8UGBKRDYEREAbjQbmMq6mpjv2Pta54s2pO
	tKPI1WZeFFun3arlBRALw01H30gIGb0I9Xpey8rg617RdLOcW8w/OPe2iWRMfiv3az
	696ZWmYi1RZ6Po22FlS9b57SnbR5idra49W1DagG0HrIY5VzLw1ujGj2GYvWm99k49
	Ui/fFO/OaPNdb/+RAJsfu14uSZZBKBNMBKgO/eJnqfzYDtWeFhN+c+ZC7KP4hERrr2
	A5fJ6Ig3jhBkeKxYcWjGwdyLIYz6WernpC/QHiloUK26d+LhMOG4519Q2eJr/4NUvY
	Q6zVKLKRf5QR1I9oO8I5sFLjSLYciYTKK5mitAhh3wUNqlEDpXqGI3AMEl1bllckYp
	HrDl/6qUPyB1NI8g1Gi58X00Pke36uWBKbC6FrDpVTe8mkJV2LF3S5HbRESHrxi6rL
	1LEwOnF3Dd3cMig0PUHtN3MeXoZWrB448JA7/y+j/cfypeWqjpSSaUkiDo6TH+wUhH
	uB1pxkr//YkigSSqvm6VWM+MYOp5LF7LS8dKcE5sbTs/ZLTCRtr4rXBWM0eqPwKbGR
	xTvrQ+4M8/Z4G1sUFc79i3nE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 17:02:03 +0200
Message-Id: <20190204150204.18007-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][thud][PATCH] Split ntpq into an own package
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
X-List-Received-Date: Mon, 04 Feb 2019 15:02:05 -0000

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


