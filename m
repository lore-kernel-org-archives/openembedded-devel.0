Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 1AF2C65DB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:48:54 +0000 (UTC)
Received: (qmail 30195 invoked by uid 1003); 1 Jul 2014 16:48:55 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@108.44.80.46)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	1 Jul 2014 16:48:55 -0000
Message-ID: <53B2E673.2030300@balister.org>
Date: Tue, 01 Jul 2014 12:48:51 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, wenzong.fan@windriver.com
References: <1404224853-22809-1-git-send-email-philip@balister.org>
	<20140701160310.GH2437@jama>
In-Reply-To: <20140701160310.GH2437@jama>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] postgresql : Fix build using pkg-config for libxml-2.0.
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
X-List-Received-Date: Tue, 01 Jul 2014 16:48:59 -0000
X-Groupsio-MsgNum: 50650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="gmCQmEVQVlrcVIe4Td07kMDag1rwV8GDe"

--gmCQmEVQVlrcVIe4Td07kMDag1rwV8GDe
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 07/01/2014 12:03 PM, Martin Jansa wrote:
> On Tue, Jul 01, 2014 at 10:27:33AM -0400, Philip Balister wrote:
>> Use package-config instead of binconfig for libxml-2.0.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  ...0001-Use-pkg-config-for-libxml2-detection.patch | 43 +++++++++++++=
+++++++++
>>  meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
>>  2 files changed, 44 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/postgresql/files/0001-Use-=
pkg-config-for-libxml2-detection.patch
>>
>> diff --git a/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-con=
fig-for-libxml2-detection.patch b/meta-oe/recipes-support/postgresql/file=
s/0001-Use-pkg-config-for-libxml2-detection.patch
>> new file mode 100644
>> index 0000000..d08ec6a
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for=
-libxml2-detection.patch
>> @@ -0,0 +1,43 @@
>> +From d52e330be895bb8c5f0fb3e2884766acbd942a85 Mon Sep 17 00:00:00 200=
1
>> +From: Philip Balister <philip@balister.org>
>> +Date: Tue, 1 Jul 2014 09:40:44 -0400
>> +Subject: [PATCH] Use pkg-config for libxml2 detection.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>=20
> What's relation to this change?
> http://patchwork.openembedded.org/patch/74159/
>=20
> Upstream-Status value doesn't seem right and your change is also
> dropping pgac_* as Koen commented before.

I need to remember to check the list archives before fixing these
things. Wenzong, do you want to update your patch, or should I update min=
e?

Philip

>=20
>> +
>> +xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
>> +
>> +Signed-off-by: Philip Balister <philip@balister.org>
>> +---
>> + configure.in | 15 ++-------------
>> + 1 file changed, 2 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/configure.in b/configure.in
>> +index f8bf466..1f4fabf 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -734,19 +734,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML =
support],
>> +               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with=
 XML support. (--with-libxml)])])
>> +=20
>> + if test "$with_libxml" =3D yes ; then
>> +-  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
>> +-  if test -n "$XML2_CONFIG"; then
>> +-    for pgac_option in `$XML2_CONFIG --cflags`; do
>> +-      case $pgac_option in
>> +-        -I*|-D*) CPPFLAGS=3D"$CPPFLAGS $pgac_option";;
>> +-      esac
>> +-    done
>> +-    for pgac_option in `$XML2_CONFIG --libs`; do
>> +-      case $pgac_option in
>> +-        -L*) LDFLAGS=3D"$LDFLAGS $pgac_option";;
>> +-      esac
>> +-    done
>> +-  fi
>> ++  CPPFLAGS=3D"$CPPFLAGS `pkg-config --short-errors --print-errors --=
cflags "libxml-2.0" 2>&1`"
>> ++  LIBS=3D"`pkg-config --short-errors --print-errors --libs "libxml-2=
=2E0" 2>&1` $LIBS"
>> + fi
>> +=20
>> + AC_SUBST(with_libxml)
>> +--=20
>> +1.8.3.1
>> +
>> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-=
oe/recipes-support/postgresql/postgresql.inc
>> index 4e5ec02..79d1281 100644
>> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
>> @@ -28,6 +28,7 @@ SRC_URI =3D "http://ftp.postgresql.org/pub/source/v$=
{PV}/${BP}.tar.bz2 \
>>             file://postgresql.init \
>>             file://postgresql-bashprofile \
>>             file://postgresql.pam \
>> +           file://0001-Use-pkg-config-for-libxml2-detection.patch \
>>  "
>> =20
>>  LEAD_SONAME =3D "libpq.so"
>> --=20
>> 1.8.3.1
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--gmCQmEVQVlrcVIe4Td07kMDag1rwV8GDe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTsuZ2AAoJEMDJd4rr0merJGIH/1iwcF22a2bTqn+dFlDNuOPD
XMl8nqgNHYDweu9SXcreXHwxWlWq9X/3ZIEzIk8Wsbo2XdkNH6YeZm3sVgmKIoLK
5VDabwFCX+hzK0dmFwgB4475lkSFlMdFwMONWDxhk34oQKgbrxlSeM0nNznzJaGO
PO3sAINt0LKDjYkM0MRZUnyUyia8VOoEX8JI9HxSaRUHKGo9PoHANBvHOXS+wLzn
lKggWWJ/KT4oaQmUKkBafgr4ExlFW8zAeY5AUyf1ioM6RXz0WXrCq13DEmCbOfIK
mPdXQV9DARHzksPwcVrwYAY6Hkm+8OL/tq+KALUNhWqbwOLAnlR2Zl5iPjV0H2c=
=lgzH
-----END PGP SIGNATURE-----

--gmCQmEVQVlrcVIe4Td07kMDag1rwV8GDe--
