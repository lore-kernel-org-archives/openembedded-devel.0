Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 50AC46EC6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 00:40:25 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so12658538ykr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 16:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CY2uwCps2zoAv7NVcHvI+U6NHQKTDi36A6RuhrREQ48=;
	b=vIHmDmtrtWmImz0qStGgP+41y3YGr4G2rOo0LM1+qHZa4Aps0RP4tduGV7xwBeKb43
	kC8Z3mAhYXUYJ+g40Om8F8o6T/L2pcpFtzlR3KAUA+WI2bK0UfN+FEC4vasCpWtTVJnC
	kOcRUY+Qw+II2cJTLghuKUnYUNSwCfdiu2gTr/gcT7/rJXyhhZXdv8p1Ys1z0Kyv7MTr
	Hb2R2syR8Ca15FggU6eeLDTrUsIYcSftLvIOaZDWMDJp2MCZY+GAzcAXwCnNED91tIFw
	uqGaNbq0A0bR6lQzxohYezYuz0H9p3tlrbJNKLV5HZAYtFC81toAdjLHbDfKd44owX3d
	esGA==
X-Received: by 10.236.23.71 with SMTP id u47mr27116114yhu.143.1393202426434;
	Sun, 23 Feb 2014 16:40:26 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 48sm44205160yhq.11.2014.02.23.16.40.24
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 16:40:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 21:39:56 -0300
Message-Id: <1393202396-11130-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
References: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: =?UTF-8?q?Giulian=20Gon=C3=A7alves=20Vivan?= <giulian@ossystems.com.br>
Subject: [meta-qt5][PATCH v3 4/4] qsiv: add the qsiv 1.1 example app
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 00:40:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Giulian Gonçalves Vivan <giulian@ossystems.com.br>

This provides a simple image viewer for demonstration purposes.

Signed-off-by: Giulian Gonçalves Vivan <giulian@ossystems.com.br>
---
 recipes-qt/qsiv/qsiv_1.1.bb |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 recipes-qt/qsiv/qsiv_1.1.bb

diff --git a/recipes-qt/qsiv/qsiv_1.1.bb b/recipes-qt/qsiv/qsiv_1.1.bb
new file mode 100644
index 0000000..bb2efa6
--- /dev/null
+++ b/recipes-qt/qsiv/qsiv_1.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Qt Simple Image Viewer"
+DESCRIPTION = "A simple image viewer using a mix of C++ and qml code for demonstration."
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11c7965a9059e287de5d93b98adf6d1a"
+DEPENDS = "qtdeclarative"
+
+SRCREV = "7b9810b0f02f9ac74fae3ead6e2e9fb5c1382173"
+SRC_URI = "git://code.ossystems.com.br/qt/qsiv;protocol=http"
+
+S = "${WORKDIR}/git"
+
+inherit qmake5
+
+EXTRA_QMAKEVARS_PRE += "target.path=${libdir}/${P}"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    echo "#!/bin/sh" > ${D}${bindir}/qsiv
+    echo "export QML_IMPORT_PATH=${libdir}/${P}/qml/qsiv" >> ${D}${bindir}/qsiv
+    echo "export QML2_IMPORT_PATH=${libdir}/${P}/qml/qsiv" >> ${D}${bindir}/qsiv
+    echo "${libdir}/${P}/qsiv \$* " >> ${D}${bindir}/qsiv
+    chmod +x ${D}${bindir}/qsiv
+}
+
+FILES_${PN} += "${libdir}/${P}"
+RDEPENDS_${PN} += "qtdeclarative-qmlplugins"
+
+FILES_${PN}-dbg += "${libdir}/${P}/.debug"
-- 
1.7.10.4


