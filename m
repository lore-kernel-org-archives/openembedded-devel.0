Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 074AA7DB52
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 02:04:52 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j15so784038qtl.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 19:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+CqbOORROSYU3iGJcyv8QvzXNz5q5OBpyqhITNqaqOY=;
	b=YNKhRC8YFnzKPOeQeXwpg0T5+l0B6C5lhIQsDaimUnJHoJVbaTz8xHh/BsVFS+vStF
	saGYV2I5uivVDDBVSR9XSeRBEYWHFyFWwN7htLUGuhOqvCXrbK8qMxIZ2xX2ZQUYQX3o
	NdAGoEiWWA93VhLhFvzHpC3xUCj8rcW+pum6xFIgrzWam6gedNvc4TQWf9axgwUbJZUg
	w1L8sXDVKSAry4wS4isLmzFjyUadIy+Z51euMsWRamcPCWn+3E1x0hrczqAAeAOz5hdi
	gZh+tSDeUHx4A5c3xGw7HFC3DUs+Iq+Z9WwHp50kJCMzlV+3cZWXQxeqZY1JkCaJ2AcV
	+cbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+CqbOORROSYU3iGJcyv8QvzXNz5q5OBpyqhITNqaqOY=;
	b=f9pXOKSbJmMpGU+iE92MEab5yEkVuIteFm6eVC8BU2tFHYV9Ch+LXGJZA4R4FkqjrJ
	2rRztgzM9/kjqGaFoDEr2NBLrOYfGXo3TIw/IE3mUpUSawKYFKG2Nim1IpFqjmhLzPNQ
	ICBGPhWuFAiexjcDnNNk0xmp3HdOFSE1lf4FdBS6sNI6ihXrgmNAAm29pcSye8mZ07wS
	f0yeJhnPFMfb6UXiuZ9hiEP1oIOupBMn9odnuJfvI9/ieeTKJnETGav64A2Gfwel4/ws
	oZLipCAGKiua45NaxLRBGwsrZ2ziJmvpEPWI6+LdJ8ofLu8f1l/97IRKVcVTbf9hTj/6
	tv1w==
X-Gm-Message-State: APjAAAW+KxSNt704T2jCFMAUvf8pnXVIGH1PW2oC86xsTWIXOWpU0jx0
	j5xAuEzQFwuXPcQqntwcMem4I7VESJN1IY8Wx88=
X-Google-Smtp-Source: APXvYqyAfq7v+hk9czS9BXt3snTf2S7J82PTMvURCBver0PM/m7pzliQWKzhjudS7uQUhTY2gjP+Mp8kG3yccnlnZtc=
X-Received: by 2002:ad4:4112:: with SMTP id i18mr15983511qvp.175.1565316293568;
	Thu, 08 Aug 2019 19:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190808093210.149215-1-kai.kang@windriver.com>
	<20190808093210.149215-2-kai.kang@windriver.com>
	<CAMKF1soxeBna0ocvLeqGSj4pemgaSv0JoxR5TS2TDvpXvOcVZA@mail.gmail.com>
	<3b1c9841-d845-210e-c89f-462846900907@windriver.com>
In-Reply-To: <3b1c9841-d845-210e-c89f-462846900907@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2019 19:04:27 -0700
Message-ID: <CAMKF1spEVAwpwCtJo-=nP1LnebzUHPVys8qkcZ_aJ=ZAr6dvnw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] xfce4-datetime-setter: add recipe
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
X-List-Received-Date: Fri, 09 Aug 2019 02:04:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2019 at 6:43 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/8/9 =E4=B8=8A=E5=8D=885:52, Khem Raj wrote:
> > On Thu, Aug 8, 2019 at 2:33 AM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Because xfce4-settings turn back to its official upstream, it missing
> >> function to set date and time. Add it from Andreas's repo on github.
> >> It depends on dbus service org.freedesktop.timedate1 which is provided
> >> by systemd, so add systemd to RDEPENDS.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   .../xfce4-datetime-setter_3.32.2.bb            | 18 ++++++++++++++++=
++
> >>   1 file changed, 18 insertions(+)
> >>   create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/xfce=
4-datetime-setter_3.32.2.bb
> >>
> >> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-dateti=
me-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-da=
tetime-setter_3.32.2.bb
> >> new file mode 100644
> >> index 000000000..7a28b6101
> >> --- /dev/null
> >> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-sett=
er_3.32.2.bb
> >> @@ -0,0 +1,18 @@
> >> +DESCRIPTION =3D "A fork of (early) gnome-control-center datetime pane=
l for XFCE. \
> >> +It is based upon GTK3 and embedds into recent xfce4-settings."
> >> +HOMEPAGE =3D "https://github.com/schnitzeltony/xfce4-datetime-setter"
> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef=
42722e"
> >> +
> >> +DEPENDS =3D "glib-2.0-native libxfce4ui"
> >> +
> >> +SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datetime-setter.git=
;protocol=3Dhttps"
> >> +SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit gettext meson
> >> +
> >> +FILES_${PN} +=3D "${datadir}/icons/hicolor"
> >> +
> >> +RDEPENDS_${PN} =3D "systemd tzdata"
> > On systemd-less systems it wont work
> >
> > ERROR: Nothing RPROVIDES 'systemd' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-xfce/recipes-apps/xfce4-datet=
ime-setter/xfce4-datetime-setter_3.32.2.bb
> > RDEPENDS on or otherwise requires it)
> > systemd was skipped: missing required distro feature 'systemd' (not in
> > DISTRO_FEATURES)
>
> It uses functions from dbus service org.freedesktop.timedate1 to set
> time and date. Without this dbus service, xfce4-datetime-setter doesn't
> work.
> And this dbus service is provides by systemd. The alternative is to
> require distro feature 'systemd'. But I think RRDEPENDS should be more
> proper.

In such cases, it means the package is systemd specific and since we
can only have one init system for a distro this package
should be guarded with that distro feature as well. rdepends does not
know distro nuances.

>
> Regards,
> Kai
>
>
> >> --
> >> 2.20.0
> >>
>
> --
> Kai Kang
>

