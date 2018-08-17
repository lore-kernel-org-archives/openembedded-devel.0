Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5CA748F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 13:39:43 +0000 (UTC)
Received: from svr-orw-mbx-05.mgc.mentorg.com ([147.34.90.205])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fqeye-0005tM-9N from Joe_MacDonald@mentor.com ;
	Fri, 17 Aug 2018 06:39:44 -0700
Received: from svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) by
	SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 17 Aug 2018 06:39:41 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Fri, 17 Aug 2018 06:39:41 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 5844)
	id D304E28A2431; Fri, 17 Aug 2018 09:39:39 -0400 (EDT)
Date: Fri, 17 Aug 2018 09:39:37 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Stefan BOSAK <stefan.bosak@gmail.com>
Message-ID: <20180817133936.GA12454@mentor.com>
References: <20180816024200.6394-1-joe_macdonald@mentor.com>
	<CAPr_pvtpVGhG-9N3miYOG9ZWhY=LzQWmp4Ewmj9RXh8s-_59Wg@mail.gmail.com>
	<20180816161901.GB9441@mentor.com>
	<CAPr_pvvoqkqNsZ+-eSBMa11_GKJPdPCPZjnOug=81W+vV7gLRA@mail.gmail.com>
	<20180816194526.GC13296@mentor.com>
	<CAPr_pvtGjZyVrKR7Ex8U7eSYHApncXDq2p_9HAoS+0EcEE7NKg@mail.gmail.com>
	<20180817013133.GA19232@mentor.com>
	<CAPr_pvtB4YdzajOEnEPCmbsA5EX2rR2e6-p5V7hf8DA4+FNTHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPr_pvtB4YdzajOEnEPCmbsA5EX2rR2e6-p5V7hf8DA4+FNTHg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] bird: initial import
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
X-List-Received-Date: Fri, 17 Aug 2018 13:39:43 -0000
X-Groupsio-MsgNum: 74020
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH] bird: initial import] On 18.08.17 (Fri 07:51)=
 Stefan BOSAK wrote:

> Hi Joe and Khem,
>=20
> @Joe
> I am writting within your message.
>=20
> @Khem Raj=20
> In the term of Bird versions:
> - both versions are mutually not compatible (config transitions/transform=
ations
> are required), that's correct
> - 1.6.x is production ready (officially supported by many distributions, =
it is
> kind of LTS, would be/stay maintainable for several next years)
> - 2.0.x would go to production ready mode later (still not supported, sad=
ly i
> do not know about any distribution which is supporting this version)
>=20
> My suggestion is to import at least version 1.6.x into official repository
> within Yocto ecosystem.

This wouldn't be the first time we've encountered this scenario and
while it's not ideal, I don't see it as a show stopper either.  I'd had
it in mind that I'd start with integrating your recipe then move out the
2.0.x version in favour of a git version so we can more easily track
updates (so ultimately it'll look more like the refpolicy recipes in
meta-selinux) but this seems like an okay first step.  That said,
there's possibly more to it than just that, in my comments below.

> On Fri, Aug 17, 2018 at 3:31 AM Joe MacDonald <Joe_MacDonald@mentor.com> =
wrote:
>=20
>     Hi Stefan,
>=20
>     Based on the information you've share here, then, I have some additio=
nal
>     questions about this, because I'm now not confident I can correlate w=
hat
>     you've said with what I'm seeing.
>=20
>     [Re: [meta-networking][PATCH] bird: initial import] On 18.08.16 (Thu =
22:56)
>     Stefan BOSAK wrote:
>=20
>     > this ipv6 compilation option is still relevant for versions
>     > 1.6.x (this is production ready line). =20
>=20
>     This much makes sense.  So the obvious approach, then, would be to
>     add --enable-ipv6 to the 1.6.4 recipe's EXTRA_OECONF options and leave
>     --enable-pthreads in the bird.inc file.
>=20
> Exactly, option --enable-ipv6 is specific to versions 1.6.x, it means
> EXTRA_OECONF should have additional extension within recipe only for vers=
ion
> 1.6.x.
>=20
>=20
>     When I do, though, the result is not what I would expect based on what
>     you're saying below.
>=20
>     First, the output of each of these are:
>=20
>        bird-2.0.2-r0.core2_64
>        =E2=94=9C=E2=94=80=E2=94=80 etc
>        =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bird.conf
>        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 init.d
>        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 bird
>        =E2=94=9C=E2=94=80=E2=94=80 usr
>        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sbin
>        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bird
>        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 birdc
>        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 birdcl
>        =E2=94=94=E2=94=80=E2=94=80 var
>=20
> This seems to be not correct, because {bird, birdc}6 are missing.
> There are implementation reasons why authors isolated IPv4 and IPv6
> through dedicated applications/binaries.
>=20
> See these files (there are no major differences between versions):
> https://gitlab.labs.nic.cz/labs/bird/blob/v2.0.2/misc/bird.init
> https://gitlab.labs.nic.cz/labs/bird/blob/v1.6.4/misc/bird.init

Alright, so based on this I think the recipes need some amount of rework
beyond just the style things Khem requested.  At a minimum, I'm going to
replace the bird.init in your original submission with the ones linked
above and I'll review what's happening with the v6 binaries, because it
very much looks like they're not being built in the 2.0.2 recipe.

>     and
>=20
>        bird-1.6.4-r0.core2_64
>        =E2=94=9C=E2=94=80=E2=94=80 etc
>        =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bird6.conf
>        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 init.d
>        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 bird
>        =E2=94=9C=E2=94=80=E2=94=80 usr
>        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sbin
>        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bird6
>        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 birdc6
>        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 birdcl6
>        =E2=94=94=E2=94=80=E2=94=80 var
>=20
>     and if I remove the --enable-ipv6 option from the 1.6.4 recipe I see:
>=20
>        bird-1.6.4-r0.core2_64
>        =E2=94=9C=E2=94=80=E2=94=80 etc
>        =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bird.conf
>        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 init.d
>        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 bird
>        =E2=94=9C=E2=94=80=E2=94=80 usr
>        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sbin
>        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bird
>        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 birdc
>        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 birdcl
>        =E2=94=94=E2=94=80=E2=94=80 var
>=20
>=20
> In this case without setting of --enable-ipv6 compilation option only IPv4
> protocol will be supported which is not sufficient.
>=20
>     > There is also one reminder from my side that there are to be several
>     > applications and two independent
>     > init scripts needed at least for versions 1.6.x (the same should be=
 for
>     2.0.x):
>     > /usr/sbin/{bird,birdc}, /usr/sbin/{birdc,birdc6}; /etc/init.d/{bird,
>     bird6}.
>=20
>     So then it almost looks like the --enable-ipv6 option for the 1.6.4
>     recipe will only build one of the two versions at a time whereas (may=
be)
>     the single binary (client or daemon) will provide both ipv4 and v6
>     functionality.  Can you help we understand what's happening here?  Do=
 we
