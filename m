Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6788BCAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 22:30:03 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.web11.1248.1758925800576699349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 15:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TeUNpI32;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-636d5cefab2so2109919d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758925800; x=1759530600; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xghu7LSo7S+hoc1g9gt/LmSBaPel9X+1SX2Hpcl0Jq8=;
        b=TeUNpI32ITX0NTX89wu2enrBOmcpbKnPfewQBmG08vtM3naO/3tFSS93i5t7anZAwY
         q7/zYaTkNKSHOXjRs3gLVROTLVSq3S1NMd4qgdlvy2TW30HCe81dpdwKuFwnxcNSBiGv
         YTMMjDFhLj+OWb0ykk7rOa8RA4c4iKckulw4lUjetw88DR1cgpVGkupYVgiBQN5wioew
         3XSAkqJDv8n2eOaJMPqFxQgjMz02mbRzVJpnk/3uEqgwBI+mNl/9xkjHKiMkNaAh21yu
         W3pMj32fghB43ijK6no8tOwzr7Yakqc3ddJ8Kd/midOeiTHyEfH7kZdrL0debDKQ/rnr
         GBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758925800; x=1759530600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xghu7LSo7S+hoc1g9gt/LmSBaPel9X+1SX2Hpcl0Jq8=;
        b=q6tzsT0NeBi5B9VFstEzSlR4mCNqgVz+R2hHWEq22GIJ6ckozRS0/CfnB69IQRma5c
         ywn3vUQrpC+WYY7uGw+yQ7cRe1e9B4dpoR7mEqXEugZEvfg/MedvENS8Gs4IDmfRyNNj
         t8F5HY7hPQmpQ+er5ksTjXShG6fuo8KhMFKXSziaf1tBMWXf36VRuw9ts3CsU9wfypPk
         HyvnGBqD4SHd6zkqy9y3ztda/NnYN8d5uzD9MXlN6L/qXB1ovgTOZToMCxw4vDpSCLw8
         0MFUwCqQ7VBXPAQbv9QsAVWQkDajUFGlEAY2p8XR2FNRgx1zqOE4WTp6VZjwlcoxTvJX
         K6fw==
X-Gm-Message-State: AOJu0Yz3WrolKTxcaKZWLuZ5Og/2uUml5dtAyLjTyOaZAg1tWopWtqiC
	wLbERpasu4ZBk2jrPT/XQB/rd130VJklWJK3wicBtFSoLBl30HRamRZCfeWw0Jtg6HKTz08B/n/
	2nZYYF5gLT396RhZfBz081QY85o1O/6oq7W4J
X-Gm-Gg: ASbGncu6LvjwTeDvSrUD1H8fgbr4rlNv3qlwMJbBCd41i+jakwnnyZ5/vL9j3AQcevo
	E0jAcykA5WRqk5uAItL4Hr3d5yU+09fvrouQm6VQ+X+lh6iC0lr1kFTzwS6Flf0y3tF0wwIeQUm
	TWPmFtQtodIKhTZTC/pQVaaHIEutj6+TEhU5Qu4tVomxkfWp5ISOsFtjkqyc7EB/psb1FcCnX16
	BOhAaeNpqrbtYT2b7Lz7TFabCsHQwdkwal6/mDDlROnFqGon+cphqrL4lBwIbz6IMdUQcvcgYO2
	Qc/ZeGp9xArYEE4xcgQbcTI1OE0TO7sTG/rtjXJaTmPghIuxhmW/DcgkL3Lz/JxXQrZM
X-Google-Smtp-Source: AGHT+IH8f9cSLTZTeMvJm6Ltv729zJRsRuoeYUBGUcunFqf0bjMYgAZIUtMZEkfUHa2e+Q37jlX8jRcKypAFB/45I/A=
X-Received: by 2002:a05:690e:42d0:b0:606:680:de8a with SMTP id
 956f58d0204a3-6361a6eb9bcmr6929662d50.11.1758925799554; Fri, 26 Sep 2025
 15:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250926192025.894307-1-danismostlikely@gmail.com>
In-Reply-To: <20250926192025.894307-1-danismostlikely@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Sep 2025 15:29:33 -0700
X-Gm-Features: AS18NWAkhBgZWlo9-jEBJ8Hnn2exbnOWrStnzsoYgXkC-fFLyULlBPovExx7hTA
Message-ID: <CAMKF1soLiq4CZxL6mCd76KA08uVBF4BLD=YfCyDK7KfN3mTE5A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] netcat-openbsd: update to 1.228
To: danismostlikely@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@usask.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 22:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119945

