Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A7B9B6060B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2013 08:01:47 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so1010085eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2013 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T+dyMnMGnkNNMF15IqJQJjAR+pUxTSD8vzFHBq2b3Qk=;
	b=VNxpjUfMn2l6+5oIdcYFkSWNPQwpTw2+8vVTZ2HxiiGKoES0gMGdYMKHp29bPp1dWr
	qO3dwSZMCVWgKlnX7YmitXm3A8m3HY/ybQQw9ynZrUjmvZ/ze71OMj/zdYHuzY13ezNb
	HbM9hFE8IA8d8M2BnnDIlhHqnI103n7BCZAQBSldokZCOeJKRfowGdwbRByEzMr6qXBP
	yf7ZiwNT+mawQ85qeL1NRZXaKtlrBO6lYjqcdk+FKYvRvewTU2lE5CgaaQSgm6bwXe6h
	hkaeQDwvr+mLmoxSfkIdWXOdXk+QQolFmZ9Lgja2XlHB5HU9NtzrkT9iJbZWqR9sb/nR
	9pVQ==
X-Received: by 10.14.246.11 with SMTP id p11mr14992026eer.9.1377417707755;
	Sun, 25 Aug 2013 01:01:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm12390090eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 01:01:47 -0700 (PDT)
Date: Sun, 25 Aug 2013 10:02:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130825080255.GH3544@jama>
References: <1776530.dBKCTHnX8Z@helios>
	<1372974449-19858-1-git-send-email-eric@eukrea.com>
	<20130825090907.636cd35c@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130825090907.636cd35c@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Sun, 25 Aug 2013 08:01:48 -0000
X-Groupsio-MsgNum: 45826
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline

--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2013 at 09:09:07AM +0200, Eric B=E9nard wrote:
> Hi Martin,
>=20
> Le Thu,  4 Jul 2013 23:47:29 +0200,
> Eric B=E9nard <eric@eukrea.com> a =E9crit :
>=20
> > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > ---
> >  .../hexedit/0001-don-t-strip-when-installing.patch |   30 ++++++++++++=
++++++++
> >  meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |   17 +++++++++++
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/hexedit/hexedit/0001-don-t=
-strip-when-installing.patch
> >  create mode 100644 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
> >=20
> > diff --git a/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-=
when-installing.patch b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t=
-strip-when-installing.patch
> > new file mode 100644
> > index 0000000..a384b05
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-in=
stalling.patch
> > @@ -0,0 +1,30 @@
> > +From cc67246ca6839e5b3f6a286f10ed24c225b77a5e Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> > +Date: Thu, 4 Jul 2013 12:34:32 +0200
> > +Subject: [PATCH] don't strip when installing
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + Makefile.in |    2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 159463e..735cc72 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -42,6 +42,6 @@ distclean: clean
> > +=20
> > + install: $(PRODUCT)
> > + 	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
> > +-	$(INSTALL) -s -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
> > ++	$(INSTALL) -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
> > + 	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
> > + 	$(INSTALL) -m 644 $(PRODUCT).1 $(DESTDIR)$(mandir)/man1
> > +--=20
> > +1.7.10.4
> > +
> > diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-=
oe/recipes-extended/hexedit/hexedit_1.2.13.bb
> > new file mode 100644
> > index 0000000..d0658db
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "view and edit files in hexadecimal or in ASCII"
> > +HOMEPAGE =3D "http://rigaux.org/hexedit.html"
> > +SECTION =3D "console/utils"
> > +LICENSE =3D "GPLv2+"
> > +DEPENDS =3D "ncurses"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> > +
> > +SRC_URI =3D "http://rigaux.org/${PN}-${PV}.src.tgz \
> > +    file://0001-don-t-strip-when-installing.patch "
> > +
> > +SRC_URI[md5sum] =3D "a5af1378d028512a9cad27a5ba3e15f9"
> > +SRC_URI[sha256sum] =3D "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb=
54c58c983963b88dd7"
> > +
> > +inherit autotools
> > +
> > +S =3D "${WORKDIR}/${PN}"
>=20
> is there any problem with this patch which prevent it to be applied ?

I wanted to reply that it was incorrectly marked as Accepted on
patchwork, but Accepted is correct and it was merged 1,5 month ago:

http://git.openembedded.org/meta-openembedded/commit/?id=3D7da2e2c86e39deba=
0c1cb08f40efd82b17da17b5

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIZui8ACgkQN1Ujt2V2gBxXjgCcC+oLzqBcNlMbZ2cU/1rhLMAL
qRYAoLSsYh4477A0JdSd3DTf7GOKbqAf
=0vpr
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