>     potentially need two different recipes for each of the v4 and v6
>     versions of the 1.6.4 recipe?
>=20
> Dedicated binaries for both protocols (IPv4 & IPv6) are required/needed to
> cover dual-stack mode (as I wrote there are implementation reasons for th=
is).
> Potentially we can have a look (get inspirations) on how debian is approa=
ching/
> covering this packaging (https://salsa.debian.org/debian/bird), could hel=
p us
> more and seems to be sufficient, or contact project maintainers to clearly
> clarify this.

Well, a quick look at
https://salsa.debian.org/debian/bird/blob/master/debian/rules seems to
provide the answer for, at least, the 1.6.4 case:

 36 override_dh_auto_configure:
 37 	CFLAGS=3D"$(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" dh_auto_configure -Bbuild-=
ipv4 -- $(COMMON_FLAGS) --disable-ipv6 --with-protocols=3Dall
 38 	CFLAGS=3D"$(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" dh_auto_configure -Bbuild-=
ipv6 -- $(COMMON_FLAGS) --enable-ipv6 --with-protocols=3Dall
 39=20
 40 override_dh_auto_build:
 41 	dh_auto_build -Bbuild-ipv4
 42 	dh_auto_build -Bbuild-ipv6

Looks to me like there are two specific configurations and builds done
for the v4 and v6 options.  So that'll inform my approach on the 1.6.4
recipe.  The 2.0.2 spec from below shows something very similar:

 22 %build
 23 ./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var =
--enable-ipv6
 24 make
 25 mv bird bird6
 26 make clean
 27 ./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var
 28 make

except, as I'd noted earlier, --enable-ipv6 isn't a valid configure
option for 2.0.2, so I'll take a quick look deeper into this and decide
on what do to with it.  I would be inclined to keep the 2.0.2 recipe
even if it is ipv4 only, but if you think v6 support is essential and it
isn't possible to make it functional in the current upstream source, I
suggest we keep only the 1.6.4 recipe.  What do you think?

-J.

> Based on my understanding of how Yocto recipes works, there are two
> possibilities to achieve the same results/goal:
> 1) more advanced approach using only one recipe
> Only one recipe for both cases will be needed, but i assume that two sepa=
rated
> iterations has to be performed within configuration/compilation recipe ph=
ase
> and one packaging/installation has to be proceeded. This means additional
> complexity within given recipe, but only one package has to be installed =
by
> user.
> 2) simpler approach using two recipes
> Two recipes will be needed to cover related scope for simplification of
> configuration/compilation phases within recipe workflows,
> but every time when needed user has to take care about installing of two
> packages.
>=20
> See these files for details (there are no major differences between versi=
ons):
> https://gitlab.labs.nic.cz/labs/bird/blob/v2.0.2/misc/bird.spec
> https://gitlab.labs.nic.cz/labs/bird/blob/v1.6.4/misc/bird.spec
>=20
> Let me know what could i do to help you if needed, I would try to do my b=
est.
> I belive that at the end we would be able to add really useful recipe into
> Yocto ecosystem which help the community to build/prepare
> optimized, highly available solutions using one of the well configurable,
> reasonable reliable and high performance BGP tool available worldwide.
>=20
> Thank you for your support including all effort behind.
>=20
> Have a nice day.
> =20
>=20
>=20
>     Thanks,
>     -Joe.
>=20
>     > As I wrote in my first message I am not Yocto recipe expert (still =
in
>     kind of
>     > learning phase), potentially some additional alignment would be nee=
ded.
>     > Bird is one of the best BGP daemon available worldwide and would be
>     really
>     > great to have this tool within native Yocto ecosystem.
>     > Again let me say thank you to all contributors and supporters in th=
is
>     scope.
>     >
>     > Have a nice day.
>     >
>     > Ing. Stefan Bosak
>     >
>     > M +421 948 852 092
>     > E stefan.bosak@gmail.com
>     >
>     >
>     > On Thu, Aug 16, 2018 at 9:45 PM Joe MacDonald <Joe_MacDonald@mentor=
=2Ecom>
>     wrote:
>     >
>     >     Hi Stefan,
>     >
>     >     [Re: [meta-networking][PATCH] bird: initial import] On 18.08.16=
 (Thu
>     19:59)
>     >     Stefan BOSAK wrote:
>     >
>     >     > Hi Joe and other contributors/supporters,
>     >     >
>     >     > i got through changes prepared by Joe, one important configur=
ation
>     >     attribute is
>     >     > missing (--enable-ipv6):
>     >     > meta-networking/recipes-protocols/bird/bird.inc:
>     >     > EXTRA_OECONF  +=3D "\
>     >     > --enable-pthreads \
>     >     > --enable-ipv6 \
>     >     > "
>     >     > May I kindly ask you to add above mentioned within changes co=
ming
>     into
>     >     official
>     >     > branches please ?
>     >
>     >     I had a quick look at the configure options for bird 2.0.2 and I
>     don't
>     >     see --enable-ipv6 listed:
>     >
>     >        /build/jjm/misc/buildx $ ../bird-2.0.2/configure --enable-ip=
v6
>     >        configure: WARNING: unrecognized options: --enable-ipv6
>     >
>     >     It looks like it might have been removed last December maybe fr=
om the
>     >     changelog:
>     >
>     >        commit b5257bea853850809be7f03eb0e1dbb398c56c34
>     >        Author: Ondrej Filip <feela@network.cz>
>     >        Date:   Tue Dec 12 10:43:56 2017 +0100
>     >
>     >            Removed '--enable-ipv6' reference.
>     >
>     >
>     >     Are you sure it's still required?
>     >
>     >     -J.
>     >
>     >     >
>     >     > Huge thank you for the support to all of you.
>     >     >
>     >     > Have a nice day.
>     >     >
>     >     > Ing. Stefan Bosak
>     >     >
>     >     > M +421 948 852 092
>     >     > E stefan.bosak@gmail.com
>     >     >
>     >     >
>     >     > On Thu, Aug 16, 2018 at 6:19 PM Joe MacDonald <
>     Joe_MacDonald@mentor.com>
>     >     wrote:
>     >     >
>     >     >     [Re: [meta-networking][PATCH] bird: initial import] On 18=
=2E08.16
>     (Thu
>     >     07:06)
>     >     >     Stefan BOSAK wrote:
>     >     >
>     >     >     > Hi Joe and other contributors,
>     >     >     >
>     >     >     > thank you very much for your kind support in the term of
>     adding of
>     >     >     > bird (BGP daemon) recipe into meta-networking layer.
>     >     >     > I would like to ask you about expected merge/commit tim=
e line
>     into
>     >     >     > official branch(es).
>     >     >
>     >     >     Generally something like this won't take long to make it =
into
>     the
>     >     master
>     >     >     branch.  Already released branches are rarely (as a rule =
never,
>     I
>     >     would
>     >     >     say) updated with new content.
>     >     >
>     >     >     -J.
>     >     >
>     >     >     >
>     >     >     > Thanks.
>     >     >     >
>     >     >     > Have a nice day.
>     >     >     >
>     >     >     > Ing. Stefan Bosak
>     >     >     >
>     >     >     > M +421 948 852 092
>     >     >     > E stefan.bosak@gmail.com
>     >     >     >
>     >     >     >
>     >     >     > On Thu, Aug 16, 2018 at 4:42 AM Joe MacDonald <
>     >     joe_macdonald@mentor.com>
>     >     >     wrote:
>     >     >     >
>     >     >     >     Initial integration of the two stable BIRD releases,
>     1.6.4 and
>     >     2.0.2.
>     >     >     >
>     >     >     >     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.=
com>
>     >     >     >     ---
>     >     >     >
>     >     >     >     This set of recipes came my way quite a while back =
=66rom
>     Stefan
>     >     >     Bosak.  I've
>     >     >     >     updated the recipes a bit, made them compile with M=
USL
>     and
>     >     verified
>     >     >     basic
>     >     >     >     functionality on x86_64 and qemuarm.
>     >     >     >
>     >     >     >      .../recipes-protocols/bird/bird.inc           |   =
32 +
>     >     >     >      .../recipes-protocols/bird/bird_1.6.4.bb      |   =
 9 +
