Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071EEC433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 07:40:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.9771.1642491625903049803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DTNddjdl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642491624; i=@fujitsu.com;
	bh=exYlls2p2gGd3uw1Ry6I+Sa5oXkmWKZDabitdXw/MfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DTNddjdlkILiXR/nz75HFkWKy3kA9mVvrtIxYFxPJceW2ZWB75PK8CDqh14Zaay3h
	 0TeIoT7nNXeHxcjj208/2breTOsN+E30G8G7qAjW2n7Nk5dtKp8zDBftz9SmV1WdkD
	 vK2HxnCybmIf0Dq3L0BXQNWl5rGjW0D1o+smxsXZGp7LnVx5qVyEGAFbHCelgibg6M
	 mrmwEaNnRADxmEPdAv6kh3dSnni353LUamGeDBJpPVYUFGroNgTZyHO9To77dQJ7vb
	 i5VpD32RW8VuwPsew5iTpImwI/1FGM2/P4thcFJDLAye+z5jnJWo/tsxdDbcuOsdvA
	 m6qGA18mhoavQ==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 48/4C-09428-8EE66E16;
 Tue, 18 Jan 2022 07:40:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MRovs871m
  iwdZv+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a6HVuYCt7IVaw7dJ+lgfGKVBcjF4eQwEwm
  iT27ljNCOHsZJdYu+MHSxcjJwSagIbF76mVmEFtEQF9i6ew9YDazgJrE0Zc/gWwODmGBNIkfG
  wJAwiwCqhKr9+5nA7F5BVwkTm48yw5iSwgoSEx5+B6slVPAVeLntlnsIK1CQDWrlyhDlAtKnJ
  z5hAViuoTEwRcvmCFalSTeXtrDCGFXSMya1cY0gZF/FpKWWUhaFjAyrWK0TirKTM8oyU3MzNE
  1NDDQNTQ01TU21zU0M9JLrNJN1Est1S1PLS7RBXLLi/VSi4v1iitzk3NS9PJSSzYxAkMypVh1
  0Q7G/at+6h1ilORgUhLlVTr1NFGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK9+zrNEIcGi1PTUi
  rTMHGB8wKQlOHiURHjDs4HSvMUFibnFmekQqVOMxhyXr89bxMxxZdWSRcxCLHn5ealS4rzMuU
  ClAiClGaV5cINgcXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvEMgUnsy8Erh9r4BOYQI
  6ZdXHRyCnlCQipKQamHjfN/C+OKYkd9bGRcDAQeC5kVqktsnscmvjJy9qVq6fcFkmLCj94PnH
  ne7ncm5kbVONPblPWnR/Wmy2Y9uEC+qp35ssQspST+/SbV597uf5G/PEjjOqhy74r7by1IK2m
  bKRO9hqzuivDazzCNNZWS34ybljlwmvy5tVqxJu3s1sF48r3qrxdqHhH1m1s9dCYrb/C2rztj
  7nyNCaqxPGbudqeSlup9GFX5Pjjy/qXXmR0/xdMUMrp9ja5UEnDp2K7/i08alJSmOOK/ez8o8
  nZ4TOe8R/oHTCw4hFV8yv3nv7RFGm8m+hXaiVlezCppz5fKeENs29Y9vGb6LBOjldWe7Tw+ww
  jYCqZRU3pfr+KLEUZyQaajEXFScCABgu3FlWAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-25.tower-565.messagelabs.com!1642491623!65518!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20850 invoked from network); 18 Jan 2022 07:40:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Jan 2022 07:40:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20I7eG6r014537
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:40:23 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 18 Jan 2022 07:40:16 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 1/2] xrdp: Fixed build error with openssl 3.0 and
 upgraded from 0.9.17 to 0.9.18.
Date: Wed, 19 Jan 2022 00:40:03 +0800
Message-ID: <1642524004-3612-2-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642524004-3612-1-git-send-email-leimaohui@fujitsu.com>
References: <1642524004-3612-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 07:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94907

- Fixed build error with openssl 3.0 according to the suggestion of upsream.
  Please reference to https://github.com/neutrinolabs/xrdp/issues/2121.

- Upgraded from 0.9.17 to 0.9.18.

- git repository of xrdp has recursive sources, so, reference to Fedora, modified SRC_URI to a tarball download URL of github.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../xrdp/{xrdp_0.9.17.bb => xrdp_0.9.18.bb}   | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.17.bb => xrdp_0.9.18.bb} (82%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
similarity index 82%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
index bc93c12db..7ec6ae15f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
@@ -6,19 +6,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
 
 inherit features_check autotools pkgconfig useradd systemd
 
-DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
+DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native imlib2 pixman libsm"
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel;protocol=https \
+SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://xrdp.sysconfig \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            "
-SRCREV = "58088324956d94fd2eb5e7694a318cccec6990f1"
 
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "c5eea0af055fac90c632e44fb667f1a25c55de2e34b37127e4cb0aabaef90a0f"
+
+CFLAGS += " -Wno-deprecated-declarations"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fuse] = " --enable-fuse, --disable-fuse, fuse"
@@ -36,7 +37,9 @@ FILES:${PN}-dev += "${libdir}/xrdp/libcommon.so \
                     ${libdir}/xrdp/libscp.so \
                     ${libdir}/xrdp/libxrdpapi.so "
 
-EXTRA_OECONF = "--enable-pam-config=suse"
+EXTRA_OECONF = "--enable-pam-config=suse --enable-fuse \
+                --enable-pixman --enable-painter --enable-vsock \
+                --enable-ipv6 --with-imlib2 --with-socketdir=${localstatedir}/run/${PN}"
 
 do_configure:prepend() {
     cd ${S}
@@ -48,12 +51,7 @@ do_compile:prepend() {
     sed -i 's/(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am/(MAKE) $(AM_MAKEFLAGS) install-exec-am/g' ${S}/keygen/Makefile.in
 }
 
-
 do_install:append() {
-	install -d ${D}${sysconfdir}
-	install -d ${D}${sysconfdir}/xrdp
-	install -d ${D}${sysconfdir}/xrdp/pam.d
-	install -d ${D}${sysconfdir}/sysconfig/xrdp
 
 	# deal with systemd unit files
 	install -d ${D}${systemd_unitdir}/system
@@ -63,11 +61,8 @@ do_install:append() {
 	sed -i -e 's,@sysconfdir@,${sysconfdir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@sbindir@,${sbindir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 
+	install -d ${D}${sysconfdir}/sysconfig/xrdp
 	install -m 0644 ${S}/instfiles/*.ini ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/sesman/sesman.ini.in ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/sesman/startwm.sh ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/xrdp/xrdp.ini.in ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/xrdp/xrdp_keyboard.ini ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/keygen/openssl.conf ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${WORKDIR}/xrdp.sysconfig ${D}${sysconfdir}/sysconfig/xrdp/
 	chown xrdp:xrdp ${D}${sysconfdir}/xrdp
@@ -92,4 +87,3 @@ pkg_postinst:${PN}() {
 		fi
         fi
 }
-PNBLACKLIST[xrdp] ?= "Needs porting to openssl 3.x"
-- 
2.25.1


