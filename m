Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id C09F47556C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 19:56:42 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id k25-v6so8028844uao.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 12:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z8uEeZBJG45c3hRI+uvscwX8KZq/LQYEFyMagIn4DCE=;
	b=GjjQwQPcuLi1KHaurRKTG3FOQ1feM/EsjGYjcJRXRftXhLpsULypQkhPClbGvJYFAf
	FYOnC6SS713jVINi6ZlUD6EahSfblhM5yw2BPnRNCCzJaHVGMYtFP3XDBC1VHv0kH5Im
	hwrcNv8OL3mDXelq2lwWs2ZYvE37MAnmQ4ndlNyCtTDRf13HVWOOOI6ioOAAYTdD5CSB
	BjgPukVt2SFdublpWUyTnSjcg9cgZ+ty/CBZ34fY1qB3FcJfNJPbIZSVojw02cQi16ev
	9jw/8fXoM5+HmS3EUvsJrhuYgGeJHkmgN/wUSvAw+N6RzVF0+khus+nQuTKWcYtdREMn
	L+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z8uEeZBJG45c3hRI+uvscwX8KZq/LQYEFyMagIn4DCE=;
	b=HlV1rMR9H9L7IeaIYJA9x+1Vg/3e5kT/khWkr/IC4GXOVtb53K2uX6r83OYRVZK+nl
	xEchnyVCrEHKB6sP7PeJ8pRGub/2eMbmoies74Z4AQ0dEuY7QlcqTlm2T3053tjcPX3N
	/uczySXiQZJCmkjCMhQeJSmI+lwInqo/UCFgHt+Jhq7MzC4v1rr6qtrJffwwXj9KTmJE
	wX5C4HVfZ12HZ2vnyW6uV3yPB/JdFvjyjGGG3WeaGAXmuQMSNanCWJjCsCp4Lt6Lygi2
	Wv1FUs4hb24c4Swxyz/Y49zH4FWYU40lGYXdroezugfJNJySP/y5BxvKntvkFasikimw
	MnRQ==
X-Gm-Message-State: AOUpUlGDWxQJlDqdv6FOfSHvlaR0I2IB4+rn+Re1WlGKb7PLtiKtVX7G
	YMtmyMVcxT625O2ZNEMLSkIJxQbuxrQJM27ObmTAkA==
X-Google-Smtp-Source: AAOMgpeIvbmv0Mb4pOBDMK8Y8yePBOI/e1AnRv2zngPiE0jSjsrER6mhnBI8xbG/canhaBKlvzwafaPbEdDEFN25UV8=
X-Received: by 2002:ab0:5323:: with SMTP id x32-v6mr10299uax.139.1531339003403;
	Wed, 11 Jul 2018 12:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180710205302.14034-1-martin@geanix.com>
In-Reply-To: <20180710205302.14034-1-martin@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jul 2018 13:56:17 -0600
Message-ID: <CAMKF1srvhgegCJt8_VQWA04BeVFzFeBND=pjCzP7bbbPAvLr-Q@mail.gmail.com>
To: martin@geanix.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ell: update to 0.6
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
X-List-Received-Date: Wed, 11 Jul 2018 19:56:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin

This fails to build with musl targets with following error.

| In file included from ../git/ell/dhcp.c:30:
| /mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/ell/0.6-r0/recipe-sysroo=
t/usr/include/linux/if_arp.h:116:8:
error: redefinition of 'struct arpreq'
|  struct arpreq {
|         ^~~~~~
| In file included from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/ell/0.6-r0/recipe-sysroot/=
usr/include/netinet/if_ether.h:118,
|                  from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/ell/0.6-r0/recipe-sysroot/=
usr/include/net/ethernet.h:10,
|                  from ../git/ell/dhcp.c:28:
| /mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/ell/0.6-r0/recipe-sysroo=
t/usr/include/net/if_arp.h:101:8:
note: originally defined here
|  struct arpreq {
|         ^~~~~~
On Tue, Jul 10, 2018 at 3:01 PM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> Removed patch is upstreamed
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  .../0001-ell-fix-build-with-musl-libc.patch   | 39 -------------------
>  .../ell/{ell_0.4.bb =3D> ell_0.6.bb}            |  6 +--
>  2 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-=
musl-libc.patch
>  rename meta-oe/recipes-core/ell/{ell_0.4.bb =3D> ell_0.6.bb} (64%)
>
> diff --git a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-li=
bc.patch b/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.p=
atch
> deleted file mode 100644
> index a172a93ca..000000000
> --- a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patc=
h
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 4f8c68757b05d12392cd1a8aed174cb8e56f80e3 Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Thu, 5 Apr 2018 17:19:44 +0300
> -Subject: [PATCH] ell: fix build with musl libc
> -
> -musl libc doesn't implement TEMP_FAILURE_RETRY. Use the
> -TEMP_FAILURE_RETRY from glibc to fix build.
> -
> -Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-Apri=
l/001209.html]
> -
> -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ----
> - ell/dbus.h | 10 ++++++++++
> - 1 file changed, 10 insertions(+)
> -
> -diff --git a/ell/dbus.h b/ell/dbus.h
> -index a7c08d2..3ff5e0f 100644
> ---- a/ell/dbus.h
> -+++ b/ell/dbus.h
> -@@ -28,6 +28,16 @@
> - #include <stddef.h>
> - #include <stdarg.h>
> -
> -+/* taken from glibc unistd.h for musl support */
> -+#ifndef TEMP_FAILURE_RETRY
> -+#define TEMP_FAILURE_RETRY(expression)             \
> -+  (__extension__                                   \
> -+    ({ long int __result;                          \
> -+       do __result =3D (long int) (expression);      \
> -+       while (__result =3D=3D -1L && errno =3D=3D EINTR);  \
> -+       __result; }))
> -+#endif
> -+
> - #ifdef __cplusplus
> - extern "C" {
> - #endif
> ---
> -2.4.0
> -
> diff --git a/meta-oe/recipes-core/ell/ell_0.4.bb b/meta-oe/recipes-core/e=
ll/ell_0.6.bb
> similarity index 64%
> rename from meta-oe/recipes-core/ell/ell_0.4.bb
> rename to meta-oe/recipes-core/ell/ell_0.6.bb
> index 1524bd6b9..8e7c88c52 100644
> --- a/meta-oe/recipes-core/ell/ell_0.4.bb
> +++ b/meta-oe/recipes-core/ell/ell_0.6.bb
> @@ -7,10 +7,8 @@ SECTION =3D "libs"
>  inherit autotools pkgconfig
>
>  S =3D "${WORKDIR}/git"
> -SRCREV =3D "b4aea06fabb2af1af01f861f8f394c75950b6d47"
> -SRC_URI =3D "git://git.kernel.org/pub/scm/libs/ell/ell.git \
> -           file://0001-ell-fix-build-with-musl-libc.patch \
> -          "
> +SRCREV =3D "59ff3160fe55a841e662f8776f0520f2038235f4"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/libs/ell/ell.git"
>
>  do_configure_prepend () {
>      mkdir ${S}/build-aux
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

