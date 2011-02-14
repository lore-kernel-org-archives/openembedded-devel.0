Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Povav-0000zG-0X
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 11:23:49 +0100
Received: by bwz10 with SMTP id 10so5045918bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 02:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=lxar1CQmizrT2eacnw7fQPu7m0PN7kHIXTqA0zDmeDY=;
	b=lQHMpHxyPT2DjtSrXzwtl729GoirdHX2C+9Tz55ZNE09m0FfYivbosy90/WGOeebCb
	K0JUHBGdmdq50qUdwVmUsqa+hXy46ispwcrZY4+iryFm6EsUJFU7YcV0GUcjF3KvLG7J
	DciX1HUls/avFsJGPKOviMqs3FcocYhadalYo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=pouPTulolvpTM+AUtvZ8wenQfmyHfXe9wMJDjyPZ5FS2ojPV83dNvN7oVxJn3jIqmq
	bwE7YBbsIYkpDvshp8IM7BCz29iZVkULMzFsThZM+myLaV/gd2sUGpPbOdARO7qVjSzy
	5NWoXwdHOxNBXKcsa6BOX1x1cDlD4jjBVJRg8=
Received: by 10.204.72.207 with SMTP id n15mr3246080bkj.62.1297678960153;
	Mon, 14 Feb 2011 02:22:40 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm1668032bka.0.2011.02.14.02.22.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 02:22:39 -0800 (PST)
Date: Mon, 14 Feb 2011 11:22:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110214102232.GB8619@localhost.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: debian.bbclass issues when some package is substring of another
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
X-List-Received-Date: Mon, 14 Feb 2011 10:23:49 -0000
X-Groupsio-MsgNum: 29155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline

--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

After last rebuild from scratch I got
Package libncursesw (5.7+20110115-r16.6)
instead of expected
Package libncursesw5 (5.7+20110115-r16.6)
which I had before (and which is _still_ in depends of packages needing
it - like ie screen)

I started to debug debian.bbclass to see why
libncursesw is no longer renamed to libncursesw5 and found that it's
because also libncurses exists and it's replaced in both and then
replacement for libncursesw doesn't match anymore. Same issue with
libtic/libticw.

Problem is that when checking libtic:
=2E/log:DEBUG: LIBNAMES: pkg ncurses-libtic socrunc ('libtic5', 'libtic')
=2E/log:DEBUG: LIBNAMES: pkgname libtic5 devname libtic

=2E/log:DEBUG: LIBNAMES: pkg ncurses-libtic =3D=3D orig_pkg ncurses-libtic
=2E/log:DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libtic =
orig_pkg ncurses-libtic debian_pn None newpkg libtic5
=2E/log:DEBUG: setVar PKG_ncurses-libtic, libtic5
but also
=2E/log:DEBUG: LIBNAMES: else pkg ncurses-libticw.replace(ncurses-libtic,li=
btic)
=2E/log:DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libticw=
 orig_pkg ncurses-libtic debian_pn None newpkg libticw
=2E/log:DEBUG: setVar PKG_ncurses-libticw, libticw

so later when checking libticw
=2E/log:DEBUG: LIBNAMES: pkg ncurses-libticw socrunc ('libticw5','libticw')
=2E/log:DEBUG: LIBNAMES: pkgname libticw5 devname libticw
it won't find ncurses-libticw to replace it with libticw5 (because it's
already named libticw)

So can someone explain why we need that 'newpkg =3D pkg.replace(orig_pkg, d=
evname, 1)' in else?

Or any hint which change caused this (as debian.bbclass wasn't changed in t=
his aspect).

Reordering PACKAGES seems like really error prone and even not really possi=
ble with dynamic packages etc.

Here is added debug I've used to find it:

diff --git a/classes/debian.bbclass b/classes/debian.bbclass
index 1a2c7da..9239631 100644
--- a/classes/debian.bbclass
+++ b/classes/debian.bbclass
@@ -84,10 +84,13 @@ python debian_package_name_hook () {
                        else:
                                bb.note("Multiple libraries (%s) found and =
LEAD_SONAME not defined" % ", ".join(sonames))

+               bb.debug(1, 'LIBNAMES: pkg %s soname %s' % (orig_pkg, sonam=
e))
                if has_libs and not has_bins and soname:
                        soname_result =3D socrunch(soname)
+                       bb.debug(1, 'LIBNAMES: pkg %s socrunc %s' % (orig_p=
kg, soname_result))
                        if soname_result:
                                (pkgname, devname) =3D soname_result
+                               bb.debug(1, 'LIBNAMES: pkgname %s devname %=
s' % (pkgname, devname))
                                for pkg in packages.split():
                                        if (bb.data.getVar('PKG_' + pkg, d)=
 or bb.data.getVar('DEBIAN_NOAUTONAME_' + pkg, d)):
                                                continue
@@ -95,11 +98,15 @@ python debian_package_name_hook () {
                                        if debian_pn:
                                                newpkg =3D debian_pn
                                        elif pkg =3D=3D orig_pkg:
+                                               bb.debug(1, 'LIBNAMES: pkg =
%s =3D=3D orig_pkg %s' % (pkg, orig_pkg))
                                                newpkg =3D pkgname
                                        else:
+                                               bb.debug(1, 'LIBNAMES: else=
 pkg %s.replace(%s, %s)' % (pkg, orig_pkg, devname))
                                                newpkg =3D pkg.replace(orig=
_pkg, devname, 1)
+                                       bb.debug(1, 'LIBNAMES: pkgname %s d=
evname %s pkg %s orig_pkg %s debian_pn %s newpkg %s' % (pkgname, devname, p=
kg, orig_pkg, debian_pn, newpkg))
                                        if newpkg !=3D pkg:
                                                bb.data.setVar('PKG_' + pkg=
, newpkg, d)
+                                               bb.debug(1, 'setVar PKG_%s,=
 %s' % (pkg, newpkg))

        for pkg in (bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or "").split(=
):
                auto_libname(packages, pkg)


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1ZAmgACgkQN1Ujt2V2gBzpAQCeMTLtRfohgT+Rk2Hx5u9MSFS1
TYkAn0AbS+5zL/FqV5CQYlUBmtUsl4PR
=/Rx2
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
