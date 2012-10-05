Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK7mp-0004Wo-Lb
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 15:17:51 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so506439wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 06:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KeAAWx3XIGNMAUN86d+q5KCrtgDkIgN0c304Lu9jtmc=;
	b=Oo+TUTs4gqvr7ZtLwOZRrhZ7Y32EPwKfhM28Ggp0E/9C+AxF3Jq0kzfj9r1yJ0SS9k
	gak3xJGWwCsp/yTpPjrWq4v/p9oOkSNPq5ddTCYIsFhj8b9w3UVHqxYPOnD5QS+CGYtp
	87jVLq6iy78LocHGDo0SiVnnaE3cCeXz9UqRrn6aKTWr8xW2L8J0HINfXSyOQa1OI4Rk
	CO+S/1k6cD4ltfqRTwCSqecC4TzYxhT3r9uc/XjUu+MdKG3dcXGnjDnJQlHqf8+eURzq
	VzhSqs9L0FIl6FvkzUOU3wN/YJfbinYEI01k0Tw8Fn58MsPRnQN8cwWWMBC1Du9/KObb
	Iggw==
Received: by 10.180.108.45 with SMTP id hh13mr3273624wib.15.1349442289506;
	Fri, 05 Oct 2012 06:04:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm2593561wid.1.2012.10.05.06.04.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 06:04:48 -0700 (PDT)
Date: Fri, 5 Oct 2012 15:04:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20121005130452.GC3542@jama.jama.net>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
	<1349323389-16520-2-git-send-email-otavio@ossystems.com.br>
	<20121005122535.GB3542@jama.jama.net>
	<CAP9ODKov0soW=roBAfUGXW2vaiL8=BF7Kknp7Cmd0kvMrLdZbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKov0soW=roBAfUGXW2vaiL8=BF7Kknp7Cmd0kvMrLdZbQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/9] libav: Convert to use dynamic packages to split libraries
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
X-List-Received-Date: Fri, 05 Oct 2012 13:17:51 -0000
X-Groupsio-MsgNum: 40936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2012 at 09:31:03AM -0300, Otavio Salvador wrote:
> On Fri, Oct 5, 2012 at 9:25 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Thu, Oct 04, 2012 at 01:03:01AM -0300, Otavio Salvador wrote:
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta-oe/recipes-multimedia/libav/libav.inc |   76 ++++++++++++-------=
---------
> >>  1 files changed, 33 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/reci=
pes-multimedia/libav/libav.inc
> >> index fc0b021..21b57b7 100644
> >> --- a/meta-oe/recipes-multimedia/libav/libav.inc
> >> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
> >> @@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET =3D "arm"
> >>  # faac faad2 lame schroedinger libgsm
> >>  DEPENDS =3D "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${=
@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
> >>
> >> +PACKAGES_DYNAMIC =3D "lib*"
> >
> > Please limit this a bit
> >
> > NOTE: multiple providers are available for runtime libpurple-protocol-m=
sn (libav, pidgin)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-p=
rotocol-msn
> > NOTE: multiple providers are available for runtime libpurple-protocol-i=
cq (libav, pidgin)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-p=
rotocol-icq
> > NOTE: multiple providers are available for runtime libpurple-plugin-ssl=
-gnutls (libav, pidgin)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-p=
lugin-ssl-gnutls
> > NOTE: multiple providers are available for runtime libpurple-protocol-i=
rc (libav, pidgin)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-p=
rotocol-irc
> > NOTE: multiple providers are available for runtime libpurple-protocol-x=
mpp (libav, pidgin)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match libpurple-p=
rotocol-xmpp
>=20
> I just doesn't understand why it didn't happen here...
>=20
> I try it here to reproduce it and then see how to fix it.

You need to pull libpurple-protocol-* as RDEPENDS to your image
together with libav to reproduce it

Cheers,
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBu2vQACgkQN1Ujt2V2gBzscwCaAmKnhVI7wlaJJsddyCUgHKjp
uv8An1ihD/zbR6nGnW9f8UYwqzO4j1Mo
=D/nZ
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
