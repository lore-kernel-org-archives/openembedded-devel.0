Return-Path: <joe@deserted.net>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 66B476F75F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:31:15 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so2630639iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=2qTIU3+leVEH3JgT40mlXc7g1gAfmGfDswEuj+u2TuQ=;
	b=CR2qfiF7Wt5APybmqiev48b10XH7xXrlMmPTygdD6+6oLrOdPCrVran7ehTp2/m/aP
	GiPO1Oum5lbZrVZ8UjDLpBFofI9Jfvurv2emDIidBPGCllLMC0ljjR8aTH9AuqTtAY+B
	IeyE3lji1hWWj0CnQIeTDBqkyESFu8mTTBbk9MP7pc13TV+UaQS9Yz89vMA/tUp59w6q
	h5gXxAve2gYrzg7JkFZ6QZCEz36x9VynYYmBCUCHUg0jLvuuKWTwTVAo9Mb8lmEKHh+N
	9gv3piycAn+B2mucuf2Sd2VF5rwFx+XpEuNmJBDJEKrRLA/u33j9sUv8d4/HeqI+GZEz
	lj3A==
X-Gm-Message-State: ALoCoQmFmuK/wmMFYj4JN65X5wUm3gDuPCpZb8TmqsHHDX5eAUD33aR2aouSCS+wDVw/VQS1I05v
X-Received: by 10.50.132.66 with SMTP id os2mr8004287igb.33.1394807476973;
	Fri, 14 Mar 2014 07:31:16 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	u1sm19803855igm.8.2014.03.14.07.31.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 07:31:15 -0700 (PDT)
Date: Fri, 14 Mar 2014 10:31:13 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314143112.GE8326@deserted.net>
References: <1394154162-4510-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1394154162-4510-1-git-send-email-paul@paulbarker.me.uk>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] ipsec-tools: Don't link against libfl
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
X-List-Received-Date: Fri, 14 Mar 2014 14:31:16 -0000
X-Groupsio-MsgNum: 48671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline

--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] ipsec-tools: Don't link against libfl] On 14=
=2E03.07 (Fri 01:02) Paul Barker wrote:

> We can remove all references to yywrap by adding "%option noyywrap" state=
ments
> to each flex source file which doesn't override yywrap. After this, we no=
 longer
> need to link against libfl and so no longer get errors about undefined
> references to yylex.
>=20
> Also change the dependency on flex to flex-native as we no longer need li=
bfl
> compiled for the target - the lexer is now self-contained.
>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  .../0002-Don-t-link-against-libfl.patch            | 86 ++++++++++++++++=
++++++
>  .../ipsec-tools/ipsec-tools_0.8.1.bb               |  3 +-
>  2 files changed, 88 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls/0002-Don-t-link-against-libfl.patch
>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002=
-Don-t-link-against-libfl.patch b/meta-networking/recipes-support/ipsec-too=
ls/ipsec-tools/0002-Don-t-link-against-libfl.patch
> new file mode 100644
> index 0000000..674331d
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-=
link-against-libfl.patch
> @@ -0,0 +1,86 @@
> +From e48b9097dce7bc2bfbb9e9c542124d3b5cebab39 Mon Sep 17 00:00:00 2001
> +From: Paul Barker <paul@paulbarker.me.uk>
> +Date: Wed, 5 Mar 2014 13:39:14 +0000
> +Subject: [PATCH] Don't link against libfl
> +
> +We can remove all references to yywrap by adding "%option noyywrap" stat=
ements
> +to each flex source file that doesn't override yywrap. After this, we no=
 longer
