Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73550C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:40:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.15066.1750668039789529327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjiMnGSK;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso4538182a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750668039; x=1751272839; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=193++mhh1EXmS8wPIkUKEyc8Slo5V5o8MCX0Ce01XkY=;
        b=HjiMnGSK9deAO1+oD7LADMdM7bzGqBq1XpdF90ZNSJJnYV1mUDW69uCMWFlOn2KUvQ
         8jFyHdNPz37W3MOz6EaVLxH4KDKuaaG77AJFmuuBTshPzKotypZzBVClQPGcc9XWDJyw
         cpwyZcczNELLU0I61u5PaU6ynpXI2Wunv5oX2FGLHkydIpzVPI+gCgmiMzPJ1m2fJJoJ
         Wdml0xUFWL3vW8uJM+jh2LrdWarIAz4iC89/KQe6eIlrrbsyN5V9SGGH6kUYOg577n6x
         5jaTzJ+9E+5eAoccOk2aBmnQU+sB+KCdZAhF9mcEy4msd/zQgAs08ND8WyxdpH7fiIcO
         pvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668039; x=1751272839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=193++mhh1EXmS8wPIkUKEyc8Slo5V5o8MCX0Ce01XkY=;
        b=OKuYEjC1w1PDO2tFneC2OqNf9JjhX/Yzfgl2op3aEky5pOQaLGQJyxT577G0VtTP58
         EdUNso9f2z9PZZfpM73x6PHlKI0dDKALGzVweUHJEo5Cs8H9zqeChFF4Cxs4Q7gqNmen
         tRQjcjFq/iXIJOeQtERiONXMC7vbj2t02EAZOVTTz9qVWmbRHx7n0d6fM5G2rgH3HV+U
         C4lIQgBHb2wAvDDSRCTOlPPjd1NHQdRz68mTMNnB5Ym3ipxR0pibUSX883ICk7ymzEFL
         80Tm3XO/3FNICsXooOl+fXZpNXMVhjANB5bZ3J3h2A189xiHSegYSrdbhuTgKwbqScnb
         UllA==
X-Gm-Message-State: AOJu0YwuUnEL42GE2nQvJSimTE1AU84BxXSBQlWuUBUlR/PPHLZDag3L
	AevTGVwgPlWicrznbKN8Saf9RMUSmlYcnsGy7VIFg+8LK109PvXWPJcWvEbWCKqKGNDdnwCi2mj
	xBbfk1UcIpnp4MC573u4OALcH83uU9D7jlgZh
X-Gm-Gg: ASbGncuyDtwlKkYCLTbaFLP2x7twG8nxwVwFfsuc/sUybiW3F+A7US8ibSfqIYTaExU
	XINw9rYVRsA2q9clT+PrARu28j/pcmvurwNkGmWfVTxkZTtQq1t9mciEAdHAePCG/JwowdHSzwf
	hzoL9yl4h+NulnnIpWvga6FGg9IBiBvcD53HUVmPHVt/U=
X-Google-Smtp-Source: AGHT+IEAgjSX7xZ9P/1Jtc25X2KznnYVHCl/AABvuNbDh/rYrRCep57yXgpHD8L/v+4al2BhuRiEZy+BjpLZiVxFv18=
X-Received: by 2002:a17:90b:562d:b0:312:1d2d:18e2 with SMTP id
 98e67ed59e1d1-3159d8c5daemr17984278a91.20.1750668039036; Mon, 23 Jun 2025
 01:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250621102550.1523918-1-alperyasinak1@gmail.com>
 <CAMSfU+5ymAa0RFBaSkfuke3H_Bimui5sJn8_BNZ+yKE1hCvYSA@mail.gmail.com>
 <CAGpma=61wNNLVtKYC_okEvvU-31f2xP69=VtUKqHCJZC05Dy2g@mail.gmail.com> <CAMSfU+43AVGcV+6KEmgpUDX51J3OnQD5x5SvS-TxQEfOhhOG8Q@mail.gmail.com>
In-Reply-To: <CAMSfU+43AVGcV+6KEmgpUDX51J3OnQD5x5SvS-TxQEfOhhOG8Q@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 23 Jun 2025 11:40:27 +0300
X-Gm-Features: AX0GCFsFA_ajCllJiWReKpUD7Yd6VOfE6C1kF5DNYFuNCDK-m-IDZ_QVHvDD9aM
Message-ID: <CAGpma=5QzPdFLN=x+HjNRcH-OecLeEjrJB1Ksa7JKu+jBtbOsA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ace: Fix contains reference to TMPDIR
 [buildpaths] error
To: Yoann Congal <yoann.congal@smile.fr>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118061

When Yoan Cognal and I looked at the structure of the project, we saw
that CCFLAGS is used instead of CXXFLAGS to add C++ compiler flags.

https://github.com/DOCGroup/ACE_TAO/blob/master/ACE/include/makeinclude/wra=
pper_macros.GNU#L117

