Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pj90s-0002GT-Up
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 12:30:43 +0100
Received: by bwz10 with SMTP id 10so4002378bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 03:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mA7ZDmJmKi6Bhca6h/UBNAzRgqX1+ekmAvYwINrMa+Q=;
	b=AIwX7KgaFdN/CFAaS/u7AlWg4CqUhyX9kr1aGNHoks0G9Wx3xDsAtMUOBLKMkU9Mjk
	VmhewJ1P583cEx/3cDWtrzSUx7Ozfw69hZ2JXQDu6yzrEM/WokwoFFzga9gCztTjykLj
	S3nhd5V7bP4OehGRSWtXHcab02SZgCegxrsYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HtVqfaj57pQJvrHzTDltknHWsVR0vm/ELJUerZ/WKCu9kiCi1ZMW8DUJBIPf+kNQLu
	IxhTPQyyA8jFtWqUCUfjKdjmhmL04douFD1yOETlEzcQpTHfFrIhiiSkIiZg9chBohEt
	uNloMpZ8/OaDxg09pumphImJerLLzzjA/LM80=
Received: by 10.204.79.135 with SMTP id p7mr3436754bkk.109.1296300582156;
	Sat, 29 Jan 2011 03:29:42 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u23sm6619731bkw.9.2011.01.29.03.29.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Jan 2011 03:29:41 -0800 (PST)
Date: Sat, 29 Jan 2011 12:29:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110129112942.GB3265@jama>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Sat, 29 Jan 2011 11:30:43 -0000
X-Groupsio-MsgNum: 28605
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2011 at 11:52:28AM -0700, Tom Rini wrote:
> Hey all,
>=20
> As I've talked about before[1] there's build reproducibility issues
> depending on when perl-native is built.  After talking with Mark Hatle
> a little bit I started thinking about relocation in perl again and it
> turns out that starting in 5.10, upstream perl supports relocation.
>=20
> This in turn makes it less painful to make perl-native be what we use
> when we want perl runtime, nearly everywhere (since you can use pstaging
> to avoid it the time next time).
>=20
> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
> switches to relocatable perl-native, and then the big switch to using it
> early.

Looks good and as we're using 5.10 already then for whole series:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Can we also get rid of legacy staging from recipes/perl/perl_5.10.1.bb ?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1D+iYACgkQN1Ujt2V2gBxiBQCfSvIwIe+iMv1jcsC3Aezlo44C
5fsAoJ+eGlxFLAkzNcF5Rn+OoTUhE5hq
=IxhV
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
