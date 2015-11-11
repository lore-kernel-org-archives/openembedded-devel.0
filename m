Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14D3A766B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:58:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAB9w7Ht006058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 01:58:07 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Wed, 11 Nov 2015 01:58:06 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] networkmanager: upgrade to 1.0.6
Thread-Index: AQHRHGZ48Y/CzypFCkiCUpZFQ/KZYJ6Wleuw
Date: Wed, 11 Nov 2015 09:58:06 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C71D837@ALA-MBA.corp.ad.wrs.com>
References: <1447235265-5602-1-git-send-email-jackie.huang@windriver.com>
	<CALbNGRTQuQ2s=0a6CS_i60KK0y5x+eYBWh2LR9N0uEAYEM-a8g@mail.gmail.com>
In-Reply-To: <CALbNGRTQuQ2s=0a6CS_i60KK0y5x+eYBWh2LR9N0uEAYEM-a8g@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] networkmanager: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 11 Nov 2015 09:58:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Andreas M=FCller
> Sent: Wednesday, November 11, 2015 5:51 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] networkmanager: upgrade to 1.0.6
>=20
> On Wed, Nov 11, 2015 at 10:47 AM,  <jackie.huang@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changes:
> > - add packageconfig for libnewt but not enable by default.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../{networkmanager_1.0.4.bb =3D> networkmanager_1.0.6.bb}            =
 | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0=
.4.bb =3D>
> networkmanager_1.0.6.bb} (92%)
> >
> > diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager=
_1.0.4.bb b/meta-
> oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> > similarity index 92%
> > rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_=
1.0.4.bb
> > rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.=
0.6.bb
> > index 310a83b..5bb3cc8 100644
> > --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.=
bb
> > +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.=
bb
> > @@ -12,8 +12,8 @@ SRC_URI =3D " \
> >      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMa=
nager-
> ${PV}.tar.xz \
> >      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.p=
atch \
> >  "
> > -SRC_URI[md5sum] =3D "7eabef7bd3bbdd6dc0473dd32aeac924"
> > -SRC_URI[sha256sum] =3D "e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500b=
f79aecbf54cee018c9"
> > +SRC_URI[md5sum] =3D "00f5f9ec69725a9f9b99366853c6f73e"
> > +SRC_URI[sha256sum] =3D "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919=
761c83fb92648254bd"
> >
> >  S =3D "${WORKDIR}/NetworkManager-${PV}"
> >
> > @@ -42,6 +42,7 @@ PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disa=
ble-bluez5-dun,bluez5"
> >  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,c=
onsolekit,consolekit"
> >  PACKAGECONFIG[concheck] =3D "--with-libsoup=3Dyes,--with-libsoup=3Dno,=
libsoup-2.4"
> >  PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=3Dyes,--with-m=
odem-manager-
> 1=3Dno,modemmanager"
> > +PACKAGECONFIG[nmtui] =3D "--with-nmtui=3Dyes,--with-nmtui=3Dno,libnewt=
"
> >  PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp"
> >
> >  PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bas=
h-completion"
> > --
> > 1.9.1
> There was already a series sent yesterday updating networkmanager to 1.06

Sorry, I didn't notice that, please ignore this.

Thanks,
Jackie

>=20
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

