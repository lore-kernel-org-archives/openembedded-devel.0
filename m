Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id B4045706D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:14:22 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so7729059wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 02:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q7hPiEhvrypc6xnQna4Fi/PwbLqyzXyYBSGORFf3ZAw=;
	b=h+wd3CuiXYezUwqVRSDfG93qdB9bTPHvDZimtAaj6hTb5KrmV3QsCg2+ich6GlfdHY
	PsvqQ/sdZxe54hFt/iiTVOZI1rhVH8n+muClR6lwX5tHbdZ3ffHsSqG7TP7ZP/O/J3Hj
	gvGlJ9qGTY04h5eEso2yD9f0YwpBmPLhRTihA1W/Y9AF0uJV95FI8Xn99F247f5LnOK6
	gLid79KifN6Js884MnFUXBYZoTNYZigPArNcO2Ka06Um8jSYZyho4gi1ARebSVoFs2ZT
	JAQeFCMg2yJODUyZL0aGliMvdju1UU68LZX0jIwU+ELj/FtuHL/ra7ExGzYWuLmBjVsP
	oieA==
X-Received: by 10.180.91.36 with SMTP id cb4mr45711613wib.30.1420625660903;
	Wed, 07 Jan 2015 02:14:20 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jp3sm17259610wid.9.2015.01.07.02.14.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 02:14:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 11:14:23 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150107101423.GH29986@jama>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
	<20150105115922.GF2484@jama>
MIME-Version: 1.0
In-Reply-To: <20150105115922.GF2484@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe/meta-webserver][PATCH v2 00/11] Merge modphp into php and upgrade
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
X-List-Received-Date: Wed, 07 Jan 2015 10:14:33 -0000
X-Groupsio-MsgNum: 53721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6cMF9JLEeZkfJjkP"
Content-Disposition: inline

--6cMF9JLEeZkfJjkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 12:59:22PM +0100, Martin Jansa wrote:
> Thanks for v2
>=20
> Please remember to update your old series as superseded when pushing=20
> newer version, it would help me a lot when sorting the pending patches.

Something is wrong:

php-5.5.20: php requires
/tmp/work/core2-64-oe-linux/php/5.5.20-r0/image/usr/bin/php, but no
providers in its RDEPENDS [file-rdeps]

