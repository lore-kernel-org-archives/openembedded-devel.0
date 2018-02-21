Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A11457872E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:45:11 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1eoUhs-0007YT-Qv from Joe_MacDonald@mentor.com ;
	Wed, 21 Feb 2018 05:45:12 -0800
Received: from SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) by
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Wed, 21 Feb 2018 05:45:10 -0800
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Wed, 21 Feb 2018 05:45:09 -0800
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)
	id 73BAF58D58D; Wed, 21 Feb 2018 08:45:09 -0500 (EST)
Date: Wed, 21 Feb 2018 08:45:09 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180221134509.wheeephzdzqytopy@mentor.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 13:45:11 -0000
X-Groupsio-MsgNum: 70789
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m35c3vt66bdkwfvr"
Content-Disposition: inline

--m35c3vt66bdkwfvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] Splitting meta-oe?] On 18.02.21 (Wed 09:49) Martin Jansa wrote:

> > I need an updated python-<foo> package for an unrelated package
>=20
> And how far will you go?
>=20
> If you want just newer python-<foo> and nothing else, will you take other
> changes to other python-* recipes from meta-python layer? There is a lot =
of
> recipes there, if you're so picky about updates, then you shouldn't update
> whole oe-core as well.

It seems like this part is already settled, but it would seem to me that
this scenario, if I understand it correctly, is "I'm using oe-core and
see up-stream meta-oe/meta-somethingorother has an updated or new recipe
for something I want in my image but I don't want to do a pull on all of
meta-oe and potentially cause a huge rebuild of stuff I don't really
care about".

That sounds like a problem better solved with 'git branch', 'git fetch'
and 'git cherry-pick' on the developer's side than breaking up meta-oe
across existing meta-boundaries.

-J.

>=20
> On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>=20
> > On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
> > >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
> > wrote:
> > >>>
> > >>>
> > >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
> > >>>> Hi,
> > >>>>
> > >>>> Is now a good time to talk about splitting up meta-oe?  Some layers
> > are
> > >>>> actively developed and maintained (one example: meta-python), othe=
rs
> > are
> > >>>> basically bitrotting and only get touched when something else caus=
es
> > them
> > >>>> to break world builds (one example: meta-gnome).  I've long felt t=
hat
> > >>>> meta-oe should be split up and the high quality layers managed in
> > their own
> > >>>> repositories so patches to them don't get held up by breakage in o=
ther
> > >>>> sub-layers.
> > >>> You make it sound like meta-oe is not a high quality layer.  I could
> > >>> make the same claim about oe-core master.
> > >>>
> > >>> I don't see the connection in patches being held up due to breakage=
 in
> > >>> other sub layers. This only happens if the dependency fail to build.
> > >>>
> > >>> You lose control over the quality in current layers that reside in
> > >>> meta-openbedded just like you have no control over all the other la=
yers
> > >>> residing in the community. It makes maintaining stable versions very
> > >>> difficult. Well, unless The Yocto Project takes over them.. I guess
> > that
> > >>> would work then.
> > >>>
> > >>>>
> > >>>> Another advantage of splitting out the high quality layers is that
> > we'd
> > >>>> like to look at running more community layers through the Yocto
> > >>>> autobuilder, and granular layers make that easier to manage.
> > >>>  I thought not including layers in bblayers.conf was easy enough.
> > >>>>
> > >>>> Comments?
> > >>>
> > >>> What problem do you thing you are trying to solve here?
> > >>
> > >> My unrelated issues are that I can't update one layer, without getti=
ng
> > >> all of the updates.
> > >> .. but that is both a good thing (i.e. they are all tested together,
> > >> so you know that the
> > >> single SRCREV update is good for all layers), and a bad thing (when
> > >> you just want a
> > >> new python recipe update from meta-python, but don't want other
> > changes).
> > >>
> > >
> > > if you dont include the layers in your BBLAYERS and they become
> > > effectively non existent, unless you are on metered internet connecti=
on,
> > > where downloading unused stuff would save you bandwidth, it should be
> > > ok.  No ?
> >
> > Its not that.
> >
> > I *am* building the different layers, but say I have a stable set of
> > packages
> > and working images .. but for whatever reason, I need an updated
> > python-<foo>
> > package for an unrelated package, or some other layer that needs a newer
> > version, etc.
> >
> > How do I get that, without taking updates to all the layers ? .. and
> > layers that
> > I really didn't want to update. I have to do some sort of combo-layer,
> > carry
> > my own copy of the recipe, etc.
> >
> > So there are definitely ways to do it, I'm just pointing out that I
> > end up taking
> > some build failures/issues from time to time on packages I didn't really
> > need to update.
> >
> > The flip side of that argument is that all of the layers and sub layers
> > have
> > gone through some sort of global build, and hence I know that they all =
have
> > worked together for someone. If I can update pieces individually, I bre=
ak
> > that .. and I own the broken bits after that .. which again, goes to
> > my point that
> > fixing one workflow/issue can break another :D
> >
> > Bruce
> >
> > >
> > >> It is very likely that splitting the layer would help one issue, but
> > >> make the other worse.
> > >>
> > >> So no solution from me, just an observation about potential issue.
> > >>
> > >> Cheers,
> > >>
> > >> Bruce
> > >>
> > >>>
> > >>> - armin
> > >>>>
> > >>>> Ross
> > >>>
> > >>>
> > >>> --
> > >>> _______________________________________________
> > >>> Openembedded-devel mailing list
> > >>> Openembedded-devel@lists.openembedded.org
> > >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >>
> > >>
> > >>
> > >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
--=20
-Joe MacDonald.
:wq

--m35c3vt66bdkwfvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlqNd+UACgkQSfx99yw5
9pZNkwgAgoLo6mI7qNzmY1O/17Qz7ev3sLacoZ8MQYfu26ySogvhA7cMjzQJ7Wtp
eCl0hLRj/dYFQLLvwwQWD7RU04seRN+rAmLFhO7jCvZYk/SpxjAyMbWNnqJBtFhd
JESyU6LYFbI+K1n8iU0Ht1IGAmdZ21brConbDh+qGTYIv1cKa4D9Qwy8rnfuRJ8S
NBGytQXDC46u26OqWWdN/2/USZxdwIwt4q9WPaOiySp9id2MevSKjMqWvqzdNoPL
2BO31vKdgR300lvcqN47uc0BE1c6jdd439itZUfnkfYJaGd63IHD7aZ5HzDZD3Xw
CgheOW8JgRgx4oLNQwLUmwGXdMzBFw==
=tauN
-----END PGP SIGNATURE-----

--m35c3vt66bdkwfvr--