>     >     >     >      .../recipes-protocols/bird/bird_2.0.2.bb      |   =
 9 +
>     >     >     >      ...-extend-config.sub-to-recognize-musl.patch | 44=
28
>     >     >     +++++++++++++++++
>     >     >     >      .../recipes-protocols/bird/files/bird.init    |   =
 2 +
>     >     >     >      5 files changed, 4480 insertions(+)
>     >     >     >      create mode 100644 meta-networking/recipes-protoco=
ls/
>     bird/
>     >     bird.inc
>     >     >     >      create mode 100644 meta-networking/recipes-protoco=
ls/
>     bird/
>     >     >     bird_1.6.4.bb
>     >     >     >      create mode 100644 meta-networking/recipes-protoco=
ls/
>     bird/
>     >     >     bird_2.0.2.bb
>     >     >     >      create mode 100644 meta-networking/recipes-protoco=
ls/
>     bird/
>     >     files/
>     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     >     >      create mode 100755 meta-networking/recipes-protoco=
ls/
>     bird/
>     >     files/
>     >     >     bird.init
>     >     >     >
>     >     >     >     diff --git a/meta-networking/recipes-protocols/bird/
>     bird.inc b/
>     >     >     >     meta-networking/recipes-protocols/bird/bird.inc
>     >     >     >     new file mode 100644
>     >     >     >     index 000000000..33d17dcb7
>     >     >     >     --- /dev/null
>     >     >     >     +++ b/meta-networking/recipes-protocols/bird/bird.i=
nc
>     >     >     >     @@ -0,0 +1,32 @@
>     >     >     >     +SUMMARY =3D "BIRD Internet Routing Daemon"
>     >     >     >     +DESCRIPTION =3D "\
>     >     >     >     +BIRD is dynamic routing daemon supporting IPv4 and=
 IPv6
>     >     versions of
>     >     >     >     routing \
>     >     >     >     +protocols BGP, RIP and OSPF."
>     >     >     >     +HOMEPAGE =3D "http://bird.network.cz"
>     >     >     >     +SECTION =3D "console/network"
>     >     >     >     +LICENSE =3D "GPLv2"
>     >     >     >     +LIC_FILES_CHKSUM =3D "file://README;beginline=3D87=
;endline=3D
>     103;md5
>     >     =3D
>     >     >     >     0efecc23f039022580d0bac9a52f6117"
>     >     >     >     +DEPENDS =3D "flex bison ncurses readline"
>     >     >     >     +
>     >     >     >     +inherit autotools
>     >     >     >     +
>     >     >     >     +EXTRA_OECONF  +=3D "\
>     >     >     >     +--enable-pthreads \
>     >     >     >     +"
>     >     >     >     +
>     >     >     >     +do_configure() {
>     >     >     >     +    oe_runconf ${EXTRA_OECONF}
>     >     >     >     +}
>     >     >     >     +
>     >     >     >     +do_install_append() {
>     >     >     >     +    install -m 0755 -d ${D}${sysconfdir}/init.d
>     >     >     >     +    install -m 0755 ${WORKDIR}/bird.init ${D}$
>     {sysconfdir}/
>     >     init.d/
>     >     >     bird
>     >     >     >     +    rm -rf ${D}/run ${D}/var/run
>     >     >     >     +}
>     >     >     >     +
>     >     >     >     +PACKAGES +=3D " bird-client"
>     >     >     >     +
>     >     >     >     +FILES_${PN} +=3D "/run /var/run"
>     >     >     >     +FILES_${PN}-client =3D "/usr/sbin/birdc*"
>     >     >     >     +
>     >     >     >     +RUNIT_SERVICES =3D "bird"
>     >     >     >     diff --git a/meta-networking/recipes-protocols/bird/
>     >     bird_1.6.4.bb b/
>     >     >     >     meta-networking/recipes-protocols/bird/bird_1.6.4.bb
>     >     >     >     new file mode 100644
>     >     >     >     index 000000000..27c62aeee
>     >     >     >     --- /dev/null
>     >     >     >     +++ b/meta-networking/recipes-protocols/bird/
>     bird_1.6.4.bb
>     >     >     >     @@ -0,0 +1,9 @@
>     >     >     >     +require bird.inc
>     >     >     >     +
>     >     >     >     +SRC_URI =3D "\
>     >     >     >     +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.ta=
r.gz \
>     >     >     >     +    file://bird.init \
>     >     >     >     +    file://
>     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     \
>     >     >     >     +    "
>     >     >     >     +SRC_URI[md5sum] =3D "d62ec2547338e8d3dfb934b4c7b2f=
aa4"
>     >     >     >     +SRC_URI[sha256sum] =3D
>     >     >     >  =20
>     >      "c26b8caae988dba81a9dbbee93502463d4326d1b749d728d62aa5529c605a=
fc0"
>     >     >     >     diff --git a/meta-networking/recipes-protocols/bird/
>     >     bird_2.0.2.bb b/
>     >     >     >     meta-networking/recipes-protocols/bird/bird_2.0.2.bb
>     >     >     >     new file mode 100644
>     >     >     >     index 000000000..92d858869
>     >     >     >     --- /dev/null
>     >     >     >     +++ b/meta-networking/recipes-protocols/bird/
>     bird_2.0.2.bb
>     >     >     >     @@ -0,0 +1,9 @@
>     >     >     >     +require bird.inc
>     >     >     >     +
>     >     >     >     +SRC_URI =3D "\
>     >     >     >     +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.ta=
r.gz \
>     >     >     >     +    file://bird.init \
>     >     >     >     +    file://
>     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     \
>     >     >     >     +    "
>     >     >     >     +SRC_URI[md5sum] =3D "de17645b045fa13912409aea59420=
132"
>     >     >     >     +SRC_URI[sha256sum] =3D
>     >     >     >  =20
>     >      "035f91d6f568f8ed438a0814235ac4c5c79147cd2acf201322c3077328834=
80f"
>     >     >     >     diff --git a/meta-networking/recipes-protocols/bird=
/files
>     /
>     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch=
 b/
