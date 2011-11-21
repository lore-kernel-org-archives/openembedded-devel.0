Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSPco-0003qH-AB
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 09:53:14 +0100
Received: by faat2 with SMTP id t2so5732532faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 00:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KRJ4MeGlpOVp/xgh9xRJbXzoev/dv0Yqpmm7Q6Nxfyg=;
	b=RGD642AdINZ9DoiS2fzm7fmiFr9bpbNs0yRtdQyQ1W82Z2OWlh09hnkYoGQ8Ljy0hG
	1mlKw+t+OGBxe7+fLDRJENnchl0holAVFjuOYt513L23+iSJlw+vC8pio8mwu5nsa+yH
	w4JRwqfv41rauSxRi5KpUOZSaKsCB3v4A1pUE=
Received: by 10.152.144.136 with SMTP id sm8mr8318333lab.33.1321865205103;
	Mon, 21 Nov 2011 00:46:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ne3sm8815725lab.7.2011.11.21.00.46.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 00:46:42 -0800 (PST)
Date: Mon, 21 Nov 2011 09:46:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111121084630.GD3565@jama.jama.net>
References: <1320866629-22073-1-git-send-email-Martin.Jansa@gmail.com>
	<20111110074449.GB3933@ad.chargestorm.se>
	<20111110075607.GH21022@jama.jama.net>
	<20111110082212.GD3933@ad.chargestorm.se>
	<20111116141517.GA10880@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111116141517.GA10880@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe] systemd: add postrm u-a calls
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
X-List-Received-Date: Mon, 21 Nov 2011 08:53:14 -0000
X-Groupsio-MsgNum: 35477
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline

--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2011 at 03:15:17PM +0100, Martin Jansa wrote:
> On Thu, Nov 10, 2011 at 09:22:12AM +0100, Anders Darander wrote:
> > * Martin Jansa <martin.jansa@gmail.com> [111110 08:57]:
> > > On Thu, Nov 10, 2011 at 08:44:49AM +0100, Anders Darander wrote:
> > > > * Martin Jansa <martin.jansa@gmail.com> [111109 20:25]:
> > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > ---
> > > > >  meta-oe/recipes-core/systemd/systemd_git.bb |   11 +++++++++--
> > > > >  1 files changed, 9 insertions(+), 2 deletions(-)
> >=20
> > > > > diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-o=
e/recipes-core/systemd/systemd_git.bb
> > > > > index 90862a3..d1d4306 100644
> > > > > --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> > > > > +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> > > > > @@ -14,7 +14,7 @@ inherit gitpkgv
> > > > >  # TODO:
> > > > >  # u-a for runlevel and telinit
> > > > > -# u-a prerm
> >=20
> > > > Here on your todo list, it stated u-a for prerm, but you applied it=
 to
> > > > the postrm. In this case, it probably doesn't really matter, but I'd
> > > > still guess that it would make more sense to remove the u-a before
> > > > removing the binaries. Although, I don't think it'll actually cause=
 any
> > > > problems in this case.
> >=20
> > > I did what u-a.bbclass usually do.. if you think it should be in prerm
> > > then it would be best to first fix in u-a.bbclass and then we can upd=
ate
> > > the rest of metadata.
> >=20
> > Yeah, like I said, is't likely not a real problem. There'll probably
> > just be a tiny window during which, in this case, e.g. reboot isn't
> > available, before u-a has been told to change the reboot link.
> >=20
> > I'm currently just a little bit catious as I've recently stumbled upon
> > post-/prerm issues using rpm... (Although the ones I know of (busybox
> > updates, rsyslog removal) are either fixed or there has been patches
> > submitted).
>=20
> So should I change postrm to prerm in this patch or is there other
> reason why it wasn't applied yet?

ping

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7KD+YACgkQN1Ujt2V2gBw3ugCaA25pBjjiNYyw7vd5mPBz4ysS
N74An2u8arJ0jTdT3WLdHq1CsJHQSdgz
=fFZc
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
