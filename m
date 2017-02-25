Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CAA0572FC1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2017 03:42:19 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1chTFU-0002oN-9x from Joe_MacDonald@mentor.com ;
	Fri, 24 Feb 2017 19:42:20 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Feb 2017 19:42:19 -0800
Received: by burninator (Postfix, from userid 1000)	id D7F455804B4; Fri, 24
	Feb 2017 22:42:18 -0500 (EST)
Date: Fri, 24 Feb 2017 22:42:18 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170225034218.GK8436@mentor.com>
References: <f9cd7853-8802-4b7d-a16c-01d35461b7e5@email.android.com>
MIME-Version: 1.0
In-Reply-To: <f9cd7853-8802-4b7d-a16c-01d35461b7e5@email.android.com>
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
X-List-Received-Date: Sat, 25 Feb 2017 03:42:20 -0000
X-Groupsio-MsgNum: 65570
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DNbkntcEGyiBe7B+"
Content-Disposition: inline

--DNbkntcEGyiBe7B+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libtevent] On 17.=
02.24 (Fri 22:33) MacDonald, Joe wrote:

> Yeah.  If you're near a keyboard, please go ahead and revert otherwise
> I'll get to in later on tonight.

Bah.  This isn't just the revert I'd been hoping for.  Samba, as usual,
is a pain.  My builds without gvfs are still happy, but reverting the
patch breaks all builds, AFAICT, so I'm going to leave this alone until
I sort out what the correct repair job looks like here.  Unless someone
comes up with a solution before I get to it.  The weekend is rather full
right now, I'm afraid.

-J.

>=20
> On Feb 24, 2017 5:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Joe?
>=20
> On Fri, Feb 24, 2017 at 10:37 PM, Andreas M=FCller <schnitzeltony@googlem=
ail.com<mailto:schnitzeltony@googlemail.com>> wrote:
> On Mon, Feb 20, 2017 at 5:08 PM, Szombathelyi Gy=F6rgy <gyurco@freemail.h=
u<mailto:gyurco@freemail.hu>> wrote:
> > Hi,
> >
> > If there&#39;s no solution to resolve the conflict between the internal=
 tevent and the external one, then maybe putting the libtevent-internal.h f=
rom the external lib to the samba tree would be a way to go.
> >
> > Br,
> > Gy=F6rgy
> > -------- Eredeti lev=E9l --------
> > Felad=F3: Andreas M=FCller &lt;schnitzeltony&#64;googlemail.com<http://=
googlemail.com>&gt;
> > D=E1tum: 2017 febru=E1r 20 12:52:18
> > T=E1rgy: Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libte=
vent
> > C=EDmzett: openembedded-devel&#64;lists.openembedded.org<http://lists.o=
penembedded.org> &lt;openembedded-devel&#64;lists.openembedded.org<http://l=
ists.openembedded.org>&gt;
> >
> > &gt; In last build I&#39;ve noticed only this new issue related to samb=
a:
> > &gt;
> > &gt; ctdb-2.5.6: ctdb rdepends on samba, but it isn&#39;t a build depen=
dency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
> > &gt;
> > &gt; Maybe this dependency was created from samba being libldb provider=
 in
> > &gt; this build.
> > &gt;
> > &gt; gvfs and whole meta-gnome layers is still included in my world, ma=
ybe it
> > &gt; didn&#39;t fail because some gvfs dependency was already failing o=
r one of
> > &gt; samba related changes in master-next is fixing this one.
> > &gt;
> > Some background: During last weekend I prepared a series based on
> > master-next unblacklisting. First target is to build a xfce-image
> > again [1]. Last step yesterday evening should be rebasing against
> > latest master-next and run a test build. That failed for gvfs - so I
> > stopped sending stuff. Now I know why gvfs fails...
> >
> > How do we proceed with this patch?
> >
> > [1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2017-02
> >
> Just notices that this patch made it into master breaking at least gvfs. =
Revert?
>=20
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists=
=2Eopenembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
--=20
-Joe MacDonald.
:wq

--DNbkntcEGyiBe7B+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYsP0aAAoJEEn8ffcsOfaWpQwIAMLjAtNc9GFlgxBQXAfT5MiY
XLTXj5yImrsU9kcpNhaamJBcmi8Kq1EH0tolW4GVskxLHKywhacxwg+mryP79HiU
j6NgQNQzniUy0zfE2h8uH6CNg/9YG78NYXXXO3At//hKxkvUFEJaZcDJWfyJGNFE
St+ikkRpe1l5ndm50DR4DVG3Fwu2orYaCWOF0U737xy2P0yB6StDOcCrSwLxCTXp
SLcOQ1ihH2GV7L2kMrVYO8WEDNYEFgdm66/fCA1Vba08j1YKE6qv4vqOvf/QBGnv
wqYeooq+D3kVlIw0Pp2z3JV7PGKUN2nT7twNql33tq3Wbm1s/tYl554S2WlXEUo=
=OyCL
-----END PGP SIGNATURE-----

--DNbkntcEGyiBe7B+--