>     >     meta-networking
>     >     >     /
>     >     >     >     recipes-protocols/bird/files/
>     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     >     >     new file mode 100644
>     >     >     >     index 000000000..4feb7f786
>     >     >     >     --- /dev/null
>     >     >     >     +++ b/meta-networking/recipes-protocols/bird/files/
>     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     >     >     @@ -0,0 +1,4428 @@
>     >     >     >     +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon =
Sep 17
>     >     00:00:00
>     >     >     2001
>     >     >     >     +From: Joe MacDonald <joe_macdonald@mentor.com>
>     >     >     >     +Date: Thu, 16 Aug 2018 01:56:05 +0000
>     >     >     >     +Subject: [PATCH] musl: update config.guess and
>     config.sub
>     >     >     >     +
>     >     >     >     +Just bringing config.guess and config.sub up to da=
te is
>     enough
>     >     to
>     >     >     enable
>     >     >     >     +musl to build BIRD.
>     >     >     >     +
>     >     >     >     +Signed-off-by: Joe MacDonald <joe_macdonald@mentor=
=2Ecom>
>     >     >     >     +---
>     >     >     >     + tools/config.guess | 1193 ++++++++++++++---------=
------
>     >     >     >     + tools/config.sub   | 1810
>     >     >     +++++++++++++++++++++++---------------------
>     >     >     >     + 2 files changed, 1520 insertions(+), 1483 deletio=
ns(-)
>     >     >     >     +
>     >     >     >     +diff --git a/tools/config.guess b/tools/config.gue=
ss
>     >     >     >     +index da83314..445c406 100755
>     >     >     >     +--- a/tools/config.guess
>     >     >     >     ++++ b/tools/config.guess
>     >     >     >     +@@ -1,14 +1,12 @@
>     >     >     >     + #! /bin/sh
>     >     >     >     + # Attempt to guess a canonical system name.
>     >     >     >     +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1=
997,
>     1998,
>     >     1999,
>     >     >     >     +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 200=
7,
>     2008
>     >     >     >     +-#   Free Software Foundation, Inc.
>     >     >     >     ++#   Copyright 1992-2018 Free Software Foundation,=
 Inc.
>     >     >     >     +
>     >     >     >     +-timestamp=3D'2009-04-27'
>     >     >     >     ++timestamp=3D'2018-06-26'
>     >     >     >     +
>     >     >     >     + # This file is free software; you can redistribut=
e it
>     and/or
>     >     modify
>     >     >     it
>     >     >     >     + # under the terms of the GNU General Public Licen=
se as
>     >     published by
>     >     >     >     +-# the Free Software Foundation; either version 2 =
of the
>     >     License, or
>     >     >     >     ++# the Free Software Foundation; either version 3 =
of the
>     >     License, or
>     >     >     >     + # (at your option) any later version.
>     >     >     >     + #
>     >     >     >     + # This program is distributed in the hope that it=
 will
>     be
>     >     useful,
>     >     >     but
>     >     >     >     +@@ -17,26 +15,22 @@ timestamp=3D'2009-04-27'
>     >     >     >     + # General Public License for more details.
>     >     >     >     + #
>     >     >     >     + # You should have received a copy of the GNU Gene=
ral
>     Public
>     >     License
>     >     >     >     +-# along with this program; if not, write to the F=
ree
>     Software
>     >     >     >     +-# Foundation, Inc., 51 Franklin Street - Fifth Fl=
oor,
>     Boston,
>     >     MA
>     >     >     >     +-# 02110-1301, USA.
>     >     >     >     ++# along with this program; if not, see <https://
>     www.gnu.org/
>     >     >     licenses/>.
>     >     >     >     + #
>     >     >     >     + # As a special exception to the GNU General Public
>     License,
>     >     if you
>     >     >     >     + # distribute this file as part of a program that
>     contains a
>     >     >     >     + # configuration script generated by Autoconf, you=
 may
