Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB1275136
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:08:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5IH7WvI011481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 10:08:03 -0700
Received: from yow-masselst-lx1.localnet (128.224.22.35) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 18 Jun 2018 10:07:48 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 13:07:47 -0400
Message-ID: <1883916.pZAjriCjz1@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 17:08:45 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday, June 18, 2018 12:51:47 PM EDT Andreas M=FCller wrote:
> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
>=20
> <mark.asselstine@windriver.com> wrote:
> > Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] we
> >=20
> > are getting a QA Warnings/Erros for 'installed-vs-shipped':
> >     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
> >    =20
> >     Files/directories were installed but not shipped in any package:
> >       /usr/lib64/xfce4/panel/plugins/liblauncher.la
> >       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
> >       ...
> >=20
> > From various OE documents the .la files should not be packaged in
> > either the main recipe package or the -dev package unless required. So
> > inherit 'remove-libtool' to have all the .la files cleaned up as they
> > don't appear to be necessary.
> >=20
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >=20
> > This error is currently only seen on master-next since the xfce4-panel
> > upgrade commit is yet to make it into master. As such this fix is only
> > applicable to master-next.
>=20
> I think it was not the upgrade -> 4.13.3 commit but later commit / same
> series
>=20

Sure, I can update the commit log and send a V2 but first let's sort out th=
e=20
remainder.

> various classes recipes: Remove FILES entries for dbg/dev packages
> ...
> --- a/meta-xfce/classes/xfce.bbclass
> +++ b/meta-xfce/classes/xfce.bbclass
> @@ -12,11 +12,3 @@ DEPENDS +=3D "intltool-native"
>=20
>  FILES_${PN} +=3D "${datadir}/icons/* ${datadir}/applications/*
> ${libdir}/xfce4/modules/*.so*"
>  FILES_${PN}-doc +=3D "${datadir}/xfce4/doc"
> -
> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*.la"
> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.la"
> ...
>=20
> My builds have remove-libtool enabled so I did not see this QA
> warning/error.
>=20
> Isn't remove-libtool enabled by default since pyro/2.3 - so that this
> patch is obsolete (and all the other same kind coming later)?

The documentation still indicates:
=2D--
<note>
            The <filename>remove-libtool</filename> class is not enabled by
            default.
</note>
=2D--

So as far as I know this still needs to be handled recipe to recipe by=20
inheriting the remove-libtool class in the affected recipes. I have done=20
builds without manipulating the generated local.conf which seem to confirm=
=20
this but I could be wrong. Add RP who might have some guidance.

MarkA

>=20
> Andreas





