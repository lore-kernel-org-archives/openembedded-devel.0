Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE1AD71999
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:10:08 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 50so25155180uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=nzgyba7ATsuPhRfQ1wQgLhyIEJGmc+y51fQ6wMHtMew=;
	b=y3VaR+PkKHTzAs5aPSYVDjRccE1xM4IeiZyvHduSrRtdQrw8geGBpfKdChyDiw1prr
	49wYoZUnNfgjOLYf+XUK9eF1DvFtcalDvnfqrBUr6hMQzUQakui13ioGHt1djq8zHuis
	7D8UCYqYLHyXsZ+DvkBTz8+DLgvKJpAr+X44cg+BQ3sMnWvqUM2d3DgdDwijQI5mqQbW
	58YyritDEx15MmnK+uUmDDVXU8MN7xLnPd/GbxM7KZVdWjbwT97YKPZc7YNuSNg3rx3b
	gf7uvjukjla3be8mwIEJBWkUH5c1Al0WLzwKtKDHIIBcShIfoDx+UQnmyZo1vXOxK9RD
	ofGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=nzgyba7ATsuPhRfQ1wQgLhyIEJGmc+y51fQ6wMHtMew=;
	b=FWVOFiKaVb61B91LEfTbsIUetNyWyj0u6Xqb0+WqPiK44cZoix/YIV8JQYapKVqyRl
	Pab3UJXYI//pBxh3aV7hBjDBmTOXek4v4o5zy0awpSV5f7tbcrx6VC9OQ8DSY9SCbWNi
	rQyaJrYp5hiAwI6qrq9iFuBexxzW0roENqSWqfz46H2VwoAm7g3AZbBOq0kB8Fywe01N
	O0du/g3aUQx+LgJvsS5W2LAwZcaDnFEMKW7qgtiA8Uzpp7I28w6HU/2m3DP8UKPChRHp
	/DjKtskx7dqE62GUQ7t/E2XJsvVCXDsbPN/tE6jVm7XvOdPKJ5vDq3xBcBj2czIO2tY6
	2MIg==
X-Gm-Message-State: AKaTC03ISaX70eSnkRMgvl5LgQqW0UkQANH0XKp7IWnyOdvJujVK9rTNnxLirXu1IkPLTfPTEjFbzjuzy31ILQ==
X-Received: by 10.176.0.180 with SMTP id 49mr7095947uaj.32.1479730210231; Mon,
	21 Nov 2016 04:10:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 21 Nov 2016 04:10:09 -0800 (PST)
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 21 Nov 2016 13:10:09 +0100
Message-ID: <CALbNGRQ=RwVWJ8ut4oHKyMx1L=C0afWbs-AW4oT4YL_Zaa53vQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/15] Revert "physfs: move to sources found at github/supertux"
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
X-List-Received-Date: Mon, 21 Nov 2016 12:10:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 6, 2016 at 11:06 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> This reverts commit 3bbec2b7921c83e13b64e808ef34122a608933f0.
>
> The commit was intended to make supertux in meta-games happy. Now I found=
 out
> that:
>
> * other packets e.g meta-retro d1x-rebirth segfault with supertux version=
 of physfs