>     include
>     >     it
>     >     >     under
>     >     >     >     +-# the same distribution terms that you use for th=
e rest
>     of
>     >     that
>     >     >     program.
>     >     >     >     +-
>     >     >     >     +-
>     >     >     >     +-# Originally written by Per Bothner <per@bothner.=
com>.
>     >     >     >     +-# Please send patches to <config-patches@gnu.org>=
=2E=20
>     Submit a
>     >     >     context
>     >     >     >     +-# diff and a properly formatted ChangeLog entry.
>     >     >     >     ++# the same distribution terms that you use for th=
e rest
>     of
>     >     that
>     >     >     >     ++# program.  This Exception is an additional permi=
ssion
>     under
>     >     >     section 7
>     >     >     >     ++# of the GNU General Public License, version 3
>     ("GPLv3").
>     >     >     >     + #
>     >     >     >     +-# This script attempts to guess a canonical syste=
m name
>     >     similar to
>     >     >     >     +-# config.sub.  If it succeeds, it prints the syst=
em
>     name on
>     >     stdout,
>     >     >     and
>     >     >     >     +-# exits with 0.  Otherwise, it exits with 1.
>     >     >     >     ++# Originally written by Per Bothner; maintained s=
ince
>     2000 by
>     >     Ben
>     >     >     >     Elliston.
>     >     >     >     + #
>     >     >     >     +-# The plan is that this can be called by configure
>     scripts if
>     >     you
>     >     >     >     +-# don't specify an explicit build system type.
>     >     >     >     ++# You can get the latest version of this script f=
rom:
>     >     >     >     ++# https://git.savannah.gnu.org/gitweb/?p=3Dconfig=
=2Egit;a=3D
>     >     blob_plain;f=3D
>     >     >     >     config.guess
>     >     >     >     ++#
>     >     >     >     ++# Please send patches to <config-patches@gnu.org>.
>     >     >     >     ++
>     >     >     >     +
>     >     >     >     + me=3D`echo "$0" | sed -e 's,.*/,,'`
>     >     >     >     +
>     >     >     >     +@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
>     >     >     >     +
>     >     >     >     + Output the configuration name of the system \`$me=
' is
>     run on.
>     >     >     >     +
>     >     >     >     +-Operation modes:
>     >     >     >     ++Options:
>     >     >     >     +   -h, --help         print this help, then exit
>     >     >     >     +   -t, --time-stamp   print date of last modificat=
ion,
>     then
>     >     exit
>     >     >     >     +   -v, --version      print version number, then e=
xit
>     >     >     >     +@@ -56,8 +50,7 @@ version=3D"\
>     >     >     >     + GNU config.guess ($timestamp)
>     >     >     >     +
>     >     >     >     + Originally written by Per Bothner.
>     >     >     >     +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997,=
 1998,
>     1999,
>     >     2000,
>     >     >     2001,
>     >     >     >     +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Sof=
tware
>     >     Foundation,
>     >     >     Inc.
>     >     >     >     ++Copyright 1992-2018 Free Software Foundation, Inc.
>     >     >     >     +
>     >     >     >     + This is free software; see the source for copying
>     conditions.
>     >     >     There is
>     >     >     >     NO
>     >     >     >     + warranty; not even for MERCHANTABILITY or FITNESS=
 FOR A
>     >     PARTICULAR
>     >     >     >     PURPOSE."
>     >     >     >     +@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>/de=
v/
>     null;
>     >     rmdir \
>     >     >     $tmp 2>/
>     >     >     >     dev/null; exit 1" 1 2 13 15 ;
>     >     >     >     +  { echo "$me: cannot create a temporary directory=
 in
>     $TMPDIR"
>     >     >&2 ;
>     >     >     exit
>     >     >     >     1 ; } ;
>     >     >     >     + dummy=3D$tmp/dummy ;
>     >     >     >     + tmpfiles=3D"$dummy.c $dummy.o $dummy.rel $dummy" ;
>     >     >     >     +-case $CC_FOR_BUILD,$HOST_CC,$CC in
>     >     >     >     +- ,,)    echo "int x;" > $dummy.c ;
>     >     >     >     ++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
>     >     >     >     ++ ,,)    echo "int x;" > "$dummy.c" ;
>     >     >     >     +       for c in cc gcc c89 c99 ; do
>     >     >     >     +-        if ($c -c -o $dummy.o $dummy.c) >/dev/nul=
l 2>&1
>     ;
>     >     then
>     >     >     >     ++        if ($c -c -o "$dummy.o" "$dummy.c") >/dev=
/null
>     2>&1 ;
>     >     then
>     >     >     >     +            CC_FOR_BUILD=3D"$c"; break ;
>     >     >     >     +         fi ;
>     >     >     >     +       done ;
>     >     >     >     +@@ -139,12 +132,40 @@ UNAME_RELEASE=3D`(uname -r) =
2>/dev/
>     null` |
>     >     |
>     >     >     >     UNAME_RELEASE=3Dunknown
>     >     >     >     + UNAME_SYSTEM=3D`(uname -s) 2>/dev/null`  || UNAME=
_SYSTEM=3D
>     >     unknown
>     >     >     >     + UNAME_VERSION=3D`(uname -v) 2>/dev/null` || UNAME=
_VERSION
>     =3D
>     >     unknown
>     >     >     >     +
>     >     >     >     ++case "$UNAME_SYSTEM" in
>     >     >     >     ++Linux|GNU|GNU/*)
>     >     >     >     ++      # If the system lacks a compiler, then just=
 pick
>     glibc.
>     >     >     >     ++      # We could probably try harder.
>     >     >     >     ++      LIBC=3Dgnu
>     >     >     >     ++
>     >     >     >     ++      eval "$set_cc_for_build"
>     >     >     >     ++      cat <<-EOF > "$dummy.c"
>     >     >     >     ++      #include <features.h>
>     >     >     >     ++      #if defined(__UCLIBC__)
>     >     >     >     ++      LIBC=3Duclibc
>     >     >     >     ++      #elif defined(__dietlibc__)
>     >     >     >     ++      LIBC=3Ddietlibc
>     >     >     >     ++      #else
>     >     >     >     ++      LIBC=3Dgnu
>     >     >     >     ++      #endif
>     >     >     >     ++      EOF
>     >     >     >     ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/n=
ull |
>     grep '
>     >     ^LIBC'
>     >     >     | sed
>     >     >     >     's, ,,g'`"
>     >     >     >     ++
>     >     >     >     ++      # If ldd exists, use it to detect musl libc.
>     >     >     >     ++      if command -v ldd >/dev/null && \
>     >     >     >     ++              ldd --version 2>&1 | grep -q ^musl
>     >     >     >     ++      then
>     >     >     >     ++          LIBC=3Dmusl
>     >     >     >     ++      fi
>     >     >     >     ++      ;;
>     >     >     >     ++esac
>     >     >     >     ++
>     >     >     >     + # Note: order is significant - the case branches =
are
>     not
>     >     exclusive.
>     >     >     >     +
>     >     >     >     +-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:$
>     {UNAME_RELEASE}:$
>     >     >     {UNAME_VERSION}"
>     >     >     >     in
>     >     >     >     ++case
>     >     "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION"
>     >     >     in
>     >     >     >     +     *:NetBSD:*:*)
>     >     >     >     +       # NetBSD (nbsd) targets should (where appli=
cable)
>     match
>     >     one
>     >     >     or
>     >     >     >     +-      # more of the tupples: *-*-netbsdelf*,
>     *-*-netbsdaout*,
>     >     >     >     ++      # more of the tuples: *-*-netbsdelf*,
>     *-*-netbsdaout*,
>     >     >     >     +       # *-*-netbsdecoff* and *-*-netbsd*.  For ta=
rgets
>     that
>     >     >     recently
>     >     >     >     +       # switched to ELF, *-*-netbsd* would select=
 the
