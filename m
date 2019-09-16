Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9F97F277
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 09:17:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8G9HH7k018023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 02:17:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 16 Sep 2019 02:17:17 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Sep 2019 17:17:15 +0800
Message-ID: <1568625435-306352-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntp: fix package split wrongly when enabled usrmerge
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
X-List-Received-Date: Mon, 16 Sep 2019 09:17:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* when usrmerge is enabled, ${libdir} is /usr/lib, and
${systemd_unitdir} is /usr/lib/systemd, sine PACKAGE
ntpdate is after ntp in variable PACKAGES, so file
${systemd_unitdir}/system/ntpdate.service will be populated
into PACKAGE ntp, but actually we have add it into FILES_ntpdate

when usrmerge is disabled, ${libdir} is empty, and usrmerge is
enabled, files under ${libdir} have been covered by other FILES
config, so fix by remove ${libdir}

* libexecdir is empty, so remove it FILES_${PN}

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
index dc18a60..9b327ba 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
@@ -136,9 +136,9 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 RSUGGESTS_${PN} = "iana-etc"
 
-FILES_${PN} = "${sbindir}/ntpd.ntp ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
+FILES_${PN} = "${sbindir}/ntpd.ntp ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd \
     ${NTP_USER_HOME} \
-    ${systemd_unitdir}/ntp-units.d/60-ntpd.list ${libexecdir}\
+    ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
 "
 FILES_${PN}-tickadj = "${sbindir}/tickadj"
 FILES_${PN}-utils = "${sbindir} ${datadir}/ntp/lib"
-- 
2.7.4


