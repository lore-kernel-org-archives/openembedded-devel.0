Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5053BC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 06:36:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.38208.1681108613802173897
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 23:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hEb6JIU5;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1842eb46746so4910638fac.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Apr 2023 23:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681108613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SW5pRQDpxWPBxe7TtC9EMfyCc4u/DBT3DnnLzfPf3c=;
        b=hEb6JIU5W4Bv0IUzKU4TPs+kFxRGD1bGwEcrk7f3diV5+xEG8+wYK7tyl09nVW66fe
         RMAcl+XeVSEVCpT2yCLBAnRbpnPPdf96nfV/YuOpfVtN/G6G2AfPe4b0M4QVztHr8gw0
         cLMgYknZBFabcEgyWvhYtpLFXn1FaLD2CprcoOSl1asdzO7XaacdgUcpWaU2Qus0wthW
         VulppA5iC0gNY446U9qrFCITW1uL9uKLqBnCnQ0/XTdYU4kG6YcPGpzJujlpSQpzNj1C
         ACpY7oawG4/yS7FRa+mtAE2v2x2z70jRg9EXqaXL5dyDKWSEBB1DBKWWZvG4HcEAKUv6
         Ad/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681108613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SW5pRQDpxWPBxe7TtC9EMfyCc4u/DBT3DnnLzfPf3c=;
        b=gSJaJ/ju+0u+FSnu0Uof/3FBN7vqvE2qsUheItm57ae++fbCREGGjY0xl5bw6L6ni+
         od5cksz7km4RgmLZ2zlqmzs6Z8GD3/mYiGHKnNuSlp5SuMo0bpJJ7A6p5JrO/S5pRju7
         TQKR7tENwUAD0lqVoLunQWaKii7O92WV4j0ji7/zBq0cWiDRFkyJz2yeAiflNgpecLtE
         0+pHqI6hEeqvYsIE6CfJ7FRDDQrtUVMK2tcMB9FRIaw0+mwA+z5v0mLXWAyw+QfNv5Nu
         U7RJ3/u+1xcE6tdT2SLYEqO/mpxTInMuLxp/XupNZPYw355S8nNsWxbv5HlF8mmi+G+F
         67ug==
X-Gm-Message-State: AAQBX9dNIm29zbEW5UiVPFWpO+8Ia4vdMnTOagkYEvHgE42Kd0ajP+Bs
	jsY8VSyLvCT91jfiZd06XKGvlKVIrcn0bY+PZesHSJnr
X-Google-Smtp-Source: AKy350aBx8C83HQNWiAqVFErQIS7zmhtqdzWmc5T4L+2XWVvmt6Pp388J55M6m46y4erGfR1UpZGjFYaLXg6ZpAf3c0=
X-Received: by 2002:a05:6870:41ca:b0:17e:915c:84a2 with SMTP id
 z10-20020a05687041ca00b0017e915c84a2mr4441609oac.4.1681108612895; Sun, 09 Apr
 2023 23:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230407091722.5576-1-kai.kang@windriver.com> <20230407091722.5576-4-kai.kang@windriver.com>
 <CAMKF1sqBB86gAtOkPZ=8WBPxup8Y46TzMc_LKJ0GC3rih9_jag@mail.gmail.com> <1aaac718-c8a9-dca7-ddc7-5a3a83f66def@windriver.com>
In-Reply-To: <1aaac718-c8a9-dca7-ddc7-5a3a83f66def@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Apr 2023 23:36:27 -0700
Message-ID: <CAMKF1sre7ZvBPRaWCkhUo2gziUAT+5z8PPyPSRQnSYMc1LVMqQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 4/4] xfce4-screenshooter: 1.9.10 -> 1.10.3
To: Kai <kai.kang@windriver.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 06:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102004

On Sun, Apr 9, 2023 at 10:36=E2=80=AFPM Kai <kai.kang@windriver.com> wrote:
>
> On 4/7/23 23:41, Khem Raj wrote:
> > On Fri, Apr 7, 2023 at 2:17=E2=80=AFAM Kai Kang <kai.kang@eng.windriver=
.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Update xfce4-screenshooter from 1.9.10 to 1.10.3
> >>
> >> * update HOMEPAGE that goodies.xfce.org has been decommissioning
> >> * content of license file has been updated
> > Its vague and does not state what has changed. Can you add some more
> > info towards what has changed ?
>
> Hi Khem,
>
> According to
>
> https://gitlab.xfce.org/apps/xfce4-screenshooter/-/issues/70
>
> The current license for this component is out of date. Please see
> xfce4-taskmanager Issue #49 for additional details & discussion.
>
> Briefly:
>
> Comparing the 17 years old file with the new one, we have:
>
>   - some whitespace changes
>   - a new FSF address
>   - some extra commas
>
> All references to GNU Library General Public License have been replaced
> with GNU Lesser General Public License
>

This info would have been good in the commit message.

>
> Regards,
> Kai
>
> >
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   ...creenshooter_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} | 6 ++=
+---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>   rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshoot=
er_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} (66%)
> >>
> >> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensh=
ooter_1.9.10.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensh=
ooter_1.10.3.bb
> >> similarity index 66%
> >> rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensho=
oter_1.9.10.bb
> >> rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.10.3.bb
> >> index bb44ec782..10427dab3 100644
> >> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1=
.9.10.bb
> >> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1=
.10.3.bb
> >> @@ -1,13 +1,13 @@
> >>   SUMMARY =3D "Application to take screenshots"
> >> -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-scr=
eenshooter"
> >> +HOMEPAGE =3D "https://docs.xfce.org/apps/xfce4-screenshooter/start"
> >>   SECTION =3D "x11/application"
> >>   LICENSE =3D "GPL-2.0-only"
> >> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7=
599855"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> >>   DEPENDS =3D "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 gl=
ib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11 libxml-parser-perl-nat=
ive"
> >>
> >>   inherit xfce-app perlnative
> >>
> >> -SRC_URI[sha256sum] =3D "04b4178527f5b98cfe76ae427e95581067edf262a5306=
39d332f6db9a68292d7"
> >> +SRC_URI[sha256sum] =3D "a454159847becfeca274a5b58c0e5817d4a260a29345a=
37bbc3b4ff46f8f3818"
> >>
> >>   do_compile:prepend() {
> >>       mkdir -p lib
> >> --
> >> 2.17.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#101981): https://lists.openembedded.org/g/openembe=
dded-devel/message/101981
> >> Mute This Topic: https://lists.openembedded.org/mt/98121607/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Kai Kang
> Wind River Linux
>

