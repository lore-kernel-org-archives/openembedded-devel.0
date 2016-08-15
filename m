Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABAE377180
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:04:55 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so4864301qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xc+OvRqpZ7C1X7qZd3+B/iAKy07IpIp0eDfIjScUTA8=;
	b=f3LRbjPcO8+GvHOTluVTLyzPfs4cfevbLf3+QTReSYWssSXql6Qzg/YLZCKGq+DFqY
	HhIOVM85ASbxTXWi7J9ncJ3MslCQEZkKayeKK452qH/XNclYU0gV6rPzfWM5XwqGF/ep
	7en8q1YKElNkOVVmsCRHY82AwxryZgb7JERcYJU2eCI499f9sd3l+Tr9LO5Jvd2LR4jV
	abZxaDanTuYG0OELR3YHDZtS2X6JSATAOvjvWIs+IpsDdG33mgoH8cVVOCwxYvzebrjJ
	tCmmnptBR/95/KLQG7VbHfYeTiG6otydUImMwCDuzvfhREop9TCBvzaosoh5RD0RWL7k
	uVTw==
X-Gm-Message-State: AEkoousSGtDLsyM7l4+naMo4dOLr0IuxSo5RzNToYtlI7K3CuaV+5ECJQ8PzUQc/7f+vjA==
X-Received: by 10.233.235.143 with SMTP id b137mr36508588qkg.144.1471287896536;
	Mon, 15 Aug 2016 12:04:56 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	j38sm13133088qtj.35.2016.08.15.12.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:04:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:04:30 -0400
Message-Id: <1471287872-24274-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCHv2 1/3] engine-pkcs11: update to version 0.2.2
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
X-List-Received-Date: Mon, 15 Aug 2016 19:04:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{engine-pkcs11_0.2.0.bb => engine-pkcs11_0.2.2.bb}       | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/engine-pkcs11/{engine-pkcs11_0.2.0.bb => engine-pkcs11_0.2.2.bb} (71%)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
similarity index 71%
rename from meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
rename to meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
index da096c9..047f701 100644
--- a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=973a19
 DEPENDS = "openssl libp11"
 
 SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git"
-SRCREV = "6909d6761c8820e1750fa0bf4fa8532c82f34e35"
+SRCREV = "132fcf2c8b319f9f4b2ebdc8dcb54ff496dc0519"
 
 S = "${WORKDIR}/git"
 
@@ -18,12 +18,14 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "\
     --disable-static \
-    --libdir ${libdir}/openssl \
+    --libdir ${libdir}/engines \
 "
 
 do_install_append () {
-    rm -f ${D}${libdir}/openssl/engines/libpkcs11.la
+    rm -f ${D}${libdir}/engines/libpkcs11.la
 }
 
-FILES_${PN} += "${libdir}/openssl/engines/libpkcs11.so*"
-FILES_${PN}-dbg += "${libdir}/openssl/engines/.debug/*"
+FILES_${PN} += "${libdir}/engines/libpkcs11${SOLIBSDEV}"
+FILES_${PN}-dbg += "${libdir}/engines/.debug/"
+
+RDEPENDS_${PN} += "openssl libp11 opensc"
-- 
2.7.4


