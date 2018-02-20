Return-Path: <Joe_MacDonald@mentor.com>
X-Greylist: delayed 1636 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Feb 2018 14:43:04 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 110D96059E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:43:04 +0000 (UTC)
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1eo8hy-0001D8-AV from Joe_MacDonald@mentor.com ;
	Tue, 20 Feb 2018 06:15:50 -0800
Received: from SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) by
	svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Tue, 20 Feb 2018 06:15:47 -0800
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Tue, 20 Feb 2018 06:15:47 -0800
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)
	id 79336580200; Tue, 20 Feb 2018 09:15:47 -0500 (EST)
Date: Tue, 20 Feb 2018 09:15:47 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180220141547.dq3ditp7kiq4m5mh@mentor.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 14:43:05 -0000
X-Groupsio-MsgNum: 70754
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gaotsdz4hfofjarq"
Content-Disposition: inline

--gaotsdz4hfofjarq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] Splitting meta-oe?] On 18.02.20 (Tue 10:45) Burton, Ross wrote:

> Hi,
>=20
> Is now a good time to talk about splitting up meta-oe?  Some layers are
> actively developed and maintained (one example: meta-python), others are
> basically bitrotting and only get touched when something else causes them
> to break world builds (one example: meta-gnome).  I've long felt that
> meta-oe should be split up and the high quality layers managed in their o=
wn
> repositories so patches to them don't get held up by breakage in other
> sub-layers.

Way back when I first proposed creating meta-networking I pitched it as
a separate layer managed outside the meta-oe umbrella.  At the time I
thought it made sense for my use case and for the use case I anticipated
=66rom consumers of meta-networking packages both for the reasons you
state below and because my intent was to create a layer primarily useful
for creating network-centric devices (bridges, firewalls, switches, APs,
etc.) with an absolute minimum of other layer dependencies.  I think I
actually proposed the highly ambitious goal of oe-core + meta-networking
as a functional set.

Anyway, in the intervening time there's been enough situations crop up
that now the minimal set is something like oe-core + meta-oe +
meta-perl(we're still open on that, I think) + meta-python +
meta-networking.

So my original goal of keeping meta-networking largely independent of
other layers isn't practical (wasn't from get-go, really) and I'm okay
with that.  I also think there's considerable value in being able to say
"we don't need that recipe in this layer, it's already maintained by
someone else in a common area in the same repo, just a different layer".
I wouldn't want to start down a path that leads to multiple incompatible
versions of recipes being maintained in layers purely out of convenience
to the layer maintainer.

I can see a lot of value in removing old recipes / layers that aren't
being used and / or have fallen far out of date, though.  If you've got
a list of those you'd like to discuss, I'm sure that's a useful
discussion to have.

I'll also take the opportunity to plug my old patch for flagging recipes
as deprecated (https://patchwork.openembedded.org/series/5489/).  It's
never gotten any traction, but I think it's a good early-warning for
consumers of recipes that are quietly using them with reasonable success
as-is despite any issues the maintainers may have with them.  Could be a
good way to determine who actually cares about these problem child
recipes before they become a big enough headache that we just need to
abandon them.

-J.

> Another advantage of splitting out the high quality layers is that we'd
> like to look at running more community layers through the Yocto
> autobuilder, and granular layers make that easier to manage.
>=20
> Comments?
>=20
> Ross
--=20
-Joe MacDonald.
:wq

--gaotsdz4hfofjarq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlqMLZMACgkQSfx99yw5
9pZIBAgAjzPHooaHAqtTcA7Xpr8FhMcmjJhk5zc1gf7DQRzWgbr4s0XXz9PbQn3s
tDe20oT7upRY9iRlFFnT+iAhAFTsE28K8fhDzXIYXEYwcLjKT6bprSFP/qCfoDSc
oAOqNrG847rL+yg2MxZ4NHNHhG7QuEoOCatagssaW7Wi70UZkBZZ3vG1Jz3HZxX3
ZEmZ1cM5HuHIq2ZuOZD71mKh+Hc0eupu0su6zyR8VUi/58JgA51Dv2gITOTu1SoW
BzZFol+a0AFAJ9HRli3MaGnHiYscDvkN6rVnMffDo+W2M96uAaBihYtOGGtQvnlA
3OdpfHEpK8tDvCTyZRsv37Xih6HsmQ==
=TpNR
-----END PGP SIGNATURE-----

--gaotsdz4hfofjarq--
