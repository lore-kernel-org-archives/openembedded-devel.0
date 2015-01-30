Return-Path: <raphael.freudiger@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3296060132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 12:53:53 +0000 (UTC)
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.14.3/8.14.3) with ESMTP id t0UCrnjo002870;
	Fri, 30 Jan 2015 13:53:49 +0100
Received: from DEFTHW99ERGMSX.ww902.siemens.net
	(defthw99ergmsx.ww902.siemens.net [139.22.70.132])
	by mail2.sbs.de (8.14.3/8.14.3) with ESMTP id t0UCrmPm003978
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Jan 2015 13:53:49 +0100
Received: from DENBGAT9EI4MSX.ww902.siemens.net ([169.254.7.46]) by
	DEFTHW99ERGMSX.ww902.siemens.net ([139.22.70.132]) with mapi id
	14.03.0224.002; Fri, 30 Jan 2015 13:53:33 +0100
From: "Freudiger, Raphael" <raphael.freudiger@siemens.com>
To: Jonathan Liu <net147@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v3] p7zip: new recipe
Thread-Index: AQHQPG0gDD0SKKfR8EKtCkEoEj5XMJzYiJqAgAATE6A=
Date: Fri, 30 Jan 2015 12:53:33 +0000
Message-ID: <03259859A79F5D4AAE6C5B1111FD3EA6010426FB@DENBGAT9EI4MSX.ww902.siemens.net>
References: <1422609231-10378-1-git-send-email-raphael.freudiger@siemens.com>
	<54CB7A5D.1050409@gmail.com>
In-Reply-To: <54CB7A5D.1050409@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.54]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] p7zip: new recipe
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
X-List-Received-Date: Fri, 30 Jan 2015 12:53:57 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

The resulting binary is already stripped, which leads to a QA warning when =
bitbake tries to strip it again.
The INHIBIT_PACKAGE_STRIP prevents this.

I will send a v4 without the PR soon.

Regards,
Raphael

----Urspr=FCngliche Nachricht-----
Von: Jonathan Liu [mailto:net147@gmail.com]=20
Gesendet: Freitag, 30. Januar 2015 13:35
An: Freudiger, Raphael
Cc: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] [meta-oe][PATCH v3] p7zip: new recipe

Hi Raphael,

On 30/01/2015 8:13 PM, Raphael Freudiger wrote:
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb=20
> b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> new file mode 100644
> index 0000000..db46271
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "7-zip is a commandline utility handling 7z archives."
> +HOMEPAGE =3D "http://www.7-zip.org/"
> +LICENSE =3D "LGPL-2.1+ & unRAR"
> +LIC_FILES_CHKSUM =3D "file://DOCS/copying.txt;md5=3Decfc54c9e37b63ac5890=
0061ce2eab5a \
> +                    file://DOCS/unRarLicense.txt;md5=3D9c87ddde469ef94ae=
d153b0951d088de"
> +PR =3D "r1"
PR is not needed.
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${=
PV}_src_all.tar.bz2 \
> +          file://do_not_override_compiler.patch"
> +
> +S =3D "${WORKDIR}/${PN}_${PV}"
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
Can this be removed? Why is INHIBIT_PACKAGE_STRIP needed?
> +
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/bin/* ${D}${bindir} }
> +
> +
> +SRC_URI[md5sum] =3D "bd6caaea567dc0d995c990c5cc883c89"
> +SRC_URI[sha256sum] =3D "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9=
dee7b66f03cb4782"
Regards,
Jonathan

