Return-Path: <gyurco@freemail.hu>
Received: from smarthost06.digicable.hu (smarthost06.digicable.hu
	[94.21.128.16])
	by mail.openembedded.org (Postfix) with ESMTP id 971FB71637
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:05:13 +0000 (UTC)
Received: from [92.249.128.185] (helo=relay03.digicable.hu)
	by smarthost06.digicable.hu with esmtp
	id 1YE1Wa-0005gv-U6 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 21:05:12 +0100
Received: from [78.131.10.118] (helo=gyurco.localdomain)
	by relay03.digicable.hu with esmtpa
	id 1YE1Wa-0004CP-Jl for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 21:05:12 +0100
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jan 2015 21:05:12 +0100
Message-ID: <1475068.2YaKjJgxm5@gyurco.localdomain>
User-Agent: KMail/4.14.4 (Linux/3.17.8-300.fc21.x86_64; KDE/4.14.4; x86_64;
	git-47b8209; 2015-01-17)
In-Reply-To: <1443677.77tJzovrQh@gyurco.localdomain>
References: <3131686.1jEHazhdRQ@gyurco.localdomain>
	<1443677.77tJzovrQh@gyurco.localdomain>
MIME-Version: 1.0
X-Original: 78.131.10.118
X-Original: 92.249.128.185
Subject: Re: [meta-oe][PATCH]ntp: fix perl path
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
X-List-Received-Date: Wed, 21 Jan 2015 20:05:16 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

...more precisely, without the patch ntp-utils will have a /bin/perl=20=

dependency, so it becomes uninstallable (nothing provides /bin/perl).

Br,
Gy=F6rgy

On Sunday 18 January 2015 15:42:59 Szombathelyi Gy=F6rgy wrote:
> Hi,
>=20
> Any chance to get this into git? Now if one has a system /bin/perl, n=
tp
> build will fail.
>=20
> Br,
> Gy=F6rgy
>=20
> On Tuesday 13 January 2015 22:44:03 Szombathelyi Gy=F6rgy wrote:
> >     Fix perl path in ntp-wait and calc_tickadj.
> >    =20
> >     Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> >=20
> > diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
> > b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb index 9f74f6b..e=
802ee7
> > 100644
> > --- a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
> > +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
> > @@ -74,8 +74,10 @@ do_install_append() {
> >=20
> >      sed -i
> >=20
> > 's!^PATH=3D.*!PATH=3D${base_sbindir}:${base_bindir}:${sbindir}:${bi=
ndir}!'
> > ${D}${bindir}/ntpdate-sync sed -i '1s,#!.*perl -w,#! ${bindir}/env =
perl,'
> > ${D}${sbindir}/ntptrace sed -i '/use/i use warnings;'
> > ${D}${sbindir}/ntptrace
> > -    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,'
> > ${D}${sbindir}/ntp-wait
> > +    sed -i '1s,#!.*perl,#! ${bindir}/env perl,' ${D}${sbindir}/ntp=
-wait
> >=20
> >      sed -i '/use/i use warnings;' ${D}${sbindir}/ntp-wait
> >=20
> > +    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,'
> > ${D}${sbindir}/calc_tickadj +    sed -i '/use/i use warnings;'
> > ${D}${sbindir}/calc_tickadj
> >=20
> >      install -d ${D}/${sysconfdir}/default
> >      install -m 644 ${WORKDIR}/ntpdate.default
> >=20
> > ${D}${sysconfdir}/default/ntpdate


