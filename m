Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtJ-0003dR-3y
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:33 +0100
Received: by eaal10 with SMTP id l10so1956628eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=DjYuqUWk4NRghSV/MAwcgC79/Riy1IHQZxELIw4Ldck=;
	b=WDDK8rrqDKLLrGCY5HKri6fXyc20CK4CXEWnUhMNq68JFHhYzPokA3C6RmfnYdWk9R
	ejou4YDCDP9TMuTdz08xtM84bcRljL25rYwaKO9hNqgVqPxP7CBFdFs6gegYX0QStjS8
	UNEhFEczzdTFf9/+byxe9ETVEq1YqEGbO/jEE=
Received: by 10.213.10.196 with SMTP id q4mr371855ebq.82.1328627731024;
	Tue, 07 Feb 2012 07:15:31 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:30 +0100
Message-Id: <1328627734-5293-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 2/6] timestamp-service: pack systemd support in ${PN}-systemd / remove unneeded systemd code
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
 recipes-core/systemd/timestamp-service.bb |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/recipes-core/systemd/timestamp-service.bb b/recipes-core/systemd/timestamp-service.bb
index be8325e..bd08d7f 100644
--- a/recipes-core/systemd/timestamp-service.bb
+++ b/recipes-core/systemd/timestamp-service.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Poor mans RTC using timestamps"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
+PR = "r1"
+
 inherit allarch systemd
 
 SRC_URI = "file://timestamp.service \
@@ -15,15 +17,9 @@ do_compile() {
 
 do_install () {
 	install -d ${D}/${bindir}
-
 	install -m 0755 ${WORKDIR}/load-timestamp.sh ${D}/${bindir}
-
-	install -d ${D}/${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/timestamp.service ${D}/${base_libdir}/systemd/system/
 }
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "timestamp.service"
-
-FILES_${PN} += "${base_libdir}/systemd"
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "timestamp.service"
 
-- 
1.7.6.4



