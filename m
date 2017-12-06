Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id A1CFF78743
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7074031853A4;
	Wed,  6 Dec 2017 12:13:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id cnK3aHM6397l; Wed,  6 Dec 2017 12:13:44 +0100 (CET)
Received: from t460p (p57A61659.dip0.t-ipconnect.de [87.166.22.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D61163183A96;
	Wed,  6 Dec 2017 12:13:43 +0100 (CET)
Date: Wed, 6 Dec 2017 12:13:42 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20171206121342.647dd19e@t460p>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA53C1@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1512466387-8999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20171205142903.6443ab7e@t460p>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA53C1@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 06 Dec 2017 11:13:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Zheng,

On Wed, 6 Dec 2017 03:30:32 +0000
"Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com> wrote:

> Hi Andreas=EF=BC=81
>    I have some questions here:
>=20
>    1. Why don't you just create a samba-client meta package inside the sa=
mba recipe instead?
>       Well, I don't know how to create a samba-client meta package, and c=
ould you help me?

do it the same way you did here, but put it into samba_*.bb, i.e. add ${PN}=
-client
to PACKAGES and create RDEPENDS_${PN}-client.

You may need to add ALLOW_EMPTY_${PN}-client =3D "1", because the package w=
on't
contain any files.

Don't forget to remove samba-common.

>=20
>    2. All samba libraries already depend on samba-common, so samba depend=
s on it indirectly. Therefore this "package group" doesn't seem to be neces=
sary.
>        Yes, I found it, thank you.
>=20
> > +
> > +SUMMARY_${PN}-ctdb-tests =3D " samba ctdb-tests"
> > +RDEPENDS_${PN}-ctdb-tests =3D "samba-ctdb-tests"
> > +
> > +SUMMARY_${PN}-pidl =3D "samba-pidl"
> > +RDEPENDS_${PN}-pidl =3D "samba-pidl" =20
>=20
>    3. These two seem to be unnecessary, too.
>       Testsuite for samba is unnecessary for the packagegroup, why?
>       And can you give me a advice about how to deal with samba-pidl?Put =
it into client?

Put it nowhere. Installing packagegroup-samba-pidl is in no way easier than
installing samba-pidl directly. The summary doesn't add any value either.

The same holds true for samba-ctdb-tests.

Generally, package groups are meta packages that combine many packages from
different recipes. They don't make sense if they install only one package,
and they aren't necessary if all used packages come from exactly one recipe.

Regards,
Andreas

>=20
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
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Andreas Oberritter
> Sent: Tuesday, December 05, 2017 9:29 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] [meta-networking][PATCH] packagegroup-samba: ne=
w add
>=20
> Hi Zheng,
>=20
> On Tue, 5 Dec 2017 17:33:07 +0800
> zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
>=20
> > Add packagegroup for samba, for there are too many rpms in samba and it=
's hard to manage.
> >=20
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  .../packagegroups/packagegroup-samba.bb            | 28 ++++++++++++++=
++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644=20
> > meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.
> > bb
> >=20
> > diff --git=20
> > a/meta-networking/recipes-connectivity/packagegroups/packagegroup-samb
> > a.bb=20
> > b/meta-networking/recipes-connectivity/packagegroups/packagegroup-samb
> > a.bb
> > new file mode 100644
> > index 0000000..6177691
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/packagegroups/packagegroup-
> > +++ samba.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY =3D "samba package groups"
> > +PV =3D "1.0"
> > +PR =3D "r2"
> > +
> > +inherit packagegroup
> > +
> > +PROVIDES =3D "${PACKAGES}"
> > +PACKAGES =3D "${PN}-server ${PN}-client ${PN}-ctdb-tests ${PN}-pidl"
> > +
> > +SUMMARY_${PN}-client =3D " samba client"
> > +RDEPENDS_${PN}-client =3D "\
> > +    smbclient \
> > +    samba-common \
> > +    winbind \
> > +    registry-tools \
> > +    " =20
>=20
> Why don't you just create a samba-client meta package inside the samba re=
cipe instead?
>=20
> > +
> > +SUMMARY_${PN}-server =3D " samba server"
> > +RDEPENDS_${PN}-server =3D "\
> > +    samba \
> > +    samba-common \
> > +    " =20
>=20
> All samba libraries already depend on samba-common, so samba depends on i=
t indirectly. Therefore this "package group" doesn't seem to be necessary.
>=20
> > +
> > +SUMMARY_${PN}-ctdb-tests =3D " samba ctdb-tests"
> > +RDEPENDS_${PN}-ctdb-tests =3D "samba-ctdb-tests"
> > +
> > +SUMMARY_${PN}-pidl =3D "samba-pidl"
> > +RDEPENDS_${PN}-pidl =3D "samba-pidl" =20
>=20
> These two seem to be unnecessary, too.
>=20
> Regards,
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
>=20


