Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0525360196
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:22:18 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so3042510wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n1o+C+hv0uWuekZMGg40KxTxi1wkgCBG3NEYcrNUTKI=;
	b=ZcOPlkUD5TKQpFBgyy4l7/ndomQQnadpULkPRE1I53IzQrsTxAlcixWykbbsPUVfa4
	SHcDtFjhb+Trnxe4EA/KxJPriHjyM9B0GE+w9Mdw8g5h85C9WOlpTyapoId326KalcVy
	NbZwm0fzByGXfuNYz4t7WvTAMLx8RjVDs0Q/UCmOkUYlSiKqFEgM7DhPzYgyzAlXvI3S
	dI13th1bgbhwIzEgtGWjV/V+jhIhp/9VKZxIG/pkQm1HRLYi3p17Qeqt8eVWcuAfWMjA
	0RKwUEKJCYLbVkGWMIoAZElKgY7cRN0D8UlIgF0x7P2JvecVmPrT9nyF1u17nci3qp2R
	tPJA==
X-Received: by 10.194.110.7 with SMTP id hw7mr18555977wjb.38.1407352939318;
	Wed, 06 Aug 2014 12:22:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ja13sm21107871wic.8.2014.08.06.12.22.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 12:22:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 21:22:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806192249.GP14848@jama>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
	<9867e980720914170f5179cc551b38711e8f590e.1407244194.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <9867e980720914170f5179cc551b38711e8f590e.1407244194.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 5/5] mariadb: update to 5.5.38
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
X-List-Received-Date: Wed, 06 Aug 2014 19:22:28 -0000
X-Groupsio-MsgNum: 51465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EkxpYdHiqGHPYbUt"
Content-Disposition: inline

--EkxpYdHiqGHPYbUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2014 at 02:20:46PM +0100, Paul Eggleton wrote:
> * Upstream switched from autotools to cmake
> * Separate build dir and parallel make now work
> * Library versioning no longer used for plugins; other libtool cruft
>   gone
> * Proper upstream initscript
> * Plugins moved from client library package to mariadb-server package
>   (matches how Fedora packages these)
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  ...b-native_5.1.67.bb =3D> mariadb-native_5.5.38.bb} |   5 +-
>  .../mysql/mariadb/Makefile.am.patch                |  19 -
>  .../mariadb/avoid-plugin-options-warnings.patch    |  17 -
>  .../mysql/mariadb/configure-ps-cache-check.patch   |  27 --
>  .../mysql/mariadb/configure.in.patch               |  13 -
>  .../mysql/mariadb/fix-cmake-module-path.patch      |  29 ++
>  .../mysql/mariadb/fix-cve-2013-1861-1.patch        | 174 ---------
>  .../mysql/mariadb/fix-cve-2013-1861-2.patch        | 257 -------------
>  .../mysql/mariadb/fix-link-error-ub1310.patch      |  37 --
>  .../mysql/mariadb/fix-mysqlclient-r-version.patch  | 161 ++++++++
>  .../mysql/mariadb/fix_host_path.patch              |  37 --
>  .../recipes-support/mysql/mariadb/misc.m4.patch    |  13 -
>  meta-oe/recipes-support/mysql/mariadb/my.cnf       |   1 +
>  meta-oe/recipes-support/mysql/mariadb/mysqld.sh    |  24 --
>  .../recipes-support/mysql/mariadb/plug.in.patch    | 405 ---------------=
------
>  .../mysql/mariadb/remove-bad-path.patch            |  18 +
>  ...orage-forbids-absolute-addresses-on-IA-32.patch |  44 ---
>  .../mariadb/zlib-let-libdir-configurable.patch     |  63 ----
>  .../mysql/{mariadb_5.1.67.bb =3D> mariadb_5.5.38.bb} |   2 +
>  .../{mariadb_5.1.67.inc =3D> mariadb_5.5.38.inc}     | 113 +++---
>  20 files changed, 273 insertions(+), 1186 deletions(-)
>  rename meta-oe/recipes-support/mysql/{mariadb-native_5.1.67.bb =3D> mari=
adb-native_5.5.38.bb} (71%)
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/Makefile.am.pat=
ch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/avoid-plugin-op=
tions-warnings.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/configure-ps-ca=
che-check.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/configure.in.pa=
tch
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cmake-modul=
e-path.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-18=
61-1.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-18=
61-2.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-link-error-=
ub1310.patch
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient=
-r-version.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix_host_path.p=
atch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/mysqld.sh
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/plug.in.patch
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/remove-bad-path=
=2Epatch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-forbids=
-absolute-addresses-on-IA-32.patch
>  delete mode 100644 meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir=
-configurable.patch
>  rename meta-oe/recipes-support/mysql/{mariadb_5.1.67.bb =3D> mariadb_5.5=
=2E38.bb} (94%)
>  rename meta-oe/recipes-support/mysql/{mariadb_5.1.67.inc =3D> mariadb_5.=
5.38.inc} (68%)

We've already discussed this on IRC, here is more details:

19:08:49 < JaMa> bluelightning: ping, mariadb is failing here (when buildin=
g after world, not with minimal deps):
19:08:51 < JaMa> mariadb/5.5.38-r0/build'
19:08:51 < JaMa> | make -f dbug/CMakeFiles/t.dir/build.make dbug/CMakeFiles=
/t.dir/build
19:08:51 < JaMa> | ./factorial: 1: ./factorial: Syntax error: word unexpect=
ed (expecting ")")
19:08:51 < JaMa> | make[2]: *** [dbug/output1.r] Error 2
19:09:05 < JaMa> bluelightning: have you seen something like that before in=
 your builds?
19:09:14 < bluelightning> I haven't, no
19:09:29 < bluelightning> I wonder what triggers it...
19:10:16 < JaMa> I would compare log.do_configure to see what's new, but bo=
th TMPDIRs are already gone so it will take some time
19:11:24 < bluelightning> hmm, ok... well I'm happy to hold until we figure=
 out where the issue is

Failing version autodetected boost:
$ diff -uNr temp/log.do_configure
--- mariadb/5.5.38-r0/temp/log.do_configure.fail 2014-08-06 11:44:44.426248=
399 -0700
+++ mariadb/5.5.38-r0/temp/log.do_configure.ok   2014-08-06 11:57:23.110273=
393 -0700
@@ -727,9 +727,7 @@
 -- Looking for io_queue_init in aio - not found
 -- Check size of pthread_t
 -- Check size of pthread_t - done
--- Boost version: 1.55.0
--- Performing Test BOOST_OK
--- Performing Test BOOST_OK - Failed
+-- Could NOT find Boost
 -- Looking for include file netdb.h
 -- Looking for include file netdb.h - found
 -- Looking for include file security/pam_appl.h

Maybe that's not the only difference. Let me know if you can reproduce the =
issue after building boost before mariadb.

When it doesn't fail, it also reports some more autodetected dependencies:
WARNING: QA Issue: mariadb-client rdepends on readline but its not a build =
dependency? [build-deps]
WARNING: QA Issue: mariadb-leftovers rdepends on readline but its not a bui=
ld dependency? [build-deps]

Regards,

--EkxpYdHiqGHPYbUt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPigIkACgkQN1Ujt2V2gBx0BACgpGE6YlxLTrs1k5nb85mNhIQY
3H8AnjHEZ4BJ8vLY8Wk74UmzuZzNggBt
=xCQW
-----END PGP SIGNATURE-----

--EkxpYdHiqGHPYbUt--
