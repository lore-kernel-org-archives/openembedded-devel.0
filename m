Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6mp6-0005K4-La
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 19:49:23 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so2260657eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2013 10:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ki1NyCdA78/X/k0VbvSFsEd/U19RAJXcX06HEdYYbrA=;
	b=LW1fXcyrXtjWy/5JuHYeKkNwHxF1j5kKRqMTuhvVW1nwVDTy5aVnZq7pmUw3U0wlTM
	3doiPkTG0m6WcgzKXBCj0sALcAkriyS7wSuiNoRlEnB5BAR0iQlXPrkrRA+T321h1mgK
	6UHQcXj83ROZuxEejf4EAUB2ETS3kzHMffabd+VIWj71yYaAGJFdg45icyAii8aQimCm
	k9BptGZm2oA90e/0NXMc1O/mOQbTqub+5cArJs36FGoCj0u0tHOK8hn+7+XhAVrAWbnP
	1cftLTXDtkf6Qs2RVOuh0iekpvQj44xaPY4uvdpkedBjO2h14bXIJDXibRl8QP5Uvpw4
	6LpQ==
X-Received: by 10.14.5.6 with SMTP id 6mr23019066eek.42.1361039595120;
	Sat, 16 Feb 2013 10:33:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q5sm89708590eeo.17.2013.02.16.10.33.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 10:33:14 -0800 (PST)
Date: Sat, 16 Feb 2013 19:33:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216183322.GY3300@jama>
References: <1360622110-15419-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1360622110-15419-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 0/3] replace meta-oe's update-fonts.bbclass by oe-core's fontcache.bbclass
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
X-List-Received-Date: Sat, 16 Feb 2013 18:49:24 -0000
X-Groupsio-MsgNum: 43202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lYVfafuUkPqz/tKz"
Content-Disposition: inline

--lYVfafuUkPqz/tKz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 11:35:07PM +0100, Andreas M=FCller wrote:
> The following changes since commit 61911b23099c2658186179504ded318c987b52=
76:
>=20
>   ttf: introduce update-fonts bbclass and change all ttf recipes to use i=
t (2013-02-06 15:16:01 +0100)
>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git font-ca=
che
>=20
> Andreas M=FCller (3):
>       ttf-fonts: inherit oe-core's fontcache.bbclass instead of update-fo=
nts
>       update-fonts.bbclass: remove - we now use oe-core's fontcache.bbcla=
ss     Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>       font-update-common: remove

darn, I should have noticed that fontcache has the same functionality
before introducing update-fonts. Thanks for cleanup, applied.

>=20
>  meta-oe/classes/update-fonts.bbclass               |   40 --------------=
------
>  .../font-update-common/update-fonts                |    4 --
>  .../font-update-common/font-update-common_0.1.bb   |   18 ---------
>  .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    4 +-
>  .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    4 +-
>  .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    4 +-
>  .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    4 +-
>  .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    4 +-
>  .../ttf-fonts/ttf-liberation_0.2.bb                |    4 +-
>  .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    7 +--
>  .../ttf-fonts/ttf-sazanami_20040629.bb             |    4 +-
>  .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |    4 +-
>  .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    4 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    2 +-
>  14 files changed, 21 insertions(+), 86 deletions(-)
>  delete mode 100644 meta-oe/classes/update-fonts.bbclass
>  delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-upda=
te-common/update-fonts
>  delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-upda=
te-common_0.1.bb
>=20
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lYVfafuUkPqz/tKz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEf0PIACgkQN1Ujt2V2gBzqfACgsHG2fuCXv4WTniXEPbcoDAqX
jbwAoKFM5eGFGS0K4MA5YKdog3KarBU/
=lD3H
-----END PGP SIGNATURE-----

--lYVfafuUkPqz/tKz--
