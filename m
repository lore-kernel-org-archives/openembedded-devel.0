Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA67728CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 09:38:05 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w62so6938681wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jan 2015 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r+s4nNeSILCpMpwbtFaHfIjwEYpV0g1RLkLbJWjP6UM=;
	b=KqMwm/3WT6/I20lM/zgfdxkZ8zwQhXLF0y31o8xcwxG1MxKKYRoq3z0hufpJfN+mUQ
	cb0xxatRyIHzaJI+YoHmlvlL868mebfIN9Yu8RlbBKLyx3vfO4Gj1Gk7Pv3BG0cEnW2v
	coqSHtPQwnA48OpymipOVXoQQwemx1U6cAeoRc0ym7YqRCkh6zetG/GrbeWc1ZwFnK2p
	lp/unhMpMUeEMn1hI3z3P1uU+A9NJu35ULWZDZPQE95d8KYXCZwxH+X6BfWecndXPdCW
	S6h9qSdktkgfW2UaTayhzyKDsuAJmIT7yRIRNMA20BxJPay3OrVrWNuGDvBJ/4qsP5+j
	Lrsg==
X-Received: by 10.180.77.114 with SMTP id r18mr3315785wiw.8.1420796285740;
	Fri, 09 Jan 2015 01:38:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kn7sm9277546wjc.45.2015.01.09.01.38.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 01:38:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Jan 2015 10:38:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150109093810.GB3137@jama>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe/meta-webserver][PATCH v4 00/13] Merge modphp into php and upgrade
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
X-List-Received-Date: Fri, 09 Jan 2015 09:38:10 -0000
X-Groupsio-MsgNum: 53782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 02:50:15PM +0000, Paul Eggleton wrote:
> Finally resolve the overlap between the modphp and php recipes by
> merging the former into the latter. Along the way I fixed a few minor
> issues and upgraded related recipes.
>=20
> I've taken a stepped approach to doing the php merge / upgrade so it's
> easier to see what's going on and easier for me to test - first upgrade
> php to the same version as modphp, then do the integration, then upgrade
> to the latest 5.5 release. I would appreciate someone testing PHP in CGI
> mode however since I don't have a convenient test setup for that (as I
> do for mod_php).
>=20
> Changes since v2/3:
> * Fix phar script installation and packaging, which also resolves a QA
>   warning

There is one more issue:

sstate-sysroot-crutf.sh script was whitelisting this entries:
[^/]*/usr/lib/php/\.channels.*
[^/]*/usr/lib/php/\.registry.*
[^/]*/usr/lib/php/\.depdb.*
[^/]*/usr/lib/php/\.filemap
[^/]*/usr/lib/php/\.lock

No it's in php5 directory so it's easy to change the whitelist, can you
please confirm that it's safe to ignore these files (that nobody will
miss them if they aren't there after sstate reuse) or check if we can
prevent creating them in first place?

And is "/usr/lib/php5/php" expected, shouldn't it be just
"/usr/lib/php5"?

ERROR: Following files are installed in sysroot, but not tracked by
sstate:
x86_64-linux/usr/lib/php5/php/.channels
x86_64-linux/usr/lib/php5/php/.channels/.alias
x86_64-linux/usr/lib/php5/php/.channels/.alias/pear.txt
x86_64-linux/usr/lib/php5/php/.channels/.alias/pecl.txt
x86_64-linux/usr/lib/php5/php/.channels/.alias/phpdocs.txt
x86_64-linux/usr/lib/php5/php/.channels/__uri.reg
x86_64-linux/usr/lib/php5/php/.channels/doc.php.net.reg
x86_64-linux/usr/lib/php5/php/.channels/pear.php.net.reg
x86_64-linux/usr/lib/php5/php/.channels/pecl.php.net.reg
x86_64-linux/usr/lib/php5/php/.depdb
x86_64-linux/usr/lib/php5/php/.depdblock
x86_64-linux/usr/lib/php5/php/.filemap
x86_64-linux/usr/lib/php5/php/.lock
x86_64-linux/usr/lib/php5/php/.registry
x86_64-linux/usr/lib/php5/php/.registry/.channel.__uri
x86_64-linux/usr/lib/php5/php/.registry/.channel.doc.php.net
x86_64-linux/usr/lib/php5/php/.registry/.channel.pecl.php.net

