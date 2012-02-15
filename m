Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxlEg-0004NR-3l
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 21:13:54 +0100
Received: by eekd41 with SMTP id d41so445246eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 12:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KiFcfBhgOL8YPCeNe3zAJFD7HCY2LhAmfEKz+w6FpN4=;
	b=F5p9MUpMSbFEo68VisRe/GLg+ZPNRR/XSxc4ppwt53OmS3kncfQDdYm0f87yM3Z2+3
	pSlu234vvZw3J30xx8BJpG9wBeXXSbig0OYmO5QupNBSLpx+ZsrK7Ip0BU2F3U0nAM/t
	EYl3bcm7fXGRdExtvGSTd7Ry+RM50DMgWYKXk=
Received: by 10.14.94.134 with SMTP id n6mr8795223eef.63.1329336341962;
	Wed, 15 Feb 2012 12:05:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm14583701eeb.4.2012.02.15.12.05.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 12:05:41 -0800 (PST)
Date: Wed, 15 Feb 2012 21:05:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120215200537.GD32230@jama.jama.net>
References: <CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
	<CAP9ODKq=i_jLUHcB+L1marL7Ymz261LZGC26Q49Bfvm+E4tm5g@mail.gmail.com>
	<CALbNGRS-g-kXkEYdxkcwbAum2kqbg5a79=QCoV8eYm2TpwWh9w@mail.gmail.com>
	<CAP9ODKqXfNBpQ7J6rEcFkFKXX5LspymGtQ0SNBh_jMX=pGyFHQ@mail.gmail.com>
	<CALbNGRQvP7A=oz6mtM8hZ6wO6+esQQ6KR4nmV4DXhY=eonAAtA@mail.gmail.com>
	<CAP9ODKo3A3AMqLR701E39V5MykwUS7f55phQmGSNq6WdXFfYtA@mail.gmail.com>
	<CALbNGRTDR1zLZCUPfpUnXN_ezEpX0ehqo8ubY3Dafr4rw8_jDg@mail.gmail.com>
	<CAP9ODKq2MjMnz7wEVA+ho5HWntxFw42e6rVuc-7VLob-9hzFfQ@mail.gmail.com>
	<CALbNGRQp1xFLUECjtg78gy1-8vYpUwB-G4xjCKn_80paA2Ymnw@mail.gmail.com>
	<CAP9ODKr9O8Ff2PPDBfTmgOYwJT8sExKcGs00-PfvzS=3O31dGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr9O8Ff2PPDBfTmgOYwJT8sExKcGs00-PfvzS=3O31dGw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 6/7] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Wed, 15 Feb 2012 20:13:54 -0000
X-Groupsio-MsgNum: 37140
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline

--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 05:55:56PM -0200, Otavio Salvador wrote:
> On Wed, Feb 15, 2012 at 17:53, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>=20
> > For test I did with a bunch of recipes
> >
> > 1. build from scratch with unmodified sources
> > 2. Applied sytemd-patches and the 'cleanup'-patches (removing obsolete
> > systemd code in recipes)
> > 3. build recipes again
> > 4. compared the results with buildhistory
> >
> > Results are as expected except one issue I don't understand:
> >
> > The sizes of the *-dbg packages are reduced. Some reduce to less than
> > half. Has anybody a good explanation for this?
>=20
>=20
> No good guess about possible reasoning.

Just guess:

-dbg packages contain also sources packaged for /usr/src/debug/, maybe
your changes caused *.service files to be ommited from it?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk88EBEACgkQN1Ujt2V2gByQXwCcDBx1IWkH6GdizCz0iEBzkMnj
In4An3+/srS1Ah5Bhv4m+wJKjWPapOCR
=ilj4
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
