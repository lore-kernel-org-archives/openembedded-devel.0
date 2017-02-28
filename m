Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 59E1072F7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:17:09 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ciWPe-0000ax-Tm from Joe_MacDonald@mentor.com ;
	Mon, 27 Feb 2017 17:17:10 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Feb 2017 17:17:10 -0800
Received: by burninator (Postfix, from userid 1000)	id 786A95805F3; Mon, 27
	Feb 2017 20:17:09 -0500 (EST)
Date: Mon, 27 Feb 2017 20:17:09 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20170228011708.GC1688@mentor.com>
References: <20170227080959.27797-1-jackie.huang@windriver.com>
	<20170227080959.27797-2-jackie.huang@windriver.com>
	<CADkTA4OXnroiRi4Y4JGHAPf2jB4BgtAbn+fJSMoFEpN8JCY9mw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013F52F492@ALA-MBC.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013F52F492@ALA-MBC.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 28 Feb 2017 01:17:10 -0000
X-Groupsio-MsgNum: 65588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the service by defa=
ult] On 17.02.28 (Tue 01:12) Huang, Jie (Jackie) wrote:

> It can be overridden to enable the service in the conf file of the
> distro with witch only dnsmasq is used in the images.
>=20
> We can also disable the service in the distro conf file instead of in
> the recipe if it makes more sense.

I've been thinking about this and I think it would make more sense for
dnsmasq to have a PROVIDE/CONFLICT option that would eliminate the risk,
though I guess I can see a scenario where you might want to use bind for
DNS services and use dnsmasq to provide just DHCP or something.  It
would be a weird setup, though.

Seems to me that your patch is to cover a case where you want to have
both on the system, though, so can you explain why we wouldn't make
dnsmasq incompatible with bind?

In that scenario, why not check for a PACKAGECONFIG option or for the
presence of bind and only disable dnsmasq if you find bind as well?

-J.

>=20
> Thanks,
> Jackie
>=20
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Monday, February 27, 2017 10:39 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel
> Subject: Re: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the servi=
ce by default
>=20
>=20
>=20
> On Mon, Feb 27, 2017 at 3:09 AM, <jackie.huang@windriver.com<mailto:jacki=
e.huang@windriver.com>> wrote:
> From: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.huang@windri=
ver.com>>
>=20
> The service will fail to start/stop when dnsmasq and
> bind (provides named) are both installed since they
> are using the same port 53:
>=20
> | dnsmasq: failed to create listening socket for port 53: Address already=
 in use
>=20
> So disable the service by default, if the user really
> want to use two dns servives, the config needs to be
> changed to use different interfaces or ports.
>=20
> But what if the user is only using dnsmasq ? (which is the case in the im=
ages I use).
> This would be a behaviour change that they add dnsmasq, but don't actuall=
y get the
> service started.
> IMHO if someone is installing two packages that provide the same service,=
 they
> are more aware of what is going on and can disable one (or the other) .. =
versus
> someone that adds a single package that provides a service .. and then fi=
nd out that
> it doesn't actually start.
> Bruce
>=20
>=20
> As reference, other distro like centos/fedora also
> disables the services by default on installation.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.hua=
ng@windriver.com>>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-n=
etworking/recipes-support/dnsmasq/dnsmasq.inc
> index 424a06b..9c2276f 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -81,3 +81,4 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> +SYSTEMD_AUTO_ENABLE ?=3D "disable"
> --
> 2.8.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists=
=2Eopenembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end"
--=20
-Joe MacDonald.
:wq

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYtM+UAAoJEEn8ffcsOfaWuRgIAKBQpGEfY8ljAHANYnpA6XP+
2YERMsX2+yCuVm1ii1r94tbZgx7E/B4Mm6lT74GSDloxvfluTmIA2SFEJkC6eoBg
dH5YuvtOGwa+C5+pR3eu6gS8V7n98QzUOyW7gNNGvF7pgE3V4VXygmO1iuHdRzks
Co6ZDvq+Qe1cRSmsVu/r43b37RTZwPqbg++0JHghflWUMptfael3s3yUGSSzvSa6
l3Wuh4LvdI2Qe5ti2ykIuu9LCxg1iiZIayRdafnxRCtsjZ1tJ2B9qWMmv7KLg0+o
iKD/FccgxCKWCEyP0XTMMy2Saa/zvZ9ja1kwwoZFj39VCqUYqicWUdLa4qMSxyg=
=6Xkx
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
