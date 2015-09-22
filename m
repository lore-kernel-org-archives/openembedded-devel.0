Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EAAC373243
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:43:15 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1ZeNql-0006ws-8y from Joe_MacDonald@mentor.com ;
	Tue, 22 Sep 2015 06:43:15 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 06:43:13 -0700
Received: by burninator (Postfix, from userid 1000)	id 186B4587588; Tue, 22
	Sep 2015 09:42:02 -0400 (EDT)
Date: Tue, 22 Sep 2015 09:42:02 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20150922134201.GA5217@mentor.com>
References: <1442567670-16066-1-git-send-email-kai.kang@windriver.com>
	<20150921183945.GA4700@mentor.com> <56010810.2020207@windriver.com>
MIME-Version: 1.0
In-Reply-To: <56010810.2020207@windriver.com>
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
X-List-Received-Date: Tue, 22 Sep 2015 13:43:16 -0000
X-Groupsio-MsgNum: 57500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6] On 15.09.22 (Tue=
 15:49) Kang Kai wrote:

> On 2015=E5=B9=B409=E6=9C=8822=E6=97=A5 02:39, Joe MacDonald wrote:
>=20
>     Hi Kai,
>=20
>     [[oe] [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6] On 15.09.18 (F=
ri 17:14) kai.kang@windriver.com wrote:
>=20
>=20
>         From: Kai Kang <kai.kang@windriver.com>
>=20
>         Upgrade xl2tpd v1.3.0-46-gdf7e30e to 1.3.6.
>=20
>         * drop PR
>         * add patch to fix build failure with gcc 5.x
>=20
>         Signed-off-by: Kai Kang <kai.kang@windriver.com>
>         ---
>          .../recipes-protocols/xl2tpd/xl2tpd.inc            |   2 -
>          .../fix-inline-functions-errors-with-gcc-5.x.patch | 116 +++++++=
++++++++++++++
>          .../recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb       |   5 +
>          .../recipes-protocols/xl2tpd/xl2tpd_git.bb         |   5 -
>          4 files changed, 121 insertions(+), 7 deletions(-)
>          create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2t=
pd/fix-inline-functions-errors-with-gcc-5.x.patch
>          create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2t=
pd_1.3.6.bb
>          delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2t=
pd_git.bb
>=20
>         diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc =
b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
>         index 1a72fd1..03a1a0b 100644
>         --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
>         +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
>         @@ -6,8 +6,6 @@ DEPENDS =3D "ppp virtual/kernel"
>          LICENSE =3D "GPLv2"
>          LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0636e73ff0215e8d672dc=
4c32c317bb3"
>=20
>         -INC_PR =3D "r0"
>         -
>          SRC_URI =3D "git://github.com/xelerance/xl2tpd.git"
>=20
>          S =3D "${WORKDIR}/git"
>         diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-=
inline-functions-errors-with-gcc-5.x.patch b/meta-networking/recipes-protoc=
ols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
>         new file mode 100644
>         index 0000000..dc78f02
>         --- /dev/null
>         +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-=
functions-errors-with-gcc-5.x.patch
>         @@ -0,0 +1,116 @@
>         +Upstream-Status: Pending
>         +
>         +GCC 5.x defaults to -std=3Dgnu11 instead of -std=3Dgnu89. The se=
mantics for
>         +inline functions changes which causes build failures such as:
>         +
>         +| misc.h:68:20: warning: inline function 'swaps' declared but ne=
ver defined
>         +|  extern inline void swaps (void *, int);
>         +|                      ^
>         +
>         +and
>         +
>         +| control.c:1717: undefined reference to `check_control'
>         +
>         +Fix them by:
>         +1 drop 'inline' attribute for function swap()
>=20
>     The question about whether 'inline' belongs in a .c file or not aside
>     (that's obviously not your department, that's how it is in the origin=
al
>     code), why is swaps() treated differently than every other function? =
 If
>     the compiler really needed to be told 'inline' on all of these, this
>     just ensures that swaps() is never inlined.  Is that your intent?
>=20
>=20
> For the functions except swap(), they are not referred by other .c files.=
 So
> they are not needed to be exported and can be mark as static inline.

Can you confirm you're looking at what you think you're looking at?  The
modification is to a function called swaps() not swap().

> For swap(), it is referred by other .c files. It must be exported.

Are the other .c files #include-ing this one?  If not, I can't see how
this was ever working.  Anyway, my question was just primarily "did you
intend that swaps() would never be inlined".  The behaviour now is that
swaps() will only be inlined now if the compiler thinks it can be in the
=2Ec file where it is defined and if some other .c files are managing to
link against it (presumably through some implicit declaration) then it
will rely on an external reference.  That's what you want to do here?
It seems like something that should be submitted upstream if only to vet
the change.

As a band-aid for building with gcc 5.x and 4.x simultaneously, though,
it seems okay.

-J.

>=20
> But the semantics for inline functions changes from gcc 4.x to gcc 5.x. G=
CC 5
> defaults to -std=3Dgnu11 instead of -std=3Dgnu89.
> While -std=3Dgnu89 employs the GNU89 inline semantics, -std=3Dgnu11 uses =
the C99
> inline semantics.
>=20
>   =E2=80=A2 C99 inline: No externally visible function is generated. If t=
he function is
>     referenced in this TU, an external definition has to exist in another=
 TU;
>     same as GNU89 extern inline with no redefinition.
>   =E2=80=A2 C99 extern inline: An externally visible function is generate=
d; same as
>     GNU89 inline.
>   =E2=80=A2 GNU89 inline: Same as C99 extern inline.
>   =E2=80=A2 GNU89 extern inline: No externally visible function is genera=
ted; no
>     equivalent in C99, because redefinition is not permitted.
>=20
>=20
> There are not same meaning of  'extern inline'. For compatible with gcc 4=
=2Ex, I
> choose to remove the inline attribution from function swap().
>=20
> Ref:
> https://gcc.gnu.org/gcc-5/porting_to.html
>=20
>=20
> Regards,
> Kai
>=20
>=20
>=20
>     -J.
>=20
>=20
>         +2 replace 'inline' with 'static inline' for other functions
>         +
>         +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>         +---
>         + control.c | 8 ++++----
>         + misc.c    | 2 +-
>         + misc.h    | 2 +-
>         + network.c | 4 ++--
>         + 4 files changed, 8 insertions(+), 8 deletions(-)
>         +
>         +diff --git a/control.c b/control.c
>         +index 134a7bf..0ef505b 100644
>         +--- a/control.c
>         ++++ b/control.c
>         +@@ -1139,7 +1139,7 @@ int control_finish (struct tunnel *t, stru=
ct call *c)
>         +     return 0;
>         + }
>         +
>         +-inline int check_control (const struct buffer *buf, struct tunn=
el *t,
>         ++static inline int check_control (const struct buffer *buf, stru=
ct tunnel *t,
>         +                           struct call *c)
>         + {
>         +     /*
>         +@@ -1275,7 +1275,7 @@ inline int check_control (const struct buf=
fer *buf, struct tunnel *t,
>         +     return 0;
>         + }
>         +
>         +-inline int check_payload (struct buffer *buf, struct tunnel *t,
>         ++static inline int check_payload (struct buffer *buf, struct tun=
nel *t,
>         +                           struct call *c)
>         + {
>         +     /*
>         +@@ -1381,7 +1381,7 @@ inline int check_payload (struct buffer *b=
uf, struct tunnel *t,
>         + #endif
>         +     return 0;
>         + }
>         +-inline int expand_payload (struct buffer *buf, struct tunnel *t,
>         ++static inline int expand_payload (struct buffer *buf, struct tu=
nnel *t,
>         +                            struct call *c)
>         + {
>         +     /*
>         +@@ -1561,7 +1561,7 @@ void send_zlb (void *data)
>         +     toss (buf);
>         + }
>         +
>         +-inline int write_packet (struct buffer *buf, struct tunnel *t, =
struct call *c,
>         ++static inline int write_packet (struct buffer *buf, struct tunn=
el *t, struct call *c,
>         +                          int convert)
>         + {
>         +     /*
>         +diff --git a/misc.c b/misc.c
>         +index 3092401..af90dbf 100644
>         +--- a/misc.c
>         ++++ b/misc.c
>         +@@ -170,7 +170,7 @@ void do_packet_dump (struct buffer *buf)
>         +     printf ("}\n");
>         + }
>         +
>         +-inline void swaps (void *buf_v, int len)
>         ++void swaps (void *buf_v, int len)
>         + {
>         + #ifdef __alpha
>         +     /* Reverse byte order alpha is little endian so lest save a=
 step.
>         +diff --git a/misc.h b/misc.h
>         +index aafdc62..caab7a1 100644
>         +--- a/misc.h
>         ++++ b/misc.h
>         +@@ -65,7 +65,7 @@ extern void l2tp_log (int level, const char *f=
mt, ...);
>         + extern struct buffer *new_buf (int);
>         + extern void udppush_handler (int);
>         + extern int addfcs (struct buffer *buf);
>         +-extern inline void swaps (void *, int);
>         ++extern void swaps (void *, int);
>         + extern void do_packet_dump (struct buffer *);
>         + extern void status (const char *fmt, ...);
>         + extern void status_handler (int signal);
>         +diff --git a/network.c b/network.c
>         +index 5e5b8b2..b019c2c 100644
>         +--- a/network.c
>         ++++ b/network.c
>         +@@ -135,7 +135,7 @@ int init_network (void)
>         +     return 0;
>         + }
>         +
>         +-inline void extract (void *buf, int *tunnel, int *call)
>         ++static inline void extract (void *buf, int *tunnel, int *call)
>         + {
>         +     /*
>         +      * Extract the tunnel and call #'s, and fix the order of the
>         +@@ -155,7 +155,7 @@ inline void extract (void *buf, int *tunnel,=
 int *call)
>         +     }
>         + }
>         +
>         +-inline void fix_hdr (void *buf)
>         ++static inline void fix_hdr (void *buf)
>         + {
>         +     /*
>         +      * Fix the byte order of the header
>         +--
>         +1.9.1
>         +
>         diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.=
6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
>         new file mode 100644
>         index 0000000..aac11b7
>         --- /dev/null
>         +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
>         @@ -0,0 +1,5 @@
>         +require xl2tpd.inc
>         +
>         +SRCREV =3D "5619e1771048e74b729804e8602f409af0f3faea"
>         +
>         +SRC_URI +=3D "file://fix-inline-functions-errors-with-gcc-5.x.pa=
tch"
>         diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.=
bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
>         deleted file mode 100644
>         index bd084aa..0000000
>         --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
>         +++ /dev/null
>         @@ -1,5 +0,0 @@
>         -require xl2tpd.inc
>         -PR =3D "${INC_PR}.0"
>         -
>         -SRCREV =3D "df7e30eb199fc5710faa83866381aea18b66e60c"
>         -
>         --
>         1.9.1
>=20
>=20
>=20
>=20
> --
> Regards,
> Neil | Kai Kang
>=20

--=20
-Joe MacDonald.
:wq

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWAVqmAAoJEEn8ffcsOfaWG+MIAMVXAcyvCYyvCZ5M3+UllVqk
VTAtz3C1jMTFK0GD2uLAS+nIdlQctqtDqL3/HAfeXeKrkr7SW2F7bvbQfAx6of9H
85HTnmq/s4E6N/ngR6F6L5P0wzhpjJHEYNvShoqMD391NBb3jq2n8uCbOxguOmcX
ZuR2z1v3sEWZMK+QKOQu1IYkjz3a7vd+jqTj29nmfGnTTL6M8KFbUbQI54D5UfWx
m7y8ygJ4kYmwlknwaMehDXDPVrJeJJ7hsg+q+ngB/3Yk9BGAHa8kNJz1VItqWlcL
HAZCzcbYe7JYyYwKav7Tc4xdtv+qpq7kfwsUenvKkfbtOjRIEg1xeU9/O1cq5GE=
=kSnU
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
