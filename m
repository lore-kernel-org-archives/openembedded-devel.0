Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0YNt-0008S0-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 14:06:57 +0100
Received: by eekd41 with SMTP id d41so515419eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.201.8 as permitted sender) client-ip=10.14.201.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.201.8 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.201.8])
	by 10.14.201.8 with SMTP id a8mr779860eeo.106.1330001916471 (num_hops =
	1); Thu, 23 Feb 2012 04:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D7QVcfeoSyPpLGnYkqik2elDlgQTXfiiSI7toNNyVCg=;
	b=pdfVWpATS72lruKg0a2QCFcCZvSH5BFmNYJRFjESzSH/fh4yyJtnIqaHBAus7jAy5/
	z1Y7VlH/TG0U2RqwqH/auDv27gzbNOvRWMqhILuPJaLCSN79IBScxBuOsncrEPUR01Ga
	FGX4pBfQU9FV6kmPKyetylSOSqCq9NBoX/lro=
Received: by 10.14.201.8 with SMTP id a8mr613520eeo.106.1330001916410;
	Thu, 23 Feb 2012 04:58:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm5121467eeb.8.2012.02.23.04.58.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:58:34 -0800 (PST)
Date: Thu, 23 Feb 2012 13:58:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120223125833.GS3769@jama.jama.net>
References: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
	<1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpLMpBNSqx0MUuzUbYCcapGrJccojjyQrYHjaN6TNqcSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpLMpBNSqx0MUuzUbYCcapGrJccojjyQrYHjaN6TNqcSA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] gateone, networkmanager, cloud9, ntp: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 13:06:57 -0000
X-Groupsio-MsgNum: 37399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E1BPhOSoTthPQdPL"
Content-Disposition: inline

--E1BPhOSoTthPQdPL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:50:02AM -0200, Otavio Salvador wrote:
> On Thu, Feb 23, 2012 at 10:40, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> > * maybe we should move systemd_unitdir definition outside systemd.bbcla=
ss
> > =A0because it's used in few more recipes which doesn't inherit systemd
>=20
> Please split this patch and do PR bump so we get them rebuild.

why? the output is 100% the same.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E1BPhOSoTthPQdPL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GN/kACgkQN1Ujt2V2gByObgCcCPIkCATkpL3ie2yTexg1GHAp
H7oAn0dTM88ojCg4d/JQCfQt8ZZ3Qlbf
=+p0j
-----END PGP SIGNATURE-----

--E1BPhOSoTthPQdPL--
