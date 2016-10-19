Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9445F71AFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 00:28:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 128so756314pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=l/HkDqt2Is2oMDXIpRk7POc/kDoqIQCQ+qPwBfWmXM0=;
	b=YKFwN28hgPlENK4m8iMjOaiNKn9O+2Rr5g76m1DxXie2d2w1Yw9RYc7C3fzyRqOd+4
	6I/1ayd3BqSgbZfJ2sIJs5/BOFzmSEBVZvaQvJ/LSmVY0n9KE4ZGdcdPDCeQz1MQ+teq
	EwlFCqQKYuCu9X5ruRhVtP4lfhOezZpl82ZCnm6NL/IlQhDL/guVEDn8YOVh8Uod3qie
	lqtjUhMrHDxK4OpqSiU+BSi3TxsEJzW4bX3gli7h9LHkRnpluGFG1WpsAQ2z4FbfOa06
	bK8v0/SyVKcqUG3H4iqA6z8lZtzrhUB8al/SqzodpQY83aRpkLNP/B7O/ijGKTFF/Wq/
	upHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=l/HkDqt2Is2oMDXIpRk7POc/kDoqIQCQ+qPwBfWmXM0=;
	b=GdsWN1SULopg01GKeujDedPjy0Po8piK9KYdeWy0dgWnSdpp4Ow3MsWTgdZ+vvLojA
	xLjNdG7mWtHhnc0KlW/g9MQXsTpQPHmr/VyoAjWHMyxa+neoijmC2LKhtT6k+Uvqhn4I
	WtiUyvduZApGlEMFWzYnRK5Pceqhxvp9CPQ05xBYknvFzxTZtEov1xmurUQ9/ucZ+SO9
	A0y/W9VrMWoWRpZGnFvNqJZ4DO7b5ixDyQjFNLUn2iMMA29Vg7WVVMkkJscHLWXhfuwF
	iiNetlX5eN2NHk0jez/m0DZJBuaRfMNjREeIlPLV4Vffvgdu5D5C4I++WQ/RlGvs06di
	aoiQ==
X-Gm-Message-State: AA6/9RlNMX3Wz/aqmXbBeXyxr+bILwOwc9e3fhblXaGVfOrdaU1hSu7moWaJLr97Kr7rpA==
X-Received: by 10.98.82.75 with SMTP id g72mr5509643pfb.119.1476836926847;
	Tue, 18 Oct 2016 17:28:46 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	r77sm58497775pfa.85.2016.10.18.17.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Oct 2016 17:28:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 17:28:45 -0700
Message-Id: <1476836925-14631-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: install missing header files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2016 00:28:46 -0000

Wireshark does not install header files. add install_append
Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer needed

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/wireshark/wireshark_2.2.1.bb   | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
index a5fb7f6..f7d7927 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
@@ -43,7 +43,23 @@ PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
 EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
 
-ALLOW_EMPTY_${PN} = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# Currently wireshark does not install header files
+do_install_append () {
 
-FILES_${PN} += "${datadir}*"
+	install -d ${D}/${includedir}/${BPN}
+	install -d ${D}/${includedir}/${BPN}/epan
+	install -d ${D}/${includedir}/${BPN}/epan/crypt
+	install -d ${D}/${includedir}/${BPN}/epan/dfilter
+	install -d ${D}/${includedir}/${BPN}/epan/dissectors
+	install -d ${D}/${includedir}/${BPN}/epan/ftypes
+	install -d ${D}/${includedir}/${BPN}/epan/wmem
+
+	install config.h ${D}/${includedir}/${BPN}
+	install ${S}/register.h ${D}/${includedir}/${BPN}
+	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
+	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
+	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
+	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/dissectors
+	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
+	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
+}
-- 
2.7.4


