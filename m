Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US6mL-0000Pa-90
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 16:22:57 +0200
Received: by mail-da0-f51.google.com with SMTP id g27so265526dan.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jc5G1c6F9XJhN6K2+MmiCcA+4DxFUVVxG89TyjbGq+Q=;
	b=v816hXLc4m1REkk2ETEkKGprXZI3YvtA5mjUj4ishqvThhnlPYAXWXjow8ZHUGEf4G
	pB+YNR/CnHCfnRcq5Yk58YLEvn7Iy3rbZurpowGKza+g0a9xBDg/Px8URNKLIJI2IXyd
	88wRXjG9F+uQSyXlgbhI4lx69AOvKz4BbPipRWY69bS8BSzgnpHv5cwlE3TQ/okuO1fR
	OnWD6kcI9meuLCs3RV63cVABZe7DDMUlsq7UJjPPjfsMx6ZhBx87mqaA9n/vzHf0vY2o
	pRsxi1JcmbqeXgrAVf5jAt4zHIzkWENGySCzsenKxFYydCC1PNqDnf3J0yqavphd2gBG
	67Yw==
X-Received: by 10.68.185.162 with SMTP id fd2mr3304377pbc.176.1366121104045;
	Tue, 16 Apr 2013 07:05:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wz9sm2236858pbc.5.2013.04.16.07.05.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 07:05:02 -0700 (PDT)
Date: Tue, 16 Apr 2013 16:05:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416140501.GO10628@jama.dyndns-home.com>
References: <cover.1366119759.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1366119759.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome][PATCH 0/2] Remove some recipes that are in OE-Core (cover letter only)
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
X-List-Received-Date: Tue, 16 Apr 2013 14:23:08 -0000
X-Groupsio-MsgNum: 44249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vy1A5eXR7jld12ZH"
Content-Disposition: inline

--Vy1A5eXR7jld12ZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 02:46:48PM +0100, Paul Eggleton wrote:
> In case you're wondering why I've only sent the cover letter for just two
> patches, I tried sending them as normal and what I got was:
>=20
> fatal: pull-29844/0001-hicolor-icon-theme-remove.patch: 29: patch contain=
s a line longer than 998 characters
> warning: no patches were sent
>=20
> They are just deletes though so they don't contain much in the way of
> substance.

libical is fine and I'll merge it shortly, but hicolor-icon-theme needs
PR bump in oe-core first (and in oe-core/dylan if you want it merged in
meta-oe before branching dylan).


--- meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
2013-04-15 16:56:22.777983546 +0200
+++ ../openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon=
-theme_0.12.bb
2013-04-11 17:22:28.077085198 +0200
@@ -8,7 +8,9 @@
 SECTION =3D "unknown"
 inherit gnome allarch
=20
-PR =3D "r1"
+DEPENDS =3D ""
+
+PR =3D "r0"


>=20
>=20
> The following changes since commit a45830a39bb47a9eab27980d52966226c9504e=
a4:
>=20
>   recipes: Unify indentation (2013-04-15 16:23:17 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/meta-gnome
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/meta-gnome
>=20
> Paul Eggleton (2):
>   hicolor-icon-theme: remove
>   libical: remove
>=20
>  .../hicolor-icon-theme/files/index.theme           | 1731 --------------=
------
>  .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |   23 -
>  .../libical/files/pthread-fix.patch                |   52 -
>  meta-gnome/recipes-support/libical/libical_0.48.bb |   17 -
>  4 files changed, 1823 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/hicolor-icon-theme/files/ind=
ex.theme
>  delete mode 100644 meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-i=
con-theme_0.12.bb
>  delete mode 100644 meta-gnome/recipes-support/libical/files/pthread-fix.=
patch
>  delete mode 100644 meta-gnome/recipes-support/libical/libical_0.48.bb
>=20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Vy1A5eXR7jld12ZH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtWo0ACgkQN1Ujt2V2gBzmwgCgmn6dLogEzB2kepe6vgrPDH1y
Cq8An17jo01qcUfDy/x20i6JU0qKUMvP
=l03i
-----END PGP SIGNATURE-----

--Vy1A5eXR7jld12ZH--
