Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3BB6CC57
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 13:22:44 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so1815931eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tYtUesxWSNJZopaJCJCc75it25oPNGV6kSH9HOj+SlA=;
	b=uvh88Qbn5NnecI6Esg+YaIGA4g7LwU5NjhwtU3rEL1rqezvDdwXMTEaLM/F4uIYabR
	46cO/dUaBnvI/W8FgVzBLR2qohtEui5izlW3Zov0y+CcKfl5YgCc93JCo8ff763L5Ldm
	auH1pWbuJ7lkoddja02xIDMg8EhIZtUTK+zYnXTaJ+erlc6kmgvlW4+EJkwyssE6PUfe
	kTX0BgAcW4UKVc3TUlr5GQtq3I5wH6Hy2eRjCn8DNCIEjR6FYSKHK3ZSbcMu93O0gOHf
	PMGqoUTRdlYXDOGUuKoAfVJe5AhT0MA4G45TvmL9lUMSeW5ow5DhC09hITy0hyPlR894
	xneQ==
X-Received: by 10.14.183.2 with SMTP id p2mr21877970eem.44.1380892965189;
	Fri, 04 Oct 2013 06:22:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm28044110eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 06:22:44 -0700 (PDT)
Date: Fri, 4 Oct 2013 15:22:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20131004132250.GE6240@jama>
References: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
	<20131004100904.GC6240@jama>
	<CAP71WjyKDm_NYTbA_DRLxcK8nkfsURca0UgRHPkoO+O5bzso7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjyKDm_NYTbA_DRLxcK8nkfsURca0UgRHPkoO+O5bzso7Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 Oct 2013 13:22:46 -0000
X-Groupsio-MsgNum: 46440
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Content-Disposition: inline

--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 01:57:06PM +0200, Nicolas Dechesne wrote:
> On Fri, Oct 4, 2013 at 12:09 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Try to add this in qtwebkit.inc:
> >
> > # make sure rb files are used from sysroot, not from host
> > # ruby-1.9.3-always-use-i386.patch is doing target_cpu=3D`echo $target_=
cpu | sed s/i.86/i386/`
> > # we need to replace it too (a bit longer version without importing re)
> > RUBY_SYS =3D "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586'=
, 'i386').replace('i686', 'i386') }"
> > export RUBYLIB=3D"${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_N=
ATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
> >
> > if you can confirm it works for you I'll push it to meta-qt5.
>=20
> yes, it is working fine with this change.
>=20
> however, don't you think that this is just a workaround? the real
> issue being that ruby has hard coded paths?

qmake also has hard coded paths inside and we depend on qt.conf
overrides to set correct paths when building on host with different
paths to sysroot.

I think that only better solution is to patch ruby/qmake to remove the
support for "default" paths hard coded in binary and to always show an
error when correct paths aren't supplied by env variable or some cmdline
param.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOwSoACgkQN1Ujt2V2gBwgUQCfaL2LPFAHMdnkJOJXHxGOgyzY
vtIAnRKAqQM6zK4/PPcIcUQTL6wZe6ae
=qce7
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
