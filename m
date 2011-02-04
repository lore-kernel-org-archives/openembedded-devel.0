Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PlOB3-0001Gg-N0
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 17:06:29 +0100
Received: by bwz10 with SMTP id 10so2671222bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 08:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dceL8PZvbFIUz23Qdco8KndVFUtc02w9VkP3qCTifGQ=;
	b=mSz2Ik/2TkECJBEI8AsXO0OQdtjcARfyz6le5Z70nFlMf5DjPXvnV8K6U6cpu0cWWM
	anfZavP8lKFuRpXQaBjAAgrfSCzFPqSx83FHCWs1MX3Ko47tIiOqXZppWyM8pNanDGXd
	9r061640+TUbE3+P14U0H7Rdhls6eBLH3XUvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ef+rdeg+JUwXBU7dgTUxQYOq6btbxrZYUd/Nfz/5AP09uUfRVKFnv5uzEJ5+tbYs5H
	13Dzno3BBv+VcYPTqgcJ6CB/LTx1qXQA6zOrGhtVcPw/elN9j70hvdjdjewQfcr8YOAX
	4wqGAcmP9QuCKW2egQv0Uj4r7R9pMFrtfAEZQ=
Received: by 10.204.15.83 with SMTP id j19mr11414077bka.105.1296835532013;
	Fri, 04 Feb 2011 08:05:32 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u23sm515177bkw.9.2011.02.04.08.05.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Feb 2011 08:05:31 -0800 (PST)
Date: Fri, 4 Feb 2011 17:05:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110204160548.GI3265@jama>
References: <E1PlNJv-0005sP-PU@melo.openembedded.org>
	<4D4C1B8C.9080709@mentor.com>
	<AANLkTim=14HWLtuNDr5vqZSbt=o=MzF5QqVYGUOb_sKy@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim=14HWLtuNDr5vqZSbt=o=MzF5QqVYGUOb_sKy@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Martin Jansa : gnu-config: update also bindir change to replace /usr/bin/ env instead of /usr/bin/perl
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
X-List-Received-Date: Fri, 04 Feb 2011 16:06:29 -0000
X-Groupsio-MsgNum: 28831
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Content-Disposition: inline

--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2011 at 03:57:37PM +0000, Otavio Salvador wrote:
> On Fri, Feb 4, 2011 at 15:30, Tom Rini <tom_rini@mentor.com> wrote:
> > On 02/04/2011 08:11 AM, git version control wrote:
> ...
> >> gnu-config: update also bindir change to replace /usr/bin/env instead =
of
> >> /usr/bin/perl
> ...
> > This is wrong. =A0/usr/bin/env is one of those mandated things everyone=
 has.
> > =A0And ${bindir} can be too long :) =A0Based on the previous commit, th=
is
> > test/regex should be able to go away.
>=20
> This is right since micro can build without /usr et all.

yes and ${bindir} is not that long :), only /usr/bin or like Otavio said
/bin ie for micro. That's why I fixed regexp instead of removing it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1MI9wACgkQN1Ujt2V2gBy/0wCgmIZhamZnkR8+o4Zkx3ZPTnZz
yLMAn1cjR4vH4pq4DBliXSabIrlwNdnS
=tvtz
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--