So, I will assign the value of CXXFLAGS to the CCFLAGS variable and
export CCFLAGS for use in the build environment.

I'm preparign the patch v2.

Yoann Congal <yoann.congal@smile.fr>, 22 Haz 2025 Paz, 16:00 tarihinde
=C5=9Funu yazd=C4=B1:
>
>
>
> Le dimanche 22 juin 2025, Alper Ak <alperyasinak1@gmail.com> a =C3=A9crit=
 :
> >> Hello,
> >> ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in poky/meta/conf/bitb=
ake.conf)
> >> Do you know why it is not the case here? or why does it not work?
> >> Thanks!
> >
> > Although Yocto/BitBake sets variables like CXXFLAGS and passes them to
> > the build environment, if i'm not wrong, these flags will only affect
> > the final compiler invocation if the project's own build system
> > actually uses those variables in its Makefiles or build scripts.
> >
> > Looks like ACE doesn't use CXXFLAGS in its main Makefiles or compiler
> > calls.  Instead of it, it often uses variables like CCFLAGS, CPPFLAGS
> > or directly invokes the compiler using the CXX, without including
> > CXXFLAGS. As a result, any flags added to CXXFLAGS, such as
> > ${DEBUG_PREFIX_MAP}, don't reach the compiler and the QA buildpaths
> > issue remains unresolved.
> >
> > Appending the flag directly to CXX works because ACE always calls the
> > compiler as "$(CXX) ...", so anything added to CXX is included in
> > every compiler invocation regardless of how the build system is
> > structured.  As I said, I was found that ACE's Makefiles do include
> > CPPFLAGS in the compiler calls. So, adding ${DEBUG_PREFIX_MAP} to
> > CPPFLAGS allows the flag to be properly propagated to the compiler and
> > resolves the QA issue.
> >
> > My thought before you asked the question was just "the problem is
> > caused by the project.". Now we have detailed it and figured out why.
> >
> > It seems that our solution here should be CPPFLAGS:append =3D "
> > ${DEBUG_PREFIX_MAP}". Let me know if I'm wrong or if there is a better
> > way.
>
> CPPFLAGS should be C PreProcessor options.
> DEBUG_PREFIX_MAP options are not C PreProcessor options.
>
> The theoretical solution would be to patch the ace build system to make i=
t pass CXXFLAGS to CXX-based compilation (as well as CPPFLAGS). That patch =
most likely deserves to be upstreamed.
>
> Since you looked at ace's makefiles, does it sound doable?
>
> >
> >
> > Yoann Congal <yoann.congal@smile.fr>, 21 Haz 2025 Cmt, 16:00 tarihinde
> > =C5=9Funu yazd=C4=B1:
> >>
> >>
> >>
> >> Le sam. 21 juin 2025 =C3=A0 12:26, Alper Ak via lists.openembedded.org=
 <alperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> >>>
> >>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/lib=
ACE_Compression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [b=
uildpaths]
> >>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/lib=
ACE_ETCL_Parser.so.8.0.2 in package ace-dbg contains reference to TMPDIR [b=
uildpaths]
> >>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/lib=
ACE_ETCL.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpat=
hs]
> >>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/lib=
ACE.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
> >>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/lib=
ACE_Monitor_Control.so.8.0.2 in package ace-dbg contains reference to TMPDI=
R [buildpaths]
> >>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/lib=
ACE_RLECompression.so.8.0.2 in package ace-dbg contains reference to TMPDIR=
 [buildpaths]
> >>> ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failin=
g task.
> >>>
> >>> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> >>> ---
> >>>  meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/=
recipes-connectivity/ace/ace_8.0.2.bb
> >>> index b730b0a86c..e62ed39d0b 100644
> >>> --- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> >>> +++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> >>> @@ -27,7 +27,7 @@ export ACE_ROOT =3D "${UNPACKDIR}/ACE_wrappers"
> >>>  inherit pkgconfig
> >>>
> >>>  CXXFLAGS:append =3D " -fpermissive -Wnodeprecated-declarations"
> >>> -CXX:append =3D " -ffile-prefix-map=3D${UNPACKDIR}=3D "
> >>> +CXX:append =3D " ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${UNPACKDIR=
}=3D "
> >>
> >>
> >> Hello,
> >>
> >> ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in poky/meta/conf/bitb=
ake.conf)
> >>
> >> Do you know why it is not the case here? or why does it not work?
> >>
> >> Thanks!
> >>
> >>>
> >>>  EXTRA_OEMAKE +=3D "INSTALL_LIB=3D${baselib} install_rpath=3D0"
> >>>
> >>>  do_install() {
> >>> --
> >>> 2.43.0
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#117996): https://lists.openembedded.org/g/openemb=
edded-devel/message/117996
> >>> Mute This Topic: https://lists.openembedded.org/mt/113755735/4316185
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [yoann.congal@smile.fr]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
> >>
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >
>
> --
> Yoann Congal
> Smile ECS
>

