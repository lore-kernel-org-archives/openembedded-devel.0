Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0aAi-0002tu-Qv
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 16:01:28 +0100
Received: by eaal10 with SMTP id l10so593627eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.7.80 as permitted sender) client-ip=10.213.7.80; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.7.80 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.7.80])
	by 10.213.7.80 with SMTP id c16mr559057ebc.7.1330008787668 (num_hops =
	1); Thu, 23 Feb 2012 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xWt3MHKRxAT9corvesTws6DyHw4fJSgpbuo08GK/bJA=;
	b=d+CsZjWWF3G9YDrEkuIBeGTG8gZ85bYUCeGw8mU0mlz1oMq9Y9NtVyG800UBmfBFpF
	DuATX10ZzMOkRHedmFFGCDIEH2IkPCtBmskQ9K+QWyRE/D6O2yt8UcucYPb8pHnpCyru
	IoxEp3RUmjgjyUSKULW7cxPFqxBAORCBc5yeE=
Received: by 10.213.7.80 with SMTP id c16mr441617ebc.7.1330008787577;
	Thu, 23 Feb 2012 06:53:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6129568eeb.8.2012.02.23.06.53.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 06:53:06 -0800 (PST)
Date: Thu, 23 Feb 2012 15:53:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120223145305.GW3769@jama.jama.net>
References: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
	<1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpLMpBNSqx0MUuzUbYCcapGrJccojjyQrYHjaN6TNqcSA@mail.gmail.com>
	<20120223125833.GS3769@jama.jama.net>
	<CAP9ODKqGbUADkfqjBDTaD2ASKhZbxAnEMmJ22MsK1w+UKKX8yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqGbUADkfqjBDTaD2ASKhZbxAnEMmJ22MsK1w+UKKX8yA@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2012 15:01:28 -0000
X-Groupsio-MsgNum: 37402
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pEAjBjStGYT6H+Py"
Content-Disposition: inline

--pEAjBjStGYT6H+Py
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 11:10:18AM -0200, Otavio Salvador wrote:
> On Thu, Feb 23, 2012 at 10:58, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> > On Thu, Feb 23, 2012 at 10:50:02AM -0200, Otavio Salvador wrote:
> >> On Thu, Feb 23, 2012 at 10:40, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >> > * maybe we should move systemd_unitdir definition outside systemd.bb=
class
> >> > =A0because it's used in few more recipes which doesn't inherit syste=
md
> >>
> >> Please split this patch and do PR bump so we get them rebuild.
> >
> > why? the output is 100% the same.
>=20
> Well; from previous experience any change can have strange results so
> I'd prefer to build them again.

splitted and with PR bumps in contrib/jansa/pull

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pEAjBjStGYT6H+Py
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GUtEACgkQN1Ujt2V2gBz4oQCfZ0ytJF4ma9NAQbLr4jGnnGOy
Y1gAn2QUOAn2/kpAN3Ua0pezgWu5wUh9
=X6/e
-----END PGP SIGNATURE-----

--pEAjBjStGYT6H+Py--
