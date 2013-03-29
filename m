Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYa8-0006dJ-E3
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 13:38:56 +0100
Received: by mail-ee0-f48.google.com with SMTP id b15so207903eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WwlIjj1HHTra5MCGE7mOM9BV2fAse3XnW39EVZ/kJEo=;
	b=gFww9jKeINU0FGiseyvSWka+EQHR12JUaj0cDKuJCXZYkHsYnC43mWwWwmg/QS0xcZ
	gM0+ba9JNpRL25VRImBZGVuPlvcPL6U8GKeq+nhLIesl5VZlC0pZi+8fGAYnLrZgxQGg
	ZMC8yu111Bvp5UUwFoj4SwkK0rs8vx7kSt5AzOCeDchD7bMcJjSvlXLWAmuWik7ep/ag
	trlRMajgTbUxrCZ+yRiFCVmvLozR3IbmzGB9us3ZjGUTdj85y5uIJYB4Hy7qaza70zJM
	7vkkR2gBWLVn7ZL1NaUwlg5w5gtKWxcMTHqiYQfsUcO4ThLHiszPhZM1dhKDhhqu2wh2
	scmg==
X-Received: by 10.15.22.197 with SMTP id f45mr7141647eeu.46.1364559712677;
	Fri, 29 Mar 2013 05:21:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s3sm3776873eem.4.2013.03.29.05.21.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:21:52 -0700 (PDT)
Date: Fri, 29 Mar 2013 13:21:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130329122156.GE11120@jama>
References: <1364203235-2737-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<01AB5E40-2C26-4250-BB86-20A74683FBC4@gmail.com>
	<51514A23.3080109@linaro.org>
MIME-Version: 1.0
In-Reply-To: <51514A23.3080109@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] tbb: add 4.1 20130116 version (4.1 update 2)
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
X-List-Received-Date: Fri, 29 Mar 2013 12:38:56 -0000
X-Groupsio-MsgNum: 43786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2013 at 08:11:31AM +0100, Marcin Juszkiewicz wrote:
> W dniu 26.03.2013 06:59, Khem Raj pisze:
> > On Mar 25, 2013, at 2:20 AM, Marcin Juszkiewicz
>=20
> >> +do_compile() { +    oe_runmake compiler=3Dgcc arch=3D${HOST_ARCH}
> >> runtime=3Dcc4.7_libc2.17_kernel3.8 tbb tbbmalloc +}
>=20
> > hmmm do you have to encode the tools versions like that, say in
> > future we move to gcc 4.8 or kernel 3.9 will this need adjusting too?
>=20
> If runtime is not defined it is created based on host system so can be
> totally wrong. From quick look at makefiles there is only compiler part
> checked for "cc3" or "cc4" - to add some arguments to flags.
>=20
> New version sent.

Applied, thanks!

Hopefully in right (last) revision.

Would be great if you can update patchwork status and use PATCHvN for
next patches.

memcached/libmemcached are still pending (unresolved review comments=20
afaik).

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFVh2QACgkQN1Ujt2V2gBxEtQCeIqYXkVLc++bP/F5h2kKi/COz
NtIAn3k4pVNxnOyqtdVGOlNKu/adN6ya
=Fd8E
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
