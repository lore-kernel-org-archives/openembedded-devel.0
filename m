Received: from [62.2.86.239] (helo=a.mx.bitcloner.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1N8d4i-0004BP-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 18:03:15 +0100
Received: from p5b2cf4e8.dip.t-dialin.net ([91.44.244.232] helo=127.0.0.1)
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <betheg@bitcloner.org>)
	id 1N8d3T-0003hl-N5 for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 18:01:55 +0100
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 18:00:47 +0100
Message-Id: <1258045249-18095-2-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.6.5.2
In-Reply-To: <1258045249-18095-1-git-send-email-betheg@bitcloner.org>
References: <1258045249-18095-1-git-send-email-betheg@bitcloner.org>
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/3] tzdata.inc: install iso3166.tab and zone.tab
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2009 17:03:16 -0000

Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/tzdata/tzdata.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index 71de930..d4bf976 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -38,6 +38,8 @@ do_compile () {
 do_install () {
         install -d ${D}${prefix} ${D}${datadir}/zoneinfo
         cp -pPR ${WORKDIR}/build${prefix}/* ${D}${prefix}
+        install -m 0644 ${WORKDIR}/zone.tab ${D}${datadir}/zoneinfo
+        install -m 0644 ${WORKDIR}/iso3166.tab ${D}${datadir}/zoneinfo
 
         # Install a sane default for timezones
         install -d ${D}${sysconfdir}
@@ -168,5 +170,7 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/WET                  \
                 ${datadir}/zoneinfo/Zulu                 \
                 ${datadir}/zoneinfo/Etc/*                \
+                ${datadir}/zoneinfo/iso3166.tab          \
+                ${datadir}/zoneinfo/zone.tab             \
                 ${sysconfdir}/localtime                  \
                 ${sysconfdir}/timezone                   "
-- 
1.6.5.2