>     old
>     >     >     >     +       # object file format.  This provides both f=
orward
>     >     >     >     +@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +       # Note: NetBSD doesn't particularly care ab=
out
>     the
>     >     vendor
>     >     >     >     +       # portion of the name.  We always set it to
>     "unknown".
>     >     >     >     +       sysctl=3D"sysctl -n hw.machine_arch"
>     >     >     >     +-      UNAME_MACHINE_ARCH=3D`(/sbin/$sysctl 2>/dev=
/null ||
>     \
>     >     >     >     +-          /usr/sbin/$sysctl 2>/dev/null || echo
>     unknown)`
>     >     >     >     +-      case "${UNAME_MACHINE_ARCH}" in
>     >     >     >     ++      UNAME_MACHINE_ARCH=3D`(uname -p 2>/dev/null=
 || \
>     >     >     >     ++          "/sbin/$sysctl" 2>/dev/null || \
>     >     >     >     ++          "/usr/sbin/$sysctl" 2>/dev/null || \
>     >     >     >     ++          echo unknown)`
>     >     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>     >     >     >     +           armeb) machine=3Darmeb-unknown ;;
>     >     >     >     +           arm*) machine=3Darm-unknown ;;
>     >     >     >     +           sh3el) machine=3Dshl-unknown ;;
>     >     >     >     +           sh3eb) machine=3Dsh-unknown ;;
>     >     >     >     +           sh5el) machine=3Dsh5le-unknown ;;
>     >     >     >     +-          *) machine=3D${UNAME_MACHINE_ARCH}-unkn=
own ;;
>     >     >     >     ++          earmv*)
>     >     >     >     ++              arch=3D`echo "$UNAME_MACHINE_ARCH" =
| sed -e
>     's,^e
>     >     \(armv
>     >     >     [0-9]
>     >     >     >     \).*$,\1,'`
>     >     >     >     ++              endian=3D`echo "$UNAME_MACHINE_ARCH=
" | sed
>     -ne
>     >     's,^.*\
>     >     >     (eb\)$,
>     >     >     >     \1,p'`
>     >     >     >     ++              machine=3D"${arch}${endian}"-unknown
>     >     >     >     ++              ;;
>     >     >     >     ++          *) machine=3D"$UNAME_MACHINE_ARCH"-unkn=
own ;;
>     >     >     >     +       esac
>     >     >     >     +       # The Operating System including object for=
mat,
>     if it
>     >     has
>     >     >     switched
>     >     >     >     +-      # to ELF recently, or will in the future.
>     >     >     >     +-      case "${UNAME_MACHINE_ARCH}" in
>     >     >     >     ++      # to ELF recently (or will in the future) a=
nd
>     ABI.
>     >     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>     >     >     >     ++          earm*)
>     >     >     >     ++              os=3Dnetbsdelf
>     >     >     >     ++              ;;
>     >     >     >     +           arm*|i386|m68k|ns32k|sh3*|sparc|vax)
>     >     >     >     +-              eval $set_cc_for_build
>     >     >     >     ++              eval "$set_cc_for_build"
>     >     >     >     +               if echo __ELF__ | $CC_FOR_BUILD -E =
- 2>/
>     dev/
>     >     null \
>     >     >     >     +-                      | grep __ELF__ >/dev/null
>     >     >     >     ++                      | grep -q __ELF__
>     >     >     >     +               then
>     >     >     >     +                   # Once all utilities can be ECO=
FF
>     >     (netbsdecoff)
>     >     >     or
>     >     >     >     a.out (netbsdaout).
>     >     >     >     +                   # Return netbsd for either.  FI=
X?
>     >     >     >     +@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +               fi
>     >     >     >     +               ;;
>     >     >     >     +           *)
>     >     >     >     +-              os=3Dnetbsd
>     >     >     >     ++              os=3Dnetbsd
>     >     >     >     ++              ;;
>     >     >     >     ++      esac
>     >     >     >     ++      # Determine ABI tags.
>     >     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>     >     >     >     ++          earm*)
>     >     >     >     ++              expr=3D's/^earmv[0-9]/-eabi/;s/eb$/=
/'
>     >     >     >     ++              abi=3D`echo "$UNAME_MACHINE_ARCH" |=
 sed -e
>     >     "$expr"`
>     >     >     >     +               ;;
>     >     >     >     +       esac
>     >     >     >     +       # The OS release
>     >     >     >     +@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +       # thus, need a distinct triplet. However, t=
hey do
>     not
>     >     need
>     >     >     >     +       # kernel version information, so it can be
>     replaced
>     >     with a
>     >     >     >     +       # suitable tag, in the style of linux-gnu.
>     >     >     >     +-      case "${UNAME_VERSION}" in
>     >     >     >     ++      case "$UNAME_VERSION" in
>     >     >     >     +           Debian*)
>     >     >     >     +               release=3D'-gnu'
>     >     >     >     +               ;;
>     >     >     >     +           *)
>     >     >     >     +-              release=3D`echo ${UNAME_RELEASE}|se=
d -e 's/
>     [-_].*
>     >     /\./'`
>     >     >     >     ++              release=3D`echo "$UNAME_RELEASE" | =
sed -e
>     's/
>     >     [-_].*//'
>     >     >     | cut
>     >     >     >     -d. -f1,2`
>     >     >     >     +               ;;
>     >     >     >     +       esac
>     >     >     >     +       # Since
>     CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
>     >     >     >     +       # contains redundant information, the short=
er
>     form:
>     >     >     >     +       # CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is=
 used.
