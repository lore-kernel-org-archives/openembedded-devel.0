Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQ1vO-0005mw-LV
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 20:10:34 +0100
Received: by faat2 with SMTP id t2so5802705faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 11:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hGuFEuSF74yHNg5QHNlT5M3ux/vNFlzT/0TpiVwWdc8=;
	b=UFuMcV+UQyt378Fa7XjPsBMrmCP780dGhxaKC8sudushbAi++ZFO6TQl7zXr+N9sVT
	xdakXBfgyoX76zEz/PvakLgMSToDzOl13OZkv5eGKbWH9y6/4vT0L/PAjlzrX1690hVc
	9O/D6HVN6icYNTxjgk8QOj/fsJtKPETc44t9k=
Received: by 10.205.133.148 with SMTP id hy20mr12977338bkc.132.1321297452960; 
	Mon, 14 Nov 2011 11:04:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z15sm34174005bkv.4.2011.11.14.11.04.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 11:04:12 -0800 (PST)
Date: Mon, 14 Nov 2011 20:04:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111114190400.GD311@jama.jama.net>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 19:10:34 -0000
X-Groupsio-MsgNum: 35387
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 12:55:37PM -0600, David Thomas wrote:
> I am getting a gcc error

What recipe is failing with this?

> cc1: error: -Werror=3Dunused-but-set-variable: No option -Wunused-but-set=
-variable

and what gcc version is used in that Angstrom version you're using?
=20
This option was added to gcc-4.6, so if you have 4.5 then it will
probably fail if recipe is forcing such option to CFLAGS.

Cheers,

> Using the Angstrom scripts I can run machine=3Dbeagleboard and complete.
> However, machine=3Dcm-t35 with a cm-t35.conf file throws this error.
>=20
> I am having to guess that the machine file is all that was required,
> it seems to pich all the right arch, etc.
>=20
> I had asked on Angstrom for any CM-T35 related info to no avail...
>=20
> --=20
> Dave Thomas
> MicroBee Systems, Inc
> 1429 Weatherly Road, Suite G
> Huntsville, AL 35803-1187
> 256-489-6671 (Voice)
> 256-426-2431 (Mobile)
> 256-489-6673 (FAX)
> www.microbee-systems.com
> "Innovative Solutions for an Embedded World"
>=20
> This message is intended for the sole use of the addressee, and may
> contain information that is privileged, confidential and exempt from
> disclosure under applicable law. If you are not the addressee you are
> hereby notified that you may not use, copy, disclose, or distribute to
> anyone the message or any information contained in the message. If you
> have received this message in error, please immediately advise the
> sender by reply email and delete this message.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7BZh8ACgkQN1Ujt2V2gBy3bACeLU/e2lx5vSV3/6RmyhNRpV5d
4NEAoJI4GHYLvCAdD3ca0yHOYvZ8apI6
=tDh6
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
