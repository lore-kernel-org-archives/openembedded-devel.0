Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJM-0006BN-UJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:41 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so2162877wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=K4xclQge5VmiSSOVA1RAOJ3PmmVt5xJzPPGn8+c+JUI=;
	b=FD10ggQkpKHyWCDyPgIgxUDzSXLsdBf33FZbfZz9Nz1Z1dUISjOFSQ3scyoycCgN5N
	LSZ97M1AHzXInmDXPFiq5oxPeFFZL69kPLHm9zPDOug734Ep1Wa4urT/Be+58ZiC0gHN
	VreeOjf1hCsIcvt+UO3TK14+VphkW7ugRtulxIGe3mSeF3s6BI0HbujQn/LOPlPgdnRO
	Uv+mVUBTPFXBaI1XKvvWZINZeRnbIIY15WWJfl/BUtDwtejPTAsOlHUmJWjlYeBzPFRr
	p1SE8PYpp8azKCVTxcUpj4snDnR2ske6v6lWcDgGKbIGc4QVTKzsaqMnqVTZNDKXVKsP
	qKJA==
Received: by 10.180.82.132 with SMTP id i4mr391010wiy.12.1332446387959;
	Thu, 22 Mar 2012 12:59:47 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:37 +0100
Message-Id: <1332446382-24958-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/8] systemd-serialgetty: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
 .../recipes-core/systemd/systemd-serialgetty.bb    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
index 5b903a0..5dd9e82 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
@@ -26,12 +26,12 @@ def get_console(d):
 do_install() {
 	if [ ! ${@get_baudrate(d)} = "" ]; then
 		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(d)}/g ${WORKDIR}/serial-getty@.service
-		install -d ${D}${base_libdir}/systemd/system/
+		install -d ${D}${systemd_unitdir}/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
-		install ${WORKDIR}/serial-getty@.service ${D}${base_libdir}/systemd/system/
+		install ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
 
 		# enable the service
-		ln -sf ${base_libdir}/systemd/system/serial-getty@.service \
+		ln -sf ${systemd_unitdir}/system/serial-getty@.service \
 			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(d)}.service
 	fi
 }
@@ -42,5 +42,5 @@ RRECOMMENDS_${PN} = ""
 RDEPENDS_${PN} = "systemd"
 
 # This is a machine specific file
-FILES_${PN} = "${base_libdir}/systemd/system/serial-getty@.service ${sysconfdir}"
+FILES_${PN} = "${systemd_unitdir}/system/serial-getty@.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.6.5



