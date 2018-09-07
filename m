Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6820579795
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 00:53:17 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id l63-v6so6076243pga.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 17:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=gnV5nj/HLNmqBk50lxq33aeUqfrqELDrH+3oPG7xvqU=;
	b=jUNCP69NBwHIn+9uak2J9ZOzI94ycB7ftCc6BT2tKHaU2HjsdLIvEzazpPx3b5+3Oc
	3mKCrhTMncOL2Dw7BCgsCvlTdY42nxO0VfoUwYkcGtamq9Ap4evVEIhD8T3rsg3cseTb
	DvUb7JJlxCmrMIIYwDysQ5VIUVAyw/OnszKmPI3nrEkDP+N6XCSI2xSSEOmaTIzYlVFG
	bTlohbG+yo+uLAPt4PKI1KoI7yY7oqexRhEsNF+Oqh/Yry7yGeNgPYbEUF5k+J/Gz+SH
	H4qulfoLd1UFdHLbMowXBl0AXryAYR7et0Zkdgw9I7n+yue4sfEk0RyaWg68ot/byKtb
	PjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=gnV5nj/HLNmqBk50lxq33aeUqfrqELDrH+3oPG7xvqU=;
	b=HMcxXu0iPKs2bM6+35sjjm6QPw3vxIX3hbfNLuj9fFcnBKTUuXRIGl4QcJwBH6oDR9
	XnOOrfdSOJZQnlLC2yMkpdtctiblCbLfrpUjsfiCFl0aFyFXNf41zFgBzE8n9eQbtQRP
	sf0cw9NjmtqlfMR3diTof2H7R32jP7J+S4KxT8XsP5JAW3r0/W4RyQ9DqQ3L/r+RFA+q
	blw5eNx4IBEpD+94UFtjyXPGTVl/6PvJcV5fAlw73mbWfGcgDhmNzWYvqAP8ohd3CQRb
	bevuYQbDz5cly0EtXULCXnpdD5lsgmciuIL49KVAjZzzJdB7gwBrGrqkm+xAOW/I+sGY
	MrUg==
X-Gm-Message-State: APzg51Coa5T+bZinpUPHahEZQOFknBA0ESyOkXCVF4xUwwaSMSKLWOfn
	ttTRnbu/myF6UPUMIOMG9FcvCuKt
X-Google-Smtp-Source: ANB0VdZwg9Z4l2Bv0F+HDBxc+9Vl9cUDhEfyz/2yLsnOlkUEm7cYhg6pVf8WVgfNxkVYRQHqJORFmA==
X-Received: by 2002:a63:3387:: with SMTP id
	z129-v6mr5645659pgz.104.1536281597806; 
	Thu, 06 Sep 2018 17:53:17 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:fc25:43f8:d4d:d1b3])
	by smtp.gmail.com with ESMTPSA id
	c1-v6sm7938222pfi.142.2018.09.06.17.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 17:53:17 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>,
	openembedded-devel@lists.openembedded.org
References: <20180907003059.4041-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <deae9220-8aef-6b98-99fd-732f7f8e502a@gmail.com>
Date: Thu, 6 Sep 2018 17:53:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180907003059.4041-1-alistair.francis@wdc.com>
Subject: Re: [PATCH v2] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Fri, 07 Sep 2018 00:53:17 -0000
X-Groupsio-MsgNum: 74410
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="3tDx93kelRF71QzNlsA8mQZ3uxY6lnDjo"

--3tDx93kelRF71QzNlsA8mQZ3uxY6lnDjo
Content-Type: multipart/mixed; boundary="neCvEvtn8RQYMxwNr5t5cohsbqC7iI3Pt";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <deae9220-8aef-6b98-99fd-732f7f8e502a@gmail.com>
Subject: Re: [oe] [PATCH v2] pmdk: Initial commit of the PMDK SDK
References: <20180907003059.4041-1-alistair.francis@wdc.com>
In-Reply-To: <20180907003059.4041-1-alistair.francis@wdc.com>

--neCvEvtn8RQYMxwNr5t5cohsbqC7iI3Pt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alistair

On 9/6/18 5:30 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2:
>  - Fix fortify source compile error
>=20
>  ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
>  ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 52 +++++++++++++++++++=

>  3 files changed, 107 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-j=
emalloc.cfg-Specify-the-host-when-building.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-D=
on-t-install-the-docs.patch
>  create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
>=20
> diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc=
=2Ecfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pm=
dk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
> new file mode 100644
> index 000000000..747538b0c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Sp=
ecify-the-host-when-building.patch
> @@ -0,0 +1,29 @@
> +From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001=

> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jul 2018 11:23:39 -0700
> +Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building=

> + jemalloc
> +
> +To avoid this error:
> +    configure: error: cannot run C compiled programs.
> +    If you meant to cross compile, use `--host'.
> +when cross compiling specify the host when configuring jemalloc.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Inappropriate [configuration]
> +---
> + src/jemalloc/jemalloc.cfg | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
> +index 196129de6..79ebbab1c 100644
> +--- a/src/jemalloc/jemalloc.cfg
> ++++ b/src/jemalloc/jemalloc.cfg
> +@@ -3,3 +3,4 @@
> + --with-private-namespace=3Dje_vmem_
> + --disable-xmalloc
> + --disable-munmap
> ++--host=3D${HOST_SYS}
> +--=20
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-in=
stall-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-=
Don-t-install-the-docs.patch
> new file mode 100644
> index 000000000..bd1b97c24
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-t=
he-docs.patch
> @@ -0,0 +1,26 @@
> +From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001=

> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jul 2018 11:31:17 -0700
> +Subject: [PATCH 2/2] Makefile: Don't install the docs
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Inappropriate [disable feature]
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 224a315f6..ce7f84afb 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
> +=20
> + install uninstall:
> + 	$(MAKE) -C src $@
> +-	$(MAKE) -C doc $@
> +=20
> + .PHONY: all clean clobber test check cstyle check-license install uni=
nstall\
> + 	source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
> +--=20
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/reci=
pes-extended/pmdk/pmdk_1.4.1.bb
> new file mode 100644
> index 000000000..e4d4fcb4f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "Persistent Memory Development Kit"
> +DESCRIPTION =3D "Persistent Memory Development Kit"
> +HOMEPAGE =3D "http://pmem.io"
> +SECTION =3D "libs"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7db1106255a1baa80391fd2e21e=
ebab7"
> +DEPENDS =3D "ndctl"
> +
> +SRC_URI =3D "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
> +           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-bui=
lding.patch \
> +           file://0002-Makefile-Don-t-install-the-docs.patch \
> +           file://0003-Makefile-Don-t-build-the-examples.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "d9a7b3f1059ffd54b4c92e38329fe69e"
> +SRC_URI[sha256sum] =3D "e11cfbbdf0773fb5965211e18044531f442ad1e6d6726f=
1bac8a6dcc0e092622"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +# Fix jemalloc error:
> +# | configure: error: cannot run C compiled programs.
> +# | If you meant to cross compile, use `--host'.
> +#
> +# Also fix #warning _FORTIFY_SOURCE requires compiling with optimizati=
on (-O) [-Werror=3Dcpp]
> +EXTRA_OEMAKE =3D "HOST_SYS=3D'${HOST_SYS}' EXTRA_CFLAGS=3D'-O'"

Perhaps its better to pass SELECTED_OPTIMIZATION variable instead of
hardcoding -O here since this might override the optlevel we expect

> +
> +do_install() {
> +	oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> +
> +	# Copy these into the standard directories
> +	install -d ${D}${bindir}/
> +	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> +	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> +
> +	install -d ${D}${libdir}
> +	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> +
> +	install -d ${D}${libdir}/pkgconfig
> +	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> +
> +	install -d ${D}${includedir}
> +	mv ${D}/usr/local/include/* ${D}${includedir}/
> +
> +	# Remove uneeded files
> +	rm -rf ${D}/usr/local/
> +}
> +
> +# Include these by default otherwise the SDK is not very useful
> +FILES_${PN} +=3D "${bindir}/pmempool ${bindir}/daxio"
> +FILES_${PN} +=3D "${libdir}/*so*"
> +FILES_${PN} +=3D "${libdir}/pkgconfig/*.pc"
> +FILES_${PN} +=3D "${includedir}/libpmemobj++/* ${includedir}/libpmemob=
j/*"
>=20


--neCvEvtn8RQYMxwNr5t5cohsbqC7iI3Pt--

--3tDx93kelRF71QzNlsA8mQZ3uxY6lnDjo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5HL9AAKCRC7BTNVkZ0z
FJj2AKCItSFM9S7H1So3rAhSUWPmTPEW0ACfRjbRXTYt5TUZyqnMGcDAH9ved+w=
=WoTZ
-----END PGP SIGNATURE-----

--3tDx93kelRF71QzNlsA8mQZ3uxY6lnDjo--
