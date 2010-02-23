Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Njxke-0004Gl-Oi
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 17:36:51 +0100
Received: by bwz5 with SMTP id 5so2607522bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 08:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WANHwTMXBPfktR9KpHs5e1fVaIiJ9SQq3NkpIuYqk/4=;
	b=ANiitTUXZw18HZGcKRZj/d0nqwTnz9X+UlVXe4VGsrKWmxgspzwqDHjgNvGH3zpppp
	13cCsUV65yt2VvpMP9CH48PmBMfc1j2R/wLtJTV38e5qtuAZqTPbg8LgOtC/mSUtziaJ
	Qr+INvEd+QO68NgDfdNDEL8TO42gdg1/o08WI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=k3i1lJP8hfDCVvLLATuoSFfVG/+JYA1UYxtFHko16oWaEXt25/NUDX8HhM1L36ELjo
	1WuSK15ACnDPy9Y4l18txFKdZTPKDC73I/tTcJT2Za+hLPdt0ucEfr8oNvZl/rjuVLed
	FYxncpsHmjsdLjKgxPWBvD6SW2MiHaBcW6K2M=
Received: by 10.102.211.3 with SMTP id j3mr56566mug.117.1266942843899;
	Tue, 23 Feb 2010 08:34:03 -0800 (PST)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id b9sm4283502mug.24.2010.02.23.08.34.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Feb 2010 08:34:03 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2010 17:34:15 +0100
Message-Id: <1266942855-10622-2-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] om-gta01-gps: New recipe for the om-gta01 based GPS device.
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
X-List-Received-Date: Tue, 23 Feb 2010 16:36:51 -0000

* Re-add the GPS device that has been remove from the main gpsd recipe
---
 recipes/gpsd/files/om-gta01/gpsd-default |    6 +++-
 recipes/gpsd/om-gta01-gps_0.bb           |   31 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gpsd/om-gta01-gps_0.bb

diff --git a/recipes/gpsd/files/om-gta01/gpsd-default b/recipes/gpsd/files/om-gta01/gpsd-default
index abd3592..bf29ad8 100644
--- a/recipes/gpsd/files/om-gta01/gpsd-default
+++ b/recipes/gpsd/files/om-gta01/gpsd-default
@@ -1,3 +1,5 @@
 # If you must specify a non-NMEA driver, uncomment and modify the next line
-#GPSD_OPTS=
-GPS_DEV="/tmp/nmeaNP"
+GPSD_SOCKET="/var/run/gpsd.sock"
+GPSD_OPTIONS="" 
+GPS_DEVICES="/tmp/nmeaNP"
+
diff --git a/recipes/gpsd/om-gta01-gps_0.bb b/recipes/gpsd/om-gta01-gps_0.bb
new file mode 100644
index 0000000..fc2c674
--- /dev/null
+++ b/recipes/gpsd/om-gta01-gps_0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Package to get om-gta01 GPS hardware running"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPL"
+RDEPENDS_${PN} = "gpsd"
+PR="r0"
+
+SRC_URI = " \
+           file://om-gta01/restart_gllin.sh \
+           file://om-gta01/gpsd-default \
+           file://om-gta01/gps-hardware \
+"
+
+do_install() {
+	install -d ${D}${sysconfdir}/apm/resume.d
+	install -m 755 ${WORKDIR}/om-gta01/restart_gllin.sh ${D}/${sysconfdir}/apm/resume.d
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/om-gta01/gps-hardware ${D}${sysconfdir}/init.d
+    install -d ${D}/${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/om-gta01/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
+}
+
+pkg_postinst() {
+	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
+}
+
+pkg_postrm() {	
+	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
+}
+
+PACKAGE_ARCH_${PN} = "om-gta01"
-- 
1.6.4.4



