Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 069CF60FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:13:33 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1823779eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xsFXqBh+LfMpK2dvvCgrgwnzc+cpP5dsSXnF9nA+VDI=;
	b=ZYqcZR84oumAtDnGBGX0Zt1mphKJZytwdK5W5KBzCtkSHXh9AbOEbWVHCCO1OGlZFo
	4vFXo9n3XWdD6l0s7z10/p54S+227w1z6bJxDDqbydHC9GEarc1k6WxRIohLAi3EbTWn
	nkdv+SygfzRpHCQdBNPgJ/T25aA/5gYXu4ICiHjHxQrHnoK6WEv2OHp+0lCrXDL+rkaW
	MJxCZ9CPbRcs+1Gcq1sxe7mrKLN6n4ZsAJm8ILqeQ3t7mr4DeJ9L24L3vzwymCxH0xVs
	EuxyGTiNwp6nLBLkxJCSEi5hY92iekPVtliNUHj45RHhRkzkT+2Kfx3EeOMprzafv66R
	ZhCw==
X-Received: by 10.14.4.137 with SMTP id 9mr34737eej.124.1380896014836;
	Fri, 04 Oct 2013 07:13:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm28506729eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 07:13:33 -0700 (PDT)
Date: Fri, 4 Oct 2013 16:13:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20131004141340.GF6240@jama>
References: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
	<20131004100904.GC6240@jama>
	<CAP71WjyKDm_NYTbA_DRLxcK8nkfsURca0UgRHPkoO+O5bzso7Q@mail.gmail.com>
	<20131004132250.GE6240@jama>
	<CAP71WjzY7STw_W1Zt2Lkg1D-GmZaxfGe_O37+tiH2wa6Bz4Vqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjzY7STw_W1Zt2Lkg1D-GmZaxfGe_O37+tiH2wa6Bz4Vqg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: ruby-native problem (on dylan)
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
X-List-Received-Date: Fri, 04 Oct 2013 14:13:35 -0000
X-Groupsio-MsgNum: 46442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Content-Disposition: inline

--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 03:26:21PM +0200, Nicolas Dechesne wrote:
> On Fri, Oct 4, 2013 at 3:22 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > qmake also has hard coded paths inside and we depend on qt.conf
> > overrides to set correct paths when building on host with different
> > paths to sysroot.
>=20
> well, gcc too in fact, since it has hardcoded sysroot ...
>=20
> >
> > I think that only better solution is to patch ruby/qmake to remove the
> > support for "default" paths hard coded in binary and to always show an
> > error when correct paths aren't supplied by env variable or some cmdline
> > param.
>=20
> i think that's what --enable-load-relative does in ruby ./configure.
>=20
> i wonder what happens on ruby on the target then. i guess the standard
> /usr/lib/xxx might be used by default.. but i haven't tried that.
>=20
> can you make a similar patch on the dylan branch too?

Yes will do in next round.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOzRQACgkQN1Ujt2V2gBwmYgCgupFkuZA/8kgI4AO64nwoMs/+
pXMAn0yhBdJctJJVPBSyeM1SIeJn/bzu
=kRLb
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
