Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id D19FD6B7EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:10 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so183585eaf.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LnN9wEm/CRCEsMjUIlfO+X8S4Zjbade/3fT5mFeM3xQ=;
	b=emkbZ/qabmF30otH42mv8Ja0gnQdMuV3P2yn98Jt3csCK7Dt4QR12USr6gLZRCCSnj
	g1T2NH6Hlrv5D73Vr9qWhkNC9wiOvYBYxLagWwrrqFkqj8aXC6z6mCTnLI7XT3XqpEKa
	Q+akIE09ElM+JvR8kcwr8HqEqUzOqjpuSxJFBlQNfPA+pxSkPUdQ7v2SlG7F2khhrRw5
	OFbJc0yf+MqpFWJmuIDZEfpsSG6f8P3MCX5W9qh8oi1HoI7fjReQCABKpWwD0GHPyBqo
	uVqkUXG0xlQ3xsQzDC22g2pQ56DGV29USi10q2ui1Y/0ZoqN4Gh5wSyENVRQdpYCEAuT
	J9aA==
X-Received: by 10.14.208.194 with SMTP id q42mr12268997eeo.31.1376551151192;
	Thu, 15 Aug 2013 00:19:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm4975342eez.3.2013.08.15.00.19.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:54 +0200
Message-Id: <c54b3f9a3f52b62ecd0ae7f4ed35058b9dabff4d.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 14/60] gsoap: add missing dependency on zlib
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:11 -0000

* do_compile fails without:
| i586-oe-linux-g++  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -L. -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o wsdl2h wsdl2h-wsdl2h.o wsdl2h-wsdl.o wsdl2h-schema.o wsdl2h-types.o wsdl2h-service.o wsdl2h-soap.o wsdl2h-mime.o wsdl2h-wsp.o wsdl2h-wsdlC.o ../../gsoap/libgsoapssl++.a -lssl -lcrypto -lz
| /OE/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/4.7.2/ld: cannot find -lz
| collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
index ba8b619..b85db05 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
@@ -1,6 +1,6 @@
 require gsoap_${PV}.inc
 
-DEPENDS = "gsoap-native openssl"
+DEPENDS = "gsoap-native openssl zlib"
 
 do_install_append() {
     install -d ${D}${libdir}
-- 
1.8.3.2


