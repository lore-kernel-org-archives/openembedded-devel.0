Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id EA6046CD55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:40:02 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so1799091eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2tVKKbHJXYbri6t04SalAF93QIRJjVSOvL8vPFPj28g=;
	b=glk9chh3+FgW0z+NAkD0bpZSCI++oiEw9ZyVS6zf/PQ8B6Bz2lxo3B9A7kg8awcuoy
	NtMs1hVQmT08Ut4r7qPGIM6YvEsPi5M/4XtFKsYi1oEj7xVNG26pCGah5aHP7zp6TKfO
	j5mMMzZTvmF+UtVkhHKAMDsArtIMuEh9dqRgaihXriQFTkMPmRyucvet96aL6x1LX/3g
	qqwOZfOKGs7dtV5Z4Rb1CI/yZ5sDIF3HBIOidUGFbA18MtWSWT5tYFtcPTrJpGpTutxc
	nPioUrUCcvqr6WP5TmiUhdYItIqNaxW+yFT5a63iyXpFgwYWwgDp0S6rKPE4JysHtpsN
	Z5Ww==
X-Received: by 10.14.177.199 with SMTP id d47mr3095860eem.14.1382089203917;
	Fri, 18 Oct 2013 02:40:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm2163428eex.2.2013.10.18.02.40.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Oct 2013 02:40:03 -0700 (PDT)
Date: Fri, 18 Oct 2013 11:40:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131018094009.GF3930@jama>
References: <cover.1381920288.git.anders@chargestorm.se>
	<cace5960-a68e-4774-911d-debd3fc71b6d@email.android.com>
MIME-Version: 1.0
In-Reply-To: <cace5960-a68e-4774-911d-debd3fc71b6d@email.android.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/2] Breakpad and ktap recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 09:40:04 -0000
X-Groupsio-MsgNum: 46802
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline

--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2013 at 07:14:09AM +0200, Anders Darander wrote:
> I'm going to resend this series with the correct prefix added.=20

Are they the same, just with prefix added?

I've already included them in last jenkins builds, so to know if I
should fetch new version from patchwork or not.

> Anders Darander <anders@chargestorm.se> wrote:
> >
> >These are a couple of recipes that we've been using internally for some
> >time. They
> >were developed and mostly used on a dylan-based setup. Testing has
> >primarily been=20
> >performed on ARM, both qemuarm and our custom machine.
> >
> >Breakpad is a crash reporting tool, that's getting a wider use.
> >Please, let me know if there's a more efficient way (or otherwise
> >better way) to=20
> >have the bbclass generate the symbol file.
> >
> >Ktap is a new scripting dynamic tracing tool for Linux. This recipe
> >will be of
> >use until everyone is on 3.13+ kernels (ktap has been merged for the
> >3.13 series).
> >
> >The following changes since commit
> >f8903f53db717294d63a8d79b5ef7ca34b3c189e:
> >
> >libhugetlbfs: install perl lib to directory perl instead of perl5
> >(2013-10-15 13:43:53 +0200)
> >
> >are available in the git repository at:
> >
> >  git://github.com/darander/meta-oe breakpad-ktap
> >  https://github.com/darander/meta-oe/tree/breakpad-ktap
> >
> >Anders Darander (2):
> >  breakpad: add initial recipe
> >  ktap: add initial recipe
> >
> > meta-oe/classes/breakpad.bbclass                  | 32 ++++++++++
> >meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 72
> >+++++++++++++++++++++++
> > meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb    | 19 ++++++
> > meta-oe/recipes-kernel/ktap/ktap.inc              | 11 ++++
> > meta-oe/recipes-kernel/ktap/ktap_0.3.bb           | 17 ++++++
> > 5 files changed, 151 insertions(+)
> > create mode 100644 meta-oe/classes/breakpad.bbclass
> > create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap.inc
> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap_0.3.bb
>=20
> --=20
> ChargeStorm AB / eStorm=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJhAfkACgkQN1Ujt2V2gBygMQCeM6RAu7d4cn5IffJxFzoUckMy
X1UAn2Ikv+olSlVAukIhWuabqsmXgd/z
=OO1X
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--
