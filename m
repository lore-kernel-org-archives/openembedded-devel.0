Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URjOh-00034A-Dx
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 15:24:45 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so2258178eaf.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6CuDTGnYJ5AdIE2TALT9O+QA/XKoTBkrxhpmSVDubwo=;
	b=GZo31OkZrBd2J27CJ+xLBfJleC8FqN9Hhqr7p3Yj4cEoXN9PetlDBrSbJJzejiXsqI
	oe/G8kV6EJHsVcGs0h6Yb+6jypTFs9RfMC/BQCTR+K1jEPbuokbub8cnxfNiO69UOFNz
	A1URj62gGscyrxfTVdrUFb8Yrwh7s1DM9cL6xgprnjaoqU8zTR3g0qddrUqiV7X6ahkM
	9/VB6PekZ6FNuwkxFd7buSq+TH5lCg5OhIxHWxjjG8wdYumLLO3vmNnr0oRkTUMLbuJ3
	LzBdRFtyrrj8nsLP15An4YWhqMmufBr97Wolsgr7hpf9RgIvcMuvzfWtmSa4GH69W3sf
	tV3w==
X-Received: by 10.14.214.65 with SMTP id b41mr62233666eep.37.1366031230558;
	Mon, 15 Apr 2013 06:07:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a2sm25325921eem.11.2013.04.15.06.07.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 06:07:09 -0700 (PDT)
Date: Mon, 15 Apr 2013 15:07:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130415130715.GA10628@jama.dyndns-home.com>
References: <20130413134648.GE2477@jama>
	<1365891129-8299-1-git-send-email-Martin.Jansa@gmail.com>
	<kkelis$rj6$1@ger.gmane.org> <20130415124259.GI3914@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130415124259.GI3914@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] recipes: Unify indentation
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
X-List-Received-Date: Mon, 15 Apr 2013 13:24:52 -0000
X-Groupsio-MsgNum: 44194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 08:42:59AM -0400, Joe MacDonald wrote:
> [Re: [oe] [meta-oe][PATCH] recipes: Unify indentation] On 13.04.14 (Sun 1=
8:30) Koen Kooi wrote:
>=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > Op 14-04-13 00:12, Martin Jansa schreef:
> > > * This change is only aesthetic (unlike indentation in Python tasks).=
 *
> > > Some recipes were using tabs. * Some were using 8 spaces. * Some were
> > > using mix or different number of spaces. * Make them consistently use=
 4
> > > spaces everywhere. * Yocto styleguide advises to use tabs (but the on=
ly
> > > reason to keep tabs is the need to update a lot of recipes). Lately t=
his
> > > advice was also merged into the styleguide on the OE wiki. * Using 4
> > > spaces in both types of tasks is better because it's less error prone
> > > when someone is not sure if e.g. do_generate_toolchain_file() is Pyth=
on
> > > or shell task and also allows to highlight every tab used in .bb, .in=
c,
> > > .bbappend, .bbclass as potentially bad (shouldn't be used for indenti=
ng
> > > of multiline variable assignments and cannot be used for Python tasks=
).
> > >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > I still hate spaces for shell methods, but I support the reasons behind=
 it, so:
> >=20
> > Acked-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> I completely agree.  The only spot where I see this as being not optimal
> is something like this (hunk simplified for clarity):
>=20
>  PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
> -            ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> -             ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
> +    ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> +    ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"

the off-by-one was probably reason why it was moved to 4-space
indentation. Sometimes it wasn't off-by-one, but when tabs and spaces
were mixed to indent them (with ${PN} aligned) then after replacing tabs
with 4 spaces it was probably broken a bit more.

> The former state wasn't great, but in general if I'm doing this type of
> thing, I'll tend to align them thus:
>=20
> PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
>              ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
>              ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"

It it was aligned like this (after replacing tabs) I was keeping it.

Examples like:
PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
          ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
          ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
were unified to use only 4 spaces.

The same for less spaces, e.g.
PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
  ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
  ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"

I was also tempted to remove trailing spaces and move closing quote to
be always on new line (easier to add/remove lines when all end with \).
But that was a bit more difficult for my shell/sed monkeys, because
shell tasks has many matching '"$' lines following line which also
starts with spaces. So I kept closing quotes as they were, only on lines
with only quote I've moved it to beginning.

PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
    ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
    ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc \
"
looks better than
PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
    ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
    ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc \
       "

Some changes were manual (git grep to find suspicious lines and then
check them manually) so it isn't 100% perfect but as you said, it's
better then it was before.

git diff -w shows only few removed empty lines (e.g. begining or end of
shell task) and 2-3 lines which I've manually splitted to multiline.

With 3 acks already I'll merge this together with systemd changes today.

We should update OE styleguide after this :).

> Probably leaving such things as they are in the tree is more trouble
> than it's worth, but we could, I'd like to avoid restyling after a line
> continuation.  I won't object to the proposal as it stands, though,
> since on the whole it looks to be doing much more good than harm.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFr+4MACgkQN1Ujt2V2gBx8CwCfT2B+pqilaX7wwthooklyA/SA
LdgAniyi8iOZfg03eCUvx+4JZnYRZC+P
=18Gp
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
