Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A9B97731A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 10:07:09 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aycf8-0002zn-Ef from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2016 03:07:10 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Fri, 6 May 2016 11:07:09 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] Fix "failed sanity test tmpdir" for libnice and
	update PNBLACKLIST.
Thread-Index: AQHRpupW2wHvQUhtUkGj+2KudrTB25+qhDMAgAEr/IA=
Date: Fri, 6 May 2016 10:07:08 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699940127D1DB10@EU-MBX-01.mgc.mentorg.com>
References: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
	<20160505171310.GB23370@jama>
In-Reply-To: <20160505171310.GB23370@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH] Fix "failed sanity test tmpdir" for libnice and update PNBLACKLIST.
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
X-List-Received-Date: Fri, 06 May 2016 10:07:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have sent V2 patch after fixing this.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Thursday, May 05, 2016 10:13 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] Fix "failed sanity test tmpdir" for libnice and u=
pdate PNBLACKLIST.

On Thu, May 05, 2016 at 09:22:30PM +0500, Noor, Ahsan wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Update do_compile_append where it was updating *.pc from ${S} and
>   removing staging dir folder. Now we have seperate build folder
>   where packages got build. We have to search pc in ${B} not in ${S}.
>   After updating the tmp dir pathc is removed from nice.pc file.

typo pathc

> * Remove PNBLACKLIST for libnice and farsight recipes.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta-oe/recipes-support/farsight/farsight2_0.0.22.bb | 1 -
>  meta-oe/recipes-support/farsight/libnice_0.0.13.bb   | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb=20
> b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> index ffb222b..beb6108 100644
> --- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> +++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> @@ -29,4 +29,3 @@ FILES_${PN}-dbg +=3D "${libdir}/*/.debug"
>  SRC_URI[md5sum] =3D "e1f540cf3ebab06c3d7db1f46b44ac88"
>  SRC_URI[sha256sum] =3D "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f872=
9987a27dae6b3974"
> =20
> -PNBLACKLIST[farsight2] ?=3D "Depends on broken libnice"
> diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb=20
> b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> index a9081dc..3d99622 100644
> --- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> +++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> @@ -28,7 +28,7 @@ do_configure_prepend() {  }
> =20
>  do_compile_append() {
> -    for i in $(find ${S} -name "*.pc") ; do
> +    for i in $(find ${B} -name "*.pc") ; do
>          sed -i -e s:${STAGING_DIR_TARGET}::g \
>                 -e s:/${TARGET_SYS}::g \
>                    $i
> @@ -39,4 +39,3 @@ do_compile_append() {  SRC_URI[md5sum] =3D=20
> "e5b9f799a57cb939ea2658ec35253ab9"
>  SRC_URI[sha256sum] =3D "d8dd260c486a470a6052a5323920878a084e44a19df09b15=
728b85c9e3d6edf0"
> =20
> -PNBLACKLIST[libnice] ?=3D "BROKEN: QA Issue: nice.pc failed sanity test =
(tmpdir)"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

