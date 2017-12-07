Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8587077F34
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 18:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AE41F31A6D64;
	Thu,  7 Dec 2017 19:43:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OaRySiGY5vcy; Thu,  7 Dec 2017 19:43:02 +0100 (CET)
Received: from t460p (p57A61C94.dip0.t-ipconnect.de [87.166.28.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E230B31A6D5E;
	Thu,  7 Dec 2017 19:43:01 +0100 (CET)
Date: Thu, 7 Dec 2017 19:43:00 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20171207194300.6ceeaadd@t460p>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA567B@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1512466387-8999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20171205142903.6443ab7e@t460p>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA53C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20171206121342.647dd19e@t460p>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA567B@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-networking][PATCH] packagegroup-samba: new add
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
X-List-Received-Date: Thu, 07 Dec 2017 18:43:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Dec 2017 01:20:58 +0000
"Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com> wrote:

> Hi Andreas=EF=BC=81
>     Thank you for your description.
>     And what about samba-server?

It's called "samba". If it's confusing, maybe adding a comment inside the r=
ecipe
or to the package summary of "samba" might help.

Regards,
Andreas


>=20
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>=20
>=20
> -----Original Message-----
> From: Andreas Oberritter [mailto:obi@opendreambox.org]=20
> Sent: Wednesday, December 06, 2017 7:14 PM
> To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] [meta-networking][PATCH] packagegroup-samba: ne=
w add
>=20
> Hi Zheng,
>=20
> On Wed, 6 Dec 2017 03:30:32 +0000
> "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com> wrote:
>=20
> > Hi Andreas=EF=BC=81
> >    I have some questions here:
> >=20
> >    1. Why don't you just create a samba-client meta package inside the =
samba recipe instead?
> >       Well, I don't know how to create a samba-client meta package, and=
 could you help me? =20
>=20
> do it the same way you did here, but put it into samba_*.bb, i.e. add ${P=
N}-client to PACKAGES and create RDEPENDS_${PN}-client.
>=20
> You may need to add ALLOW_EMPTY_${PN}-client =3D "1", because the package=
 won't contain any files.
>=20
> Don't forget to remove samba-common.
>=20
> >=20
> >    2. All samba libraries already depend on samba-common, so samba depe=
nds on it indirectly. Therefore this "package group" doesn't seem to be nec=
essary.
> >        Yes, I found it, thank you.
> >  =20
> > > +
> > > +SUMMARY_${PN}-ctdb-tests =3D " samba ctdb-tests"
> > > +RDEPENDS_${PN}-ctdb-tests =3D "samba-ctdb-tests"
> > > +
> > > +SUMMARY_${PN}-pidl =3D "samba-pidl"
> > > +RDEPENDS_${PN}-pidl =3D "samba-pidl"   =20
> >=20
> >    3. These two seem to be unnecessary, too.
> >       Testsuite for samba is unnecessary for the packagegroup, why?
> >       And can you give me a advice about how to deal with samba-pidl?Pu=
t it into client? =20
>=20
> Put it nowhere. Installing packagegroup-samba-pidl is in no way easier th=
an installing samba-pidl directly. The summary doesn't add any value either.
>=20
> The same holds true for samba-ctdb-tests.
>=20
> Generally, package groups are meta packages that combine many packages fr=
om different recipes. They don't make sense if they install only one packag=
e, and they aren't necessary if all used packages come from exactly one rec=
ipe.
>=20
> Regards,
> Andreas
>=20
> >=20
> >=20
> > --------------------------------------------------
> > Zheng Ruoqin
> > Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> > ADDR.: No.6 Wenzhu Road, Software Avenue,
> >        Nanjing, 210012, China
> > MAIL : zhengrq.fnst@cn.fujistu.com
> >=20
> >=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org=20
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> > Of Andreas Oberritter
> > Sent: Tuesday, December 05, 2017 9:29 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH] [meta-networking][PATCH] packagegroup-samba:=
=20
> > new add
> >=20
> > Hi Zheng,
> >=20
> > On Tue, 5 Dec 2017 17:33:07 +0800
> > zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> >  =20
> > > Add packagegroup for samba, for there are too many rpms in samba and =
it's hard to manage.
> > >=20
> > > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > > ---
> > >  .../packagegroups/packagegroup-samba.bb            | 28 ++++++++++++=
++++++++++
> > >  1 file changed, 28 insertions(+)
> > >  create mode 100644
> > > meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.
> > > bb
> > >=20
> > > diff --git
> > > a/meta-networking/recipes-connectivity/packagegroups/packagegroup-sa
> > > mb
> > > a.bb
> > > b/meta-networking/recipes-connectivity/packagegroups/packagegroup-sa
> > > mb
> > > a.bb
> > > new file mode 100644
> > > index 0000000..6177691
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/packagegroups/packagegrou
> > > +++ p-
> > > +++ samba.bb
> > > @@ -0,0 +1,28 @@
> > > +SUMMARY =3D "samba package groups"
> > > +PV =3D "1.0"
> > > +PR =3D "r2"
> > > +
> > > +inherit packagegroup
> > > +
> > > +PROVIDES =3D "${PACKAGES}"
> > > +PACKAGES =3D "${PN}-server ${PN}-client ${PN}-ctdb-tests ${PN}-pidl"
> > > +
> > > +SUMMARY_${PN}-client =3D " samba client"
> > > +RDEPENDS_${PN}-client =3D "\
> > > +    smbclient \
> > > +    samba-common \
> > > +    winbind \
> > > +    registry-tools \
> > > +    "   =20
> >=20
> > Why don't you just create a samba-client meta package inside the samba =
recipe instead?
> >  =20
> > > +
> > > +SUMMARY_${PN}-server =3D " samba server"
> > > +RDEPENDS_${PN}-server =3D "\
> > > +    samba \
> > > +    samba-common \
> > > +    "   =20
> >=20
> > All samba libraries already depend on samba-common, so samba depends on=
 it indirectly. Therefore this "package group" doesn't seem to be necessary.
> >  =20
> > > +
> > > +SUMMARY_${PN}-ctdb-tests =3D " samba ctdb-tests"
> > > +RDEPENDS_${PN}-ctdb-tests =3D "samba-ctdb-tests"
> > > +
> > > +SUMMARY_${PN}-pidl =3D "samba-pidl"
> > > +RDEPENDS_${PN}-pidl =3D "samba-pidl"   =20
> >=20
> > These two seem to be unnecessary, too.
> >=20
> > Regards,
> > Andreas
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> >=20
> >=20
> >  =20
>=20
>=20
>=20
>=20
>=20


