Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id E6DD87F37D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:38:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p12so23107878iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8W1NGCAWaN6KP1g5DSWvYEgQqEYOTPpJMs2RSXf8fL4=;
	b=H/Fo114v7bVRUwhovHLscIEtqYQedzf1+v3PH8yDyO3bOx4VZkbk1PnKnq6iPNTYxb
	PLlRVUt8MaKy3/SUE+WHTeNTM+OGF3Gt2IR6DRnOGgAOW6bj6Rxi/sxhdFueL7PkaOt1
	JOfCDLyOYRTUGFnXDt461sr8vIIVTiCBzsox20jd9Bltmy7NPco+LOjb1+puFGbxxZPR
	/HZMz/yEP+nOPIV6gVYoPhhQhHg+ihbChNhd3ORxLFzRzg/Thd3rUZlSiYNF+NH2eMEE
	8wy5S4fcfvZrhXvyUN5aCqxyiYkMNrczXeGBB+aOc+2nkoidmyBm7Ngz4PZkaJE6YA1/
	J93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8W1NGCAWaN6KP1g5DSWvYEgQqEYOTPpJMs2RSXf8fL4=;
	b=VZhYGblbSpUa3uGhDbwdUld0yElWI3LtiInzhdmUMTDnh3BX5hyJYdgoOeO5x6LCp3
	1mpsvWW3q95djP1G65TWzPiG0vnNoLneinDK3GoJ1Y5Q65mCbEbcUvnwtSZutRvw1M5U
	+/4VPKUDDXTdC4YXzryX7MtlTp1Lb4WNWg7Tn7k+vq2AyOSZUzo2TRF2UDVHJsAUc37M
	4PhWaDAhQgGyyE9BaBKol5jcEbwWMLmNhRPDByMY0HnMO7TJNlMrP+DhhYLqThKLioZ5
	rNvTmix5qM05EZWGqkyFKSsFaQyAHkjD8Bn+lXxw5vkpv+5UVmqkCI6bG3DthtBF7Hnd
	4UKg==
X-Gm-Message-State: APjAAAW7Lzr10OM9hSNrwDWm73tbXt5CIfBb49sv2GT+4CgmIWZARWbv
	BzdZh3BOMBZg35VwVBO2MWpNbqrSsxtljeb017s=
X-Google-Smtp-Source: APXvYqzMTvJj2LJIBprogbE5omn7DMnpL6VhNKk+i5Qkf+hxMFQeQHOplUQbgx7RuFV3v8/LVMKwqTo8gI4gmHpIyEI=
X-Received: by 2002:a6b:5116:: with SMTP id f22mr136627iob.108.1566592733865; 
	Fri, 23 Aug 2019 13:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190816071246.168087-1-kai.kang@windriver.com>
	<28f7200e-c9ed-e8fd-b067-25731c475981@windriver.com>
In-Reply-To: <28f7200e-c9ed-e8fd-b067-25731c475981@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 23 Aug 2019 22:38:42 +0200
Message-ID: <CALbNGRT1Xg_TLMmSusD2ESNvuCF=aD8ONJK7_S3L7s4kZwJ4_g@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Aug 2019 20:38:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 3:59 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/8/16 =E4=B8=8B=E5=8D=883:12, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > It fails to compile xfce4-datetime-setter occasionally when system load
> > is high:
> >
> > | ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No su=
ch file or directory
> > |    42 | #include "cc-datetime-resources.h"
> > |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> > | compilation terminated.
> >
> > Update datetime_panel_dep to make sure cc-datetime-resources.h be
> > generated before including.
>
> Hi Andreas,
>
> Any comment on this patch please? And I also sent a pull request on githu=
b.
>
> Regards,
> Kai
>
>
> >
> > xfce4-datetime-setter depends on libxfce4ui which requires distro
> > feature 'x11', so make it require 'x11' too.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   .../files/fix-inner-dependency.patch          | 28 ++++++++++++++++++=
+
> >   .../xfce4-datetime-setter_3.32.2.bb           |  7 +++--
> >   2 files changed, 33 insertions(+), 2 deletions(-)
> >   create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files=
/fix-inner-dependency.patch
> >
> > diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inn=
er-dependency.patch b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fi=
x-inner-dependency.patch
> > new file mode 100644
> > index 000000000..9cccb892f
> > --- /dev/null
> > +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-depe=
ndency.patch
> > @@ -0,0 +1,28 @@
> > +It fails to compile xfce4-datetime-setter occasionally when system loa=
d is high:
> > +
> > +| ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No s=
uch file or directory
> > +|    42 | #include "cc-datetime-resources.h"
> > +|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> > +| compilation terminated.
> > +
> > +Update datetime_panel_dep to make sure cc-datetime-resources.h be gene=
rated
> > +before including.
> > +
> > +Upstream-Status: Submitted [https://github.com/schnitzeltony/xfce4-dat=
etime-setter/pull/2]
> > +
> > +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > +---
> > +diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
> > +index c5bf39c..241e177 100644
> > +--- a/panels/datetime/meson.build
> > ++++ b/panels/datetime/meson.build
> > +@@ -175,7 +175,8 @@ datetime_panel_lib =3D static_library(
> > +
> > + datetime_panel_dep =3D declare_dependency(
> > +   include_directories: [ common_inc, include_directories('.') ],
> > +-  link_with: datetime_panel_lib
> > ++  link_with: datetime_panel_lib,
> > ++  sources: resources
> > + )
> > +
> > + subdir('po-timezones')
> > diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetim=
e-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-dat=
etime-setter_3.32.2.bb
> > index d64358537..4d128ac51 100644
> > --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-sette=
r_3.32.2.bb
> > +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-sette=
r_3.32.2.bb
> > @@ -6,13 +6,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7585998954=
5e37968a99b631ef42722e"
> >
> >   DEPENDS =3D "glib-2.0-native libxfce4ui"
> >
> > -SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datetime-setter.git;=
protocol=3Dhttps"
> > +SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datetime-setter.git;=
protocol=3Dhttps \
> > +           file://fix-inner-dependency.patch \
> > +"
> >   SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
> >
> >   S =3D "${WORKDIR}/git"
> >
> >   inherit gettext meson distro_features_check
> > -REQUIRED_DISTRO_FEATURES =3D "systemd"
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "systemd x11"
> >
> >   FILES_${PN} +=3D "${datadir}/icons/hicolor"
> >
>
Woops I missed that completely - will check

Andreas

