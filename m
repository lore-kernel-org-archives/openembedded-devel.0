Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F0D7E71D9E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 13:29:30 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ciLMp-0000m3-J6 from Joe_MacDonald@mentor.com ;
	Mon, 27 Feb 2017 05:29:31 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Feb 2017 05:29:30 -0800
Received: by burninator (Postfix, from userid 1000)	id 5B69B5805F3; Mon, 27
	Feb 2017 08:29:30 -0500 (EST)
Date: Mon, 27 Feb 2017 08:29:30 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170227132929.GM8436@mentor.com>
References: <f9cd7853-8802-4b7d-a16c-01d35461b7e5@email.android.com>
	<20170225034218.GK8436@mentor.com>
	<CA+chaQe4b7QR5hHMr5S-AEeFNnZLOZivYuiqyBViROFJs=oqyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQe4b7QR5hHMr5S-AEeFNnZLOZivYuiqyBViROFJs=oqyQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Mon, 27 Feb 2017 13:29:31 -0000
X-Groupsio-MsgNum: 65582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WeyQLTZFbZxVv3E0"
Content-Disposition: inline

--WeyQLTZFbZxVv3E0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libtevent] On 17.=
02.25 (Sat 09:20) Martin Jansa wrote:

> > My builds without gvfs are still happy, but reverting the patch
> > breaks all builds
>=20
> What gets broken? When I removed this change from master-next after
> Andreas's report I haven't seen any new issue and the gvfs one was
> indeed fixed after that.
>=20
> I'll include revert at least in master-next to see what it does with
> next bitbake world.

The failure wasn't specifically an error, it was a ton of QA warnings
about missing providers for libtevent.  After abandoning the previous
build and starting fresh, as the autobuilder would, it seems okay with
the revert, so we'll go with that approach.

-J.

>=20
> On Sat, Feb 25, 2017 at 4:42 AM, Joe MacDonald <Joe_MacDonald@mentor.com>
> wrote:
>=20
>     [Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libtevent] =
On
>     17.02.24 (Fri 22:33) MacDonald, Joe wrote:
>=20
>     > Yeah.  If you're near a keyboard, please go ahead and revert otherw=
ise
>     > I'll get to in later on tonight.
>=20
>     Bah.  This isn't just the revert I'd been hoping for.  Samba, as usua=
l,
>     is a pain.  My builds without gvfs are still happy, but reverting the
>     patch breaks all builds, AFAICT, so I'm going to leave this alone unt=
il
>     I sort out what the correct repair job looks like here.  Unless someo=
ne
>     comes up with a solution before I get to it.  The weekend is rather f=
ull
>     right now, I'm afraid.
>=20
>     -J.
>   =20
>     >
>     > On Feb 24, 2017 5:01 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>     > Joe?
>     >
>     > On Fri, Feb 24, 2017 at 10:37 PM, Andreas M=FCller <
>     schnitzeltony@googlemail.com<mailto:schnitzeltony@googlemail.com>> wr=
ote:
>     > On Mon, Feb 20, 2017 at 5:08 PM, Szombathelyi Gy=F6rgy <gyurco@free=
mail.hu
>     <mailto:gyurco@freemail.hu>> wrote:
>     > > Hi,
>     > >
>     > > If there&#39;s no solution to resolve the conflict between the in=
ternal
>     tevent and the external one, then maybe putting the libtevent-interna=
l.h
>     from the external lib to the samba tree would be a way to go.
>     > >
>     > > Br,
>     > > Gy=F6rgy
>     > > -------- Eredeti lev=E9l --------
>     > > Felad=F3: Andreas M=FCller &lt;schnitzeltony&#64;googlemail.com<h=
ttp://
>     googlemail.com>&gt;
>     > > D=E1tum: 2017 febru=E1r 20 12:52:18
>     > > T=E1rgy: Re: [oe] [meta-networking][PATCH v2] Samba: use built-in
>     libtevent
>     > > C=EDmzett: openembedded-devel&#64;lists.openembedded.org<http://l=
ists.
>     openembedded.org> &lt;openembedded-devel&#64;lists.openembedded.org<h=
ttp://
>     lists.openembedded.org>&gt;
>     > >
>     > > &gt; In last build I&#39;ve noticed only this new issue related to
>     samba:
>     > > &gt;
>     > > &gt; ctdb-2.5.6: ctdb rdepends on samba, but it isn&#39;t a build
>     dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
>     > > &gt;
>     > > &gt; Maybe this dependency was created from samba being libldb pr=
ovider
>     in
>     > > &gt; this build.
>     > > &gt;
>     > > &gt; gvfs and whole meta-gnome layers is still included in my wor=
ld,
>     maybe it
>     > > &gt; didn&#39;t fail because some gvfs dependency was already fai=
ling
>     or one of
>     > > &gt; samba related changes in master-next is fixing this one.
>     > > &gt;
>     > > Some background: During last weekend I prepared a series based on
>     > > master-next unblacklisting. First target is to build a xfce-image
>     > > again [1]. Last step yesterday evening should be rebasing against
>     > > latest master-next and run a test build. That failed for gvfs - s=
o I
>     > > stopped sending stuff. Now I know why gvfs fails...
>     > >
>     > > How do we proceed with this patch?
>     > >
>     > > [1] https://github.com/schnitzeltony/meta-openembedded/tree/
>     work-2017-02
>     > >
>     > Just notices that this patch made it into master breaking at least =
gvfs.
>     Revert?
>     >
>     > Andreas
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org<mailto:Openem
>     bedded-devel@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     >
>     >
>     --
>     -Joe MacDonald.
>     :wq
>=20
>=20

--=20
-Joe MacDonald.
:wq

--WeyQLTZFbZxVv3E0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYtCm5AAoJEEn8ffcsOfaWteoH/jRcvpNOJCzx5DP4avro+Jyk
rk/Uk3j3K047muJvnRGgAGWYj1tMxfsCXb3CHSm3RBPWeeUCSIvSPNJ9mb0vhegI
QqRJ2BhdOvnIj/YBlWHytUzyXsqkldRZ2oYjVdO3msXyRmRodw2vCpD6Ocf039eR
DLdYpNNUivDxuC4hDqJMgmq4plO7S8dorybGPjTvAEsz2huYnyhafvoReHTY59n4
iodbD8calI0jzfPZn5ATH1hfc0eIiS2R5AafrVUtwd2hpbcrtsJVCaIyX+27DCrc
VkC3RoRY7Azeu+1EcZerp4sY+AvS1VXKvvZSIv3HcyDzDthPeq9XZFTnLyIZObk=
=h/UI
-----END PGP SIGNATURE-----

--WeyQLTZFbZxVv3E0--
