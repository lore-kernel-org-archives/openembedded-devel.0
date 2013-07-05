Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 066A76B033
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:24:02 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so1164870eak.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iR0mC+ewcqfBjFPkSZrbZqHTOtskuTjunaaoZNuofDA=;
	b=Q9C9Yj82Z5tfYzH1J0gfYkBlZG+va0N87pju4g5xTWyXqWD0EEA32N3LkgrKQUWOT4
	RS57kQe36kGSWhCjNiaDkpqag3DctZ3uZd5rN/FktfUD1oFKnEQWix+rlZnqvrsTlezl
	YQUL907Icwovte+xpBJx58weJZnuoJb8n4owd1/R7RmX1RMpg6HYKpFASxVusQIitnxA
	vPQRpkLAIzXl8PArYU+8tSw2wXxdpxba3h4lDU0+EDEJwN+Vv53iC4eQ4uGV+JPQI4rF
	QLLoneAJgXrES2gYkoXDPNQ30Hq38rxQQinauI6uShiWVyv0lpZaCBLTjkOHl1iAjdOB
	508A==
X-Received: by 10.14.122.201 with SMTP id t49mr9506686eeh.26.1372987443643;
	Thu, 04 Jul 2013 18:24:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id i2sm9727760eeu.4.2013.07.04.18.24.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:24:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:50 +0200
Message-Id: <ae5d4eb48038c263853a4304c7084af75764b84f.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/10] gsoap: add missing dependency on zlib
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
X-List-Received-Date: Fri, 05 Jul 2013 01:24:03 -0000

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
1.8.2.1


