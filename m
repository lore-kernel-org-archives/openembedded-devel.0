Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWoas-0007q7-OH
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 15:58:19 +0200
Received: by mail-wi0-f176.google.com with SMTP id hi8so508203wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hIM+tD3xtdQk/mHYXYMzbQypQ0u+BVob/9fsuHV1Y9w=;
	b=wzeuAhPmQ0q+eLcESPPzLcIeOKA7I/2kPk93JkTtV1SYqYtdbdKOLIoUHwIT31XRli
	IR5MUg5tKETOZWW0I6q5q2keHZKJTEP33MkCyUud6qRGXke4+2S372kSgMMu42GZLwdP
	RPvd47pO6iLg55EufZ2BkpW8rN+29l6hBD9ZfSj7L1rXCisxEqm6N8g5doDg22wFBG2G
	1W4CzIhGP84DvrJl5xebWBweCOjh8mO16AGrw3t9DZ2QgP5R5Ybv1UqApUTGilXoe6C8
	iapRVRxfucibpATm4jZK9OW6rxYVNhk1j5GVARliSkEt4NUZk+8XlDCpeheMnIr9xgtP
	D+oQ==
X-Received: by 10.194.71.103 with SMTP id t7mr10601147wju.38.1367242825721;
	Mon, 29 Apr 2013 06:40:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e8sm14657216wic.5.2013.04.29.06.40.24 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 06:40:24 -0700 (PDT)
Date: Mon, 29 Apr 2013 15:40:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130429134047.GI3199@jama>
References: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-oe][PATCH 0/3] php: further clean-ups
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
X-List-Received-Date: Mon, 29 Apr 2013 13:58:22 -0000
X-Groupsio-MsgNum: 44494
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline

--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 02:23:39PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Few more PHP clean-up patches, some testing on more esoteric hardware wou=
ld
> be nice, but I don't forsee any problems (famous last words...).

Thanks for cleanup patches, are you also using modphp? In last jenkins
builds I've noticed that php and modphp recipes are trying to install
conflicting files in sysroot (and only first one successfully) can you
check if they can be altered to install them correctly or even better,
there was some thread about building cgi and fpm together, what about
building all 4 +cli +modphp in one recipe with few PACKAGECONFIGs?

Cheers,

>=20
> Jack Mitchell (3):
>   php: remove obsolete CFLAGS
>   php: remove unnecessary LIBS export
>   php: remove unneeded THREADS export
>=20
>  meta-oe/recipes-devtools/php/php.inc | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> --=20
> 1.8.2.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF+eF8ACgkQN1Ujt2V2gBymAgCgrMjhYTrLuZvqpVE+S+VJYbz/
uvkAnjqLR+/6r1Nw6AC5hottFTpc9DXD
=P5IL
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--
