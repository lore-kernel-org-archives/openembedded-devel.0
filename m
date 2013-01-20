Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNN-00078V-IJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so2373722eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=LbdnG/s6DILw5kNuHRvShiYYJ9blnqrarsCmL6LvP/I=;
	b=nrADQMvGsULKu0GTnuXgtUJRCRxLWAWWlDb8yc1j/oJWjQYvGNpPUOZpYQGHDZ2fA0
	bKTLCajaFaTu2N0GR8D/EkxO5NDEoBhraSL5haQmx/tocPCCJL9p0I6DA2pw6c177mub
	HBPU/I2ICTCJDxHOoqSNMif6CjBsrgm5s4vx9dYbzhxWA6UMXpkm3Pa7GJ1cImq/PZes
	1M95PZPcnvUN+ENTwyN5BpQ0GlO6HfxCTNrXdfS/jloe4uYOZpFyoFREAjPsW7lFy2K2
	GKn7t8/lNa8koVmITPDg0b55wmbzyD+i+3ZHeTdIg3UZBrj0Otj6aF49VuHU6dX7gg/h
	88Xg==
X-Received: by 10.14.203.3 with SMTP id e3mr13251720eeo.9.1358681542522;
	Sun, 20 Jan 2013 03:32:22 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:05 +0100
Message-Id: <1358681528-19761-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnrdBn7dK/umktwc0UkxiuwZElavGvOv4g/Bd4KWWb7fC92SfvckTJwI498Iycjs3c9F0Lt
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 4/7] apcupsd: add 3.14.10
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
X-List-Received-Date: Sun, 20 Jan 2013 11:48:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb

diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
new file mode 100644
index 0000000..e50d03f
--- /dev/null
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -0,0 +1,35 @@
+SUMMARY = "foo"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c12853cc7fdf20d17b4fddefd26b7802"
+
+SRC_URI = "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.10/apcupsd-${PV}.tar.gz"
+SRC_URI[md5sum] = "5928822d855c5cf7ac29655e3e0b8c23"
+SRC_URI[sha256sum] = "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51aba5487e189eef2032"
+
+inherit autotools
+
+LD = "${CXX}"
+
+EXTRA_OECONF = "--enable-usb \
+                --with-distname=${DISTRO}"
+
+do_configure() {
+	export topdir=${S}
+	cp -a ${S}/autoconf/configure.in ${S}
+
+	if ! [ -d ${S}/platforms/${DISTRO} ] ; then
+		cp -a ${S}/platforms/unknown ${S}/platforms/${DISTRO} 
+	fi
+
+	gnu-configize --force
+	# install --help says '-c' is an ignored option, but it turns out that the argument to -c isn't ignored, so drop the complete '-c path/to/strip' line
+	sed -i -e 's:$(INSTALL_PROGRAM) $(STRIP):$(INSTALL_PROGRAM):g' ${S}/autoconf/targets.mak
+	# Searching in host dirs triggers the QA checks
+	sed -i -e 's:-I/usr/local/include::g' -e 's:-L/usr/local/lib64::g' -e 's:-L/usr/local/lib::g' ${S}/configure
+
+	# m4 macros are missing, using autotools_do_configure leads to linking errors with gethostname_re
+	oe_runconf
+}
+
+
-- 
1.8.1



