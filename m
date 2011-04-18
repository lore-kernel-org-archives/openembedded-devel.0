Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QBeyW-0002HM-97
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 05:18:08 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJT007M0VPOTFY1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	17 Apr 2011 22:15:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2836314AF5B; Sun,
	17 Apr 2011 23:15:24 -0400 (EDT)
Date: Sun, 17 Apr 2011 23:15:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <BANLkTi=FJ2bF31UUSS_4By691ccs0dXnrQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110418031524.GA19200@denix.org>
MIME-version: 1.0
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
	<1302319620-18223-4-git-send-email-heroor@gmail.com>
	<20110417182730.GC4068@denix.org>
	<BANLkTi=FJ2bF31UUSS_4By691ccs0dXnrQ@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCHv3 4/5] ti-syslink-module: Add Syslink version	02.00.00.68 Beta1
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
X-List-Received-Date: Mon, 18 Apr 2011 03:18:08 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Mon, Apr 18, 2011 at 08:31:02AM +0530, Siddharth Heroor wrote:
> On Sun, Apr 17, 2011 at 11:57 PM, Denys Dmytriyenko <denis@denix.or=
g> wrote:
> > On Sat, Apr 09, 2011 at 08:56:59AM +0530, Siddharth Heroor wrote:
> >> From: Siddharth Heroor <heroor@ti.com>
> >>
> >>
> >> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >> ---
> >> =A0...-syslink-module_02.00.00.67+02.00.00.68beta1.bb | =A0 11 +=
++++++++++
> >> =A01 files changed, 11 insertions(+), 0 deletions(-)
> >> =A0create mode 100644 recipes/ti/ti-syslink-module_02.00.00.67+0=
2.00.00.68beta1.bb
> >
> > Sid,
> >
> > Renaming the file with the proper versioning doesn't do any good,=
 when you set
> > the actual PV inside the recipe to the wrong value anyway - bitba=
ke and opkg
> > will sort by PV and not the recipe name! Hence, you are setting t=
he version to
> > 02_00_00_68 and what happens when the real 02_00_00_68 gets relea=
sed?
> >
> Hi Denys,
>=20
> Thank you for correcting my understanding.
>=20
> The next version of syslink is expected to be 02_00_00_69 Beta2. I
> don't think there will be
> a 02_00_00_68_beta2. The version numbering followed by syslink appe=
nds beta1 to
> 02_00_00_68. In such a case, should the next version recipe be
> 02_00_00_68+02_00_00_69_beta2?

Sid,

Are you saying the versioning schema for this component is like this:

02_00_00_68_beta1
02_00_00_69_beta2
etc?

It's quite weird... Anyway, for proper sorting and ordering of versio=
ns, it's=20
still recommended to use OE's versioning policy...

--=20
Denys

> > I did some quick editing and will send the updated patches for #4=
 and #5 -
> > please review and provide feedback. Thanks.
> >
> > --
> > Denys
> >
> >> diff --git a/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.6=
8beta1.bb b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1=
.bb
> >> new file mode 100644
> >> index 0000000..f7bcb35
> >> --- /dev/null
> >> +++ b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.=
bb
> >> @@ -0,0 +1,11 @@
> >> +require ti-syslink-module.inc
> >> +
> >> +PV =3D "02_00_00_68"
> >> +PVExtra =3D "_beta1"
> >> +
> >> +S =3D "${WORKDIR}/syslink_${PV}${PVExtra}/ti/syslink/utils/hlos=
/knl/Linux"
> >> +SYSLINK_ROOT =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
> >> +
> >> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/SysL=
ink/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=3Dsys=
linktarball"
> >> +SRC_URI[syslinktarball.md5sum] =3D "468034372124f70f82b60cfb5f1=
1c8e8"
> >> +SRC_URI[syslinktarball.sha256sum] =3D "ed574dcb3a5477cfbc69a1c9=
e768d5197291cb057d19fd791e16e1c89af3e8e1"
> >> --
> >> 1.7.0.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-devel
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
>=20
>=20
>=20
> --=20
> Sid
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel



