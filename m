Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id CB62D61485
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:18:11 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so5873811eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cn5ygLaz+AyJPh13mIj2+F48FpryAXsgYnMWXbn0UFY=;
	b=A2zBK2cQv8K+uebuNubpdgorb2kVGv5ZPdpLcgC5SAa7wNBojifBHoeSmjH4FaWhRB
	dXTS4WoxmJgeMLLKrXAaBlkrZ+i1wDFEJFs2ddemUGluXBziu21MvxmubqxoxE7go4t3
	UMI4y/VJGj8/0j/hCmPBivzhKjTssx9GlLAJ6QaqUk2hm+6R33tW9nmgBpmmp1fAUWtq
	PHzO0pKUyf/1QfvnP2N4Fl37KXLMeSSwNLttJbfsPrTHdjOD9iKB91MiZf/r51OMz+In
	uLs1HKI4sWL3T5TyRuPPwvpesfZj5MZemzMdHNsX1ZCeSEu9Bxit11cNYpzsHG3VBZ4Z
	8vTg==
X-Received: by 10.15.102.68 with SMTP id bq44mr23642001eeb.89.1372061892457;
	Mon, 24 Jun 2013 01:18:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm26505302eex.17.2013.06.24.01.18.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 01:18:11 -0700 (PDT)
Date: Mon, 24 Jun 2013 10:18:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130624081847.GM14021@jama>
References: <1372059844-12315-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1372059844-12315-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-ruby][PATCH] ruby: Upgrade from 1.9.3-p194 -> 1.9.3-p429
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
X-List-Received-Date: Mon, 24 Jun 2013 08:18:12 -0000
X-Groupsio-MsgNum: 45205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xtx0sNU5lZ46KfgK"
Content-Disposition: inline

--xtx0sNU5lZ46KfgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2013 at 12:44:04AM -0700, Khem Raj wrote:
> Old recipe was having od_install failures

                        ^^ typo already amended before merging to jansa/in-=
test branch
> this fixes those too
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-ruby/recipes-devtools/ruby/ruby.inc           |    2 +-
>  .../ruby/ruby/ruby-1.9.3-bignum-test-fix.patch     |   31 --------------=
------
>  .../ruby/ruby/ruby-1.9.3-webrick-test-fix.patch    |   24 ---------------
>  .../{ruby_1.9.3-p194.bb =3D> ruby_1.9.3-p429.bb}     |    7 ++---
>  4 files changed, 3 insertions(+), 61 deletions(-)
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignu=
m-test-fix.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webri=
ck-test-fix.patch
>  rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p194.bb =3D> ruby_1.9=
=2E3-p429.bb} (83%)
>=20
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes=
-devtools/ruby/ruby.inc
> index becf64c..18fcb9c 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby.inc
> +++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>      file://COPYING;md5=3D837b32593517ae48b9c3b5c87a5d288c \
>      file://BSDL;md5=3D3949e007205deef714bd225e1ee4a8ea \
>      file://GPL;md5=3D393a5ca445f6965873eca0259a17f833 \
> -    file://LEGAL;md5=3De88686821918c0b6d2b1b8328116cec5 \
> +    file://LEGAL;md5=3D3ce1fae39fe573b818c0af162bce6579 \
>  "
> =20
>  DEPENDS =3D "ruby-native zlib openssl tcl"
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-=
fix.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix=
=2Epatch
> deleted file mode 100644
> index cb3682d..0000000
> --- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.pat=
ch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> ---- ruby-1.9.3-p0/test/ruby/test_bignum.rb.orig	2011-11-10 09:52:59.1019=
25465 +0100
> -+++ ruby-1.9.3-p0/test/ruby/test_bignum.rb	2011-11-10 09:54:14.580798826=
 +0100
