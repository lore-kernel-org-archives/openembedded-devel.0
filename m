Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D04371E4C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D372D31E0FAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 11:55:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KBKjIz3cX3gg
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 11:55:56 +0100 (CET)
Received: from t510.zcs.saftware.de (p57A61904.dip0.t-ipconnect.de
	[87.166.25.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AF92131E045A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 11:55:56 +0100 (CET)
Date: Thu, 16 Feb 2017 11:55:55 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170216115555.454fd3a0@t510.zcs.saftware.de>
In-Reply-To: <CALbNGRRKU-bYBOUqtUsEqP4vM097qqdXgGk-27LHPaFVCXfsmA@mail.gmail.com>
References: <1487241365-6326-1-git-send-email-obi@opendreambox.org>
	<CALbNGRRKU-bYBOUqtUsEqP4vM097qqdXgGk-27LHPaFVCXfsmA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] libmikmod: create packageconfig option for pulseaudio
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
X-List-Received-Date: Thu, 16 Feb 2017 10:56:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Feb 2017 11:42:43 +0100
Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:

> On Thu, Feb 16, 2017 at 11:36 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/met=
a-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> > index 2e1b9bf..9d31c92 100644
> > --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> > +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
> > @@ -3,7 +3,7 @@ SECTION =3D "libs"
> >  LICENSE =3D "LGPLv2.1"
> >  LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd25595107=
9008b364516c"
> >
> > -DEPENDS =3D "alsa-lib texinfo pulseaudio"
> > +DEPENDS =3D "alsa-lib texinfo"
> >
> >  SRC_URI =3D "\
> >      ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar=
.gz \
> > @@ -24,3 +24,5 @@ EXTRA_OECONF =3D "\
> >      --enable-threads \
> >  "
> >
> > +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaud=
io', 'pulseaudio', '', d)}"
> > +PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseaudi=
o,pulseaudio"
> > -- =20
> Does pulseaudio do something useful without pulseaudio-server in the
> image? Something like
>=20
> PACKAGECONFIG[pulseaudio] =3D
> "--enable-pulseaudio,--disable-pulseaudio,pulseaudio,pulseaudio-server"

I have no idea, because I never used pulseaudio. This patch just tries to
fix a broken dependency chain for another recipe depending on libmikmod.

FWIW, I guess you could include pulseaudio support in libmikmod without
forcing its use, so adding a runtime dependency on the server seems to be
a bit too much.

Regards,
Andreas

