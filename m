Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QBFca-00047l-0X
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 02:13:52 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJR00JY7SIKHWA2@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	16 Apr 2011 19:11:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C630514AF5B; Sat,
	16 Apr 2011 20:11:08 -0400 (EDT)
Date: Sat, 16 Apr 2011 20:11:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <BANLkTi=o8_=Wdpe=b+Ydo6iha7aiMszC0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110417001108.GA4068@denix.org>
MIME-version: 1.0
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
	<1302319620-18223-5-git-send-email-heroor@gmail.com>
	<BANLkTi=o8_=Wdpe=b+Ydo6iha7aiMszC0A@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCHv3 5/5] ti-syslink-libs: Add Syslink version	02.00.00.68 Beta1
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
X-List-Received-Date: Sun, 17 Apr 2011 00:13:52 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Sat, Apr 16, 2011 at 04:34:18PM -0500, Xianghua Xiao wrote:
> This recipe includes a SRC URI that is not accessible for the publi=
c,
> why is that?

Actually, it is publicly downloadable. How did you try it and what wa=
s the=20
error message?

--=20
Denys


> On Fri, Apr 8, 2011 at 10:27 PM, Siddharth Heroor <heroor@gmail.com=
> wrote:
> > From: Siddharth Heroor <heroor@ti.com>
> >
> >
> > Signed-off-by: Siddharth Heroor <heroor@ti.com>
> > ---
> > =A0...ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb | =A0 24 ++=
++++++++++++++++++
> > =A01 files changed, 24 insertions(+), 0 deletions(-)
> > =A0create mode 100644 recipes/ti/ti-syslink-libs_02.00.00.67+02.0=
0.00.68beta1.bb
> >
> > diff --git a/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68be=
ta1.bb b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb
> > new file mode 100644
> > index 0000000..4a88f28
> > --- /dev/null
> > +++ b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb
> > @@ -0,0 +1,24 @@
> > +require ti-syslink-libs.inc
> > +
> > +PV =3D "02_00_00_68"
> > +PVExtra =3D "_beta1"
> > +
> > +S =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
> > +SYSLINK_ROOT =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
> > +
> > +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/SysLi=
nk/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=3Dsysl=
inktarball"
> > +SRC_URI[syslinktarball.md5sum] =3D "468034372124f70f82b60cfb5f11=
c8e8"
> > +SRC_URI[syslinktarball.sha256sum] =3D "ed574dcb3a5477cfbc69a1c9e=
768d5197291cb057d19fd791e16e1c89af3e8e1"
> > +
> > +do_configure() {
> > + =A0 =A0# Update config.bld
> > + =A0 =A0sed -i \
> > + =A0 =A0 =A0 =A0-e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =3D\ =
\"${CODEGEN_INSTALL_DIR}\":g \
> > + =A0 =A0 =A0 =A0-e s:C64P_COFF,://C64P_COFF:g \
> > + =A0 =A0 =A0 =A0-e s:C64P_ELF,://C64P_ELF:g \
> > + =A0 =A0 =A0 =A0-e s:C674_COFF,://C674P_COFF:g \
> > + =A0 =A0 =A0 =A0-e s:M3_ELF,://M3_ELF:g \
> > + =A0 =A0 =A0 =A0-e s:A8_ELF$://A8_ELF:g \
> > + =A0 =A0 =A0 =A0${S}/config.bld
> > +}
> > +
> > --
> > 1.7.0.4
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



