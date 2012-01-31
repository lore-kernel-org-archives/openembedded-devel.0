Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsHnN-0001mo-Kw
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 18:47:05 +0100
Received: by yenr5 with SMTP id r5so163833yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=IjWsBxNKXMDOsm8mKqUgOpbN/eFW+HekWYx37xRn19E=;
	b=vSyZ0KDn92+dxujLGJePGz0OSAT+O1NZswot1tTNbAeEIIWsxjAC+JZDlNnTzpXlMB
	SIJVrtpVqtEaDTRM2QxYyqH+cS7LKR2iD60iao5j0NjJAzCtuRAL2K5KoWWrxeTql23m
	IMo7+L/WDV+7jMcFcgjDaIxheYpJZPpVDbDy8=
Received: by 10.236.80.4 with SMTP id j4mr36165430yhe.120.1328031551355;
	Tue, 31 Jan 2012 09:39:11 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 6sm43425979anp.14.2012.01.31.09.39.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 09:39:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 17:38:56 +0000
Message-Id: <cb6176771f9766892fb60c8f2a48490b1b060b36.1328031500.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328031500.git.otavio@ossystems.com.br>
References: <cover.1328031500.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328031500.git.otavio@ossystems.com.br>
References: <cover.1328031500.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/3] systemd-serialgetty: support machines without serial console
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
X-List-Received-Date: Tue, 31 Jan 2012 17:47:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/systemd/systemd-serialgetty.bb    |   24 +++++++++++++------
 1 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
index 2b88d0c..5b903a0 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
@@ -2,29 +2,37 @@ DESCRIPTION = "Systemd serial config"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://LICENSE \
            file://serial-getty@.service"
 
-def get_baudrate(bb, d):
-    return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
+def get_serial_console_value(d, index):
+    c = d.getVar('SERIAL_CONSOLE', True)
 
-def get_console(bb, d):
-    return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[1]
+    if len(c):
+        return c.split()[index]
+
+    return ""
+
+def get_baudrate(d):
+    return get_serial_console_value(d, 0)
+
+def get_console(d):
+    return get_serial_console_value(d, 1)
 
 do_install() {
-	if [ ! ${@get_baudrate(bb, d)} = "" ]; then
-		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(bb, d)}/g ${WORKDIR}/serial-getty@.service
+	if [ ! ${@get_baudrate(d)} = "" ]; then
+		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(d)}/g ${WORKDIR}/serial-getty@.service
 		install -d ${D}${base_libdir}/systemd/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install ${WORKDIR}/serial-getty@.service ${D}${base_libdir}/systemd/system/
 
 		# enable the service
 		ln -sf ${base_libdir}/systemd/system/serial-getty@.service \
-			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(bb, d)}.service
+			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(d)}.service
 	fi
 }
 
-- 
1.7.2.5



