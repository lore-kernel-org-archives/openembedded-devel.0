Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6A46D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 15:13:38 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d10so23178055qko.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 08:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TgSZ8cdufq9LO3z9802XqTbvBDRo08BDQ7CUdI5oE40=;
	b=M685NoJH4NoeSGkSgectw3XiJvccKdNA43nFTxIGmER9vwm4eTzUNVwszCaNbqfiRj
	7k29ryImgST8r4SwyQYYv0UOSv6hnuDgXs5i2NsX+uywZMVf5dNPptGBk3PKnClLjL8z
	vzkVvLQkVAXohIDOKQxLC5nnMHCbP2ya2Rw9pnPvGQpM02v4mRm4FESeAAH8pk/4PgeG
	FI9/c522nqCjZnhoBuG9+GOrsJqG+AM0oyTcwkJipWZ/pPeHSDCkhgFHTWhSbq/ytHEB
	LRBidx0i+rABWn4hsLxTQ2fDvKVRy5hSada1D1LEkoa68E8P5ZPS9pU0Rn3OHrQebz22
	3RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TgSZ8cdufq9LO3z9802XqTbvBDRo08BDQ7CUdI5oE40=;
	b=g5PPTahegv2Q5LA9S4LwNp+DYT6Y0jhxqK+bK+8IHWFzVJmMy9pcgBuL/7wTCAUJMs
	uzdgEQgwXnpF5cc/J0tMzszK+DMsJVhKqxR1QQ3xLYWMBwS9A1xKJgx/27/RBZSGKoKp
	9HZH5thcsVKGbIeL3u2PDdcBWlY8uzpksLiIVBHMIngY6xeUkqD/04a3R9vLe6RYwigA
	jrmtCK4BQSzuEAPshCAsNXdawwWOfq9pcUZpmxauwT4q0lIhfUbH7Jrvikust9ZHeIZY
	IL6Cyx7d2mvZ9dCObUFpDjbuwwHT9ey8Wn9hsKzyxeTD5Tol+opbjuntbrfyoviAeFRY
	Xsfg==
X-Gm-Message-State: APjAAAXwJ9smKRqqNAVXt+GpkB8ewE6UOE2dJRL9SfCavk5zpaL3/PxT
	xUicsQTUbbz3CCL9mE6el8loT2YR14rc8jJDfWz6Yiug
X-Google-Smtp-Source: APXvYqzb9SCAnOijZCYkafPH6xWP+UtoAiYy/3xA2rbzSi9qYmS2ffaQPvEcnUI1ctH6q2Kq7q/RYlerQYyDABV2F5M=
X-Received: by 2002:a37:b287:: with SMTP id b129mr83627976qkf.20.1559056418642;
	Tue, 28 May 2019 08:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190522131345.10392-1-andrei@gherzan.ro>
In-Reply-To: <20190522131345.10392-1-andrei@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 May 2019 08:13:11 -0700
Message-ID: <CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 15:13:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrei

The musl patches need to be forward ported as well. They dont apply
cleanly anymore on top of this update.

On Wed, May 22, 2019 at 6:14 AM Andrei Gherzan <andrei@gherzan.ro> wrote:
>
> One patch was dropped (0003-dlopen-failure.patch) as a similar one was
> merged upstream. See:
> https://github.com/NetworkManager/NetworkManager/commit/bd4957fcd78a0e64d=
26459e94ab3b84c91cd6f5f
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../networkmanager/0003-dlopen-failure.patch  | 34 -------------------
>  ...ger_1.16.0.bb =3D> networkmanager_1.18.0.bb} |  6 ++--
>  2 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0003-dlopen-failure.patch
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.16.0.bb =3D> networkmanager_1.18.0.bb} (96%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0003-dlopen-failure.patch b/meta-networking/recipes-connectivity/net=
workmanager/networkmanager/0003-dlopen-failure.patch
> deleted file mode 100644
> index e99c22710..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0003-dlopen-failure.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Thu, 22 Mar 2018 18:18:06 +0100
> -Subject: [PATCH] musl: dlopen is included so LD_LIBS=3D"" instead of
> - LD_LIBS=3D"none required"
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Pending
> -
> -Stolen from [1] and prettyfied slightly
> -
> -[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/Netwo=
rkManager/patches
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ----
> - configure.ac | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 487a266..96ae4f7 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -235,6 +235,7 @@ dnl
> - dnl Checks for libdl - on certain platforms its part of libc
> - dnl
> - AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=3D])
> -+AS_IF([test "$ac_cv_search_dlopen" =3D "none required"],[ac_cv_search_d=
lopen=3D""])
> - AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
> -
> - PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >=3D 2.37.6 gmodule-2.0],
> ---
> -2.14.3
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.18.0.bb
> similarity index 96%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.16.0.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.18.0.bb
> index 9f01f1bc1..9215a8676 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.16.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.18.0.bb
> @@ -26,15 +26,13 @@ SRC_URI =3D " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
>      file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch=
 \
>      file://0002-Do-not-create-settings-settings-property-documentati.pat=
ch \
> -    file://0003-dlopen-failure.patch \
>  "
>  SRC_URI_append_libc-musl =3D " \
>      file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
>      file://musl/0002-Fix-build-with-musl.patch \
>  "
> -
> -SRC_URI[md5sum] =3D "10abacaafb162a67d2942adf03e7e9e4"
> -SRC_URI[sha256sum] =3D "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef=
098d05f2324c5d2c"
> +SRC_URI[md5sum] =3D "c8c27116a8083bab5d5fcca0d03e988a"
> +SRC_URI[sha256sum] =3D "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd=
6b0847d29d2a8ba6"
>
>  UPSTREAM_CHECK_URI =3D "${GNOME_MIRROR}/NetworkManager/1.16/"
>  UPSTREAM_CHECK_REGEX =3D "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz=
"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

