Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2516AFF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 21:43:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2013 14:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,997,1363158000"; d="scan'208";a="365438786"
Received: from unknown (HELO helios.localnet) ([10.252.121.235])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 14:43:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Thu, 04 Jul 2013 22:43:11 +0100
Message-ID: <1776530.dBKCTHnX8Z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1372973869-16805-1-git-send-email-eric@eukrea.com>
References: <1372973869-16805-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hexedit: new recipe
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
X-List-Received-Date: Thu, 04 Jul 2013 21:43:12 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Eric,

On Thursday 04 July 2013 23:37:49 Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../hexedit/0001-don-t-strip-when-installing.patch |   30
> ++++++++++++++++++++ meta-oe/recipes-extended/hexedit/hexedit_1.2.13.=
bb | =20
> 17 +++++++++++ 2 files changed, 47 insertions(+)
>  create mode 100644
> meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-instal=
ling.p
> atch create mode 100644 meta-oe/recipes-extended/hexedit/hexedit_1.2.=
13.bb
>=20
> diff --git
> a/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-inst=
alling
> .patch
> b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-inst=
alling
> .patch new file mode 100644
> index 0000000..a384b05
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-inst=
alling
> .patch @@ -0,0 +1,30 @@
> +From cc67246ca6839e5b3f6a286f10ed24c225b77a5e Mon Sep 17 00:00:00 20=
01
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
> +
> + install: $(PRODUCT)
> + =09$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
> +-=09$(INSTALL) -s -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
> ++=09$(INSTALL) -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
> + =09$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
> + =09$(INSTALL) -m 644 $(PRODUCT).1 $(DESTDIR)$(mandir)/man1
> +--
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
> b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb new file mode 10=
0644
> index 0000000..85d02f1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "view and edit files in hexadecimal or in ASCII"
> +HOMEPAGE =3D "http://rigaux.org/hexedit.html"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2+"
> +DEPENDS =3D "ncurses"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32=
c317bb3"
> +
> +SRC_URI =3D "http://rigaux.org/${PN}-${PV}.src.tgz \
> +    file://0001-don-t-strip-when-installing.patch "
> +
> +SRC_URI[md5sum] =3D "a5af1378d028512a9cad27a5ba3e15f9"
> +SRC_URI[sha256sum] =3D
> "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54c58c983963b88dd7" +
> +inherit autotools
> +
> +S =3D "${WORKDIR}/${PN}"

Great, but would you mind setting SUMMARY instead of DESCRIPTION if it'=
s just=20
a short description?

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