>=20
> On Mon, Jan 05, 2015 at 10:33:13AM +0000, Paul Eggleton wrote:
> > Finally resolve the overlap between the modphp and php recipes by
> > merging the former into the latter. Along the way I fixed a few minor
> > issues and upgraded related recipes.
> >=20
> > I've taken a stepped approach to doing the php merge / upgrade so it's
> > easier to see what's going on and easier for me to test - first upgrade
> > php to the same version as modphp, then do the integration, then upgrade
> > to the latest 5.5 release. I would appreciate someone testing PHP in CGI
> > mode however since I don't have a convenient test setup for that (as I
> > do for mod_php).
> >=20
> > Changes since v1:
> > * Default mod_php building to disabled since we don't have apache2 in=
=20
> >   meta-oe where the php recipe is and meta-oe can't depend on=20
> >   meta-webserver
> > * Drop commented out line in uw-imap pam change
> > * Update meta-webserver README as appropriate
> >=20
> >=20
> > The following changes since commit 2ea3a19a478c526baa04d6b9a9e8c9f42aae=
9d34:
> >=20
> >   ctapi-common: Add new recipe (2014-12-31 16:38:22 +0100)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.openembedded.org/meta-openembedded-contrib paule/php
> >   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?=
h=3Dpaule/php
> >=20
> > Paul Eggleton (12):
> >   php: upgrade to 5.5.15
> >   libc-client: rename to uw-imap, upgrade to 2007f
> >   php: integrate modphp
> >   php: upgrade to 5.5.20
> >   modphp: remove
> >   README: update for modphp merging into php
> >   uw-imap: make libpam dependency dependent on DISTRO_FEATURES
> >   php: add PACKAGECONFIG to fix implicit dependency on libpam
> >   php: add PACKAGECONFIG for imap
> >   xdebug: fix DEPENDS and un-blacklist
> >   xdebug: update to 2.2.6
> >   phpmyadmin: update to 4.3.4
> >=20
> >  .../recipes-devtools/php/php}/70_mod_php5.conf     |   0
> >  .../recipes-devtools/php/php}/configure.patch      |   0
> >  .../php/php}/pthread-check-threads-m4.patch        |   0
> >  meta-oe/recipes-devtools/php/php_5.4.33.bb         | 150 -----------
> >  meta-oe/recipes-devtools/php/php_5.5.20.bb         | 234 +++++++++++++=
++++
> >  .../uw-imap/uw-imap/imap-2007e-shared.patch        |  82 ++++++
> >  .../uw-imap/imap-2007f-format-security.patch       |  20 ++
> >  .../files =3D> uw-imap/uw-imap}/quote_cctype.patch   |   0
> >  .../uw-imap_2007f.bb}                              |  23 +-
> >  meta-webserver/README                              |  16 +-
> >  .../0001-using-pkgconfig-to-check-libxml.patch     |  74 ------
> >  .../modphp/files/php-CVE-2014-3587.patch           |  31 ---
> >  .../modphp/files/php-CVE-2014-3597.patch           | 282 -------------=
--------
> >  .../modphp/files/php-CVE-2014-5120.patch           |  35 ---
> >  meta-webserver/recipes-php/modphp/modphp5.inc      | 112 --------
> >  meta-webserver/recipes-php/modphp/modphp_5.5.15.bb |   7 -
> >  .../0001-Bug-4544-additional-fix-for-4.2.x.patch   |  29 ---
> >  ...ug-4504-security-Self-XSS-in-query-charts.patch |  29 ---
> >  ...4505-security-XSS-in-view-operations-page.patch |  43 ----
> >  .../{phpmyadmin_4.2.7.bb =3D> phpmyadmin_4.3.4.bb}   |   7 +-
> >  .../xdebug/{xdebug_2.2.5.bb =3D> xdebug_2.2.6.bb}    |   8 +-
> >  21 files changed, 372 insertions(+), 810 deletions(-)
> >  rename {meta-webserver/recipes-php/modphp/files =3D> meta-oe/recipes-d=
evtools/php/php}/70_mod_php5.conf (100%)
> >  rename {meta-webserver/recipes-php/modphp/files =3D> meta-oe/recipes-d=
evtools/php/php}/configure.patch (100%)
> >  rename {meta-webserver/recipes-php/modphp/files =3D> meta-oe/recipes-d=
evtools/php/php}/pthread-check-threads-m4.patch (100%)
> >  delete mode 100644 meta-oe/recipes-devtools/php/php_5.4.33.bb
> >  create mode 100644 meta-oe/recipes-devtools/php/php_5.5.20.bb
> >  create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007e=
-shared.patch
> >  create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/imap-2007f=
-format-security.patch
> >  rename meta-oe/recipes-devtools/{libc-client/files =3D> uw-imap/uw-ima=
p}/quote_cctype.patch (100%)
> >  rename meta-oe/recipes-devtools/{libc-client/libc-client_2007e.bb =3D>=
 uw-imap/uw-imap_2007f.bb} (55%)
> >  delete mode 100644 meta-webserver/recipes-php/modphp/files/0001-using-=
pkgconfig-to-check-libxml.patch
> >  delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-201=
4-3587.patch
> >  delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-201=
4-3597.patch
> >  delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-201=
4-5120.patch
> >  delete mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
> >  delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
> >  delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/00=
01-Bug-4544-additional-fix-for-4.2.x.patch
> >  delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/00=
01-bug-4504-security-Self-XSS-in-query-charts.patch
> >  delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/00=
01-bug-4505-security-XSS-in-view-operations-page.patch
> >  rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.2.7.bb =3D>=
 phpmyadmin_4.3.4.bb} (75%)
> >  rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.5.bb =3D> xdebug_=
2.2.6.bb} (79%)
> >=20
> > --=20
> > 1.9.3
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6cMF9JLEeZkfJjkP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStBv8ACgkQN1Ujt2V2gByyPACfWM4KL/yuF4dCHyQ1dBp5BG12
QnMAnju5BK2qI0j8q17EXIzcQon1Eygp
=2W6W
-----END PGP SIGNATURE-----

--6cMF9JLEeZkfJjkP--