> -@@ -378,7 +378,7 @@
> -     assert_equal(true, (2**32).even?)
> -   end
> -=20
> --  def interrupt
> -+  def assert_interrupt
> -     time =3D Time.now
> -     start_flag =3D false
> -     end_flag =3D false
> -@@ -387,14 +387,16 @@
> -       yield
> -       end_flag =3D true
> -     end
> --    sleep 1
> -+    Thread.pass until start_flag
> -     thread.raise
> -     thread.join rescue nil
> --    start_flag && !end_flag && Time.now - time < 10
> -+    time =3D Time.now - time
> -+    assert_equal([true, false], [start_flag, end_flag])
> -+    assert_operator(time, :<, 10)
> -   end
> -=20
> -   def test_interrupt
> --    assert(interrupt { (65536 ** 65536).to_s })
> -+    assert_interrupt {(65536 ** 65536).to_s}
> -   end
> -=20
> -   def test_too_big_to_s
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test=
-fix.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-f=
ix.patch
> deleted file mode 100644
> index c6eb3fa..0000000
> --- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.pa=
tch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -diff --git a/test/webrick/test_cgi.rb b/test/webrick/test_cgi.rb
> -index 1185316..0ef1b37 100644
> ---- a/test/webrick/test_cgi.rb
> -+++ b/test/webrick/test_cgi.rb
> -@@ -14,6 +14,7 @@ class TestWEBrickCGI < Test::Unit::TestCase
> -         def req.meta_vars
> -           meta =3D super
> -           meta["RUBYLIB"] =3D $:.join(File::PATH_SEPARATOR)
> -+          meta[RbConfig::CONFIG['LIBPATHENV']] =3D ENV[RbConfig::CONFIG=
['LIBPATHENV']]
> -           return meta
> -         end
> -       },
> -diff --git a/test/webrick/test_filehandler.rb b/test/webrick/test_fileha=
ndler.rb
> -index bcdb3df..f78ba5c 100644
> ---- a/test/webrick/test_filehandler.rb
> -+++ b/test/webrick/test_filehandler.rb
> -@@ -252,6 +252,7 @@ class WEBrick::TestFileHandler < Test::Unit::TestCase
> -         def req.meta_vars
> -           meta =3D super
> -           meta["RUBYLIB"] =3D $:.join(File::PATH_SEPARATOR)
> -+          meta[RbConfig::CONFIG['LIBPATHENV']] =3D ENV[RbConfig::CONFIG=
['LIBPATHENV']]
> -           return meta
> -         end
> -       },
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb b/meta-ru=
by/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> similarity index 83%
> rename from meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
> rename to meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> index 6611ce1..7c5be36 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
> +++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> @@ -9,16 +9,13 @@ SRC_URI +=3D "\
>      file://ruby-1.9.3-disable-versioned-paths.patch \
>      file://ruby-1.9.3-fix-s390x-build.patch \
>      file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \
> -    file://ruby-1.9.3-webrick-test-fix.patch \
> -    file://ruby-1.9.3-bignum-test-fix.patch \
>      file://ruby-1.9.3-custom-rubygems-location.patch \
>      file://rubygems-1.8.11-binary-extensions.patch \
>      file://ruby-1.9.3-mkmf-verbose.patch \
>      file://ruby-1.9.3-install-cross.patch \
>  "
> -
> -SRC_URI[md5sum] =3D "bc0c715c69da4d1d8bd57069c19f6c0e"
> -SRC_URI[sha256sum] =3D "46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4=
ab855438cf4bd8bb"
> +SRC_URI[md5sum] =3D "993c72f7f805a9eb453f90b0b7fe0d2b"
> +SRC_URI[sha256sum] =3D "d192d1afc46a7ef27b9d0a3c7a67b509048984db2c38907a=
a82641bdf980acf4"
> =20
>  EXTRA_OECONF =3D "\
>      --enable-wide-getaddrinfo \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xtx0sNU5lZ46KfgK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHIAOcACgkQN1Ujt2V2gBwQDgCfYDA873HNYCCEerKQ/SDXvkqk
s64AoIdA8oODlRxGdoMBIDXwsxhVCH6w
=lzkj
-----END PGP SIGNATURE-----

--xtx0sNU5lZ46KfgK--
