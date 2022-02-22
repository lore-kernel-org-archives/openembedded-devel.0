Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5E6C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:50:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8226.1645498251910643809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 18:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C5BE40C30
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiLIi0bWnDGd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2974540C2E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D524B174767;
	Mon, 21 Feb 2022 21:50:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/4] meta-openembedded: rename CVE_CHECK_WHITELIST to
 CVE_CHECK_IGNORE
Date: Tue, 22 Feb 2022 02:50:46 +0000
Message-Id: <20220222025048.2826709-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222025048.2826709-1-denis@denix.org>
References: <20220222025048.2826709-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 02:50:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95433

Part of inclusive language changes.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-initramfs/recipes-devtools/dracut/dracut_055.bb            | 2 +-
 meta-networking/recipes-connectivity/samba/samba_4.14.12.bb     | 2 +-
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +-
 meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb       | 2 +-
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb       | 2 +-
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb        | 2 +-
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb       | 2 +-
 meta-oe/recipes-support/nss/nss_3.74.bb                         | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_055.bb
index 91514b840..3eee6669a 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
@@ -67,4 +67,4 @@ RRECOMMENDS:${PN} =3D " \
                     "
=20
 # CVE-2010-4176 affects only Fedora
-CVE_CHECK_WHITELIST +=3D "CVE-2010-4176"
+CVE_CHECK_IGNORE +=3D "CVE-2010-4176"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
index 5be4d2d51..b390d65e6 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
@@ -38,7 +38,7 @@ UPSTREAM_CHECK_REGEX =3D "samba\-(?P<pver>4\.14(\.\d+)+=
).tar.gz"
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version =
pkgconfig
=20
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
-CVE_CHECK_WHITELIST +=3D "CVE-2011-2411"=20
+CVE_CHECK_IGNORE +=3D "CVE-2011-2411"
=20
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove =3D "perl"
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27=
.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 7a6243b10..43b69f7a2 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -98,4 +98,4 @@ FILES:${PN}-staticdev +=3D "${libdir}/sasl2/*.a"
 INSANE_SKIP:${PN} +=3D "dev-so"
=20
 # CVE-2020-8032 affects only openSUSE
-CVE_CHECK_WHITELIST +=3D "CVE-2020-8032"
+CVE_CHECK_IGNORE +=3D "CVE-2020-8032"
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb b/=
meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
index 5c6d22020..205dc929b 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
@@ -38,7 +38,7 @@ CVE_PRODUCT =3D "apple:mdnsresponder"
 # https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0=
613
 # https://security-tracker.debian.org/tracker/CVE-2007-0613
 # https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
-CVE_CHECK_WHITELIST +=3D "CVE-2007-0613"
+CVE_CHECK_IGNORE +=3D "CVE-2007-0613"
=20
 PARALLEL_MAKE =3D ""
=20
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/=
meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index 464f62250..1017f16ad 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -74,4 +74,4 @@ FILES:${PN}-dev +=3D "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg +=3D "${libdir}/dovecot/*/.debug"
=20
 # CVE-2016-4983 affects only postinstall script on specific distribution
-CVE_CHECK_WHITELIST +=3D "CVE-2016-4983"
+CVE_CHECK_IGNORE +=3D "CVE-2016-4983"
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.8p15.bb
index 4a719ae9c..fe2bd0773 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -29,7 +29,7 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
 SRC_URI[sha256sum] =3D "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79=
754a87536b849c19"
=20
 # CVE-2016-9312 is only for windows.
-CVE_CHECK_WHITELIST +=3D "CVE-2016-9312"
+CVE_CHECK_IGNORE +=3D "CVE-2016-9312"
=20
 inherit autotools update-rc.d useradd systemd pkgconfig
=20
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
index 2dc3af6bf..6c4514eb9 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-d=
ownloads"
 SRC_URI[sha256sum] =3D "7500df4734173bce2e95b5039079119dacaff121650b2b6c=
a76d2dc68bdac1c5"
=20
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not =
for openvpn.
-CVE_CHECK_WHITELIST +=3D "CVE-2020-7224 CVE-2020-27569"
+CVE_CHECK_IGNORE +=3D "CVE-2020-7224 CVE-2020-27569"
=20
 SYSTEMD_SERVICE:${PN} +=3D "openvpn@loopback-server.service openvpn@loop=
back-client.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/=
meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
index 06bb97154..bf74f1229 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
@@ -17,7 +17,7 @@ SRCREV =3D "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
 SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;pro=
tocol=3Dhttps"
 S =3D "${WORKDIR}/git"
=20
-CVE_CHECK_WHITELIST +=3D "CVE-2020-35864"
+CVE_CHECK_IGNORE +=3D "CVE-2020-35864"
=20
 CXXFLAGS +=3D "-fPIC"
 BUILD_CXXFLAGS +=3D "-fPIC"
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-su=
pport/nss/nss_3.74.bb
index c93f7caeb..8d40e2c93 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -281,4 +281,4 @@ RDEPENDS:${PN}-smime =3D "perl"
 BBCLASSEXTEND =3D "native nativesdk"
=20
 # CVE-2006-5201 affects only Sun Solaris
-CVE_CHECK_WHITELIST +=3D "CVE-2006-5201"
+CVE_CHECK_IGNORE +=3D "CVE-2006-5201"
--=20
2.25.1


