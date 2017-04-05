Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2D55D77B1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:42:04 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id t20so15516618wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=ybtIr55fo9cpLSypoQsPVX1j7oKqGYNPjwE/osbHLY0=;
	b=aaMORvfk+xCRw3d8wrw/9t/Q6nMn4sZDpFTALEjVgZ42fGdYla6CWJzRiy/SUGE5Zq
	1eWbkxHMlGL4dhkQrzkCy+8wCbuoI3txw9CG9cU7bRYvaAhHXaRwCxvAqlWrqLRK9+sw
	nsyJMHlKmtRrm4OLU1olL4qG6tU3c2QUVM2dvHy0aKm9/qGak6DDRIFWGgvSbwbPJbF7
	OMLMn1xlGKaaEr1dJeE41+20eKalX5HpDN6JPkOpjN3R7RmwTCmatBepgkXjKTzm2oC3
	FlGuylZJwlcsu0kwRZszJQgDtYUBsv9ii1x0ls9e9+npYk8jOk9Lj00UtyT+Wkx21+9W
	vo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id
	:mail-followup-to:mime-version:content-disposition:user-agent;
	bh=ybtIr55fo9cpLSypoQsPVX1j7oKqGYNPjwE/osbHLY0=;
	b=RlgB004h6fJ7a69j8N0vgwBKHwMeNDbYg+jwS0kWtoJxzILBGIaFeh5vqorFcKZzh/
	pmH8cfA5JeZ7ihwKdLmCCFkk1B3012xjL+jPRKGWSTctDfedsR2oBqTInTG7jMYW8Zw+
	7hkvQzNg80p36G/7GP3q/vAFNBy/8i7AwIFjfZF85ax4jUrj4UlWmB5cV6u7ciI5FNTP
	9QXXCd5I+Ath7Mr9I4abufDzg7a8z6kW6EOe8CAyTFIEZGBseqWXTLNasRo24/EU7BcU
	9EgzPY+g0XduHU1DXjtge2BjP8j8SMwlpjTzZqkkf9+81WAsmJj1yC/1FLfCYW7wwjyx
	lykg==
X-Gm-Message-State: AFeK/H21Pl1SzWQnA2laqcH5lvoPLRqeE9R9JBNJlakxiUrbG2QNl+WTw37uoMPkBXBeiw==
X-Received: by 10.223.142.45 with SMTP id n42mr867283wrb.131.1491399725562;
	Wed, 05 Apr 2017 06:42:05 -0700 (PDT)
Received: from localhost (x55b0f68b.dyn.telefonica.de. [85.176.246.139])
	by smtp.gmail.com with ESMTPSA id
	94sm26296192wrp.34.2017.04.05.06.42.04
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:42:04 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
Date: Wed, 5 Apr 2017 15:40:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170405134010.GA18688@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] [PATCH] unbound: this patch adds unbound to meta-networking
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
X-List-Received-Date: Wed, 05 Apr 2017 13:42:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unbound is a validating, recursive, and caching DNS resolver

Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
---
 .../recipes-support/unbound/unbound_1.6.1.bb       | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound_1.6.1.bb

diff --git a/meta-networking/recipes-support/unbound/unbound_1.6.1.bb b/meta-networking/recipes-support/unbound/unbound_1.6.1.bb
new file mode 100644
index 0000000..b6e0a42
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound_1.6.1.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
+DESCRIPTION = "\ Unbound is designed as a set of modular components, so that \
+                also DNSSEC (secure DNS) validation and stub-resolvers \
+                (that do not run as a server, but are linked into an applica \
+                tion) are easily possible."
+
+HOMEPAGE = "https://www.unbound.net/"
+SECTION = "net"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
+DEPENDS = "openssl libtool libevent"
+RDEPENDS_${PN} += "bash"
+inherit autotools pkgconfig
+PR = "r0"
+
+SRC_URI = "https://www.unbound.net/downloads/${BP}.tar.gz"
+SRC_URI[md5sum] = "aa808f33d94a36c9312d1b8ad8805e14"
+SRC_URI[sha256sum] = "42df63f743c0fe8424aeafcf003ad4b880b46c14149d696057313f5c1ef51400"
+
+S = "${WORKDIR}/unbound-${PV}"
+
+EXTRA_OECONF = " \
+        --host=${TARGET_SYS} \
+        --sysconfdir=/etc/ \
+        --localstatedir=/var \
+        --sbindir=/usr/bin \
+        --with-conf-file=/etc/unbound/unbound.conf \
+        --with-pidfile=/run/unbound.pid \
+        --with-rootkey-file=/etc/trusted-key.key \
+"
+
+do_configure () {
+        ${S}/configure ${EXTRA_OECONF}
+}
+
+do_compile () {
+        oe_runmake
+}
+
+do_install () {
+        install -d ${D}${bindir}
+        install -d ${D}${libdir}
+        install -d ${D}${sysconfdir}
+        install -m 644 -D ${S}/libunbound/unbound.h ${D}${includedir}/unbound.h
+        install -m 644 -D ${S}/doc/example.conf.in ${D}${sysconfdir}/unbound/unbound.conf
+        install -m 644 -D ${S}/contrib/unbound.service.in ${D}${libdir}/systemd/unbound.service
+        install -m 755 unbound ${D}${bindir}
+        install -m 755 unbound-anchor ${D}${bindir}
+        install -m 755 unbound-checkconf ${D}${bindir}
+        install -m 755 unbound ${D}${bindir}
+        install -m 755 unbound-control-setup ${D}${bindir}
+        install -m 755 unbound-host ${D}${bindir}
+        install -m 755 ${WORKDIR}/build/.libs/libunbound.so* ${D}${libdir}
+}
+
+FILES_${PN} ="${sysconfdir}/unbound/unbound.conf ${bindir}/unbound* ${libdir}/systemd/unbound.service ${includedir}/unbound.h ${libdir}/libunbound.so*"
+FILES_${PN}-dev = "${includedir}/*"
-- 
1.9.1


