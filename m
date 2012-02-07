Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtI-0003dQ-HC
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:32 +0100
Received: by eekd41 with SMTP id d41so2181830eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=V75i9DnfU4HwwK2gUvpSkoEP6OFXcebj5aK54p6OLRc=;
	b=P7u8JnkTikS0j3cIlPIV12f+LrJKME8UIf7tH+vkLU5geftUUhiGis4IlStrLlp3Zy
	c82MRun9dChNzX5aMwx6VAJ3z2vQf1j4ARKfUsS9DwTzFpzmtsSafQLfeAXnLM98/a6M
	B6TiW/v/zbzzCWFqa6nLNGtXOzXEVYHd0evsc=
Received: by 10.14.23.208 with SMTP id v56mr2265055eev.103.1328627730160;
	Tue, 07 Feb 2012 07:15:30 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:29 +0100
Message-Id: <1328627734-5293-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 1/6] led-config: pack systemd support in ${PN}-systemd / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:23:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-core/leds/led-config.bb |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes-core/leds/led-config.bb b/recipes-core/leds/led-config.bb
index 81a65b8..958da42 100644
--- a/recipes-core/leds/led-config.bb
+++ b/recipes-core/leds/led-config.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 inherit systemd
 
 #PV = "${DISTRO_VERSION}"
-PR = "r12"
+PR = "r13"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://led-config \
@@ -24,15 +24,11 @@ do_install () {
 
 	install -m 0644 ${WORKDIR}/leds ${D}/${sysconfdir}/default/
 	install -m 0755 ${WORKDIR}/led-config ${D}/${bindir}
-
-	install -d ${D}/${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/leds.service ${D}/${base_libdir}/systemd/system/
 }
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "leds.service"
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "leds.service"
 
-FILES_${PN} += "${base_libdir}/systemd"
 CONFFILES_${PN} += "${sysconfdir}/default/leds \
                    "
 
-- 
1.7.6.4