> The following changes since commit 5b4413ccf329a981bee976c9fcde5d2872f0de=
fb:
>=20
>   dnrd: fix SRC_URI (2015-01-05 11:25:51 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/php
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/php
>=20
> Paul Eggleton (13):
>   php: upgrade to 5.5.15
>   libc-client: rename to uw-imap, upgrade to 2007f
>   php: integrate modphp
>   php: upgrade to 5.5.20
>   php: fix phar script packaging
>   modphp: remove
>   README: update for modphp merging into php
>   uw-imap: make libpam dependency dependent on DISTRO_FEATURES
>   php: add PACKAGECONFIG to fix implicit dependency on libpam
>   php: add PACKAGECONFIG for imap
>   xdebug: fix DEPENDS and un-blacklist
>   xdebug: update to 2.2.6
>   phpmyadmin: update to 4.3.4
>=20
>  .../recipes-devtools/php/php}/70_mod_php5.conf     |   0
>  .../recipes-devtools/php/php}/configure.patch      |   0
>  .../recipes-devtools/php/php/phar-makefile.patch   |  29 ++-
>  .../php/php}/pthread-check-threads-m4.patch        |   0
>  meta-oe/recipes-devtools/php/php_5.4.33.bb         | 150 -----------
>  meta-oe/recipes-devtools/php/php_5.5.20.bb         | 236 +++++++++++++++=
++
>  .../uw-imap/uw-imap/imap-2007e-shared.patch        |  82 ++++++
>  .../uw-imap/imap-2007f-format-security.patch       |  20 ++
>  .../files =3D> uw-imap/uw-imap}/quote_cctype.patch   |   0
>  .../uw-imap_2007f.bb}                              |  23 +-
>  meta-webserver/README                              |  16 +-
>  .../0001-using-pkgconfig-to-check-libxml.patch     |  74 ------
>  .../modphp/files/php-CVE-2014-3587.patch           |  31 ---
>  .../modphp/files/php-CVE-2014-3597.patch           | 282 ---------------=
------
>  .../modphp/files/php-CVE-2014-5120.patch           |  35 ---
>  meta-webserver/recipes-php/modphp/modphp5.inc      | 112 --------
>  meta-webserver/recipes-php/modphp/modphp_5.5.15.bb |   7 -
>  .../0001-Bug-4544-additional-fix-for-4.2.x.patch   |  29 ---
>  ...ug-4504-security-Self-XSS-in-query-charts.patch |  29 ---
>  ...4505-security-XSS-in-view-operations-page.patch |  43 ----
>  .../{phpmyadmin_4.2.7.bb =3D> phpmyadmin_4.3.4.bb}   |   7 +-
>  .../xdebug/{xdebug_2.2.5.bb =3D> xdebug_2.2.6.bb}    |   8 +-
>  22 files changed, 394 insertions(+), 819 deletions(-)
>  rename {meta-webserver/recipes-php/modphp/files =3D> meta-oe/recipes-dev=
tools/php/php}/70_mod_php5.conf (100%)
>  rename {meta-webserver/recipes-php/modphp/files =3D> meta-oe/recipes-dev=
tools/php/php}/configure.patch (100%)
>  rename {meta-webserver/recipes-php/modphp/files =3D> meta-oe/recipes-dev=
tools/php/php}/pthread-check-threads-m4.patch (100%)
>  delete mode 100644 meta-oe/recipes-devtools/php/php_5.4.33.bb
>  create mode 100644 meta-oe/recipes-devtools/php/php_5.5.20.bb
>  create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e-s=
hared.patch
>  create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f-f=
ormat-security.patch
>  rename meta-oe/recipes-devtools/{libc-client/files =3D> uw-imap/uw-imap}=
/quote_cctype.patch (100%)
>  rename meta-oe/recipes-devtools/{libc-client/libc-client_2007e.bb =3D> u=
w-imap/uw-imap_2007f.bb} (55%)
>  delete mode 100644 meta-webserver/recipes-php/modphp/files/0001-using-pk=
gconfig-to-check-libxml.patch
>  delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-=
3587.patch
>  delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-=
3597.patch
>  delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-=
5120.patch
>  delete mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
>  delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
>  delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001=
-Bug-4544-additional-fix-for-4.2.x.patch
>  delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001=
-bug-4504-security-Self-XSS-in-query-charts.patch
>  delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001=
-bug-4505-security-XSS-in-view-operations-page.patch
>  rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.2.7.bb =3D> p=
hpmyadmin_4.3.4.bb} (75%)
>  rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.5.bb =3D> xdebug_2.=
2.6.bb} (79%)
>=20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSvoYIACgkQN1Ujt2V2gBxN9wCfSKzKFxzSXLnwmAzDFhTSPgs4
3sYAn3ZcZ3jFMqPKImfu2IRjLfZazaw0
=Wxxe
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
