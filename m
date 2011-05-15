Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QLdS2-0005Vl-2q
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 17:41:50 +0200
Received: by fxm19 with SMTP id 19so2886726fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=d65VBQEd2ga6aDFKMwW+i6hjxS97l9I0VO62fiK9sBQ=;
	b=q3JotRLLRImoTwxJAQDOklLT/d46I+Wj1FDkjm5vX2VuhwnYkVawCGrGqc/hMd5770
	/0nJl4XOqs5p2wxgi/oDO44TvJCieKCTOdqwjguGONkMZKlXOBe435YNWred17/wFsBW
	UQxcvQNuR6QtE2C/r2pyf8MMSnOerYShv92fI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EueWDyYK9B8OyXBIcNFBvNgprIKReIsLmb0nFNkd1YuVyerXRQ1EHqEGTL1HxFSoUO
	Ri1rvQTklFAGCGPnVK8fRuLoQly/Ol2dSB7x4dkm+yx7sBxxwN5ua9pNOK1S66imOLBW
	36Tu+QjO7oElIruUkWL9wRMvBrHpxfEyQawnM=
Received: by 10.223.57.5 with SMTP id a5mr2477781fah.90.1305473939162;
	Sun, 15 May 2011 08:38:59 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 13sm1503751fau.16.2011.05.15.08.38.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 08:38:58 -0700 (PDT)
Date: Sun, 15 May 2011 17:38:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110515153857.GF3377@jama.jama.net>
References: <1305190050.4254.14.camel@mattotaupa>
	<20110512085420.GD3423@jama.jama.net>
	<1305473512.5838.569.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1305473512.5838.569.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libshr-glib: task configure fails with `/bin/sh: gdbus-codegen: command not found`
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
X-List-Received-Date: Sun, 15 May 2011 15:41:50 -0000
X-Groupsio-MsgNum: 32057
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Content-Disposition: inline

--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 15, 2011 at 05:31:52PM +0200, Paul Menzel wrote:
> Thank you for the explanation.
>=20
> 	DISTRO=3D"shr" bitbake -k libshr-glib
>=20
> indeed worked after getting `glib-2.0_git` to build on my build host
> [1].
>=20
> I will not get to test newer GLib version with other distributions
> before July.
>=20
> One slightly off topic question. Where did you get the 2.29.3 or git
> recipe from or did you write it from scratch? I find the ordering in the
> recipe quite confusing.

Thanks for testing and fix!

The recipe is from meta-oe where I created it from older version in
oe-core.

I didn't plan to backport it to oe.dev first, but because I needed
mrmoku (Klaus Kurzmann) to help me with phoneuid/phonefsod changes I've
added it to oe.dev too because he is still using oe.dev.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3P85EACgkQN1Ujt2V2gBw0+ACfctTuBETw2L8NAU7iUuhf7D1e
qX4AoInduiwo6wtVGagPzSkauZdqCoIx
=sn8j
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--
