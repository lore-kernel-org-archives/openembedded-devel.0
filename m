Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SUOKn-0008A7-Fr
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 22:27:05 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4200KH6YZ9YY41@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 May 2012 15:16:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D38CE2010D; Tue,
	15 May 2012 16:16:20 -0400 (EDT)
Date: Tue, 15 May 2012 16:16:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CADZ6=at4UmAFwAgggrDYOs0L-rMQBNU1idmD+Eo9FGMoqnKq1g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120515201620.GA14162@denix.org>
MIME-version: 1.0
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<3578934.ouGGrvIU0p@helios>
	<CADZ6=at4UmAFwAgggrDYOs0L-rMQBNU1idmD+Eo9FGMoqnKq1g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Tue, 15 May 2012 20:27:06 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, May 15, 2012 at 06:44:10PM +0200, Thilo Fromm wrote:
> Hello,
>=20
> >> I'm trying to remove an element from DISTRO_FEATURES (specifical=
ly
> >> "ld-is-gold"), but I am unable to find the right spot to do it. =
The
> >> distribution we're using (Angstrom, as it happens) sets this in
> >> conf/distro/angstrom-v2012.x.conf. My machine configuration is t=
he
> >> wrong spot to modify DISTRO_FEATURES, since it will be processed
> >> first. local.conf is not working, too.
> >>
> >> So could anybody please tell me where I need to put my
> >>
> >> DISTRO_FEATURES =3D "${@'${DISTRO_FEATURES}}'.replace('ld-is-gol=
d', =A0'')}"
> >>
> >> so it applies for the build?
> >
> > Unfortunately such hacks only work for variables that are not set=
 within the
> > distro configuration, which is applied after local.conf.
>=20
> I see. Fortunately I can require conf/distro/angstrom-v2012.x.conf =
in
> my own distro config file.
>=20
> > Ultimately you shouldn't really do this. If you want to change di=
stro policy
> > then you really ought to have your own distro configuration, or t=
ry to work
> > with the existing distro to fix whatever problem exists.
>=20
> It's a backwards compatibility thing: we're bound to gcc-4.5 (we ha=
ve
> kernel build issues with newer gcc versions; we're nailed to
> linux-2.6.37 thanks to lack of support by Texas Instruments) which
> fails to detect the correct version of binutils GOLD (LD would work=
)
> and therefore misses critical features which break the build later =
on.
> I won't, however, try to convince the Angstrom guys to further supp=
ort
> ancient toolchains and make gold optional again just because of TI'=
s
> laziness.

I think you are severely misinformed! Above issues (binutils-2.20/gcc=
-4.5=20
requirement and gold ld problem with Thumb) were already fixed. I've =
been=20
testing the builds with gcc-4.6 and binutils-2.22 for few weeks and e=
ven=20
gcc-4.7 with gold linker since last week. I don't know what layer you=
 are=20
using, but you may need to update, if you are using meta-ti.

Otherwise, if your platform is not directly supported by meta-ti, ple=
ase send=20
the bug report with the error message to meta-ti mailing list and I'l=
l try to=20
address it.

As of linux-2.6.37 for your specific platform - this one I can't help=
 with,=20
you would need to talk to your TI rep from the division that makes th=
e=20
platform and convince them to provide support for newer kernels.

--=20
Denys



