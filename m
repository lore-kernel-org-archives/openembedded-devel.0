Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id CCB8161F47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2013 07:09:15 +0000 (UTC)
Received: from e6520eb (unknown [82.233.81.124]) (Authenticated sender: eukrea)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 44BFB4C808E;
	Sun, 25 Aug 2013 09:09:09 +0200 (CEST)
Date: Sun, 25 Aug 2013 09:09:07 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130825090907.636cd35c@e6520eb>
In-Reply-To: <1372974449-19858-1-git-send-email-eric@eukrea.com>
References: <1776530.dBKCTHnX8Z@helios>
	<1372974449-19858-1-git-send-email-eric@eukrea.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] hexedit: new recipe
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
X-List-Received-Date: Sun, 25 Aug 2013 07:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Thu,  4 Jul 2013 23:47:29 +0200,
Eric B=E9nard <eric@eukrea.com> a =E9crit :

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../hexedit/0001-don-t-strip-when-installing.patch |   30 ++++++++++++++=
++++++
>  meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |   17 +++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-s=
trip-when-installing.patch
>  create mode 100644 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
>=20
> diff --git a/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-wh=
en-installing.patch b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-s=
trip-when-installing.patch
> new file mode 100644
> index 0000000..a384b05
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-inst=
alling.patch
> @@ -0,0 +1,30 @@
> +From cc67246ca6839e5b3f6a286f10ed24c225b77a5e Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> +Date: Thu, 4 Jul 2013 12:34:32 +0200
> +Subject: [PATCH] don't strip when installing
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +---
> + Makefile.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 159463e..735cc72 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -42,6 +42,6 @@ distclean: clean
> +=20
> + install: $(PRODUCT)
> + 	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
> +-	$(INSTALL) -s -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
> ++	$(INSTALL) -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
> + 	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
> + 	$(INSTALL) -m 644 $(PRODUCT).1 $(DESTDIR)$(mandir)/man1
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe=
/recipes-extended/hexedit/hexedit_1.2.13.bb
> new file mode 100644
> index 0000000..d0658db
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "view and edit files in hexadecimal or in ASCII"
> +HOMEPAGE =3D "http://rigaux.org/hexedit.html"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2+"
> +DEPENDS =3D "ncurses"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +SRC_URI =3D "http://rigaux.org/${PN}-${PV}.src.tgz \
> +    file://0001-don-t-strip-when-installing.patch "
> +
> +SRC_URI[md5sum] =3D "a5af1378d028512a9cad27a5ba3e15f9"
> +SRC_URI[sha256sum] =3D "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54=
c58c983963b88dd7"
> +
> +inherit autotools
> +
> +S =3D "${WORKDIR}/${PN}"

is there any problem with this patch which prevent it to be applied ?

Eric