>     >     >     >     +-      echo "${machine}-${os}${release}"
>     >     >     >     ++      echo "$machine-${os}${release}${abi-}"
>     >     >     >     ++      exit ;;
>     >     >     >     ++    *:Bitrig:*:*)
>     >     >     >     ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/Bitrig.=
//'`
>     >     >     >     ++      echo
>     >     "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     *:OpenBSD:*:*)
>     >     >     >     +       UNAME_MACHINE_ARCH=3D`arch | sed 's/OpenBSD=
=2E//'`
>     >     >     >     +-      echo ${UNAME_MACHINE_ARCH}-unknown-openbsd$
>     >     {UNAME_RELEASE}
>     >     >     >     ++      echo
>     >     "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
>     >     >     >     ++      exit ;;
>     >     >     >     ++    *:LibertyBSD:*:*)
>     >     >     >     ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/^.*BSD\=
=2E//'`
>     >     >     >     ++      echo
>     >     "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
>     >     >     >     ++      exit ;;
>     >     >     >     ++    *:MidnightBSD:*:*)
>     >     >     >     ++      echo
>     >     "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     *:ekkoBSD:*:*)
>     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-ekkobsd$
>     {UNAME_RELEASE}
>     >     >     >     ++      echo
>     "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     *:SolidBSD:*:*)
>     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-solidbsd$
>     {UNAME_RELEASE}
>     >     >     >     ++      echo
>     "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     macppc:MirBSD:*:*)
>     >     >     >     +-      echo powerpc-unknown-mirbsd${UNAME_RELEASE}
>     >     >     >     ++      echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     *:MirBSD:*:*)
>     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-mirbsd$
>     {UNAME_RELEASE}
>     >     >     >     ++      echo
>     "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     ++    *:Sortix:*:*)
>     >     >     >     ++      echo "$UNAME_MACHINE"-unknown-sortix
>     >     >     >     ++      exit ;;
>     >     >     >     ++    *:Redox:*:*)
>     >     >     >     ++      echo "$UNAME_MACHINE"-unknown-redox
>     >     >     >     ++      exit ;;
>     >     >     >     ++    mips:OSF1:*.*)
>     >     >     >     ++        echo mips-dec-osf1
>     >     >     >     ++        exit ;;
>     >     >     >     +     alpha:OSF1:*:*)
>     >     >     >     +       case $UNAME_RELEASE in
>     >     >     >     +       *4.0)
>     >     >     >     +               UNAME_RELEASE=3D`/usr/sbin/sizer -v=
 | awk '
>     {print
>     >     $3}'`
>     >     >     >     +               ;;
>     >     >     >     +       *5.*)
>     >     >     >     +-              UNAME_RELEASE=3D`/usr/sbin/sizer -v=
 | awk '
>     {print
>     >     $4}'`
>     >     >     >     ++              UNAME_RELEASE=3D`/usr/sbin/sizer -v=
 | awk '
>     {print
>     >     $4}'`
>     >     >     >     +               ;;
>     >     >     >     +       esac
>     >     >     >     +       # According to Compaq, /usr/sbin/psrinfo ha=
s been
>     >     available
>     >     >     on
>     >     >     >     +@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +       ALPHA_CPU_TYPE=3D`/usr/sbin/psrinfo -v | se=
d -n -e
>     's/^
>     >     The
>     >     >     alpha \
>     >     >     >     (.*\) processor.*$/\1/p' | head -n 1`
>     >     >     >     +       case "$ALPHA_CPU_TYPE" in
>     >     >     >     +           "EV4 (21064)")
>     >     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>     >     >     >     +           "EV4.5 (21064)")
>     >     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>     >     >     >     +           "LCA4 (21066/21068)")
>     >     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>     >     >     >     +           "EV5 (21164)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev5" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev5 ;;
>     >     >     >     +           "EV5.6 (21164A)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev56" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev56 ;;
>     >     >     >     +           "EV5.6 (21164PC)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphapca56" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphapca56 ;;
>     >     >     >     +           "EV5.7 (21164PC)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphapca57" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphapca57 ;;
>     >     >     >     +           "EV6 (21264)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev6" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev6 ;;
>     >     >     >     +           "EV6.7 (21264A)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev67" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev67 ;;
>     >     >     >     +           "EV6.8CB (21264C)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>     >     >     >     +           "EV6.8AL (21264B)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>     >     >     >     +           "EV6.8CX (21264D)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>     >     >     >     +           "EV6.9A (21264/EV69A)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev69" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev69 ;;
>     >     >     >     +           "EV7 (21364)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev7" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev7 ;;
>     >     >     >     +           "EV7.9 (21364A)")
>     >     >     >     +-              UNAME_MACHINE=3D"alphaev79" ;;
>     >     >     >     ++              UNAME_MACHINE=3Dalphaev79 ;;
>     >     >     >     +       esac
>     >     >     >     +       # A Pn.n version is a patched version.
>     >     >     >     +       # A Vn.n version is a released version.
>     >     >     >     +       # A Tn.n version is a released field test
>     version.
>     >     >     >     +       # A Xn.n version is an unreleased experimen=
tal
>     >     baselevel.
>     >     >     >     +       # 1.2 uses "1.2" for uname -r.
>     >     >     >     +-      echo ${UNAME_MACHINE}-dec-osf`echo $
>     {UNAME_RELEASE} |
>     >     sed -e
>     >     >     's/^
>     >     >     >     [PVTX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
>     >     >     'abcdefghijklmnopqrstuvwxyz'`
>     >     >     >     +-      exit ;;
>     >     >     >     +-    Alpha\ *:Windows_NT*:*)
>     >     >     >     +-      # How do we know it's Interix rather than t=
he
>     generic
>     >     POSIX
>     >     >     >     subsystem?
>     >     >     >     +-      # Should we change UNAME_MACHINE based on t=
he
>     output of
>     >     uname
>     >     >     >     instead
>     >     >     >     +-      # of the specific Alpha model?
>     >     >     >     +-      echo alpha-pc-interix
>     >     >     >     +-      exit ;;
>     >     >     >     +-    21064:Windows_NT:50:3)
>     >     >     >     +-      echo alpha-dec-winnt3.5
>     >     >     >     +-      exit ;;
>     >     >     >     ++      echo "$UNAME_MACHINE"-dec-osf"`echo
>     "$UNAME_RELEASE" |
>     >     sed -e
>     >     >     's/^
>     >     >     >     [PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ
>     >     abcdefghijklmnopqrstuvwxyz
>     >     >     `"
>     >     >     >     ++      # Reset EXIT trap before exiting to avoid
>     spurious
>     >     non-zero
>     >     >     exit
>     >     >     >     code.
>     >     >     >     ++      exitcode=3D$?
>     >     >     >     ++      trap '' 0
>     >     >     >     ++      exit $exitcode ;;
>     >     >     >     +     Amiga*:UNIX_System_V:4.0:*)
>     >     >     >     +       echo m68k-unknown-sysv4
>     >     >     >     +       exit ;;
>     >     >     >     +     *:[Aa]miga[Oo][Ss]:*:*)
>     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-amigaos
>     >     >     >     ++      echo "$UNAME_MACHINE"-unknown-amigaos
>     >     >     >     +       exit ;;
>     >     >     >     +     *:[Mm]orph[Oo][Ss]:*:*)
>     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-morphos
>     >     >     >     ++      echo "$UNAME_MACHINE"-unknown-morphos
>     >     >     >     +       exit ;;
>     >     >     >     +     *:OS/390:*:*)
>     >     >     >     +       echo i370-ibm-openedition
>     >     >     >     +@@ -295,12 +347,12 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +       echo s390-ibm-zvmoe
>     >     >     >     +       exit ;;
>     >     >     >     +     *:OS400:*:*)
>     >     >     >     +-        echo powerpc-ibm-os400
>     >     >     >     ++      echo powerpc-ibm-os400
>     >     >     >     +       exit ;;
>     >     >     >     +     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
>     >     >     >     +-      echo arm-acorn-riscix${UNAME_RELEASE}
>     >     >     >     ++      echo arm-acorn-riscix"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +-    arm:riscos:*:*|arm:RISCOS:*:*)
>     >     >     >     ++    arm*:riscos:*:*|arm*:RISCOS:*:*)
>     >     >     >     +       echo arm-unknown-riscos
>     >     >     >     +       exit ;;
>     >     >     >     +     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
>     >     >     >     +@@ -325,35 +377,38 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +           sparc) echo sparc-icl-nx7; exit ;;
>     >     >     >     +       esac ;;
>     >     >     >     +     s390x:SunOS:*:*)
>     >     >     >     +-      echo ${UNAME_MACHINE}-ibm-solaris2`echo $
>     >     {UNAME_RELEASE}|sed
>     >     >     -e 's/
>     >     >     >     [^.]*//'`
>     >     >     >     ++      echo "$UNAME_MACHINE"-ibm-solaris2"`echo
>     >     "$UNAME_RELEASE" |
>     >     >     sed -e
>     >     >     >     's/[^.]*//'`"
>     >     >     >     +       exit ;;
>     >     >     >     +     sun4H:SunOS:5.*:*)
>     >     >     >     +-      echo sparc-hal-solaris2`echo ${UNAME_RELEAS=
E}|sed
>     -e 's
>     >     /[^.]*
>     >     >     //'`
>     >     >     >     ++      echo sparc-hal-solaris2"`echo "$UNAME_RELEA=
SE"|
>     sed -e
>     >     's/[^.]
>     >     >     *//'`"
>     >     >     >     +       exit ;;
>     >     >     >     +     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
>     >     >     >     +-      echo sparc-sun-solaris2`echo ${UNAME_RELEAS=
E}|sed
>     -e 's
>     >     /[^.]*
>     >     >     //'`
>     >     >     >     ++      echo sparc-sun-solaris2"`echo "$UNAME_RELEA=
SE" |
>     sed -e
>     >     's/
>     >     >     [^.]*//'
>     >     >     >     `"
>     >     >     >     ++      exit ;;
>     >     >     >     ++    i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
>     >     >     >     ++      echo i386-pc-auroraux"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
>     >     >     >     +-      eval $set_cc_for_build
>     >     >     >     +-      SUN_ARCH=3D"i386"
>     >     >     >     ++      eval "$set_cc_for_build"
>     >     >     >     ++      SUN_ARCH=3Di386
>     >     >     >     +       # If there is a compiler, see if it is conf=
igured
>     for
>     >     64-bit
>     >     >     >     objects.
>     >     >     >     +       # Note that the Sun cc does not turn __LP64=
__
>     into 1
>     >     like gcc
>     >     >     does.
>     >     >     >     +       # This test works for both compilers.
>     >     >     >     +-      if [ "$CC_FOR_BUILD" !=3D 'no_compiler_foun=
d' ];
>     then
>     >     >     >     ++      if [ "$CC_FOR_BUILD" !=3D no_compiler_found=
 ]; then
>     >     >     >     +           if (echo '#ifdef __amd64'; echo
>     IS_64BIT_ARCH; echo
>     >     '#
>     >     >     endif') |
>     >     >     >     \
>     >     >     >     +-              (CCOPTS=3D $CC_FOR_BUILD -E - 2>/de=
v/null)
>     | \
>     >     >     >     ++              (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/=
dev/
>     null) | \
>     >     >     >     +               grep IS_64BIT_ARCH >/dev/null
>     >     >     >     +           then
>     >     >     >     +-              SUN_ARCH=3D"x86_64"
>     >     >     >     ++              SUN_ARCH=3Dx86_64
>     >     >     >     +           fi
>     >     >     >     +       fi
>     >     >     >     +-      echo ${SUN_ARCH}-pc-solaris2`echo $
>     {UNAME_RELEASE}|sed
>     >     -e 's/
>     >     >     [^.]*/
>     >     >     >     /'`
>     >     >     >     ++      echo "$SUN_ARCH"-pc-solaris2"`echo
>     "$UNAME_RELEASE"|sed
>     >     -e 's
>     >     >     /[^.]*
>     >     >     >     //'`"
>     >     >     >     +       exit ;;
>     >     >     >     +     sun4*:SunOS:6*:*)
>     >     >     >     +       # According to config.sub, this is the prop=
er way
>     to
>     >     >     canonicalize
>     >     >     >     +       # SunOS6.  Hard to guess exactly what SunOS=
6 will
>     be
>     >     like,
>     >     >     but
>     >     >     >     +       # it's likely to be more like Solaris than
>     SunOS4.
>     >     >     >     +-      echo sparc-sun-solaris3`echo ${UNAME_RELEAS=
E}|sed
>     -e 's
>     >     /[^.]*
>     >     >     //'`
>     >     >     >     ++      echo sparc-sun-solaris3"`echo "$UNAME_RELEA=
SE"|
>     sed -e
>     >     's/[^.]
>     >     >     *//'`"
>     >     >     >     +       exit ;;
>     >     >     >     +     sun4*:SunOS:*:*)
>     >     >     >     +       case "`/usr/bin/arch -k`" in
>     >     >     >     +@@ -362,25 +417,25 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +               ;;
>     >     >     >     +       esac
>     >     >     >     +       # Japanese Language versions have a version
>     number like
>     >     >     `4.1.3-JL'.
>     >     >     >     +-      echo sparc-sun-sunos`echo ${UNAME_RELEASE}|=
sed -e
>     's/-/
>     >     _/'`
>     >     >     >     ++      echo sparc-sun-sunos"`echo "$UNAME_RELEASE"=
|sed
>     -e 's/-
>     >     /_/'`"
>     >     >     >     +       exit ;;
>     >     >     >     +     sun3*:SunOS:*:*)
>     >     >     >     +-      echo m68k-sun-sunos${UNAME_RELEASE}
>     >     >     >     ++      echo m68k-sun-sunos"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     sun*:*:4.2BSD:*)
>     >     >     >     +       UNAME_RELEASE=3D`(sed 1q /etc/motd | awk '{=
print
>     substr
>     >     >     ($5,1,3)}') 2>
>     >     >     >     /dev/null`
>     >     >     >     +-      test "x${UNAME_RELEASE}" =3D "x" && UNAME_R=
ELEASE=3D3
>     >     >     >     ++      test "x$UNAME_RELEASE" =3D x && UNAME_RELEA=
SE=3D3
>     >     >     >     +       case "`/bin/arch`" in
>     >     >     >     +           sun3)
>     >     >     >     +-              echo m68k-sun-sunos${UNAME_RELEASE}
>     >     >     >     ++              echo m68k-sun-sunos"$UNAME_RELEASE"
>     >     >     >     +               ;;
>     >     >     >     +           sun4)
>     >     >     >     +-              echo sparc-sun-sunos${UNAME_RELEASE}
>     >     >     >     ++              echo sparc-sun-sunos"$UNAME_RELEASE"
>     >     >     >     +               ;;
>     >     >     >     +       esac
>     >     >     >     +       exit ;;
>     >     >     >     +     aushp:SunOS:*:*)
>     >     >     >     +-      echo sparc-auspex-sunos${UNAME_RELEASE}
>     >     >     >     ++      echo sparc-auspex-sunos"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     # The situation for MiNT is a little confusin=
g.=20
>     The
>     >     machine
>     >     >     name
>     >     >     >     +     # can be virtually everything (everything whi=
ch is
>     not
>     >     >     >     +@@ -391,44 +446,44 @@ case "${UNAME_MACHINE}:$
>     {UNAME_SYSTEM}:$
>     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     >     +     # MiNT.  But MiNT is downward compatible to T=
OS, so
>     this
>     >     should
>     >     >     >     +     # be no problem.
>     >     >     >     +     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* |
>     atarist
>     >     >     [e]:*TOS:*:*)
>     >     >     >     +-        echo m68k-atari-mint${UNAME_RELEASE}
>     >     >     >     ++      echo m68k-atari-mint"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist
>     >     [e]:*TOS:*:*)
>     >     >     >     +-      echo m68k-atari-mint${UNAME_RELEASE}
>     >     >     >     +-        exit ;;
>     >     >     >     ++      echo m68k-atari-mint"$UNAME_RELEASE"
>     >     >     >     ++      exit ;;
>     >     >     >     +     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* |
>     >     *falcon*:*TOS:*:*)
>     >     >     >     +-        echo m68k-atari-mint${UNAME_RELEASE}
>     >     >     >     ++      echo m68k-atari-mint"$UNAME_RELEASE"
>     >     >     >     +       exit ;;
>     >     >     >     +     milan*:*MiNT:*:* | milan*:*mint:*:* |
>     *milan*:*TOS:*:*)
>     >     >     >     +-        echo m68k-milan-mint${UNAME_RELEASE}
>     >     >     >     +-        exit ;;
>     >     >     >     ++      echo m68k-milan-mint"$UNAME_RELEASE"
>     >     >     >     ++      exit ;;
>     >     >     >     +     hades*:*MiNT:*:* | hades*:*mint:*:* |
>     *hades*:*TOS:*:*)
>     >     >     >     +-        echo m68k-hades-mint${UNAME_RELEASE}
>     >     >     >     +-        exit ;;
>     >     >     >     ++      echo m68k-hades-mint"$UNAME_RELEASE"
>     >     >     >     ++      exit ;;
>     >     >     >     +     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
>     >     >     >     +-        echo m68k-unknown-mint${UNAME_RELEASE}
>     >     >     >     +-        exit ;;
>     >     >     >     ++      echo m68k-unkn
>=20

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlt20BgACgkQSfx99yw5
9pbi3Af+L5SxfEhLrWQ3YCrA3lFTFPF47iEiaR4gd0tB3GpW+fid+5JEO9ez+f+F
OukNtufLSAJTPuu2GTjELyrnu1pOzRdqD1KnJEgyUFDac0bAv8TROsNha7OxWOb8
/Jr40yCP9v23PsvmnWLPxFwST7gEb+dlqRrLuvzTs919ncb61qEnPd5NkvrNj1kp
0Mc55O9KuYgTE6Lxj/1fVxE/3GIjfnOSLoQPEiSiMHfCX8Up7q365y4eAkUgAXsi
4z0U6OabPeXuFxRBMcmVGc+Runma+J/g5HpgRJGi3e0M1KnOmPkW33zZ6huOhPKm
FDHy6gNS5L32oMZ0P4c6TVgXFWAfag==
=ZITL
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
