Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 73FC57E9AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:46:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x4so18155787wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2019 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZrI0HgaOD7q8ujQm+XlOWyef2ogAoCzcLAuV65fBS2I=;
	b=N+NNfbn7tBnIRYi2nYdhyCq0SVzK5RfX++OwnHQpFC/mNISkPf22HCrSyukgmrRZYD
	tXY9GseEVBek4wbHRSZJoJdIH+kFNMxSQ+eLq3xXR8rGC/4y/48gyy13mi5LZn88G4n8
	x6YwS9bzMAvqqLf0nac/KLQVvv7R9FOWIskS/CpaV8/gqkhgnWowF0EKsIEPYTesOPgR
	ESZ/ZgGqg8JnGJwSr5mTheiHPouJWoi/DgBpCjCoPtPMlzuP6LJ9cJSH9TwPzz6wYhH7
	/W5JIIuH3D8otc7mWsX4bd+3+XKykSe8KjW8IwlCsiMZEc5iuel/J7dT+ace/q/f4f0q
	vfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZrI0HgaOD7q8ujQm+XlOWyef2ogAoCzcLAuV65fBS2I=;
	b=PJcQYtmfStuGhMMv+4nF5HTFazZiTDYMZWzyZWL3kh2BJ7dr/gHYymhtGWbHOh8E2g
	1avAsCjDTbqU1jThKVC5grivW9VE+jVv7vAAHpal5bHj76b+G4QRWm+1rfWxFk81ucao
	zr8+lN7Z/esLMMjbh8zyK3OCI2mik8C5cX98XT39SfWtmbcN6LnOuTMDMHMr7dhd8NbH
	9LUQx4avl8fi3kGVYSm7TgE9euhbHCWZepGiaDmNDJZ4eTfWTgqMWvzvu1gpQS78Rr1s
	k6mxROjsyWMy9deFjLHOlaQBCScNk6xLvQZIrW2xV56mMoB+r+dxTth6bJYHpKnbdmSx
	sA9Q==
X-Gm-Message-State: APjAAAWvKFkbnPAl+vVMQSCUUy+k+b1mtEs5xRvLD0qF3qZadiM5yj9x
	kRCCnhea/iL9QXL2FVG8j1o=
X-Google-Smtp-Source: APXvYqwWkV76IMshshrEC8KNsVHcYtCHwAbi330wWW2YBQZmgNpESWO9cBe/l3cBj9Mn8gWFXNyoug==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr23580942wrv.321.1562078789121;
	Tue, 02 Jul 2019 07:46:29 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	o11sm2246382wmh.37.2019.07.02.07.46.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 07:46:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Jul 2019 16:46:28 +0200
To: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <20190702144628.GA1484@jama>
References: <20190702111032.999-1-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <20190702111032.999-1-pascal.bach@siemens.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] protobuf: 1.3.1 -> 1.3.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2019 14:46:28 -0000
X-Groupsio-MsgNum: 78373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2019 at 01:10:32PM +0200, Pascal Bach wrote:
> The patch can be dropped as it is included in this release.
> Also drop the +git suffix as the version matches the version exactly.

The subject should be protobuf-c, not protobuf.

I'll retest if this fixes the issues I was seeing with
protobuf-c-native.

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../protobuf-c/protobuf3-compatibility.patch       | 55 ----------------=
------
>  .../{protobuf-c_1.3.1.bb =3D> protobuf-c_1.3.2.bb}   |  4 +-
>  2 files changed, 1 insertion(+), 58 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf=
3-compatibility.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.1.bb =3D> proto=
buf-c_1.3.2.bb} (90%)
>=20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compa=
tibility.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-com=
patibility.patch
> deleted file mode 100644
> index 35914952d..000000000
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibilit=
y.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 7456d1621223d425b8a3fd74e435a79c046169fb Mon Sep 17 00:00:00 2001
> -From: Robert Edmonds <edmonds@users.noreply.github.com>
> -Date: Wed, 10 Apr 2019 20:47:48 -0400
> -Subject: [PATCH] t/generated-code2/cxx-generate-packed-data.cc: Fix build
> - failure on newer protobuf
> -
> - Upstream-Status: Backport [https://github.com/protobuf-c/protobuf-c/pul=
l/369]
> -
> -google::protobuf::Message::Reflection has been removed in newer versions
> -of protobuf. The replacement is google::protobuf::Reflection.
> -
> -protobuf in commit 779f61c6a3ce02a119e28e802f229e61b69b9046 ("Integrate
> -recent changes from google3.", from August 2008) changed the following
> -in message.h:
> -
> -    @@ -336,7 +337,8 @@ class LIBPROTOBUF_EXPORT Message {
> -
> -       // Introspection ------------------------------------------------=
---
> -
> -    -  class Reflection;  // Defined below.
> -    +  // Typedef for backwards-compatibility.
> -    +  typedef google::protobuf::Reflection Reflection;
> -
> -The "typedef for backwards-compatibility" apparently lasted ten years
> -until protobuf commit 6bbe197e9c1b6fc38cbdc45e3bf83fa7ced792a3
> -("Down-integrate from google3.", from August 2018) which finally removed
> -the typedef:
> -
> -    @@ -327,8 +344,6 @@ class LIBPROTOBUF_EXPORT Message : public Messag=
eLite {
> -
> -       // Introspection ------------------------------------------------=
---
> -
> -    -  // Typedef for backwards-compatibility.
> -    -  typedef google::protobuf::Reflection Reflection;
> -
> -This commit updates the only use of this typedef (in the test suite) to
> -directly refer to the replacement, google::protobuf::Reflection. This
> -fixes the build failure in the test suite.
> ----
> - t/generated-code2/cxx-generate-packed-data.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/t/generated-code2/cxx-generate-packed-data.cc b/t/generated=
-code2/cxx-generate-packed-data.cc
> -index 4fd3e25..0865d2e 100644
> ---- a/t/generated-code2/cxx-generate-packed-data.cc
> -+++ b/t/generated-code2/cxx-generate-packed-data.cc
> -@@ -998,7 +998,7 @@ static void dump_test_packed_repeated_enum (void)
> - static void dump_test_unknown_fields (void)
> - {
> -   EmptyMess mess;
> --  const google::protobuf::Message::Reflection *reflection =3D mess.GetR=
eflection();
> -+  const google::protobuf::Reflection *reflection =3D mess.GetReflection=
();
> -   google::protobuf::UnknownFieldSet *fs =3D reflection->MutableUnknownF=
ields(&mess);
> -
> - #if GOOGLE_PROTOBUF_VERSION >=3D 2001000
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> similarity index 90%
> rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> index 1d1782306..6d1ffc3f4 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> @@ -12,11 +12,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb901168715=
f4782a2b06c3ddaefa558"
> =20
>  DEPENDS =3D "protobuf-native protobuf"
> =20
> -PV .=3D "+git${SRCPV}"
> -SRCREV =3D "269771b4b45d3aba04e59569f53600003db8d9ff"
> +SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
> =20
>  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> -           file://protobuf3-compatibility.patch \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXRtuQwAKCRA3VSO3ZXaA
HB3ZAKCjE/zSejLINigtTw0azRCBe6snkACffIqbgR0dlr7UvFRtwAR8NKVgbrA=
=HOLK
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
