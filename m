Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0A57F75F3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 18:40:59 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1Ze61L-0007hx-M5 from Joe_MacDonald@mentor.com ;
	Mon, 21 Sep 2015 11:40:59 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Sep 2015 11:40:58 -0700
Received: by burninator (Postfix, from userid 1000)	id 05B1F5878C2; Mon, 21
	Sep 2015 14:39:46 -0400 (EDT)
Date: Mon, 21 Sep 2015 14:39:46 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <kai.kang@windriver.com>
Message-ID: <20150921183945.GA4700@mentor.com>
References: <1442567670-16066-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1442567670-16066-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6
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
X-List-Received-Date: Mon, 21 Sep 2015 18:41:02 -0000
X-Groupsio-MsgNum: 57495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kai,

[[oe] [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6] On 15.09.18 (Fri 17:=
14) kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
>=20
> Upgrade xl2tpd v1.3.0-46-gdf7e30e to 1.3.6.
>=20
> * drop PR
> * add patch to fix build failure with gcc 5.x
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-protocols/xl2tpd/xl2tpd.inc            |   2 -
>  .../fix-inline-functions-errors-with-gcc-5.x.patch | 116 +++++++++++++++=
++++++
>  .../recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb       |   5 +
>  .../recipes-protocols/xl2tpd/xl2tpd_git.bb         |   5 -
>  4 files changed, 121 insertions(+), 7 deletions(-)
>  create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-i=
nline-functions-errors-with-gcc-5.x.patch
>  create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6=
=2Ebb
>  delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
>=20
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-n=
etworking/recipes-protocols/xl2tpd/xl2tpd.inc
> index 1a72fd1..03a1a0b 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> @@ -6,8 +6,6 @@ DEPENDS =3D "ppp virtual/kernel"
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
> index 0000000..dc78f02
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-function=
s-errors-with-gcc-5.x.patch
> @@ -0,0 +1,116 @@
> +Upstream-Status: Pending
> +
> +GCC 5.x defaults to -std=3Dgnu11 instead of -std=3Dgnu89. The semantics =
for
> +inline functions changes which causes build failures such as:
> +
> +| misc.h:68:20: warning: inline function 'swaps' declared but never defi=
ned
> +|  extern inline void swaps (void *, int);
> +|                      ^
> +
> +and
> +
> +| control.c:1717: undefined reference to `check_control'
> +
> +Fix them by:
> +1 drop 'inline' attribute for function swap()

The question about whether 'inline' belongs in a .c file or not aside
(that's obviously not your department, that's how it is in the original
code), why is swaps() treated differently than every other function?  If
the compiler really needed to be told 'inline' on all of these, this
just ensures that swaps() is never inlined.  Is that your intent?

-J.

> +2 replace 'inline' with 'static inline' for other functions
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
> +index 134a7bf..0ef505b 100644
> +--- a/control.c
> ++++ b/control.c
> +@@ -1139,7 +1139,7 @@ int control_finish (struct tunnel *t, struct call =
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
> +@@ -1275,7 +1275,7 @@ inline int check_control (const struct buffer *buf=
, struct tunnel *t,
> +     return 0;
> + }
> +=20
> +-inline int check_payload (struct buffer *buf, struct tunnel *t,
> ++static inline int check_payload (struct buffer *buf, struct tunnel *t,
> +                           struct call *c)
> + {
> +     /*
> +@@ -1381,7 +1381,7 @@ inline int check_payload (struct buffer *buf, stru=
ct tunnel *t,
> + #endif
> +     return 0;
> + }
> +-inline int expand_payload (struct buffer *buf, struct tunnel *t,
> ++static inline int expand_payload (struct buffer *buf, struct tunnel *t,
> +                            struct call *c)
> + {
> +     /*
> +@@ -1561,7 +1561,7 @@ void send_zlb (void *data)
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
> +index 5e5b8b2..b019c2c 100644
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
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/m=
eta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
> new file mode 100644
> index 0000000..aac11b7
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
> @@ -0,0 +1,5 @@
> +require xl2tpd.inc
> +
> +SRCREV =3D "5619e1771048e74b729804e8602f409af0f3faea"
> +
> +SRC_URI +=3D "file://fix-inline-functions-errors-with-gcc-5.x.patch"
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/met=
a-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
> deleted file mode 100644
> index bd084aa..0000000
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require xl2tpd.inc
> -PR =3D "${INC_PR}.0"
> -
> -SRCREV =3D "df7e30eb199fc5710faa83866381aea18b66e60c"
> -
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWAE7uAAoJEEn8ffcsOfaWqlwIAMBb5pJDr7CzdLgT9RjJp+SC
LBZiMZP8+4Y7SrPONWWqu/EhEkoH3o2qvrBwhdu/+2LaXaT11hloyEUzwECkT+Nu
ehhxnM6Tgcyz7lr0v6sOx/99a/lFRAi2fzw1cWoy8c+l85+CMpFEtGlC57tsppeo
5bBcyX3VTvK/uWQt/IWQQjZGJVs2TzLZAElrYBzIu/ng1ZS1HpTk+Ih9WkTxZ09S
RBUu2Rvpk/nk/jeNxTQJgq+YyD0ayu1QJfIIWk2MBPY96YfUcpZoARkifekuXblN
TNQ7SY7iRP2ozEnVvBTrMVcs/DkUruzjnY06lnt7qyhT628LtmxBDze5RLwt8yY=
=8joY
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
