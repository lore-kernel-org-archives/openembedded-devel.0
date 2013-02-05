Received: from mail-yh0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1U2nzZ-0004R5-M2
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 20:15:42 +0100
Received: by mail-yh0-f41.google.com with SMTP id 47so63477yhr.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 10:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=k2BN4b91aqWL13EIajTkCl71kc/WKbx3lLe7CAAr8n8=;
	b=z1UqxpQWjo3qKOF7H5DoddKYhBelHFJiK1DojSGXoAit6X8/zrYvY5vsttNBMqcS6t
	xFxFe3fS1yokZ8HUZ9N2FiJdbAaQsJJ2kFEcB9Al7bYjRxaltoEtt56cicVwATbVcOrK
	EV8e9tp2xSsEequ/1ZTmfXpFZGLLcUTxEHT0H11VHDSm5p3Qmi/ywgkAJ9OkNa9XvIol
	9xA/Z+GOUWTeD2IRJc4DTKl+hi8GIoBBOkICKUQ7bv+yqOPm0MXjSc9bPMU40Qxvy1LT
	pJAdYmi4OxQ2mN3kCSJeZmJ7SNjC98xFAV73DCym/6CxLyZLb5Qf4/6tPAC3nIxfQ+W5
	2gqw==
X-Received: by 10.236.79.9 with SMTP id h9mr19282654yhe.83.1360090791404;
	Tue, 05 Feb 2013 10:59:51 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id f29sm19733609anj.17.2013.02.05.10.59.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 10:59:50 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:59:27 -0200
Message-Id: <1360090767-15512-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] mg: add recipe for version 20110905
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
X-List-Received-Date: Tue, 05 Feb 2013 19:15:42 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-support/mg/mg_20110905.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/mg/mg_20110905.bb

diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-support/mg/mg_20110905.bb
new file mode 100644
index 0000000..8d6907e
--- /dev/null
+++ b/meta-oe/recipes-support/mg/mg_20110905.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "A portable version of the mg maintained by the OpenBSD team"
+HOMEPAGE = "http://homepage.boetes.org/software/mg/"
+LICENSE = "Public Domain"
+DEPENDS = "ncurses"
+SECTION = "console/editors"
+
+SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "2de35316fa8ebafe6003efaae70b723e"
+SRC_URI[sha256sum] = "1cd37d7e6a3eecc890a5718c38b8f38495057ba93856762a756ccee2f9618229"
+
+LIC_FILES_CHKSUM = "file://version.c;md5=811e1b67a5cd60c12b218a2b7c1adbf2"
+
+do_configure () {
+    sed -i Makefile.in -e 's,^prefix=.*,prefix=${prefix},'
+    ./configure
+}
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
-- 
1.7.2.5



