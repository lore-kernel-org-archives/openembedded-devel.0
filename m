Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id CD7096B819
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 18:28:23 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so1989704eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OvHp4lw+2w8eFQ/OPsDcaK/Iln6xhxXD5brHPa68Pss=;
	b=WocXu8wPvOvEDf5F4CQOTUPihMyDB4NVTDU/nYk55ewMYkohXFpwQtOyooxeR6lDhX
	SseNF4cTcasEMQuv6xcQ3U56h2/8sjLyKy0SSkFyATjFqatpdhW6t2LWEQUM+jl5daB3
	6dOuXeK8f03T3OU6CALLK/8QgCVjkwI0uFekOcocwkYiHJ1eIx7BW6vH7Chf/T8anY6q
	4slQZbWuUBWQYV3XsNMENusdqR7LUETy1u1sEWVJlBKVgbFo8bWrZFHq+iZ4skZyKc4M
	eGuksxsUFt7zzy9hIn0jxHuShZ2QXhnsM2zkh0+5weDin6ifMvDIxV+odcQb2lmHQt14
	ezVA==
X-Received: by 10.14.179.193 with SMTP id h41mr1272131eem.27.1395858503728;
	Wed, 26 Mar 2014 11:28:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm48751468eex.21.2014.03.26.11.28.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 11:28:22 -0700 (PDT)
Date: Wed, 26 Mar 2014 19:28:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140326182821.GG3709@jama>
References: <CAFeBWL73bvbfgZdNxHJshfLcGrQ647diP24Oy-vHjkCFX6XG+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL73bvbfgZdNxHJshfLcGrQ647diP24Oy-vHjkCFX6XG+w@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Warnings during build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 18:28:26 -0000
X-Groupsio-MsgNum: 48839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Content-Disposition: inline

--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 11:12:28AM -0700, Adam Lee wrote:
> Hope I am not spamming the list with pesky questions.
> I am getting build warnings similar to below:
>=20
> WARNING: gtk-immodule-ipa-2.24.22 was registered as shlib provider for
> im-ipa.so, changing it to gtk3-immodule-ipa-3.10.7 because it was built
> later
>=20
>=20
> The full list of warnings can be found at - http://pastebin.com/quqwCPEq.
>=20
> I am not sure what these warnings are. They are definitely new in 1.6. I =
am
> trying to figure out if there is something I can do, or if this will be
> sorted out as we get closer to the 1.6 release date.

See
http://comments.gmane.org/gmane.comp.handhelds.openembedded/62213

as long as nothing tries to link against im-ipa.so it's safe and you
should just list them in PRIVATE_LIBS.

The warning means that if something links with im-ipa.so then it's not
known if it will get runtime dependency on gtk-immodule-ipa-2.24.22 or
gtk3-immodule-ipa-3.10.7 (it will always be the one built later in the
same sysroot).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzHEUACgkQN1Ujt2V2gBy9HwCdFIMWe28uD/JtLJIMzQC+0R1Z
GKUAn3FQWezVc56jQ3IptxA1T4mbFdmv
=NXKT
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
