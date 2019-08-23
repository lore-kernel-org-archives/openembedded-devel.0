Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4D0F7F37D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:46:08 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p12so23150728iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qYvLKyHdg/Q1a7NfOmfhFEyEQ2TOmUdF47OUiLlgeW4=;
	b=ZddP+Fke4TSxiPhi/oASDJbEZtqeDQsO/sMhQy+QvFwvVfkRpdCmXWD5dhTcmUpMyo
	WYRA597ob8ZmJvhPTQpIxMJ+oge5jMA3l/VRoagWUXy1ApiX09Cexg8vZarGip0ySYkD
	6tfaZV+sj8UuV3oFmZnwilkXmJRZFoKd3W8OxS1OWDN2zmKX8o/Ow4ujULU3WcNC9fWR
	+tgpnl4jClQc5HWnGMa5pbBHXHux5rJdCUFMTmMyCxobhxKM4TcdFsor8Rb4WNHdeT/C
	D+T+SYYDXMNt6tLWp0JFtxY5locfQd1qXkirFb+p5Bvtek0Jn8/Nhr5jOPTnkmbfnomi
	sWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qYvLKyHdg/Q1a7NfOmfhFEyEQ2TOmUdF47OUiLlgeW4=;
	b=Vzj0C7D8HD8PtqY0dSJXhz9F67FCvuCX4mXqRxS1/eosBP3kCB1a+dZFtk+RDHilzj
	45/o92nPoFndPa1HlstvtQfNZRSENgWKZ2bo+md7rrqHWL4pOH1Q8rVX9vwALE+Jpq1r
	j73V9Lkh+eIsV59cm1U/YbaL9IoQ90ijUs37M7+dWZBevhNWoY+WMFqbOO1HY2ANYrZs
	eJI8/nFDLaZCV7gK12yc3Ivnei9Gs51EGQqhx3DIRuzyuNczvJQCtewI7l9WjFLUbHKw
	CN4AZliKgc3sS1LfeFV0xK4f4t6meIayWn87j574G1BpDeEiQaG4pwvJIRzAfFWvAuGk
	wwKA==
X-Gm-Message-State: APjAAAWOxgjtig3oPEch50p87SCq3L5bHVUiI1CaglRSoUW14i6u7oZf
	hfAAR/Ek4PSoka7w4hWQdtJkxIMch0Bw3PSgfZo=
X-Google-Smtp-Source: APXvYqwLuiK0qQBhLXB4/xXcFoMnM2Jih5o1UDhT/V8fD1qM+9v4y4hJKNAIwxUbJrAmi8MZ/V0pMkxYrnjWKqtc3/E=
X-Received: by 2002:a6b:7807:: with SMTP id j7mr183951iom.224.1566593169990;
	Fri, 23 Aug 2019 13:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190816071246.168087-1-kai.kang@windriver.com>
	<28f7200e-c9ed-e8fd-b067-25731c475981@windriver.com>
	<CALbNGRT1Xg_TLMmSusD2ESNvuCF=aD8ONJK7_S3L7s4kZwJ4_g@mail.gmail.com>
In-Reply-To: <CALbNGRT1Xg_TLMmSusD2ESNvuCF=aD8ONJK7_S3L7s4kZwJ4_g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 23 Aug 2019 22:45:58 +0200
Message-ID: <CALbNGRTri949iQT=judPQ+kdsr8oWqyB0a1WDrdfCxqx71Kw2Q@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch] xfce4-datetime-setter: fix compile error and requires distro feature x11
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
X-List-Received-Date: Fri, 23 Aug 2019 20:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 10:38 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Fri, Aug 23, 2019 at 3:59 AM Kang Kai <Kai.Kang@windriver.com> wrote:
> >
> > On 2019/8/16 =E4=B8=8B=E5=8D=883:12, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > >
> > > It fails to compile xfce4-datetime-setter occasionally when system lo=
ad
> > > is high:
> > >
> > > | ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No =
such file or directory
> > > |    42 | #include "cc-datetime-resources.h"
> > > |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > | compilation terminated.
> > >
> > > Update datetime_panel_dep to make sure cc-datetime-resources.h be
> > > generated before including.
> >
> > Hi Andreas,
> >
> > Any comment on this patch please? And I also sent a pull request on git=
hub.
> >
> > Regards,
> > Kai
> >
> >
> > >
> > > xfce4-datetime-setter depends on libxfce4ui which requires distro
> > > feature 'x11', so make it require 'x11' too.
> > >
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   .../files/fix-inner-dependency.patch          | 28 ++++++++++++++++=
+++
> > >   .../xfce4-datetime-setter_3.32.2.bb           |  7 +++--
> > >   2 files changed, 33 insertions(+), 2 deletions(-)
> > >   create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/fil=
es/fix-inner-dependency.patch
> > >
> > > diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-i=
nner-dependency.patch b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/=
fix-inner-dependency.patch
> > > new file mode 100644
> > > index 000000000..9cccb892f
> > > --- /dev/null
> > > +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-de=
pendency.patch
> > > @@ -0,0 +1,28 @@
> > > +It fails to compile xfce4-datetime-setter occasionally when system l=
oad is high:
> > > +
> > > +| ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No=
 such file or directory
> > > +|    42 | #include "cc-datetime-resources.h"
> > > +|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > +| compilation terminated.
> > > +
> > > +Update datetime_panel_dep to make sure cc-datetime-resources.h be ge=
nerated
> > > +before including.
> > > +
> > > +Upstream-Status: Submitted [https://github.com/schnitzeltony/xfce4-d=
atetime-setter/pull/2]
> > > +
> > > +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > +---
> > > +diff --git a/panels/datetime/meson.build b/panels/datetime/meson.bui=
ld
> > > +index c5bf39c..241e177 100644
> > > +--- a/panels/datetime/meson.build
> > > ++++ b/panels/datetime/meson.build
> > > +@@ -175,7 +175,8 @@ datetime_panel_lib =3D static_library(
> > > +
> > > + datetime_panel_dep =3D declare_dependency(
> > > +   include_directories: [ common_inc, include_directories('.') ],
> > > +-  link_with: datetime_panel_lib
> > > ++  link_with: datetime_panel_lib,
> > > ++  sources: resources
> > > + )
> > > +
> > > + subdir('po-timezones')
> > > diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datet=
ime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-d=
atetime-setter_3.32.2.bb
> > > index d64358537..4d128ac51 100644
> > > --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-set=
ter_3.32.2.bb
> > > +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-set=
ter_3.32.2.bb
> > > @@ -6,13 +6,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989=
545e37968a99b631ef42722e"
> > >
> > >   DEPENDS =3D "glib-2.0-native libxfce4ui"
> > >
> > > -SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datetime-setter.gi=
t;protocol=3Dhttps"
> > > +SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datetime-setter.gi=
t;protocol=3Dhttps \
> > > +           file://fix-inner-dependency.patch \
> > > +"
> > >   SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
> > >
> > >   S =3D "${WORKDIR}/git"
> > >
> > >   inherit gettext meson distro_features_check
> > > -REQUIRED_DISTRO_FEATURES =3D "systemd"
> > > +
> > > +REQUIRED_DISTRO_FEATURES =3D "systemd x11"
> > >
> > >   FILES_${PN} +=3D "${datadir}/icons/hicolor"
> > >
> >
> Woops I missed that completely - will check
Thanks! Did apply the patch

Andreas

