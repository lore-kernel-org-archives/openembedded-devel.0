Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7ED6C23A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 06:30:00 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5Q6U0n4008734
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 26 Jun 2019 08:30:00 +0200
Received: from ATNETS99130MSX.ww300.siemens.net
	(atnets99130msx.ww300.siemens.net [158.226.163.53])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTPS id x5Q6U0RF002448
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 26 Jun 2019 08:30:00 +0200
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.82]) by
	ATNETS99130MSX.ww300.siemens.net ([158.226.163.53]) with mapi id
	14.03.0439.000; Wed, 26 Jun 2019 08:30:00 +0200
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Thread-Topic: [oe] [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
Thread-Index: AQHVK5hewr0dLDf3pUS+6ZTvDowHg6atd7TQ
Date: Wed, 26 Jun 2019 06:29:59 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC124BEEAB@ATNETS9912WMSX.ww300.siemens.net>
References: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.13]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Scasny,
	Radovan" <radovan.scasny@siemens.com>
Subject: Re: [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Wed, 26 Jun 2019 06:30:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr!

You have removed udev from default configuration. Because if udev is not in=
 PACKAGECONFIG anymore, '--without-udev' will be passed as parameter in con=
figure step.

There are multiple options how to do that.
1. put 'udev' into DEPENDS, RDEPENDS and put '--with-udev' into EXTRA_OECON=
F
 - missing option to disable it
2. keep 'udev' in PACKAGECONFIG
 - will be enabled automatically while is not explicitly overridden by anot=
her PACKAGECONFIG

I prefer an option 2. . Udev will be enabled by default with option to disa=
ble it.

Regards,
Andrej

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> On Behalf Of Oleksandr Kravchuk
Sent: Tuesday, June 25, 2019 10:55 PM
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [oe] [PATCH v2][meta-networking] dhcpcd: update to 7.2.2

udev is now enabled by default and is always requested.

License checksum changed due to modified copyright year.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_7.0.8.bb =3D> dhcpcd_7.2.2.bb}        | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)  rename meta-networking/re=
cipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb =3D> dhcpcd_7.2.2.bb} (70%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/=
meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
similarity index 70%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
index 84c3db7a5..e2759f47a 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
@@ -5,18 +5,16 @@ DESCRIPTION =3D "dhcpcd runs on your machine and silently=
 configures your computer  HOMEPAGE =3D "http://roy.marples.name/projects/d=
hcpcd/"
=20
 LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1e8f17e4edcccc38152ccf60374e0f8=
9"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0531457992a97ecebc6975914a874a9=
d"
=20
 SRC_URI =3D "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] =3D "77bbb1d73b6f30d6ddcc8b0fd3eae266"
-SRC_URI[sha256sum] =3D "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c=
432f36362dc9b5"
-
 SRC_URI +=3D "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+SRC_URI[md5sum] =3D "2f17034432ea10415ee84a97ef131128"
+SRC_URI[sha256sum] =3D "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244a=
d55c62d38ba09e"
=20
 inherit autotools-brokensep
=20
-PACKAGECONFIG ?=3D "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}=
"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
=20
 PACKAGECONFIG[udev] =3D "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
--
2.17.1

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

