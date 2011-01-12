Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcz8R-0007qU-22
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 12:45:03 +0100
Received: by fxm17 with SMTP id 17so433876fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 03:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fy/fzuku4CNcELNCdvLPt5OEjpEoURP7ZiSpOqxPOu8=;
	b=D2du7LZ4Qx+vbOHbPUgAAjYfnoLcUHKBse/pXHQ82FmNbZCk3OI89GiAWk/K46m0Qt
	c+GtBHrQnEmCKAIdXw1LdX9JjhEPl1yqPg4cv9a0KA3vXl5y/TOW8StGDMskjTSFsQTx
	7FMJ/zbKd1gpyfHlt8fLy5ra81qCAeq/EgI9E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DX+jCMrNedtyMKggWYQYO9Z1oL4nXxgaIgB3I1Z7bhEjMNEYt3yez8LH4dnIKfTPza
	woX8nyku5oGI4ujVdQjBhiCoBZFK3V6RToxZTLKK8tMDqOqXDNiWRnxHSchcDQDqwi+L
	2c/mScAD+vdGBozLngFy7RnGK9uWvGjGcee98=
Received: by 10.223.86.130 with SMTP id s2mr871832fal.66.1294832671205;
	Wed, 12 Jan 2011 03:44:31 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm158576faa.29.2011.01.12.03.44.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 03:44:29 -0800 (PST)
Date: Wed, 12 Jan 2011 12:44:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110112114442.GI3244@jama>
References: <1294823863-13419-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1294823863-13419-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH v2] eglibc: Configure based on DISTRO_FEATURES_EGLIBC
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
X-List-Received-Date: Wed, 12 Jan 2011 11:45:03 -0000
X-Groupsio-MsgNum: 27958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BghK6+krpKHjj+jk"
Content-Disposition: inline

--BghK6+krpKHjj+jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2011 at 01:17:43AM -0800, Khem Raj wrote:
> * Let distros decide what features to enable if not
>   selected it will turn off all possible knobs
>=20
> * Enable all knobs for angstrom and distros based on
>   sane-toolchain
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: koen@dominion.thruhere.net
> CC: koansoftware@gmail.com

Looks fine, builds fine, target is still usable :)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--BghK6+krpKHjj+jk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk0tlCoACgkQN1Ujt2V2gBzo2wCdEDT9xSRJIJ5+u60Z7dCk1gM2
edUAn3K4tuRh+ATIisIJsRTUKhUucJox
=Up8p
-----END PGP SIGNATURE-----

--BghK6+krpKHjj+jk--
