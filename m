Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id E56E377B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:42:06 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id w11so14369675wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=Mzb6Q1i2hE5ov8VdNXnqp+vwk2zH9CJExpYSYw2CuGY=;
	b=kAQNcyh2WvH3wSqDr8EfccQP/P79qlpJKxzkt6En4Mv/Fx+BTfkofuKujdEldbYv0N
	HG4OzRYI8g/fY3Zgr3gaudroLTMS3kvNQJYM3D1l36YKzLnbMkIgUoiLtYSm+p+5Wdep
	SeYyqmFB5nBmoy7Yql0DhO9+i1gqQP5/pRhoxUHT1nBhzhfn2q3l+UfvyOn2lvajlYDg
	X0x1bvuk6ZgU+U6NhfMoqkpUCV28NTi80CZIKuccN2jo8i0OkeXtvNE6duyqCHcWccz0
	h0FaJl0eCGnjjWVbUqRRm4khpBroL8seT8TRvRFEgFutm6G13J4OLOdZbtM2cbun4duJ
	Bt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id
	:mail-followup-to:mime-version:content-disposition:user-agent;
	bh=Mzb6Q1i2hE5ov8VdNXnqp+vwk2zH9CJExpYSYw2CuGY=;
	b=Ng1fc5VwuZChNIZ9BI+wdSDXAeK/QqhfVholwC+oSfD67BJMTd+vt6qnemy10y4Rpk
	sZBuyW//+NSIjk0lVJuxza60b2Bd2PjuuUXcRF9QNKS1gLB7JFz/0kM0/4gibMjLKmXE
	A/6cIPcgBt3XvniYYcHqGa60zr9xG4y5IviuZHNKOHDktYE2/fzo4SgzUm9sAPv7wprn
	AOggJ1Xx6a9EfgUBpHnYuM0qtJ45SsJ16UrjZ8ievsgH64vpeXJT1o4S39R5FXFBZak1
	gta4+VWaJZsaZ8prcN5F/TO09omGJjPF67PGC4UnWhTKVt7u5l5uf/g9QacZEaWK7JHa
	cttw==
X-Gm-Message-State: AFeK/H1Bbkta0NyZuik3Jwxc28bt+XrgA8jKbDLVkoaPtpE6YhDUtQytHwyRJNXDJyKO5A==
X-Received: by 10.223.133.35 with SMTP id 32mr23357753wrh.129.1491399727356;
	Wed, 05 Apr 2017 06:42:07 -0700 (PDT)
Received: from localhost (x55b0f68b.dyn.telefonica.de. [85.176.246.139])
	by smtp.gmail.com with ESMTPSA id
	191sm22473353wmv.25.2017.04.05.06.42.06
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:42:06 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
Date: Wed, 5 Apr 2017 15:41:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170405134110.GA20393@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] [PATCH] libreswan: this patch adds libreswan to meta-networking
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
X-List-Received-Date: Wed, 05 Apr 2017 13:42:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Libreswan is an IPsec implementation for Linux

Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
---
 .../recipes-support/libreswan/libreswan_3.20.bb    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-support/libreswan/libreswan_3.20.bb

diff --git a/meta-networking/recipes-support/libreswan/libreswan_3.20.bb b/meta-networking/recipes-support/libreswan/libreswan_3.20.bb
new file mode 100644
index 0000000..e291211
--- /dev/null
+++ b/meta-networking/recipes-support/libreswan/libreswan_3.20.bb
@@ -0,0 +1,48 @@
+SUMMERY = "Libreswan is an IPsec implementation for Linux."
+DESCRIPTION = "IPsec implementation with IKEv1 and IKEv2 keying protocols"
+HOMEPAGE = "http://www.libreswan.org"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "gmp nss libcap-ng libevent iproute2 iptables unbound flex-native"
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+RDEPENDS_${PN} = "python curl libpam"
+RDEPENDS_${PN}_nylon = "perl"
+PR = "r0"
+
+SRC_URI = "http://download.libreswan.org/libreswan-${PV}.tar.gz"
+SRC_URI[md5sum] = "72aecdf8314c0c47546d5ae2cf918191"
+SRC_URI[sha256sum] = "2f0931c11ea0b9303ce1e4ee76ffe9db6f3bd70ceead51fe4ec11e2f40a9ae2e"
+
+S = "${WORKDIR}/libreswan-${PV}"
+
+EXTRA_OEMAKE = "DESTDIR=${D} \
+                FINALCONFDIR=${sysconfdir}/ipsec \
+                INC_RCDEFAULT=${sysconfdir}/init.d \
+                INC_USRLOCAL=${prefix} \
+                INC_MANDIR=/share/man \
+                FINALSBINDIR=${bindir} \
+                FINALLIBEXECDIR=${libexecdir}/ipsec \
+                USE_XAUTH=true \
+                USE_LIBCAP_NG=true \
+                USE_LEAK_DETECTIVE=false \
+                WERROR='' \
+                "
+
+do_compile () {
+    export ARCH=${TARGET_ARCH}
+    ${S}/CROSSCOMPILE.sh
+    make \
+    #programs
+    oe_runmake programs
+}
+
+do_install () {
+        oe_runmake install
+        install -d ${D}${datadir}/doc
+}
+
+FILES_${PN} = "${sysconfdir} ${libdir}/ipsec/* ${sbindir}/* ${bindir}/* ${localstatedir}/* ${libexecdir}/ipsec/* /run"
+FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-doc += "${datadir}/libreswan/* ${mandir}/*"
+CONFFILES_${PN} = "${sysconfdir}/ipsec/ipsec.conf"
-- 
1.9.1


