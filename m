Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B007770E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:44:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y134so20408575pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=pMPVwJgu9E2/sTlVpRIl0quKDyXIlnsGGaNv8uRBpJg=;
	b=yIGsK7w5qMZC+vNhA6i3ea72YoS3PYPG0dX1WM9rq5uYvyQz3WQnVhUBRAyxHqjWGD
	dgTO9uE0qUL8Ed+xrYj9UYwWCrDC4YPazVhj1VRw/45Nd3YYKV/c/szASiJfO6I6QOK7
	V+PBf9htCQgEA/4X44E5/w3eg8li+BBtwJ5Y7Laa2sOuogcg/+mLBiFf3CNOHZ7ldv7c
	26pSMJu9FX0ZdsIW2DiIoaRxLyUQa85DYucihCkZHqTe/qFoVaU676z9SuobBN2J6WjL
	0bEeQg2AIJMDdM896czmxIBDWVOkCYz4ViCk7LPzy5sAhBxdjsNRxLWU0RsYXadk6JsL
	6RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=pMPVwJgu9E2/sTlVpRIl0quKDyXIlnsGGaNv8uRBpJg=;
	b=CfdFpIue52DBv7SsATQWzSsPXD4naXF/LkVIa7LmYVuOl9KLX+LfbGmAwuIGHFT38g
	psqbmZYbEkPjEoG4OfzYn0vM8bZBQ3pILPEhGkKrWE4i1zqeMDugOww+S+HBpfccLDSm
	IKMZ0wmD9BNJx6G6LVGT4PSUR3l4EtDk9QIyrdZdXhOoHj7zwyp7OblnTuX0HzxU+l/b
	rp6+O8xdfYCsJv7GU3tn4BjGxGhLswD1lLrS4WYyMpS742WHPyo+d1SCJNXWhUmHbtmy
	rRhOqYo5JE+XbeDPEL8GMWjPvj5xsjrVEjTybN1opxsPo+btaLSRjfI2qOZOQA+TMiEL
	7W3Q==
X-Gm-Message-State: AEkoouuQwKSy71O1uz3od20ZKUEPZ4hD9aCsf7AMPo/TcRGr/kn+XwP+GGkHPk5fEa4jUw==
X-Received: by 10.98.65.81 with SMTP id o78mr137581382pfa.48.1470415465864;
	Fri, 05 Aug 2016 09:44:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:41d7:99c1:5cc6:c627?
	([2601:646:8882:b8c:41d7:99c1:5cc6:c627])
	by smtp.gmail.com with ESMTPSA id
	z10sm29245084pff.95.2016.08.05.09.44.24
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 09:44:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Fri, 5 Aug 2016 09:44:41 -0700
Message-Id: <A052AFE4-6611-45D2-B559-73E38E398FCF@gmail.com>
References: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] opencv: Fix build with gcc 6.0
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
X-List-Received-Date: Fri, 05 Aug 2016 16:44:25 -0000
X-Groupsio-MsgNum: 62450
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA2A2C39-48DF-49D1-9CDF-BBAB9F673C10";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DA2A2C39-48DF-49D1-9CDF-BBAB9F673C10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 5, 2016, at 9:38 AM, Ricardo Ribalda Delgado =
<ricardo.ribalda@gmail.com> wrote:
>=20
> It seems like gcc 6.0 does not have the same behaviour as previous 5.x
> with regards isystem flag.
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> .../recipes-support/opencv/opencv/fixgcc60.patch   | 30 =
++++++++++++++++++++++
> meta-oe/recipes-support/opencv/opencv_3.1.bb       |  4 +--
> 2 files changed, 31 insertions(+), 3 deletions(-)
> create mode 100644 =
meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch =
b/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
> new file mode 100644
> index 000000000000..5d0bf97cab63
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
> @@ -0,0 +1,30 @@
> +diff --git a/cmake/OpenCVPCHSupport.cmake =
b/cmake/OpenCVPCHSupport.cmake
> +index 28ccc1c6be4f..b0e1cbf77287 100644
> +--- a/cmake/OpenCVPCHSupport.cmake
> ++++ b/cmake/OpenCVPCHSupport.cmake
> +@@ -19,7 +19,7 @@ IF(CMAKE_COMPILER_IS_GNUCXX)
> +         ARGS ${CMAKE_CXX_COMPILER_ARG1} -dumpversion
> +         OUTPUT_VARIABLE gcc_compiler_version)
> +     #MESSAGE("GCC Version: ${gcc_compiler_version}")
> +-    IF(gcc_compiler_version VERSION_GREATER "4.2.-1")
> ++    IF(gcc_compiler_version VERSION_GREATER "4.2.-1" AND =
gcc_compiler_version VERSION_LESS "6.0.0")
> +         SET(PCHSupport_FOUND TRUE)
> +     ENDIF()
> +
> +diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
> +index 3a23cd73633d..1fea1578b1d9 100644
> +--- a/cmake/OpenCVUtils.cmake
> ++++ b/cmake/OpenCVUtils.cmake
> +@@ -76,7 +76,11 @@ function(ocv_include_directories)
> +     if("${__abs_dir}" MATCHES "^${OpenCV_SOURCE_DIR}" OR =
"${__abs_dir}" MATCHES "^${OpenCV_BINARY_DIR}")
> +       list(APPEND __add_before "${dir}")
> +     else()
> +-      include_directories(AFTER SYSTEM "${dir}")
> ++	    if (gcc_compiler_version VERSION_LESS "6.0.0")
> ++		    include_directories(AFTER SYSTEM "${dir}")
> ++	    else()
> ++		    include_directories(AFTER "${dir}")
> ++	    endif()

I would rather prefer to see if need for -isystem can be completely =
removed.

> +     endif()
> +   endforeach()
> +   include_directories(BEFORE ${__add_before})
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb =
b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> index c41baec7bba8..8ab9a2b4e071 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D =
"git://github.com/Itseez/opencv.git;name=3Dopencv \
>             =
git://github.com/Itseez/opencv_contrib.git;destsuffix=3Dcontrib;name=3Dcon=
trib \
>             =
git://github.com/Itseez/opencv_3rdparty.git;branch=3Dippicv/master_2015120=
1;destsuffix=3Dparty3;name=3Dparty3 \
>             file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
> +            file://fixgcc60.patch \
>             file://fixpkgconfig.patch"
>=20
> PV =3D "3.1+git${SRCPV}"
> @@ -145,6 +146,3 @@ do_install_append() {
>     install -d ${D}${datadir}/OpenCV/samples/bin/
>     cp -f bin/*-tutorial-* bin/*-example-* =
${D}${datadir}/OpenCV/samples/bin/
> }
> -
> -# http://errors.yoctoproject.org/Errors/Details/68617/
> -PNBLACKLIST[opencv] ?=3D "BROKEN: fails to build with gcc-6"
> --
> 2.8.1
>=20


--Apple-Mail=_DA2A2C39-48DF-49D1-9CDF-BBAB9F673C10
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlekwn0ACgkQuwUzVZGdMxQbLwCfRytd6/H1KPKFNQ3CxDd2iZzW
ePwAnjUrj66c3mN1Y5ydh3aAWrDN0Qkj
=he7d
-----END PGP SIGNATURE-----

--Apple-Mail=_DA2A2C39-48DF-49D1-9CDF-BBAB9F673C10--