> * supertux can be configured to use it's own physfs as static library
>
> To avoid package version counting backwards PE =3D 1 was added. The patch
> required for supertux was already applied in meta-games.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 ----------------=
------
>  .../recipes-support/physfs/physfs_2.0.3.bb         | 13 ++++++
>  .../recipes-support/physfs/physfs_git.bb           | 15 -------
>  3 files changed, 13 insertions(+), 67 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fi=
x-build-with-gcc-6.patch
>  create mode 100644 meta-filesystems/recipes-support/physfs/physfs_2.0.3.=
bb
>  delete mode 100644 meta-filesystems/recipes-support/physfs/physfs_git.bb
>
> diff --git a/meta-filesystems/recipes-support/physfs/files/0001-fix-build=
-with-gcc-6.patch b/meta-filesystems/recipes-support/physfs/files/0001-fix-=
build-with-gcc-6.patch
> deleted file mode 100644
> index 805c4a1..0000000
> --- a/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-g=
cc-6.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 06fe4c205094e0b65d3e5d1244f52089ed5bdafb Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Sun, 25 Sep 2016 23:50:22 +0200
> -Subject: [PATCH] fix build with gcc-6
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - src/archiver_zip.c | 1 -
> - src/physfs_miniz.h | 3 +++
> - 2 files changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/archiver_zip.c b/src/archiver_zip.c
> -index 5c4996d..3b436db 100644
> ---- a/src/archiver_zip.c
> -+++ b/src/archiver_zip.c
> -@@ -845,7 +845,6 @@ static ZIPentry *zip_hash_ancestors(ZIPinfo *info, c=
har *name)
> -     if (sep)
> -     {
> -         const size_t namelen =3D (sep - name) + 1;
> --        ZIPentry *parent;
> -
> -         *sep =3D '\0';  /* chop off last piece. */
> -         retval =3D zip_find_entry(info, name);
> -diff --git a/src/physfs_miniz.h b/src/physfs_miniz.h
> -index 619cb71..fd877c0 100644
> ---- a/src/physfs_miniz.h
> -+++ b/src/physfs_miniz.h
> -@@ -194,6 +194,8 @@ struct tinfl_decompressor_tag
> -     code_len =3D TINFL_FAST_LOOKUP_BITS; do { temp =3D (pHuff)->m_tree[=
~temp + ((bit_buf >> code_len++) & 1)]; } while (temp < 0); \
> -   } sym =3D temp; bit_buf >>=3D code_len; num_bits -=3D code_len; } MZ_=
MACRO_END
> -
> -+#pragma GCC diagnostic push
> -+#pragma GCC diagnostic ignored "-Wmisleading-indentation"
> - static tinfl_status tinfl_decompress(tinfl_decompressor *r, const mz_ui=
nt8 *pIn_buf_next, size_t *pIn_buf_size, mz_uint8 *pOut_buf_start, mz_uint8=
 *pOut_buf_next, size_t *pOut_buf_size, const mz_uint32 decomp_flags)
> - {
> -   static const int s_length_base[31] =3D { 3,4,5,6,7,8,9,10,11,13, 15,1=
7,19,23,27,31,35,43,51,59, 67,83,99,115,131,163,195,227,258,0,0 };
> -@@ -465,6 +467,7 @@ common_exit:
> -   }
> -   return status;
> - }
> -+#pragma GCC diagnostic pop
> -
> - /* Flush values. For typical usage you only need MZ_NO_FLUSH and MZ_FIN=
ISH. The other stuff is for advanced use. */
> - enum { MZ_NO_FLUSH =3D 0, MZ_PARTIAL_FLUSH =3D 1, MZ_SYNC_FLUSH =3D 2, =
MZ_FULL_FLUSH =3D 3, MZ_FINISH =3D 4, MZ_BLOCK =3D 5 };
> ---
> -2.5.5
> -
> diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/me=
ta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
> new file mode 100644
> index 0000000..dc2c106
> --- /dev/null
> +++ b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "PhysicsFS is a library to provide abstract access to variou=
s archives"
> +HOMEAPAGE =3D "http://icculus.org/physfs"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5d94e3eaaa10b00ca803ba35a=
3e87cde"
> +DEPENDS =3D "readline zlib"
> +
> +inherit cmake
> +
> +PE =3D "1"
> +
> +SRC_URI =3D "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "c2c727a8a8deb623b521b52d0080f613"
> +SRC_URI[sha256sum] =3D "ca862097c0fb451f2cacd286194d071289342c107b6fe690=
79c079883ff66b69"
> diff --git a/meta-filesystems/recipes-support/physfs/physfs_git.bb b/meta=
-filesystems/recipes-support/physfs/physfs_git.bb
> deleted file mode 100644
> index a50715c..0000000
> --- a/meta-filesystems/recipes-support/physfs/physfs_git.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY =3D "PhysicsFS is a library to provide abstract access to variou=
s archives"
> -HOMEAPAGE =3D "http://icculus.org/physfs"
> -LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4424d2cfb8a288df2843c4467=
b5d719a"
> -DEPENDS =3D "readline zlib"
> -
> -inherit cmake
> -
> -SRC_URI =3D " \
> -    git://github.com/SuperTux/physfs.git \
> -    file://0001-fix-build-with-gcc-6.patch \
> -"
> -SRCREV =3D "f3b45a94d0b7c0a85469b1e60fefd8383b6719ba"
> -S =3D "${WORKDIR}/git"
> -PV =3D "2.0.3+git${SRCPV}"
> --
> 2.5.5
>

ping on whole series

