Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlcKD-0008Ia-MY
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 10:22:03 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so1535767eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=aRCKIrUSxnwysX0IKfzG+SymOfkNW6CHXr943mNH8uw=;
	b=CAqEOI9qIFSMJdrS9+mcFYBRmc9ld1GarOVWXHvc30BykVbfyfJHy8oZZCMFPbX0YZ
	dETnexwoE4351VqRjmaDZagWjMRo7KnaJv1Y2iWo1ZKDoVohJlVvzgu/khDLdfaJaCts
	xm8M+tRwsGtShdwi3yDAvuVJAHtLz7IueJZCn3Yx9BZb/N6UEnXUJ+OuSaXiL0O6Xo48
	0arrUalcoU3niuSAqv6m6q5wX7CGSF/iujNzm+PeBSYHhKkDBNL1KuoPS1e0c2iaFE6d
	9+SmZDOjOIMuOCK+IoKkrGo/L/hYxrB66Yi7SFk9rR8mb761nG6KDpC4qEBgWtZBGukZ
	pPxA==
X-Received: by 10.14.203.2 with SMTP id e2mr21772384eeo.20.1355994433700;
	Thu, 20 Dec 2012 01:07:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm14200333eeg.4.2012.12.20.01.07.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 01:07:12 -0800 (PST)
Date: Thu, 20 Dec 2012 10:07:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220090714.GE14543@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: recipes failing after libpng and cups upgrade
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
X-List-Received-Date: Thu, 20 Dec 2012 09:22:03 -0000
X-List-Received-Date: Thu, 20 Dec 2012 09:22:03 -0000
X-Groupsio-MsgNum: 42266
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline

--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

FYI: there are few more failing recipes in world build now:
due to libpng upgrade:
meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
meta-oe/recipes-support/fltk/fltk_1.1.10.bb
meta-oe/recipes-support/emacs/emacs_23.4.bb
meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
meta-oe/recipes-navigation/omgps/omgps_svn.bb

due to cups upgrade:
meta-oe/recipes-extended/hplip/hplip_3.12.6.bb

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDS1UIACgkQN1Ujt2V2gBxiIQCfQBdVhVh5HRL/O3LU/x1DST4X
D9EAoIpyRJ9P46jHuKYQwQ1J189OxVWr
=q7f/
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
