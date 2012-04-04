Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFKig-0000V3-ND
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 09:33:30 +0200
Received: by wibhj13 with SMTP id hj13so215561wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 00:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YUMaPBzcV3PNgE3gff+q24OzzNSrjSdxJrCyYc8zYJM=;
	b=oE/tBO26aSxxcofJlnuYMkctlmUwm1+0A2CcwNHdA3Pa/Jj9z108ftzChgl/fl6V6Z
	J6Jql3/F6QrWbfp7E1s+aVo2/pwcNKoOFlSh7zSXv8za8azx6cGZJdqektTuzlFu/Soe
	zgVfd+kUAVS9AU05S2zFQtQKIUplgKyrxjAxIXAa0zRO6ZIXqu2BSrAySYyxpQQORq1x
	XYq4uB7EtKBXKkCEEgiph3m+jOYeg7WIV/ErcOTvqrKmWCDFbgomvPkL3QBuogTNdiKn
	RRa3dE8i4Hw7uzO/x4YsmXON5Su2Rlpo3OpA1FEDolB4daPhC7OqKNw2t8chmOhtDPew
	X58g==
Received: by 10.180.104.230 with SMTP id gh6mr2560393wib.22.1333524260711;
	Wed, 04 Apr 2012 00:24:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm2676011wix.8.2012.04.04.00.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 00:24:20 -0700 (PDT)
Date: Wed, 4 Apr 2012 09:24:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120404072419.GC4181@jama.jama.net>
References: <20120404091720.4b743c5b@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120404091720.4b743c5b@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 07:33:30 -0000
X-Groupsio-MsgNum: 38106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2012 at 09:17:20AM +0200, Eric B=E9nard wrote:
> Hi,
>=20
> would that make sense to support systemd as a DISTRO_FEATURES ?
> That would make builds using older udev (< 174) possible with meta-oe as
> this actually fails because of systemd.

You mean without runtime dependency on systemd or even without build
time dep?

Because tricky runtime dependency is imho only in polkit which needs to
be changed in .bbappend and then carefull selection of task-* and their
content.

I was using meta-oe without systemd runtime till last week.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk979yMACgkQN1Ujt2V2gByeyACdGrePqy4JI1V7rQBMyaZMRZai
hO8AoKl53fkVnaHNrUYBnpsaiqtVxosO
=CRYS
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
