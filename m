Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9F4606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 02:00:36 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1a3aFA-0001HA-Lo from Joe_MacDonald@mentor.com ;
	Mon, 30 Nov 2015 18:00:36 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Nov 2015 18:00:36 -0800
Received: by burninator (Postfix, from userid 1000)	id 46D3158089E; Mon, 30
	Nov 2015 21:00:35 -0500 (EST)
Date: Mon, 30 Nov 2015 21:00:35 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <kai.kang@windriver.com>
Message-ID: <20151201020034.GC20849@mentor.com>
References: <1448869131-24453-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448869131-24453-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6
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
X-List-Received-Date: Tue, 01 Dec 2015 02:00:37 -0000
X-Groupsio-MsgNum: 58854
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kai,

Can you re-submit this based on the long-lingering merge of my xl2tpd
upgrade now in master?

-J.

[[oe] [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6] On 15.11.30 (Mon 15:=
38) kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
>=20
> Upgrade xl2tpd v1.3.0-46-gdf7e30e to 1.3.6.
>=20
> * drop PR
> * add patch to fix build warnings with gcc 5.x:
>=20
> | misc.h:68:20: warning: inline function 'swaps' declared but never defin=
ed
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-protocols/xl2tpd/xl2tpd.inc            |   2 -
>  .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 +++++++++++++++=
++++++
>  .../xl2tpd/{xl2tpd_git.bb =3D> xl2tpd_1.3.6.bb}      |   4 +-
>  3 files changed, 136 insertions(+), 4 deletions(-)
>  create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-i=
nline-functions-errors-with-gcc-5.x.patch
>  rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_git.bb =3D> xl2t=
pd_1.3.6.bb} (15%)
>=20
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-n=
etworking/recipes-protocols/xl2tpd/xl2tpd.inc
> index ffec167..d2402c5 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> @@ -8,8 +8,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -INC_PR =3D "r0"
> -
>  SRC_URI =3D "git://github.com/xelerance/xl2tpd.git"
> =20
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-f=
unctions-errors-with-gcc-5.x.patch b/meta-networking/recipes-protocols/xl2t=
pd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
> new file mode 100644
> index 0000000..b75c912
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-function=
s-errors-with-gcc-5.x.patch
> @@ -0,0 +1,134 @@
> +Upstream-Status: Backport
> +
> +Backport from https://github.com/xelerance/xl2tpd/commit/9098f64950eb22c=
f049058d40f647bafdb822174
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +From 9098f64950eb22cf049058d40f647bafdb822174 Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Wed, 23 Sep 2015 10:41:05 +0800
> +Subject: [PATCH] Fix build errors caused by inline function with gcc 5
> +
> +GCC 5 defaults to -std=3Dgnu11 instead of -std=3Dgnu89. And -std=3Dgnu89
> +employs the GNU89 inline semantics, -std=3Dgnu11 uses the C99 inline
> +semantics.
> +
> +For 'inline' fuction, it is NOT exported by C99. So error messages such =
as:
> +
> +| control.c:1717: undefined reference to `check_control'
> +
> +For these functions which is not referred by other compile units, make
> +them 'static inline'.
> +
> +For 'extern inline' function, it fails such as:
> +
> +| misc.h:68:20: warning: inline function 'swaps' declared but never defi=
ned
> +|  extern inline void swaps (void *, int);
> +|                      ^
> +
> +Because function swaps() is referred by other compile units, it must be
> +exported. The semantics of 'extern inline' are not same between GNU89
> +and C99, so remove 'inline' attribute for compatible with GNU89.
> +
> +Ref:
> +https://gcc.gnu.org/gcc-5/porting_to.html
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + control.c | 8 ++++----
> + misc.c    | 2 +-
> + misc.h    | 2 +-
> + network.c | 4 ++--
> + 4 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/control.c b/control.c
> +index b2891a9..c4a39b5 100644
> +--- a/control.c
> ++++ b/control.c
> +@@ -1140,7 +1140,7 @@ int control_finish (struct tunnel *t, struct call =
*c)
> +     return 0;
> + }
> +=20
> +-inline int check_control (const struct buffer *buf, struct tunnel *t,
> ++static inline int check_control (const struct buffer *buf, struct tunne=
l *t,
> +                           struct call *c)
> + {
> +     /*
> +@@ -1276,7 +1276,7 @@ inline int check_control (const struct buffer *buf=
, struct tunnel *t,
> +     return 0;
> + }
> +=20
> +-inline int check_payload (struct buffer *buf, struct tunnel *t,
> ++static inline int check_payload (struct buffer *buf, struct tunnel *t,
> +                           struct call *c)
> + {
> +     /*
> +@@ -1382,7 +1382,7 @@ inline int check_payload (struct buffer *buf, stru=
ct tunnel *t,
> + #endif
> +     return 0;
> + }
> +-inline int expand_payload (struct buffer *buf, struct tunnel *t,
> ++static inline int expand_payload (struct buffer *buf, struct tunnel *t,
> +                            struct call *c)
> + {
> +     /*
> +@@ -1562,7 +1562,7 @@ void send_zlb (void *data)
> +     toss (buf);
> + }
> +=20
> +-inline int write_packet (struct buffer *buf, struct tunnel *t, struct c=
all *c,
> ++static inline int write_packet (struct buffer *buf, struct tunnel *t, s=
truct call *c,
> +                          int convert)
> + {
> +     /*
> +diff --git a/misc.c b/misc.c
> +index 3092401..af90dbf 100644
> +--- a/misc.c
> ++++ b/misc.c
> +@@ -170,7 +170,7 @@ void do_packet_dump (struct buffer *buf)
> +     printf ("}\n");
> + }
> +=20
> +-inline void swaps (void *buf_v, int len)
> ++void swaps (void *buf_v, int len)
> + {
> + #ifdef __alpha
> +     /* Reverse byte order alpha is little endian so lest save a step.
> +diff --git a/misc.h b/misc.h
> +index aafdc62..caab7a1 100644
> +--- a/misc.h
> ++++ b/misc.h
> +@@ -65,7 +65,7 @@ extern void l2tp_log (int level, const char *fmt, ...);
> + extern struct buffer *new_buf (int);
> + extern void udppush_handler (int);
> + extern int addfcs (struct buffer *buf);
> +-extern inline void swaps (void *, int);
> ++extern void swaps (void *, int);
> + extern void do_packet_dump (struct buffer *);
> + extern void status (const char *fmt, ...);
> + extern void status_handler (int signal);
> +diff --git a/network.c b/network.c
> +index b1268c6..d324a71 100644
> +--- a/network.c
> ++++ b/network.c
> +@@ -135,7 +135,7 @@ int init_network (void)
> +     return 0;
> + }
> +=20
> +-inline void extract (void *buf, int *tunnel, int *call)
> ++static inline void extract (void *buf, int *tunnel, int *call)
> + {
> +     /*
> +      * Extract the tunnel and call #'s, and fix the order of the=20
> +@@ -155,7 +155,7 @@ inline void extract (void *buf, int *tunnel, int *ca=
ll)
> +     }
> + }
> +=20
> +-inline void fix_hdr (void *buf)
> ++static inline void fix_hdr (void *buf)
> + {
> +     /*
> +      * Fix the byte order of the header
> +--=20
> +2.6.1
> +
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/met=
a-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
> similarity index 15%
> rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
> rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
> index bd084aa..aac11b7 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
> @@ -1,5 +1,5 @@
>  require xl2tpd.inc
> -PR =3D "${INC_PR}.0"
> =20
> -SRCREV =3D "df7e30eb199fc5710faa83866381aea18b66e60c"
> +SRCREV =3D "5619e1771048e74b729804e8602f409af0f3faea"
> =20
> +SRC_URI +=3D "file://fix-inline-functions-errors-with-gcc-5.x.patch"
> --=20
> 2.6.1
>=20
--=20
-Joe MacDonald.
:wq

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWXP9CAAoJEEn8ffcsOfaWNJwH/iPV4hmq6vTD8s9LYpksozgy
484F/u4IupOfSue601q5ntb4gWbZD0iq1bIhO8svhcHyiwVDX4jFOotBTcRtrBHm
lK96t54xoMVbE1exawxnYT2DU1sg6G519pjfmiS740DTw51Nt3fTm/4KjSBN8gSq
Az5wUppfSN8zsNjOuHxb7XVTQJSHY+L1+hUINYxR7ncUuvgK8ItdZPoAalBCTYkc
cLIdrCQSOKADYpdpsMzagx0UmlQzP+Php6ggKkG6KeLAzcsMhMt4GvHq59E/MUdt
mveoOf7oLThmaJauknveHDGUkA/N5JYObiJzf9g0VzXmMa0hNfkWHzK9/wZ8hKA=
=bdW6
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
