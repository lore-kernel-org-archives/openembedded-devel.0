Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJN-0006BO-PV
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:41 +0100
Received: by wgbds1 with SMTP id ds1so603350wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LvlsmjPevvv7yxnPDrwbahq4wEpgStw2wF5Dq84kLiw=;
	b=KgDrInn4xFSB+neJIJ4dJ4dAGZ+Ryoubhy/WBQwu1kgTXy3l+Z6rje128+6PX9UZfY
	HYY2x/J0T5CucuWV0Cp2ALju3QktLMXuQhPI2ZOJwmASMNLg0fSlHPRDIzbb2hpImsxF
	ck9h7tgrEcXxevUv6H5rddgYW9cklLDziq/xkxhqZ2BdXlRrWNmjPo9l3Uth2Jxl+cKv
	8TA1k1682qkuUshJ3NEfEbxM+3kQlhFO0qhCRGYaRGaOfaGOUiaWE/dId6S6j62B8rMV
	pAmTaNOVW1dKL3OTz+S5Efh80Au5itZwEc6WfQnoGNdTZxt0rdi/dqVpA92zLFh1IEdq
	t4dA==
Received: by 10.180.92.34 with SMTP id cj2mr402970wib.8.1332446386702;
	Thu, 22 Mar 2012 12:59:46 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:36 +0100
Message-Id: <1332446382-24958-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/8] systemd-compat-units: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
X-List-Received-Date: Thu, 22 Mar 2012 20:08:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-compat-units.bb b/meta-oe/recipes-core/systemd/systemd-compat-units.bb
index 2cbce67..c9a6b67 100644
--- a/meta-oe/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta-oe/recipes-core/systemd/systemd-compat-units.bb
@@ -10,15 +10,15 @@ inherit allarch
 SRC_URI = "file://*.service"
 
 do_install() {
-	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
-	install -d ${D}${base_libdir}/systemd/system/sysinit.target.wants/
-	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${base_libdir}/systemd/system
-	ln -sf ../run-postinsts.service ${D}${base_libdir}/systemd/system/basic.target.wants/
-	ln -sf ../run-postinsts.service ${D}${base_libdir}/systemd/system/sysinit.target.wants/
+	install -d ${D}${systemd_unitdir}/system/basic.target.wants
+	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system
+	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.target.wants/
+	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
 
-	install -m 0644 ${WORKDIR}/machineid.service ${D}${base_libdir}/systemd/system
-	ln -sf ../machineid.service ${D}${base_libdir}/systemd/system/sysinit.target.wants/
-	ln -sf ../machineid.service ${D}${base_libdir}/systemd/system/basic.target.wants/
+	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/system
+	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.wants/
 
 	# hack to make old style sysvinit postinsts succeed
 	install -d ${D}${bindir}
@@ -33,12 +33,12 @@ echo -n "Disabling the following sysv scripts: "
 
 for i in busybox-udhcpc dnsmasq hwclock.sh networking syslog syslog.busybox ; do
 	if [ -e $i ] ; then
-		echo -n "$i " ; ln -s /dev/null $D${base_libdir}/systemd/system/$i.service
+		echo -n "$i " ; ln -s /dev/null $D${systemd_unitdir}/system/$i.service
 	fi
 done ; echo
 }
 
-FILES_${PN} = "${base_libdir}/systemd/system ${bindir}"
+FILES_${PN} = "${systemd_unitdir}/system ${bindir}"
 RDPEPENDS_${PN} = "systemd"
 
 
-- 
1.7.6.5



