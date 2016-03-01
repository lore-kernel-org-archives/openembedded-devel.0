Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0457575894
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:44:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 01 Mar 2016 00:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,522,1449561600"; d="scan'208";a="661687851"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Mar 2016 00:44:14 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.21]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.10]) with mapi id
	14.03.0248.002; Tue, 1 Mar 2016 16:44:12 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  [meta-oe] [PATCH v3] libvpx: upgrade to version 1.5.0
Thread-Index: AQHRc1YwIgUCYXSu+ESHg+vZfQBQ0Z9EQvMg
Date: Tue, 1 Mar 2016 08:44:11 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D191C222B@PGSMSX103.gar.corp.intel.com>
References: <1456793382-4567-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1456793382-4567-2-git-send-email-rebecca.swee.fun.chang@intel.com>
	<DA09302D-6443-42B7-AE48-FE2DBAE402DD@gmail.com>
In-Reply-To: <DA09302D-6443-42B7-AE48-FE2DBAE402DD@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [meta-oe] [PATCH v3] libvpx: upgrade to version 1.5.0
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
X-List-Received-Date: Tue, 01 Mar 2016 08:44:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We need vp8 to work when using vp8dec (in gst-plugins-good) on software dec=
ode.
I kept the configuration to make sure it is always enabled.
I'm trying to compile without the configuration --enable-vp8 to try out. Do=
 you think I should remove it?

Rebecca

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: Tuesday, March 1, 2016 8:59 AM
To: openembedded-devel@lists.openembedded.org
Cc: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Subject: Re: [oe] [meta-oe] [PATCH v3] libvpx: upgrade to version 1.5.0


> On Feb 29, 2016, at 4:49 PM, rebecca.swee.fun.chang@intel.com wrote:
>=20
> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>=20
> This version had improved VP9 encoder and speeds up the encoding and=20
> decoding process.


much better. Why do we keep v8 enabled

>=20
> Signed-off-by: Chang Rebecca Swee Fun=20
> <rebecca.swee.fun.chang@intel.com>
> ---
> .../recipes-multimedia/webm/{libvpx_1.4.0.bb =3D> libvpx_1.5.0.bb}   | 7 =
+++----
> 1 file changed, 3 insertions(+), 4 deletions(-) rename=20
> meta-oe/recipes-multimedia/webm/{libvpx_1.4.0.bb =3D> libvpx_1.5.0.bb}=20
> (88%)
>=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb=20
> b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> similarity index 88%
> rename from meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> rename to meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> index c963a9c..8ac178d 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b0475501=
5be901744a78cc30d390d4"
> SRC_URI +=3D "http://storage.googleapis.com/downloads.webmproject.org/rel=
eases/webm/${BP}.tar.bz2 \
>             file://libvpx-configure-support-blank-prefix.patch \
>            "
> -SRC_URI[md5sum] =3D "63b1d7f59636a42eeeee9225cc14e7de"
> -SRC_URI[sha256sum] =3D "f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30b=
ac8801ff66a118e4"
> +SRC_URI[md5sum] =3D "49e59dd184caa255886683facea56fca"
> +SRC_URI[sha256sum] =3D "306d67908625675f8e188d37a81fbfafdf5068b09d9aa527=
02b6fbe601c76797"
>=20
> -# ffmpeg links with this and fails
> +# ffmpeg links with this and fails
> # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.tex=
t+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLI=
BC_2.4'
> ARM_INSTRUCTION_SET =3D "arm"
>=20
> @@ -48,4 +48,3 @@ do_install() {
>     oe_runmake install DESTDIR=3D${D}
>     chown -R root:root ${D}
> }
> -
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


