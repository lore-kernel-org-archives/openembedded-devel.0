Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvQzD-0001fI-Kt
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 10:07:48 +0100
Received: by fxm8 with SMTP id 8so1943326fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 01:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zrGMBy2WUOgdRnEwMQKQONoSn9wwcKeirii4vGGLA24=;
	b=sPWjaLlFaitgmRdwZCn4skmXN+NBDgnVOEfCr0e4n6peEFXVZR7E0mpzNgZs52asLR
	ORGhAuRuiRY98nyaVaQv43ptirWZ3VitQM2eSoBl7VTE0+7PU0xXVidU2qyiGBnwvYjH
	Vf8oZysBEx1ux6TueYrUZWn1ldtrtWMRPZTAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QznxmOUWGdXw49JbXCJVEJXLiDj9XqJFgapxJaxkPLwCqKFgGT2BT8QJeMgXcuNY9R
	hDHi4x0Ec/3pL4VZDWiDr/rWHU5jd73apn0WYS1ggyZdOPfkA7BRLrdXaP3ZzdEKZCK5
	3Q5ZG0MbwaNsgu9adtf8bIcMe/vXpgUarzKX4=
Received: by 10.223.66.200 with SMTP id o8mr493658fai.38.1299229128814;
	Fri, 04 Mar 2011 00:58:48 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm1017438fal.25.2011.03.04.00.58.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 00:58:43 -0800 (PST)
Date: Fri, 4 Mar 2011 09:58:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110304085836.GC3312@jama.jama.net>
References: <20110224164519.GA12581@jama.jama.net>
	<1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
	<20110303072744.GB419@jama.jama.net> <4D6FA7CC.9020407@mentor.com>
	<1299197506.17567.241.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1299197506.17567.241.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: define shared PERSISTENT_DIR and point it outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 09:07:48 -0000
X-Groupsio-MsgNum: 29914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2011 at 12:11:46AM +0000, Richard Purdie wrote:
> On Thu, 2011-03-03 at 07:38 -0700, Tom Rini wrote:
> > On 03/03/2011 12:27 AM, Martin Jansa wrote:
> > > On Fri, Feb 25, 2011 at 04:27:16PM +0100, Martin Jansa wrote:
> > >> * import from poky 6a11cf7dfe930461a6660e3b783b546fa2634900
> > >> * we had CACHE var pointing to machine specific dir since 2006
> > >>    caf077679022f37ce55d758101f130e4e93bd7b5
> > >> * current bitbake is looking for cache dir like this:
> > >>    cachedir =3D (bb.data.getVar("PERSISTENT_DIR", d, True) or
> > >>                bb.data.getVar("CACHE", d, True))
> > >>    which without PERSISTENT_DIR defined picks machine-specific CACHE=
 dir
> > >>    so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE s=
witch
> > >>    in same builddir :/
> > >
> > > ping?
> > >
> >=20
> > I'd like Richards comments here.
>=20
> The intent was always to have CACHE be machine specific and
> PERSISTENT_DIR not be machine specific. This means all builds share the
> idea of revision numbers yet the main cache is machine specific so you
> don't hit reparses when switching machines unnecessarily.
>=20
> So yes, I think the change is valid, I hadn't realised OE didn't have
> that change and I'm happy to ack it...

Can I get at least one more ACK?

And if we all agree on new location
"${TOPDIR}/conf/persistent"
then I would send similar patch to oe-core and move it too

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1wqbwACgkQN1Ujt2V2gBziNQCfXFXh4diJz+GXNUutZq1bwrYl
lcQAoIasq1nSRR6Sfnm6NtREE9dAcBV3
=QaEq
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
