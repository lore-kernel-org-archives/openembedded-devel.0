Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0DvN-0004gd-7Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 16:16:09 +0100
Received: by eekd41 with SMTP id d41so13872eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:07:49 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.183.136 as permitted sender) client-ip=10.14.183.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.183.136 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.183.136])
	by 10.14.183.136 with SMTP id q8mr15936591eem.60.1329923269253
	(num_hops = 1); Wed, 22 Feb 2012 07:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GL0ayQ1XEC/JS2gVR4FwxwU3mYXOKUVdoKfnlj2Dc1Y=;
	b=wS7QXBRFXkI6tKQQQY1IyQbbXTi6Fhe4ZEUxH1p7YGTrBOTwp/iAIy0bHLc/CpO3In
	71zdq9WwRSOANOZwtDq6kCT62HOPCYeYjUB1RNBFnwhmM781PGq2Lk7aAEoTVFTGLQu/
	8BgvFrHrx6f/w8U1qpP6pj9H2T1UYI2/cRg8o=
Received: by 10.14.183.136 with SMTP id q8mr12752917eem.60.1329923269062;
	Wed, 22 Feb 2012 07:07:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm74170409eef.10.2012.02.22.07.07.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 07:07:48 -0800 (PST)
Date: Wed, 22 Feb 2012 16:07:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120222150745.GL3769@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
	<20120220160415.GH3953@jama.jama.net>
	<CALbNGRQkNRcf3gHbscAvVFqZv0nGRR5_U2kTHSZ_uVCASWGtYQ@mail.gmail.com>
	<20120222131548.GK3769@jama.jama.net>
	<CAP9ODKp48zr4Qdpd6K+EX-jztSst3iiB6iDZRo0QSQ=0uytVNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp48zr4Qdpd6K+EX-jztSst3iiB6iDZRo0QSQ=0uytVNg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Wed, 22 Feb 2012 15:16:09 -0000
X-Groupsio-MsgNum: 37340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline

--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 12:45:55PM -0200, Otavio Salvador wrote:
> On Wed, Feb 22, 2012 at 11:15, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > Maybe only add that variable for /lib/systemd/system so I can push my
> > "systemd rework" patchset for meta-smartphone with this variable
> > already.
> >
>=20
> Can you explain why you'd like to move those files?

I don't want to move it.. just wanted to use systemd_unitdir variable as
discussed here
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg23=
921.html

when I'm updating all recipes in meta-smartphone which are using
systemd, see:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dshortlog;h=3Dre=
fs/heads/jansa/test

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9FBMEACgkQN1Ujt2V2gBwv6gCgtPWsxQGFTQJ5MRZTRgVQAZ8j
hlUAn2UzM94lpciQ4SzWQxCHL07w2082
=2EhS
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--
