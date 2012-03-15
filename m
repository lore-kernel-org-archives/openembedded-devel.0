Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S882z-0008RZ-01
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 11:36:41 +0100
Received: by wera1 with SMTP id a1so2657882wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H782gDMWlepSVR3wWmHCNfz4WrQfYuuxb0TWyOnEyLA=;
	b=NwpYgimwWCWJRRo5GDqxmlghijRJNUcJ+knyamk+DS9DPww/7MDfiLm8Ihjts/90KS
	YIqmiUmfzsm4Gk4M0Dlk8Fs3biBQx1CxrOPwOWF1nTmLRHx0+4eLEk46MD4fQMn4I92X
	UsmSI8XH7JvC7JJCkmcJrtxjq5hcfEOXGDKngPQWrjNae7kMkVv7Fzo5olZxR9I1YrTp
	gQ+DqIJL4aiSvexbTQL3COmnYpLJXSF8rsFoiczvihQLIHmUO7NMLiivUhpTfilzMpwb
	lIjkh8nX3dk34lHcUMAS9zklyrORQQhSkodyYJSmCGH80cCVZcCR5oZYbANC1Rga2lbZ
	GoZw==
Received: by 10.216.138.38 with SMTP id z38mr3486969wei.63.1331807274820;
	Thu, 15 Mar 2012 03:27:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw5sm4064696wib.0.2012.03.15.03.27.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 03:27:53 -0700 (PDT)
Date: Thu, 15 Mar 2012 11:27:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120315102752.GF4973@jama.jama.net>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
	<CALbNGRSPmMZ2MGutnXuJtwerv=y8BDGiQnBUK-Lh6nk+5y9a1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSPmMZ2MGutnXuJtwerv=y8BDGiQnBUK-Lh6nk+5y9a1A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Thu, 15 Mar 2012 10:36:41 -0000
X-Groupsio-MsgNum: 37776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline

--65ImJOski3p8EhYV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 11:21:27AM +0100, Andreas M=FCller wrote:
> On Wed, Mar 14, 2012 at 8:59 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * custom waf to fix dirty vala version was dropped
> > * I've fixed our vala to stop reporting dirty even for valid released t=
arballs
> > =A0so you can still get dirty version but it's not so common to keep th=
is ugly binary here.
> > * disable PARALLEL_MAKE to improve our chances agains build hangs
> > =A0(btw fedora is doing the same
> > =A0 http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0meta-oe/recipes-connectivity/midori/midori/waf =A0 =A0 | =A0Bin 9256=
9 -> 0 bytes
> > =A0.../recipes-connectivity/midori/midori_0.4.3.bb =A0 =A0| =A0 13 ----=
---------
> > =A0.../recipes-connectivity/midori/midori_0.4.4.bb =A0 =A0| =A0 =A08 ++=
++++++
> > =A03 files changed, 8 insertions(+), 13 deletions(-)
> > =A0delete mode 100755 meta-oe/recipes-connectivity/midori/midori/waf
> > =A0delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.3.=
bb
> > =A0create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.4.=
bb
> >
> I wanted to test this but task do_compile seems to run forever (now
> for 1,5h) and I have an empty log.do_compile. Any pointers where to
> look after?

It happens to me on one host too :/.

Disabling gtk+ and PARALLEL_MAKE is only improving our chances against
build hangs not fixing them completely.

Sometimes it hangs in do_configure sometimes in do_compile (last line in
do_configure is checking locales, but I belive the problem is in
glib-genmarshal call).

But the same I had with 0.4.2 and 0.4.3 so it's not "new" issue.

Interestingly running run.do_configure and run.do_compile by hand in
terminal usually works.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9hxCgACgkQN1Ujt2V2gBzSOACfcl4nFfI7X+mJv38Buwt2PdoW
SMgAoKPL3ITgnMHlPH2po+Ax5WXVhzNR
=LiEd
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
