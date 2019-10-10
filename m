Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4086E6C0EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 09:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2238B1842E;
	Thu, 10 Oct 2019 11:13:44 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id rhaamql6W0gc; Thu, 10 Oct 2019 11:13:41 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5D96018421;
	Thu, 10 Oct 2019 11:13:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E7DA1A065;
	Thu, 10 Oct 2019 11:13:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 325161A064;
	Thu, 10 Oct 2019 11:13:41 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 10 Oct 2019 11:13:41 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 25C0EF6D;
	Thu, 10 Oct 2019 11:13:41 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 10 Oct 2019 11:13:41 +0200
Received: from XBOX03.axis.com (10.0.5.17) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 10 Oct 2019 11:13:40 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Thu, 10 Oct 2019 11:13:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] kconfig-frontends: Retrieve the Git
	repository from GitLab
Thread-Index: AQHVf0pD3WvxNzMOYUCsn+8ZaaFwNqdTljbA
Date: Thu, 10 Oct 2019 09:13:40 +0000
Message-ID: <a894dfe7a40e490480789090ef3f0b29@XBOX03.axis.com>
References: <20191010090800.14823-1-pkj@axis.com>
In-Reply-To: <20191010090800.14823-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] kconfig-frontends: Retrieve the Git	repository from GitLab
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
X-List-Received-Date: Thu, 10 Oct 2019 09:13:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Armin, once this is accepted to master, can you backport it to Thud and=20
Warrior as well? There has been no other changes to the recipe for a long=20
time so it should apply without any problems.

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-dev=
el-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 10 oktober 2019 11:08
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] kconfig-frontends: Retrieve the Git reposi=
tory from GitLab
>=20
> The ymorin.is-a-geek.org site has been down since September and there
> is no indication of when, if ever, it will be back. Retrieve the
> repository from GitLab instead, recommended by the maintainer, Yann E
> Morin.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends=
_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends=
_4.11.0.1.bb
> index de9a6eb99..fae80a79e 100644
> --- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0=
.1.bb
> +++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0=
.1.bb
> @@ -7,13 +7,13 @@ the effort of keeping an up-to-date, out-of-tree, packa=
ging of the \
>  kconfig infrastructure, ready for use by third-party projects. \
>  The kconfig-frontends package provides the kconfig parser, as well as al=
l \
>  the frontends"
> -HOMEPAGE =3D "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
> +HOMEPAGE =3D "https://gitlab.com/ymorin/kconfig-frontends"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9b8cf60ff39767ff04b671fca8302=
408"
>  SECTION =3D "devel"
>  DEPENDS +=3D "ncurses flex bison gperf-native bison-native"
>  RDEPENDS_${PN} +=3D "python3 bash"
> -SRC_URI =3D "git://ymorin.is-a-geek.org/kconfig-frontends;branch=3D4.11.=
x \
> +SRC_URI =3D "git://gitlab.com/ymorin/kconfig-frontends.git;protocol=3Dht=
tps;branch=3D4.11.x \
>  	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.pat=
ch \
>             file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch"
>=20
> --
> 2.21.0


