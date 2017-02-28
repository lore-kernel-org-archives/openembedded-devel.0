Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBC67199C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 03:35:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1S3Z5fk021174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Feb 2017 19:35:05 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 27 Feb 2017 19:35:04 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the service
	by default
Thread-Index: AQHSkQdNwFK30NgEw0qBY/jJVIkEcqF9mfXAgACK3ID//5hW8A==
Date: Tue, 28 Feb 2017 03:35:04 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013F52F8C7@ALA-MBC.corp.ad.wrs.com>
References: <20170227080959.27797-1-jackie.huang@windriver.com>
	<20170227080959.27797-2-jackie.huang@windriver.com>
	<CADkTA4OXnroiRi4Y4JGHAPf2jB4BgtAbn+fJSMoFEpN8JCY9mw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013F52F492@ALA-MBC.corp.ad.wrs.com>
	<20170228011708.GC1688@mentor.com>
In-Reply-To: <20170228011708.GC1688@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.153]
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] dnsmasq: disable the service by default
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
X-List-Received-Date: Tue, 28 Feb 2017 03:35:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> Sent: Tuesday, February 28, 2017 9:17 AM
> To: Huang, Jie (Jackie)
> Cc: Bruce Ashfield; openembedded-devel
> Subject: Re: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the servi=
ce by default
>=20
> [Re: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the service by de=
fault] On 17.02.28 (Tue
> 01:12) Huang, Jie (Jackie) wrote:
>=20
> > It can be overridden to enable the service in the conf file of the
> > distro with witch only dnsmasq is used in the images.
> >
> > We can also disable the service in the distro conf file instead of in
> > the recipe if it makes more sense.
>=20
> I've been thinking about this and I think it would make more sense for
> dnsmasq to have a PROVIDE/CONFLICT option that would eliminate the risk,
> though I guess I can see a scenario where you might want to use bind for
> DNS services and use dnsmasq to provide just DHCP or something.  It
> would be a weird setup, though.
>=20
> Seems to me that your patch is to cover a case where you want to have
> both on the system, though, so can you explain why we wouldn't make
> dnsmasq incompatible with bind?

We're using bind and dhcp as default DNS and DHCP service, but lxc depends =
on
dnsmasq to provide these services, so if we add lxc we need to install
both of them, but lxc doesn't need dnsmasq service to be started, it starts=
 dnsmaq
in its script to listen to a virtual address which won't cause conflicts.

So I think bind and dnsmasq doesn't have to be incompatible.

>=20
> In that scenario, why not check for a PACKAGECONFIG option or for the
> presence of bind and only disable dnsmasq if you find bind as well?

It works as well if there is a way to check the presence of bind when build=
ing
dnsmasq, could you give me a tip how to do that? Thanks!

Thanks,
Jackie

>=20
> -J.
>=20
> >
> > Thanks,
> > Jackie
> >
> > From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> > Sent: Monday, February 27, 2017 10:39 PM
> > To: Huang, Jie (Jackie)
> > Cc: openembedded-devel
> > Subject: Re: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the ser=
vice by default
> >
> >
> >
> > On Mon, Feb 27, 2017 at 3:09 AM,
> <jackie.huang@windriver.com<mailto:jackie.huang@windriver.com>> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.huang@wind=
river.com>>
> >
> > The service will fail to start/stop when dnsmasq and
> > bind (provides named) are both installed since they
> > are using the same port 53:
> >
> > | dnsmasq: failed to create listening socket for port 53: Address alrea=
dy in use
> >
> > So disable the service by default, if the user really
> > want to use two dns servives, the config needs to be
> > changed to use different interfaces or ports.
> >
> > But what if the user is only using dnsmasq ? (which is the case in the =
images I use).
> > This would be a behaviour change that they add dnsmasq, but don't actua=
lly get the
> > service started.
> > IMHO if someone is installing two packages that provide the same servic=
e, they
> > are more aware of what is going on and can disable one (or the other) .=
. versus
> > someone that adds a single package that provides a service .. and then =
find out that
> > it doesn't actually start.
> > Bruce
> >
> >
> > As reference, other distro like centos/fedora also
> > disables the services by default on installation.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.h=
uang@windriver.com>>
> > ---
> >  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta=
-networking/recipes-
> support/dnsmasq/dnsmasq.inc
> > index 424a06b..9c2276f 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > @@ -81,3 +81,4 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
> >  RREPLACES_${PN} +=3D "${PN}-systemd"
> >  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> >  SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> > +SYSTEMD_AUTO_ENABLE ?=3D "disable"
> > --
> > 2.8.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org<mailto:Openembedded-
> devel@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end"
> --
> -Joe MacDonald.
> :wq