On Fri, Sep 26, 2025 at 12:20=E2=80=AFPM Dan McGregor via
lists.openembedded.org
<danismostlikely=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> A version newer than 1.195 is required for certain features of newer
> versions of cloud-init.  May as well bump to the version in Debian
> Testing.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  ...1-bundle-own-base64-encode-decode-functions.patch | 12 ++++++------
>  .../0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch  | 10 +++++-----
>  ...tcat-openbsd_1.195.bb =3D> netcat-openbsd_1.228.bb} | 12 +++++-------
>  3 files changed, 16 insertions(+), 18 deletions(-)
>  rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.195.bb =
=3D> netcat-openbsd_1.228.bb} (64%)
>
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-b=
undle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-su=
pport/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.=
patch
> index 929f63f4a9c..7e665d777fb 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-o=
wn-base64-encode-decode-functions.patch
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-o=
wn-base64-encode-decode-functions.patch
> @@ -14,7 +14,7 @@ Update to version 1.190-2
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   Makefile |   4 +-
> - base64.c | 313 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + base64.c | 313 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   netcat.c |   3 +
>   socks.c  |   3 +
>   4 files changed, 321 insertions(+), 2 deletions(-)
> @@ -360,8 +360,8 @@ diff --git a/netcat.c b/netcat.c
>  index a0fb51b..9c4ed23 100644
>  --- a/netcat.c
>  +++ b/netcat.c
> -@@ -240,6 +240,9 @@ static int connect_with_timeout(int fd, const struct=
 sockaddr *sa,
> -
> +@@ -239,6 +239,9 @@ char *proto_name(int, int);
> + static int connect_with_timeout(int, const struct sockaddr *, socklen_t=
, int);
>   static void quit();
>
>  +int    b64_ntop(u_char const *src, size_t srclength, char *target, size=
_t targsize);
> @@ -378,10 +378,10 @@ index 9068f39..c576f6b 100644
>   #define SOCKS_DOMAIN  3
>   #define SOCKS_IPV6    4
>
> -+int    b64_ntop(u_char const *src, size_t srclength, char *target, size=
_t targsize);
> -+int    b64_pton(char const *src, u_char *target, size_t targsize);
> ++int   b64_ntop(u_char const *src, size_t srclength, char *target, size_=
t targsize);
> ++int   b64_pton(char const *src, u_char *target, size_t targsize);
>  +
> - int   remote_connect(const char *, const char *, struct addrinfo);
> + int   remote_connect(const char *, const char *, struct addrinfo, char =
*);
>   int   socks_connect(const char *, const char *, struct addrinfo,
>             const char *, const char *, struct addrinfo, int,
>  --
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-f=
ix-netcat-openbsd-ftbfs-with-GCC-15.patch b/meta-networking/recipes-support=
/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
> index c1757d39ad8..d574ee0b67c 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netc=
at-openbsd-ftbfs-with-GCC-15.patch
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netc=
at-openbsd-ftbfs-with-GCC-15.patch
> @@ -28,19 +28,19 @@ Signed-off-by: mark.yang <mark.yang@lge.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/netcat.c b/netcat.c
> -index d70598a..b8ba959 100644
> +index 62d01d8..7367f47 100644
>  --- a/netcat.c
>  +++ b/netcat.c
> -@@ -238,7 +238,7 @@ char *proto_name(int uflag, int dccpflag);
> - static int connect_with_timeout(int fd, const struct sockaddr *sa,
> -         socklen_t salen, int ctimeout);
> +@@ -237,7 +237,7 @@ ssize_t fillbuf(int, unsigned char *, size_t *);
>
> + char *proto_name(int, int);
> + static int connect_with_timeout(int, const struct sockaddr *, socklen_t=
, int);
>  -static void quit();
>  +static void quit(int sig);
>
>   int    b64_ntop(u_char const *src, size_t srclength, char *target, size=
_t targsize);
>   int    b64_pton(char const *src, u_char *target, size_t targsize);
> -@@ -2235,7 +2235,7 @@ usage(int ret)
> +@@ -2347,7 +2347,7 @@ usage(int ret)
>    * quit()
>    * handler for a "-q" timeout (exit 0 instead of 1)
>    */
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.=
bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
> similarity index 64%
> rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.195.b=
b
> rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
> index 99ae90aa914..af01f7f2ac4 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
> @@ -2,21 +2,19 @@ require netcat.inc
>  SUMMARY =3D "OpenBSD Netcat"
>  HOMEPAGE =3D "http://ftp.debian.org"
>  LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Df39e60ae4ea9fdb559c8=
33be2e59de99"
> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D7c58e21ba8c9e76c25f4=
6b2182b23bb8"
>

What changed here ? Please update the reason in commit message with
License-update: tag

>  DEPENDS +=3D "glib-2.0 libbsd"
>  do_patch[depends] =3D "quilt-native:do_populate_sysroot"
>
> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20181022T085404Z/=
pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=3Dnetcat \
> -           http://snapshot.debian.org/archive/debian/20181022T085404Z/po=
ol/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=3Dnetcat=
-patch;subdir=3D${BP} \
> +SRC_URI =3D "http://snapshot.debian.org/archive/debian/20250301T025722Z/=
pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=3Dnetcat \
> +           http://snapshot.debian.org/archive/debian/20250301T025722Z/po=
ol/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=3Dnetcat=
-patch;subdir=3D${BP} \
>             file://0001-bundle-own-base64-encode-decode-functions.patch \
>             file://0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch \
>             "
>
> -SRC_URI[netcat.md5sum] =3D "219d5e49c45658e229a3bda63063a986"
> -SRC_URI[netcat.sha256sum] =3D "0e283b2a214313c69447cd962c528ac19afb3ddfe=
606b25de6d179f187cde4c3"
> -SRC_URI[netcat-patch.md5sum] =3D "7eba241989dbef6caa78ec4bc8e35151"
> -SRC_URI[netcat-patch.sha256sum] =3D "c6736fcbab5254cbbc52278993a951da112=
6e42800a297c27db297e332e2017e"
> +SRC_URI[netcat.sha256sum] =3D "e501b0239db0d8f981b964adee74effe80e6337e5=
d402a00515a6df8d933269e"
> +SRC_URI[netcat-patch.sha256sum] =3D "7989cc18b3ffa4ef1da57149bd3fc039995=
46a91c35b82b49caf4d758015c573"
>
>  inherit pkgconfig
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119937): https://lists.openembedded.org/g/openembedde=
d-devel/message/119937
> Mute This Topic: https://lists.openembedded.org/mt/115454852/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

