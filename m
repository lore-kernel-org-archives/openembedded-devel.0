Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56C227722C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:42:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u14KgGSt022232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Feb 2016 12:42:16 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 4 Feb 2016 12:42:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Thu, 4 Feb 2016 15:42:15 -0500
Message-ID: <1454618535-15221-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-networking][v2][PATCH] ntp: remove empty libexecdir to prevent potential QA issues
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
X-List-Received-Date: Thu, 04 Feb 2016 20:42:17 -0000
Content-Type: text/plain

Depending on the configuration used to build ntp it is possible to
have an empty libexecdir. This can cause QA issues. Add a test at the
end of install() to remove libexecdir if it is empty, thus avoiding
the possibility of QA issues, regardless of configuration.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Changes v1 -> v2
* switched to use rmdir instead of test+rm

 meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
index f9f900e..7caa5a6 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
@@ -94,6 +94,9 @@ do_install_append() {
 
     install -d ${D}${systemd_unitdir}/ntp-units.d
     install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
+
+    # Remove an empty libexecdir.
+    rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
-- 
2.1.4


