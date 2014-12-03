Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1819260169
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 08:51:12 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id l2so19218402wgh.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZcGGEBmxD4hLPmo1srEI8dZX12TWCotC+rVIBJaM++Q=;
	b=zLamnHQ4gHudPzOAtyOBsMRZmV4V/2m70hbju54XR0DEhk/LGobVadWySd7BhCEEOW
	SqDvRGZlUIK56+epGBD1Y4Y1wHsaHiPvkfWbfXOtKmgiTuv/UnxBGtuAvxBy6Ab+PrOb
	NNPFxiYjY98muMdpuzFcUnRUnFFhASX3Dj9o9Dm72xqSSm4zIorMZlbMWc3uAMIi7Dg4
	oqkFnSqfUz4vVeXZ7V8oXr41ZuGi1FP5rdnFQkmOIWe1mQ9Md9xqU6LAL+bQFxb6MK/n
	Gqb9l084vFyPZJa/GYmiInJmPGSOi7I4wwaYDt4Iq1RwpJWMlDQ1ntB0/szgGfM8jvRk
	GaOg==
X-Received: by 10.180.103.40 with SMTP id ft8mr53920109wib.68.1417596672572;
	Wed, 03 Dec 2014 00:51:12 -0800 (PST)
Received: from localhost.localdomain (pD9F9B8B2.dip0.t-ipconnect.de.
	[217.249.184.178])
	by mx.google.com with ESMTPSA id hn2sm35339910wjc.5.2014.12.03.00.51.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 00:51:11 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Dec 2014 09:50:19 +0100
Message-Id: <1417596619-28605-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-networking][PATCH] stunnel: Update to Version 5.07
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
X-List-Received-Date: Wed, 03 Dec 2014 08:51:15 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 17 -----------------
 meta-networking/recipes-support/stunnel/stunnel_5.07.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.07.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
deleted file mode 100644
index 74f2234..0000000
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Program for providing universal TLS/SSL tunneling service"
-DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
-DEPENDS = "openssl zlib tcp-wrappers"
-
-RDEPENDS_${PN} += "perl"
-
-SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
-SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
-
-inherit autotools
-
-EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.07.bb b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
new file mode 100644
index 0000000..bf47aef
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.07.bb
@@ -0,0 +1,15 @@
+SUMMARY = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=45e8e7befe9a0f7e0543b78dfeebde20"
+
+DEPENDS = "openssl"
+SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "c10edd84ecbc676a5a48c7e34ab3d1c5"
+SRC_URI[sha256sum] = "505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac6ea417afe8065309"
+
+
+inherit autotools
+
+EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
-- 
1.8.1.rc3


