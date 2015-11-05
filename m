Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 379F877106
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 04:03:17 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so49565132pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 20:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=a1Eq2S3vNtN+4pBIJAe3FcA7cIiF9XG8dpklw0gCLoo=;
	b=MAQaUrT7SF7WQ97tmUgNcMbyBwNNiqKcWThtaTohKDSHTz2sbuSO1CSQAjzxrBA7hL
	9+FQG9noQhC+4miVivgqIVgIapm+/mbeJ9CF0zi2gUn96f+aIZHXKY0Wl6kavI4S8ENe
	AjalUdOSV4ULyEGbjeGewfGDP+bDAgCzvwyoMBmCPbJftG+H+eeVeY5PhFHqT7XlU1xz
	nMb3gIY9w/4WNBgJ5k9fWIIPXRPou10PkLeypHpaxdh4dxCZuQDZDxsLE7STPRWA8cVQ
	bE+SP4j7Jdnv/gsx1/a50ruDCpIdVFEOpuPB63PM5YPODJYhy+k9KisjSa64ZXzX7Jvv
	m/OA==
X-Received: by 10.68.197.133 with SMTP id iu5mr6824136pbc.145.1446696197748;
	Wed, 04 Nov 2015 20:03:17 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:441f:6745:6fd9:23af?
	([2601:646:8601:4580:441f:6745:6fd9:23af])
	by smtp.gmail.com with ESMTPSA id
	xm4sm4854037pab.27.2015.11.04.20.03.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Nov 2015 20:03:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446695892-21744-2-git-send-email-danismostlikely@gmail.com>
Date: Wed, 4 Nov 2015 20:03:16 -0800
Message-Id: <255DA978-17A8-4A1C-8E1E-D72360AD923C@gmail.com>
References: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
	<1446695892-21744-2-git-send-email-danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
Subject: Re: [meta-python][PATCH 2/2] gateone: update to latest git
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
X-List-Received-Date: Thu, 05 Nov 2015 04:03:18 -0000
X-Groupsio-MsgNum: 58327
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3D9341E5-B422-4861-BB37-A21BD0B5E416";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3D9341E5-B422-4861-BB37-A21BD0B5E416
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 4, 2015, at 7:58 PM, Dan McGregor <danismostlikely@gmail.com> =
wrote:
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> This version works with pyton-tornado 4.2 as currently distributed
> with OE.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
> ...on.py-Hack-around-broken-gethostname-thin.patch | 26 =
----------------------
> .../recipes-connectivity/gateone/gateone/80oe.conf |  1 +
> .../recipes-connectivity/gateone/gateone_git.bb    |  7 +++---
> 3 files changed, 5 insertions(+), 29 deletions(-)
> delete mode 100644 =
meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hac=
k-around-broken-gethostname-thin.patch
>=20
> diff --git =
a/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-H=
ack-around-broken-gethostname-thin.patch =
b/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-H=
ack-around-broken-gethostname-thin.patch
> deleted file mode 100644
> index 5f5fa91..0000000
> --- =
a/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-H=
ack-around-broken-gethostname-thin.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -=46rom d811d3bdf06d78c93c48bef762c19c392c879077 Mon Sep 17 00:00:00 =
2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Tue, 26 Nov 2013 15:54:10 +0100
> -Subject: [PATCH] configuration.py: Hack around broken gethostname =
thingy
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - gateone/core/configuration.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gateone/core/configuration.py =
b/gateone/core/configuration.py
> -index da41cbd..d1c8222 100644
> ---- a/gateone/core/configuration.py
> -+++ b/gateone/core/configuration.py
> -@@ -162,7 +162,7 @@ def define_options(installed=3DTrue):
> -     ]
> -     # Used both http and https above to demonstrate that both are =
acceptable
> -     try:
> --        additional_origins =3D =
socket.gethostbyname_ex(socket.gethostname())
> -+        additional_origins =3D [] # additional_origins =3D =
socket.gethostbyname_ex(socket.gethostname())
> -     except socket.gaierror:
> -         # Couldn't get any IPs from the hostname
> -         additional_origins =3D []
> ---
> -1.8.4.2
> -
> diff --git =
a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf =
b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
> index cde98bc..09cdbfa 100644
> --- a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
> +++ b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
> @@ -2,6 +2,7 @@
> {
>     "*": {
>         "gateone": { // These settings apply to all of Gate One
> +            "log_file_prefix": "/var/log/gateone.log", // default =
would be /var/log/gateone/gateone.log

Can this use ${localstatedir} some how instead of /var

>             "log_file_max_size": 5242880, // 5 megabyte logs for OE by =
default (default would normally be 100Mb)
>             "log_file_num_backups": 2, // Default is normally 10
>             "origins": ["*"], // Every device has a unique origin
> diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb =
b/meta-python/recipes-connectivity/gateone/gateone_git.bb
> index 7eae12a..80bbae8 100644
> --- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
> +++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
> @@ -4,9 +4,8 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D834cbc6995db88433db17cdf8953a428"
> HOMEPAGE =3D "http://liftoffsoftware.com/Products/GateOne"
>=20
> PV =3D =E2=80=9C1.2"

Should this have SRCPV in PV

> -SRCREV =3D "1528d324088fc1c180b7fdf50f5b5c1af057eef6"
> -SRC_URI =3D "git://github.com/liftoff/GateOne.git \
> -           =
file://0001-configuration.py-Hack-around-broken-gethostname-thin.patch \
> +SRCREV =3D "17fbf85753f4d9c317950a3ef14f811188a51cb7"
> +SRC_URI =3D "git://github.com/liftoff/GateOne.git;branch=3Dmaster \
>            file://gateone-avahi.service \
>            file://80oe.conf \
>            file://gateone.service \
> @@ -49,6 +48,7 @@ FILES_${PN} =3D "${localstatedir}/lib ${bindir} =
${base_libdir} ${sysconfdir} ${PYT
> RDEPENDS_${PN} =3D "mime-support \
>                   openssh-ssh \
>                   python-compression \
> +                  python-contextlib \
>                   python-crypt \
>                   python-datetime \
>                   python-email \
> @@ -76,6 +76,7 @@ RDEPENDS_${PN} =3D "mime-support \
>                   python-tornado \
>                   python-unixadmin \
>                   python-xml \
> +                  python-html5lib \
>                   bash \
> "
>=20
> --
> 2.6.2.11.gb05c2f9
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3D9341E5-B422-4861-BB37-A21BD0B5E416
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY61QQACgkQuwUzVZGdMxQd9QCfU6ubgJsO9Q/s7ZMJMKqQFggq
NjIAnA4+QmnqaIhnD2xgcKOlCT0gW1cv
=YyIv
-----END PGP SIGNATURE-----

--Apple-Mail=_3D9341E5-B422-4861-BB37-A21BD0B5E416--
