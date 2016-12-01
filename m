Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBF16AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 03:37:27 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so11097724pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JmAWNHhcoIzxlrymhoY3yf4ThPVQ25EnigQa4UD1li8=;
	b=hqZvzbNSjtC/eJgatbgWmX0q16rHMM067g5gWIhON94XDEG9K+yAtpwdzlCwcsD5cI
	FNZE3mWNnsDPRThBeNOwbagyUyD1XVD5ijx/x6OiU0SBRU+AN5H/v2GWKQ8kzQPnAjFq
	QopAMwZssLXD4FahYaXG3jNPNlzOgD1BnJTmdEDbhKPyscYUHe+JSDER6ixnybyzeD4S
	yTrw84Md5+PYQ3OoAocgTsxXEUgGjVA21tAYZ6QeaCAesiFTbsm4oVaWGaOPjUHK+skl
	NCPq15BRR8qASZysNT369u0vx4i7AbEPmBdnTUb0uP7j+3ORe/cRjJP3i8oXmRf+Wf24
	TE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JmAWNHhcoIzxlrymhoY3yf4ThPVQ25EnigQa4UD1li8=;
	b=Q75PRcId99DOGRnG5LsM+tPXHBhcRdRFrhLeRGEmyPRDkmzOOiEE4uXk2f2N7gt22a
	d52TBsw89lfvFLaJTF6t7pf6j+EQ3LDc66lKd9iZ8P0yFXQ9Z/4wCl2dYRaBDYcaN7nO
	6YdPDdmhYcgs+eUZQlAeKxLvwMCyDaqYYnka9SiLEtAcxUG3QtpzNhrYcw/7Lxse4eYm
	XsKZlaw/DjxUVOEzhxhaaEr4AEUEi8sJcwkbcuOt8vunIIu4WRphx4AgvupHeZMB2HvY
	j5HJR5VLg9nBvIxGdTHh7SYrRnHIiw8Tj83GlA7xUA4kAMtz8vyGvPMc0FxL2OIKhtMR
	C2/Q==
X-Gm-Message-State: AKaTC02bTy0a0wZRLdFfQMqD27cPbBqx6bNRnNust4GkbEZmKoW+1TN/Q8WbCQwWGS9SQw==
X-Received: by 10.98.35.5 with SMTP id j5mr36388610pfj.91.1480563449380;
	Wed, 30 Nov 2016 19:37:29 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w16sm88225487pgc.30.2016.11.30.19.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 19:37:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 19:37:23 -0800
Message-Id: <20161201033723.6754-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-networking][PATCH V4 3/4] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Thu, 01 Dec 2016 03:37:28 -0000

* Add packageconfig for krb5
* Require pam in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/dante/dante_1.4.1.bb         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/dante/dante_1.4.1.bb

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
new file mode 100644
index 0000000..3b07ffe
--- /dev/null
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
@@ -0,0 +1,49 @@
+SECTION = "console/utils"
+SUMMARY = "A free SOCKS server"
+DESCRIPTION = "Dante consists of a SOCKS server and a SOCKS client,\
+implementing RFC 1928 and related standards. It is a flexible product\
+that can be used to provide convenient and secure network\
+connectivity. Once installed, Dante can in most cases be made\
+transparent to clients, providing functionality somewhat similar to\
+what could be described as a non-transparent Layer 4 router."
+HOMEPAGE = "http://www.inet.no/dante/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=221118dda731fe93a85d0ed973467249"
+
+SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "68c2ce12119e12cea11a90c7a80efa8f"
+SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53"
+
+# without --without-gssapi, config.log will contain reference to /usr/lib
+# as a consequence of GSSAPI path being set to /usr by default.
+# --with-gssapi-path=PATH specify gssapi path
+# --without-gssapi        disable gssapi support
+# --enable-release        build prerelease as full release
+EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
+
+DEPENDS += "flex-native bison-native libpam"
+
+inherit autotools-brokensep distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "pam"
+
+EXTRA_AUTORECONF = "-I ${S}"
+
+PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
+PACKAGECONFIG[krb5] = ",--disable-krb5,krb5"
+
+PACKAGECONFIG ??= ""
+
+do_install_append() {
+    install -d ${D}${sysconfdir}
+    cp ${S}/example/sock[sd].conf ${D}${sysconfdir}
+}
+
+PACKAGES =+ "${PN}-sockd ${PN}-libdsocks "
+
+FILES_${PN}-libdsocks = "${libdir}/libdsocks.so"
+FILES_${PN}-sockd = "${bindir}/sockd ${sysconfdir}/sockd.conf"
+
+INSANE_SKIP_${PN}-libdsocks = "dev-elf"
-- 
2.10.2


