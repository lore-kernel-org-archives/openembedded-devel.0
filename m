Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53D50751D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 22:59:58 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g20-v6so6813087qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SIUe7GZsQq3tImDCtqRH4KlhqQZ8LGtQ80YUrjcOzgU=;
	b=H1Pbxd+812Uhk7zkWBH69Lj2zWKEEy13iePf5Fl3NXBkIjoVUh2WKFMUjtZBMGWR6z
	54mJolbENiX/Y2gj1/shN6NVn+ypV2nrN4kQEZ/2L2XSN6cb8VUL6qTG9J+U6KohJG8I
	by12zSOHD/Bcn3ezrJa03YpR9JzssNFgez8wphjcGkxgqYIs1nzNB4t7fPKqWY4+oWEF
	NzywL2bgZW6pIgXTxT/OP6uMqo+K7GAI/hO8dUvhqljL/koci1GAi68ETexcjSbl9Q/D
	+/KrnJuD10NbCzegm6Pi++MPpO2cc6vWZwuKjbSpBxDvuX6moCoHfMQXnGQJ+GSPZPxj
	l7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SIUe7GZsQq3tImDCtqRH4KlhqQZ8LGtQ80YUrjcOzgU=;
	b=WraA5oFEKYBh6BsoH2rAGs7EyE1Gqn+XUWzWHnvDduZHAJmbpF4+ikaCSrmpmMpz5L
	5GFzjZtQnx4YTRWaE2OS51OL/cLQv9uJS/XAyVBaYLB4MDZc4XjmzrvJGZKquJFyCk8g
	mGJQPnx8KMIzzbHXxlzwvjOnjWWen/VjIJzxoioAcX3QC2GojEpucHdx85TSH/QcfgaP
	xHQBUHfrY6k54HnXCyvkc4I7Z7V0witdLtT/Juf+eg5P7gQRGT16fPcqgCGWoNuQf7cO
	laiMjizSdWSjX0i3jUfSkK3yodnLgApEavEylMOUlw4lAXxWZkReHESNe1q1rJhFq5o9
	8w1w==
X-Gm-Message-State: ABuFfojCjZ5QEHfcmwdlrlqS1Ua4yRKkCjY21jP5nJOuAS4Tu8w5omgp
	U7aXXSG0o5qivuDFcqpY57H14Q8r9RJGR0jhv355AA==
X-Google-Smtp-Source: ACcGV60RJ50W1xvR+U85tjk7rMWvH+hxA5+/lpBQ3uGXACEinCQyTpEjXu1QmBkdLaoRY6iieU0I3kySOYkJoMk7bBA=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr7095344qke.102.1538693999032; 
	Thu, 04 Oct 2018 15:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181004225610.13853-1-daniel.diaz@linaro.org>
In-Reply-To: <20181004225610.13853-1-daniel.diaz@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2018 15:59:32 -0700
Message-ID: <CAMKF1sp9o5bUTANAHDJQORPzB-HHjcAHoA2r_NocKULEy3hovQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?= <daniel.diaz@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libhugetlbfs: Update to 2.21
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
X-List-Received-Date: Thu, 04 Oct 2018 22:59:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel
On Thu, Oct 4, 2018 at 3:57 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> wr=
ote:
>
> Version 2.21 was released on 9/17 [1]. These changes update
> the recipe to use that version.
>
> Only one of the existing patches had been merged upstream
> (as e3928d57 "Force text segment alignment to 0x08000000 for
> i386 with gold linker") -- the rest of them is still needed
> for proper cross-compilation.
>
> Upstream commit c3e5cb22 ("Remove bit-rotting scripts") got
> rid of the Perl stuff, due to it being "massively out of
> date", so the Perl bits in the recipe have gone away too.
>
> [1] https://github.com/libhugetlbfs/libhugetlbfs/releases/tag/2.21
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  .../libhugetlbfs/libhugetlbfs_git.bb          | 20 +++++--------------

seems like you forgot to delete the patch file which is removed from src ur=
i

>  1 file changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 14c909e75..66fd8e21d 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -3,14 +3,14 @@ HOMEPAGE =3D "https://github.com/libhugetlbfs/libhugetl=
bfs"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f17206a5=
b0a1"
>
> -DEPENDS =3D "sysfsutils perl"
> -RDEPENDS_${PN} +=3D "bash perl python python-io python-lang python-subpr=
ocess python-resource ${PN}-perl"
> +DEPENDS =3D "sysfsutils"
> +RDEPENDS_${PN} +=3D "bash python python-io python-lang python-subprocess=
 python-resource"
>  RDEPENDS_${PN}-tests +=3D "bash"
>
> -PV =3D "2.20"
> +PV =3D "2.21"
>  PE =3D "1"
>
> -SRCREV =3D "e44180072b796c0e28e53c4d01ef6279caaa2a99"
> +SRCREV =3D "73d06e69108f231696e9c5c44f4b42690fc5d752"
>  SRC_URI =3D " \
>      git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=3Dhttps \
>      file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
> @@ -18,7 +18,6 @@ SRC_URI =3D " \
>      file://tests-Makefile-install-static-4G-edge-testcases.patch \
>      file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch =
\
>      file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
> -    file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
>      file://0001-include-stddef.h-for-ptrdiff_t.patch \
>      file://0002-Mark-glibc-specific-code-so.patch \
>      file://0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.pat=
ch \
> @@ -51,14 +50,6 @@ do_configure() {
>      if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; th=
en
>        sed -i 's/CUSTOM_LDSCRIPTS =3D yes/CUSTOM_LDSCRIPTS =3D no/'  Make=
file
>      fi
> -
> -    # fixup perl module directory hardcoded to perl5
> -    sed -i 's/perl5/perl/g'  Makefile
> -
> -    # fixup to install perl module under $(LIBDIR)/perl/${@get_perl_vers=
ion(d)}/TLBC
> -    # to avoid below error
> -    # Can't locate TLBC/OpCollect.pm in @INC
> -    sed -i '/^PMDIR/ s:perl:perl/${@get_perl_version(d)}:g' Makefile
>  }
>
>  do_install() {
> @@ -69,11 +60,10 @@ do_install() {
>  }
>
>
> -PACKAGES =3D+ "${PN}-perl ${PN}-tests "
> +PACKAGES =3D+ "${PN}-tests "
>  FILES_${PN} +=3D "${libdir}/*.so"
>  FILES_${PN}-dev =3D "${includedir}"
>  FILES_${PN}-dbg +=3D "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir=
}/libhugetlbfs/tests/obj64/.debug"
> -FILES_${PN}-perl =3D "${libdir}/perl"
>  FILES_${PN}-tests +=3D "${libdir}/libhugetlbfs/tests"
>
>  INSANE_SKIP_${PN} =3D "dev-so"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

