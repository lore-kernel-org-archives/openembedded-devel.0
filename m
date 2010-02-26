Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nl4Gf-0003Si-PQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 18:46:30 +0100
Received: by bwz5 with SMTP id 5so282991bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 09:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vSDqfvB0/3sySvUhEchnYDmjsg/c3gawcfVz4S1v/Hw=;
	b=mU7/pyoHfJCaBIbX1W/hkSYtCLQYIuFNvgE/gw004Uny41LDzE5q/OsLcRUx56sqtj
	g9VHX+5+C/LCyfZiVyxmIoH5lWO+B/nXJx1nHPf4nQYCz5zrvRtqQh+E/MU5NvyA7pJT
	xdMz44EuVo3WnjT2W4M7Qky0+5x8acy1WoXxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UM9oZfWsNfo3Fgvzs7EBLIZo8i5pPUbAYP44bjdj+ysXbMZA0Ap+Nl9EsGbjRozqH3
	FJ0lyKApzJ6NtlGEvv9fDrWu+Ub3JVEiRgt4W32HuBEV6/UANhpy9JkttSLc0qicD4wD
	Ar1Plo1bxjJ/XZTL/49XtBRKwK9anprejhnNo=
Received: by 10.204.38.71 with SMTP id a7mr498537bke.159.1267206218549;
	Fri, 26 Feb 2010 09:43:38 -0800 (PST)
Received: from localhost.localdomain
	(85-127-150-205.dynamic.xdsl-line.inode.at [85.127.150.205])
	by mx.google.com with ESMTPS id 13sm208116bwz.11.2010.02.26.09.43.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 09:43:38 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 18:44:02 +0100
Message-Id: <1267206242-705-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpsd-device-config: Adds new recipe
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
X-List-Received-Date: Fri, 26 Feb 2010 17:46:30 -0000

* Reintegrates machine specific gps configuration using overrides
  (formerly specified in the main gpsd recipe)
---
 recipes/gpsd/gpsd-device-config_0.bb |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpsd/gpsd-device-config_0.bb

diff --git a/recipes/gpsd/gpsd-device-config_0.bb b/recipes/gpsd/gpsd-device-config_0.bb
new file mode 100644
index 0000000..1691c2e
--- /dev/null
+++ b/recipes/gpsd/gpsd-device-config_0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Configuration for machine specific gps devices"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPL"
+RDEPENDS_${PN} = "gpsd"
+PR = "r0"
+
+SRC_URI_append_om-gta01 = " \
+                        file://restart_gllin.sh \
+                        file://gpsd-default \
+                        file://gps-hardware \
+"
+
+do_install_append_om-gta01() {
+    install -d ${D}${sysconfdir}/apm/resume.d
+    install -m 755 ${WORKDIR}/om-gta01/restart_gllin.sh ${D}/${sysconfdir}/apm/resume.d
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/om-gta01/gps-hardware ${D}${sysconfdir}/init.d
+    install -d ${D}/${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/om-gta01/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
+}
+
+pkg_postinst_append_om-gta01() {
+    update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 50
+}
+
+pkg_postrm_append_om-gta01() {	
+    update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.6.4.4



