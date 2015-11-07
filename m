Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C9C8F766B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 19:52:41 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so132196777pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=KjCb8KUt2Y8dSijl9IHJEJwLbLPsXG/2uHCOKIUW+DA=;
	b=I8mHm1ryzPFlJ/jyDFJq9EZ8WI7Cp2mtx0NQWX8xG0yhZ7/MSvl+AsaWa8GloM4rcS
	l2bIFN6kJgK9K07as6oywt4Jvgtiz3GFPGMe1Hmr3CgzEyISH1vR6aJ0wIQGNL6OiKfh
	C76qZ5OjYrJKaHsQyBcU8aGhhqbxOnEnenyUOzSzjiSO1espEZeG3cv/n3iFk2/K8NqQ
	Ewloir3QsjSJlEeeRgbGmMBZzUEh4B+6N3DIBl/fZxCQeD/DVyjwicJtONkDX6Qw43NQ
	omdx7SRMTtmAG38wsHZOCHj2jteTxqlkuZjvTnDx+GYi7m7H/H6hziciIFbIcgET9sAL
	7Abg==
X-Received: by 10.68.191.9 with SMTP id gu9mr10643612pbc.54.1446925961692;
	Sat, 07 Nov 2015 11:52:41 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:28f2:79c0:8d4d:d2b3?
	([2601:646:8601:4580:28f2:79c0:8d4d:d2b3])
	by smtp.gmail.com with ESMTPSA id
	kw10sm7332140pbc.25.2015.11.07.11.52.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 07 Nov 2015 11:52:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3108\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446898829-21243-6-git-send-email-max.oss.09@gmail.com>
Date: Sat, 7 Nov 2015 11:52:36 -0800
Message-Id: <05423CF5-47B2-439F-A64C-F89B5F9BEFD8@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
	<1446898829-21243-6-git-send-email-max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3108)
Subject: Re: [meta-browser][PATCH v2 5/5] cef3: fix build with gcc 4.9.4
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
X-List-Received-Date: Sat, 07 Nov 2015 19:52:45 -0000
X-Groupsio-MsgNum: 58402
Content-Type: multipart/signed;
	boundary="Apple-Mail=_51877429-A00E-4319-9F18-94DF3CC960C8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_51877429-A00E-4319-9F18-94DF3CC960C8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 7, 2015, at 4:20 AM, Max Krummenacher <max.oss.09@gmail.com> =
wrote:
>=20
> During the final link we get errors like this:
> .../4.9.4/ld: warning: hidden symbol 'sqlite3_temp_directory' in =
obj/.../sqlite.sqlite3.o) is referenced by DSO =
.../usr/lib/libsoftokn3.so
> .../4.9.4/ld: error: treating warnings as errors
> collect2: error: ld returned 1 exit status
>=20

This is gold linker specific so you should disable these warning when =
ld-is-gold is in DISTRO_FEATURES. Its a big broad brush so lets
try to make it small as we can.

> Use chromium.bb solution to not treat linker warnings as errors.
>=20
> Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
>=20
> Upstream-Status: Inappropriate configuration
> Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> ---
> recipes-browser/chromium/cef3_280796.bb | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-browser/chromium/cef3_280796.bb =
b/recipes-browser/chromium/cef3_280796.bb
> index df4a80f..828605b 100644
> --- a/recipes-browser/chromium/cef3_280796.bb
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -34,6 +34,10 @@ export GYP_GENERATORS=3D"ninja"
> export BUILD_TARGET_ARCH=3D"${TARGET_ARCH}"
> export GYP_DEFINES=3D"${GYP_ARCH_DEFINES} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>=20
> +EXTRA_OEGYP =3D	" \
> +    -Ddisable_fatal_linker_warnings=3D1 \
> +"
> +
> do_configure_prepend() {
>     # there is no rule for the x86-64 architecture, recycle the i586 =
one
>     cp  cef/i586_ozone.gypi  cef/x86_64_ozone.gypi
> @@ -46,7 +50,7 @@ do_configure_append() {
>     # Configure cef
>     #------------------------
>     cd cef
> -    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth ../
> +    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth ../ ${EXTRA_OEGYP}
>     cd -
> }
>=20
> --
> 1.8.4.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_51877429-A00E-4319-9F18-94DF3CC960C8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY+VocACgkQuwUzVZGdMxSsGwCeI7jWQs5+XnjvNeTqizlneJWO
HiIAn0wuxncGsOKIPxze9pT29TGED6u8
=bCbf
-----END PGP SIGNATURE-----

--Apple-Mail=_51877429-A00E-4319-9F18-94DF3CC960C8--
