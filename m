Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou9ES-0000JY-Uj
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:25:58 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00B2XPXKG1V7@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 14:25:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 18F3E14AF64; Fri,
	10 Sep 2010 15:24:56 -0400 (EDT)
Date: Fri, 10 Sep 2010 15:24:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTin-FbqWWLQE+ZJ9TA3zF70U=GBy5cbVm_DHqW5J@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910192456.GL28148@denix.org>
MIME-version: 1.0
References: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>
	<i6a71i$2tv$1@dough.gmane.org>
	<AANLkTin-FbqWWLQE+ZJ9TA3zF70U=GBy5cbVm_DHqW5J@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libgles-omap3_3.01.00.07.bb: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Sep 2010 19:25:58 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Thu, Sep 09, 2010 at 06:04:28AM -0700, Steve Sakoman wrote:
> n Thu, Sep 9, 2010 at 1:48 AM, Koen Kooi <k.kooi@student.utwente.nl=
> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 09-09-10 07:28, Khem Raj wrote:
> >> * Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK
> >
> > Khem, the .07 release was made to get the license and distributio=
n
> > changes through, it can now be downloaded with wget without filli=
ng in a
> > form.
>=20
> Koen:  does the .07 release build against recent linux-omap kernels=
 or
> is it still broken in the same way as the .06 version?

Steve, the .07 release is exactly the same as .06 from the code persp=
ective,=20
the only change is in licensing.

--=20
Denys


> > Could you please amend this patch so that the recipes fetch it di=
rectly?
> >
> >
> > regards,
> >
> > Koen
> >
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> =A0.../powervr-drivers/libgles-omap3_3.01.00.07.bb =A0 =A0| =
=A0 19 +++++++++++++++++++
> >> =A0.../omap3-sgx-modules_1.4.14.2616.bb =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A08 +++-----
> >> =A02 files changed, 22 insertions(+), 5 deletions(-)
> >> =A0create mode 100644 recipes/powervr-drivers/libgles-omap3_3.01=
.00.07.bb
> >>
> >> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb=
 b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
> >> new file mode 100644
> >> index 0000000..30a65b3
> >> --- /dev/null
> >> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
> >> @@ -0,0 +1,19 @@
> >> +BINLOCATION =3D "${S}/gfx_rel_es3.x"
> >> +
> >> +ES2LOCATION =3D "${S}/gfx_rel_es2.x"
> >> +ES3LOCATION =3D "${S}/gfx_rel_es3.x"
> >> +ES5LOCATION =3D "${S}/gfx_rel_es5.x"
> >> +
> >> +require libgles-omap3.inc
> >> +
> >> +# download required binary distribution from:
> >> +# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/latest/index_FDS.html
> >> +# see libgles-omap3.inc for detailed installation instructions
> >> +
> >> +SGXPV =3D "3_01_00_07"
> >> +IMGPV =3D "1.4.14.2616"
> >> +BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
> >> +
> >> +SRC_URI[md5sum] =3D "b33a82d393ed0a6c26ad0d952542d762"
> >> +SRC_URI[sha256sum] =3D "6f1720c2a8c2ce84b0020e144c2d77b56106a1f=
ff45b44f8fcfd74d0f2559d8e"
> >> +
> >> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.26=
16.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> >> index 0d2818b..fc98b7b 100644
> >> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> >> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> >> @@ -10,12 +10,11 @@ PR_append =3D "c"
> >> =A0TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> >> =A0require ../ti/ti-eula-unpack.inc
> >>
> >> -SGXPV =3D "3_01_00_06"
> >> +SGXPV =3D "3_01_00_07"
> >> =A0IMGPV =3D "1.4.14.2616"
> >> =A0BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
> >>
> >> =A0SRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics=
_SDK_setuplinux_${SGXPV}.bin \
> >> - =A0 =A0 =A0 =A0 =A0 file://texture-width.patch;striplevel=3D2 =
\
> >> =A0"
> >>
> >> =A0S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
> >> @@ -35,6 +34,5 @@ do_install() {
> >> =A0 =A0 =A0 =A0 =A0${S}/services4/3rdparty/bufferclass_ti/buffer=
class_ti.ko \
> >> =A0 =A0 =A0 =A0 =A0${D}/lib/modules/${KERNEL_VERSION}/kernel/dri=
vers/gpu/pvr
> >> =A0}
> >> -
> >> -SRC_URI[md5sum] =3D "7aa37ca72f34011d353e72cc67f8aac1"
> >> -SRC_URI[sha256sum] =3D "02276bc728699c36b0d2411c60f23030aa066ca=
6b8ed5adb7a40204563a227fb"
> >> +SRC_URI[md5sum] =3D "b33a82d393ed0a6c26ad0d952542d762"
> >> +SRC_URI[sha256sum] =3D "6f1720c2a8c2ce84b0020e144c2d77b56106a1f=
ff45b44f8fcfd74d0f2559d8e"
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >
> > iD8DBQFMiJ9yMkyGM64RGpERAoK2AJ9SsjGBUCtYY5/BOE8FX9ZQq8in3wCgqhnk
> > H28hsB4lTTxnuJUwxpjcSJc=3D
> > =3D9LzQ
> > -----END PGP SIGNATURE-----
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel



