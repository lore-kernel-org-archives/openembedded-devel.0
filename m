Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tm3OG-00050S-Bs
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:16:16 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so2489337eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 06:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=D1wvJhWKvC7C3B4OctrkCnQN6Br3jIuTSbcDk2YhdYY=;
	b=Ahjiq2zXLaa2OAJNDcSlboy2WBUOX/8EUKTLm3almaHiNWAyf57mWln1hfTBiLFacC
	loxc3prtn213RHQs4xzXOjwxSeop5uJKZs4BTRjlbUgBPBjZbPZ+/sc8s3nsgzAfb0nk
	ZwnIl45dAsDqM0xqnsKeKhM+ILV5OzF6Ascuim54zuce9ZrLNgLBkHGTWL5kKlzqSs8G
	UjNqPu9uJX1TshSSxDU/4UbY5UKGGFh8yc+bIVThmCRDmhQSRfCYAXm5R5NZWRs1UicG
	Tnk09ISh7zlndyRWdx6HpC381vnpR7QRB7nZUVC1oIFtFbcMKMLcP5E5QXa9j9q+ZcDY
	j1vQ==
X-Received: by 10.14.2.66 with SMTP id 42mr32488960eee.7.1356098470630;
	Fri, 21 Dec 2012 06:01:10 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w44sm21810573eep.6.2012.12.21.06.01.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 06:01:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:00:48 +0100
Message-Id: <1356098450-27475-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkg4J/sX/BGm82wVBLrxkIWliGIYHQt4vbpu5ASwffG1A2x4lsg4ZzDPgOVN5F/nSr1++gT
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 4/6] dvb-apps: import 1.1.1+hg from OE classic
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
X-List-Received-Date: Fri, 21 Dec 2012 14:16:28 -0000

* Backport patches were dropped since we use hg tip now.
* Lots of whitespace fixups

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         |  106 ++++++++++++++++++++
 1 files changed, 106 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb

diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
new file mode 100644
index 0000000..c39acac
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -0,0 +1,106 @@
+HOMEPAGE = "http://www.linuxtv.org"
+SUMMARY = "Linux DVB API applications and utilities."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http"
+SRCREV = "3fc7dfa68484"
+
+S = "${WORKDIR}/${BPN}"
+
+do_configure() {
+	sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh 
+}
+
+do_install() {
+	make DESTDIR=${D} install
+	install -d ${D}/${bindir}
+	install -d ${D}/${docdir}/dvb-apps
+	install -d ${D}/${docdir}/dvb-apps/scan
+	install -d ${D}/${docdir}/dvb-apps/szap
+	chmod a+rx ${D}/${libdir}/*.so*
+
+	# Install tests
+	install -m 0755 ${S}/test/setvoltage      ${D}${bindir}/test_setvoltage
+	install -m 0755 ${S}/test/set22k          ${D}${bindir}/test_set22k
+	install -m 0755 ${S}/test/sendburst       ${D}${bindir}/test_sendburst
+	install -m 0755 ${S}/test/diseqc          ${D}${bindir}/test_diseqc
+	install -m 0755 ${S}/test/test_sections   ${D}${bindir}/
+	install -m 0755 ${S}/test/test_av_play    ${D}${bindir}/
+	install -m 0755 ${S}/test/test_stillimage ${D}${bindir}/
+	install -m 0755 ${S}/test/test_dvr_play   ${D}${bindir}/
+	install -m 0755 ${S}/test/test_tt         ${D}${bindir}/
+	install -m 0755 ${S}/test/test_sec_ne     ${D}${bindir}/
+	install -m 0755 ${S}/test/test_stc        ${D}${bindir}/
+	install -m 0755 ${S}/test/test_av         ${D}${bindir}/
+	install -m 0755 ${S}/test/test_vevent     ${D}${bindir}/
+	install -m 0755 ${S}/test/test_pes        ${D}${bindir}/
+	install -m 0755 ${S}/test/test_dvr        ${D}${bindir}/
+
+	cp -pPR ${S}/util/szap/channels-conf* ${D}/${docdir}/dvb-apps/szap/
+	cp -pPR ${S}/util/szap/README   ${D}/${docdir}/dvb-apps/szap/
+}
+
+python populate_packages_prepend () {
+    dvb_libdir = bb.data.expand('${libdir}', d)
+    do_split_packages(d, dvb_libdir, '^lib(.*)\.so$', 'lib%s', 'DVB %s package', extra_depends='', allow_links=True)
+    do_split_packages(d, dvb_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, dvb_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, dvb_libdir, '^lib(.*)\.so\.*', 'lib%s', 'DVB %s library', extra_depends='', allow_links=True)
+}
+
+PACKAGES =+ "dvb-evtest dvb-evtest-dbg \
+             dvbapp-tests dvbapp-tests-dbg \
+             dvbdate dvbdate-dbg \
+             dvbtraffic dvbtraffic-dbg \
+             dvbnet dvbnet-dbg \
+             dvb-scan dvb-scan-dbg dvb-scan-data \
+             dvb-azap dvb-azap-dbg \
+             dvb-czap dvb-czap-dbg \
+             dvb-szap dvb-szap-dbg \
+             dvb-tzap dvb-tzap-dbg \
+             dvb-femon dvb-femon-dbg \
+             dvb-zap-data"
+
+
+FILES_${PN} = "${bindir} ${datadir}/dvb"
+FILES_${PN}-doc = ""
+FILES_${PN}-dev = "${includedir}"
+
+FILES_dvb-evtest = "${bindir}/evtest"
+FILES_dvb-evtest-dbg = "${bindir}/.debug/evtest"
+RCONFLICTS_dvb-evtest = "evtest"
+
+FILES_dvbapp-tests = "${bindir}/*test* "
+FILES_dvbapp-tests-dbg = "${bindir}/.debug/*test*"
+
+FILES_dvbdate = "${bindir}/dvbdate"
+FILES_dvbdate-dbg = "${bindir}/.debug/dvbdate"
+
+FILES_dvbtraffic = "${bindir}/dvbtraffic"
+FILES_dvbtraffic-dbg = "${bindir}/.debug/dvbtraffic"
+
+FILES_dvbnet = "${bindir}/dvbnet"
+FILES_dvbnet-dbg = "${bindir}/.debug/dvbnet"
+
+FILES_dvb-scan = "${bindir}/*scan "
+FILES_dvb-scan-dbg = "${bindir}/.debug/*scan"
+FILES_dvb-scan-data = "${docdir}/dvb-apps/scan"
+
+FILES_dvb-azap = "${bindir}/azap"
+FILES_dvb-azap-dbg = "${bindir}/.debug/azap"
+
+FILES_dvb-czap = "${bindir}/czap"
+FILES_dvb-czap-dbg = "${bindir}/.debug/czap"
+
+FILES_dvb-szap = "${bindir}/szap"
+FILES_dvb-szap-dbg = "${bindir}/.debug/szap"
+
+FILES_dvb-tzap = "${bindir}/tzap"
+FILES_dvb-tzap-dbg = "${bindir}/.debug/tzap"
+
+FILES_dvb-femon = "${bindir}/femon"
+FILES_dvb-femon-dbg = "${bindir}/.debug/femon"
+
+FILES_dvb-zap-data = "${docdir}/dvb-apps/szap"
-- 
1.7.7.6