> +need to link against libfl and so no longer get errors about undefined
> +references to yylex.
> +
> +Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> +Upstream-status: Pending
> +---
> + src/libipsec/Makefile.am | 1 -
> + src/racoon/Makefile.am   | 2 +-
> + src/racoon/cftoken.l     | 2 ++
> + src/setkey/Makefile.am   | 1 -
> + src/setkey/token.l       | 2 ++
> + 5 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/libipsec/Makefile.am b/src/libipsec/Makefile.am
> +index 6a4e3b3..df1e106 100644
> +--- a/src/libipsec/Makefile.am
> ++++ b/src/libipsec/Makefile.am
> +@@ -26,7 +26,6 @@ libipsec_la_SOURCES =3D \
> + # version is current:revision:age.
> + # See: http://www.gnu.org/manual/libtool-1.4.2/html_chapter/libtool_6.h=
tml#SEC32
> + libipsec_la_LDFLAGS =3D -version-info 0:1:0
> +-libipsec_la_LIBADD =3D $(LEXLIB)
> +=20
> + noinst_HEADERS =3D ipsec_strerror.h
> +=20
> +diff --git a/src/racoon/Makefile.am b/src/racoon/Makefile.am
> +index dbaded9..0662957 100644
> +--- a/src/racoon/Makefile.am
> ++++ b/src/racoon/Makefile.am
> +@@ -38,7 +38,7 @@ racoon_SOURCES =3D \
> + 	cftoken.l cfparse.y prsa_tok.l prsa_par.y=20
> + EXTRA_racoon_SOURCES =3D isakmp_xauth.c isakmp_cfg.c isakmp_unity.c thr=
ottle.c \
> + 	isakmp_frag.c nattraversal.c security.c $(MISSING_ALGOS)
> +-racoon_LDADD =3D $(CRYPTOBJS) $(HYBRID_OBJS) $(NATT_OBJS) $(FRAG_OBJS) =
$(LEXLIB) \
> ++racoon_LDADD =3D $(CRYPTOBJS) $(HYBRID_OBJS) $(NATT_OBJS) $(FRAG_OBJS) \
> + 	 $(SECCTX_OBJS) vmbuf.o sockmisc.o misc.o ../libipsec/libipsec.la
> + racoon_DEPENDENCIES =3D \
> + 	$(CRYPTOBJS) $(HYBRID_OBJS) $(NATT_OBJS) $(FRAG_OBJS) $(SECCTX_OBJS) \
> +diff --git a/src/racoon/cftoken.l b/src/racoon/cftoken.l
> +index 490242c..1701922 100644
> +--- a/src/racoon/cftoken.l
> ++++ b/src/racoon/cftoken.l
> +@@ -106,6 +106,8 @@ static int incstackp =3D 0;
> + static int yy_first_time =3D 1;
> + %}
> +=20
> ++%option noyywrap
> ++
> + /* common seciton */
> + nl		\n
> + ws		[ \t]+
> +diff --git a/src/setkey/Makefile.am b/src/setkey/Makefile.am
> +index 746c1f1..389e6cf 100644
> +--- a/src/setkey/Makefile.am
> ++++ b/src/setkey/Makefile.am
> +@@ -13,7 +13,6 @@ setkey_SOURCES =3D \
> +=20
> + setkey_LDFLAGS =3D ../libipsec/libipsec.la
> + setkey_DEPENDENCIES =3D ../libipsec/libipsec.la
> +-setkey_LDADD =3D $(LEXLIB)
> +=20
> + noinst_HEADERS =3D vchar.h extern.h
> + man8_MANS =3D setkey.8
> +diff --git a/src/setkey/token.l b/src/setkey/token.l
> +index ad3d843..eb23b76 100644
> +--- a/src/setkey/token.l
> ++++ b/src/setkey/token.l
> +@@ -88,6 +88,8 @@
> + #endif
> + %}
> +=20
> ++%option noyywrap
> ++
> + /* common section */
> + nl		\n
> + ws		[ \t]+
> +--=20
> +1.9.0
> +
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> index e931745..fcf329c 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> @@ -5,10 +5,11 @@ SECTION =3D "console/network"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endline=
=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> =20
> -DEPENDS =3D "virtual/kernel openssl readline flex bison-native"
> +DEPENDS =3D "virtual/kernel openssl readline flex-native bison-native"
> =20
>  SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-=
tools-${PV}.tar.bz2 \
>             file://0001-Fix-warning-with-gcc-4.8.patch \
> +           file://0002-Don-t-link-against-libfl.patch \
>            "
>  SRC_URI[md5sum] =3D "d38b39f291ba2962387c3232e7335dd8"
>  SRC_URI[sha256sum] =3D "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a=
881d63abe8153dd4"
--=20
-Joe MacDonald.
:wq

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMjErAACgkQwFvcllog0Xy9YgCcCqcJdE9YQX80xdBbQEXnXXO3
658AoJjXOuUUIEEm/g+Jd9QGTakAmLCK
=w1yF
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
