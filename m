Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88044C2BA12
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 16:01:02 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.14167.1694880056902210777
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 09:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/IwWzvb;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so1879704fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694880056; x=1695484856; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uC0FUCxDNJt7ZTTlJKcEA4ILfdfqzAEVHkK0uHSVwc=;
        b=B/IwWzvbQUMPCx5OF4zRE9Tnn4N9Kb9gx/G9AM7Q8bZdckQxmk8bXpfu/5JG4jT+rU
         EJAvgnG/79wWWF3zhbdZTVr0LBJRiJiujKZuWuBZIkKCDCA16X5dpbpNfEYkbg1TOxQF
         ExgJZGuJ6aULFkGqQuYj0XiSJ565DhgXwF3uhqKC+vOeAwMlua0aT4tWctfKmWEfdQ8R
         Kd3Nk0tKmD2TfuY3M3p/YoC+vwRsP5ePkcg79mh9hEv/Yx1WZiQf/9c3GrvBaMSLUKiu
         CoQnpPNiREQj2XPRCXelPe89JjhD2MjVn5dk/B2n7NugCiyP6DOCe8+n8IwXL6AN2Tyg
         B4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694880056; x=1695484856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uC0FUCxDNJt7ZTTlJKcEA4ILfdfqzAEVHkK0uHSVwc=;
        b=fvwt1xqifnqRBALpIZWCOp36nGDPm4Krt/oewtoPKO8gH1Pz7MBxZ8CYQKNR5RRoDY
         TT40JNBgJfXelo4FwORqzEa04bLq0tUudMTd130fM+j6q6NA/SatoijAspbpiz6Jrv1h
         r1ECxYjYmIRoonKbcVIBi0bfa1z6JiEaLz2sCZc3LA5AeLGJduYfV9IKke4Tpv60UBTl
         rPSm04jVlO8UQh6Iz4FuBtp0ZLe86LB/g8NojOV1Y32ImVrPh8bLlTUOq+ExhMOO5jQ0
         Ongnu2ssXnz6PE7ArkjDdfidz7V4wGdRDfpU7jzUBOg8mPosOLNCdo9xcNJ+TTjR6eA/
         lXgA==
X-Gm-Message-State: AOJu0YxEjFtmv20SgYZ85+Rby50f5uBnRc4G/Sc67rVynZPtSd4US+EK
	qisKEogCCAMWoO62W8rOb1HzgiM1Md3oHly2+uc=
X-Google-Smtp-Source: AGHT+IHHNC2KCgcGWBcRpXZ5qJqun8p1U7KWXTzGowNFABEhCF2A91x/sXBmrAJ6CwxHA7XpcvNXScrxlgq2qFJ5WLo=
X-Received: by 2002:a05:6870:b015:b0:1d5:cba4:a6f6 with SMTP id
 y21-20020a056870b01500b001d5cba4a6f6mr5582039oae.6.1694880056079; Sat, 16 Sep
 2023 09:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230908114242.1417439-1-f_l_k@t-online.de> <CAMKF1srwFz8JWPDE+0Xn4UzveanO5-FhyL5OUTsGeJOrVCqe0g@mail.gmail.com>
In-Reply-To: <CAMKF1srwFz8JWPDE+0Xn4UzveanO5-FhyL5OUTsGeJOrVCqe0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Sep 2023 09:00:29 -0700
Message-ID: <CAMKF1sooHk8k4nbdfsdZ-V=6mhyf_sZpNEPaq0U5Yo9HLSmoMQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libxmlb: update 0.3.10 -> 0.3.14
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 16:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104903

We also see build QA hinting at this subsequent runtime error during build

WARNING: libxmlb-0.3.14-r0 do_package_qa: QA Issue: File
/usr/libexec/installed-tests/libxmlb/xb-self-test in package
libxmlb-ptest contains reference to TMPDIR [buildpaths]

On Sat, Sep 16, 2023 at 8:54=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This is failing ptest run
>
> You can reproduce it with
>
> bitbake meta-oe-ptest-image-libxmlb
> runqemu kvm meta-oe-ptest-image-libxmlb
> ssh into qemu
> cd /usr/lib/libxmlb/ptest
> ./run-ptest
>
> ERROR:../git/src/xb-self-test.c:188:xb_common_content_type_func:
> assertion failed (error =3D=3D NULL): Failed to open file
> ?/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libxmlb/0.3.14/git/d=
ata/test.desktop?:
> No such file or directory (g-file-error-quark, 4)
> not ok /libxmlb/common{content-type} -
> ERROR:../git/src/xb-self-test.c:188:xb_common_content_type_func:
> assertion failed (error =3D=3D NULL): Failed to open file
> ?/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libxmlb/0.3.14/git/d=
ata/test.desktop?:
> No such file or directory (g-file-error-quark, 4)
> Bail out!
> FAIL: libxmlb/libxmlb.test (Child process killed by signal 6)
> SUMMARY: total=3D1; passed=3D0; skipped=3D0; failed=3D1; user=3D0.0s;
> system=3D0.0s; maxrss=3D5120
> FAIL: libxmlb/libxmlb.test (Child process killed by signal 6)
>
> On Fri, Sep 8, 2023 at 4:42=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
> >
> > This update is required for latest appstream release
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../libxmlb/{libxmlb_0.3.10.bb =3D> libxmlb_0.3.14.bb}        | 6 +++-=
--
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.10.bb =3D> libxmlb_0=
.3.14.bb} (86%)
> >
> > diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/=
recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> > similarity index 86%
> > rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
> > rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> > index 61abd07fd..d46811124 100644
> > --- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
> > +++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> > @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c=
3ce8cb06b4861d75310742"
> >  SRC_URI =3D "git://github.com/hughsie/libxmlb.git;branch=3Dmain;protoc=
ol=3Dhttps \
> >             file://run-ptest \
> >             "
> > -SRCREV =3D "a6cac6a715d57c393bbddee4d0381ad943341af9"
> > +SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
> >  S =3D "${WORKDIR}/git"
> >
> > -DEPENDS =3D "glib-2.0 xz"
> > +DEPENDS =3D "glib-2.0 xz zstd"
> >
> > -inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
> > +inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pk=
gconfig
> >
> >  PACKAGECONFIG ??=3D "\
> >      ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#104802): https://lists.openembedded.org/g/openembed=
ded-devel/message/104802
> > Mute This Topic: https://lists.openembedded.org/mt/101234583/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

