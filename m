Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 65E876B6CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 12:41:57 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so2705058eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ImIubGnYZi4fF18rrj6fGOzbcisEtgvOvJ+AMxHOlDA=;
	b=u+fjHsbx/vyatCB2ToZC3sP7eyu9M1SpLYY841eZho1xX8vgPUdRJAewaImOJnYKVp
	46vmqJ+Ggoa8LSnQeBICPXjWNAjDyGG7IsahgGsV9W6Bcj0caJBXu8hhua20Q9FeHam1
	p0zsf8hnQ17rL524RUstAkGaiNKat5fmza0pQM5d1qIktc1B+cLLdKifRAiM1k0UT2hO
	Zl9IDRFfp91vrN/LA9uiAygW1bmuHizP1AL8Cc6qDpZEdsig6WobFDR77yWHyUhdznHJ
	3dZxzXthmlOLMwK+j7C/puJKZClu+4S15VnsqCJo09VzDqrBx3bHvMWXeCD1A6RMVlaG
	tAIQ==
X-Received: by 10.14.214.136 with SMTP id c8mr50734373eep.6.1379421718258;
	Tue, 17 Sep 2013 05:41:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm50585519eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 05:41:57 -0700 (PDT)
Date: Tue, 17 Sep 2013 14:43:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hans =?iso-8859-1?Q?Beck=E9rus?= <hans.beckerus@gmail.com>
Message-ID: <20130917124333.GE7313@jama>
References: <CAFyqS9qQjwXnPY+BgqPyrSxniTbYJerSwoOsnDd9RkDX25me6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFyqS9qQjwXnPY+BgqPyrSxniTbYJerSwoOsnDd9RkDX25me6A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-oe: libedit build failure
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
X-List-Received-Date: Tue, 17 Sep 2013 12:41:57 -0000
X-Groupsio-MsgNum: 46222
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline

--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 02:07:03PM +0200, Hans Beck=E9rus wrote:
> Hi, I saw you were the latest person committing to libedit in meta-oe.
> I do not know if that makes you the maintainer of it, but regardless
> maybe you can help me?

I'm maintainer of whole meta-oe, but don't know much about libedit (I
was probably just fixing some issue detected in my verification builds).

> I stumbled into a compilation problem of libedit after shrinking down
> our poky distro in Yocto.
>=20
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [tc1] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | ../src/.libs/libedit.so: undefined reference to `wcslen'
> | collect2: error: ld returned 1 exit status
>=20
> I believe we no longer have wide character support in libc, but still
> libedit tries to compile wcsdup.c, which is a replacement function if
> HAVE_WCSDUP is not defined (from config.h). Problem is that the custom
> wcsdup() function tries to use wcslen() which does not exist either
> and configure was never given the. I think this is a bug in libedit
> since in config.h also the following can be seen
>=20
> /* Define to 1 if you want wide-character code */
> /* #undef WIDECHAR */
>=20
> So, wide char code should not even be enabled in the first place. I
> reasonable solution would be to add a check on this also before trying
> to compile a custom version of wcsdup(). Have you encountered this
> problem before? Is it eligible for a patch? Do you know how to file a
> bug report on upstream libedit? Also, if I would create a patch for
> this, should I send it to oe-core or is there a dedicated list for
> meta-openembedded?

Sorry I'm quite busy right now, I can only confirm that I've built
libedit few times last week for arm/x86/x86-64 architectures and it
doesn't fail here (but my jenkins builds are using pretty default values
not like poky-tiny or like you said "shrinked down version of poky distro".

Asking in openembedded-devel ML is good start and from your description
(without looking at actual libedit code) it really looks like bug in
upstream, so after checking with latest libedit you should report it
there as well.

I've added oe-devel to CC.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI4TnUACgkQN1Ujt2V2gByzOgCfe4B7xfqhHDB4cyZPFujAX3Cp
48MAniXzpptiQgeZ3R5yKEFJDuuSiWU+
=n+JQ
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
