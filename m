Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.110862.1597929940848250015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 06:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NiWV1R15;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jonatan.p@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id b16so2155789ioj.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F2w41wSyxTpUpFbAv/sFnYbqnJYAkP10UDVui3lUZZM=;
        b=NiWV1R15W7po5ubMKXG9E5MXOcgoEo6di6FOfrLfjqfcVIjSX06oJVR4tqt/8awmeB
         1oPe2uTbqwheePhGcfzysPfJX7h3dCDiUKjjpY0XPD8Su7o3MuT7OKynBo+dpZpHDi2i
         p8ROi8SJUtU+bTxTyIPoKv5yYcgS3KK/1X/EDKp6dJemsM8NbmxxVtZjyMvtMoxBB3bW
         xi6aEhjECsQMF8G3P+J3lTiRy7/7HeChooVlcmtkqBMgjxlfZWUF8Q3RS0B7enEZ0O3d
         PAF3G3ZG2a3+ufLAMVACyGRydOC/53jDTQg4luBRKS+ueGlp2tI26Kub6taQFc/LSbND
         A48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F2w41wSyxTpUpFbAv/sFnYbqnJYAkP10UDVui3lUZZM=;
        b=of5qnCJvkO61DCOBWy7ySwFvNmjY25LlFoO/vCIn2Pc1ZAkE1iUMPJPiuZ5T+uL05j
         4rH8p2Ad1z5qFb/L8d07uYVWGrMZY/EDcK7eiRMGECbnln5DWuyGIU/izgu8PCtJnRl5
         jT8CEfaLPW8153UBbUaiH9CF5tYKxqYoAwNACxHdYk6xVtmya3iemazxbd+rU26pZsal
         9N9A9vWbKlnaAnHUlVHKjJmEG1OWZet4AZJn6PySo224FOkfjcLzLxXU2fuTjnagKMha
         S5ERUbuSyT62rDKMXpNGMNHq7jBm17/LZ+97PnsjURJIcluRlP1e+qzxmTPTTSaIS+QS
         bObw==
X-Gm-Message-State: AOAM532mCNzfjY60MpU4UVHw+6GfAwpMNoqNTyxjiUaBGaadAdml/Z4c
	JyQYrbSxDN3s3diyZyF1EOb5kHddikPi6h9YH+k=
X-Google-Smtp-Source: ABdhPJxhqtq9y43SD3C1gGXNmJ5LjlblKQAAQcJDAnW0ga3edY7iMg5FiU0GnRCaR0g1QM1NsHu6aqjK5etM5vFH1Qo=
X-Received: by 2002:a05:6602:2106:: with SMTP id x6mr2529798iox.84.1597929940065;
 Thu, 20 Aug 2020 06:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <16285DBF18FAF8F7.27500@lists.openembedded.org>
 <CAKm+giMq=wbHhLn4WDM0xfnv4J2GJEQYfUzKts3vJukgBm2cYw@mail.gmail.com> <20200820101218.GC51054@pcleri>
In-Reply-To: <20200820101218.GC51054@pcleri>
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
Date: Thu, 20 Aug 2020 15:25:28 +0200
Message-ID: <CAKm+giO7SSxDfhXR2-=VGe+O_gyH3Zwoar+FwdyZ_iMC4cZ7aQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] openjdk-8: Convert do_unpack postfunc to _append
To: Richard Leitner <richard.leitner@skidata.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Thu, Aug 20, 2020 at 12:12 PM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> Hi,
> thanks for your patch!
> Unfortunately we already have a similar one in master-next (commit
> b8e6267 (WORKDIR and ARCHIVER_WORKDIR support, 2020-05-09)).

Ah, I didn't see that. I've tested the patch from master-next now, and
it fixes my issues too.

Thanks!

>
> Would you please have a look at it and if applicable send a rebased
> (master-next) version?
>
> regards;rl
>
> On Wed, Aug 19, 2020 at 11:31:17AM +0200, Jonatan Palsson wrote:
> > Ping
> >
> > On Wed, Aug 5, 2020 at 2:05 PM Jonatan P=C3=A5lsson via
> > lists.openembedded.org <jonatan.p=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > archiver.bbclass will invoke do_unpack as a function (rather than a
> > > task) during do_unpack_and_patch. When invoked as a function, the
> > > postfuncs of do_unpack are not executed.
> > >
> > > Convert the postfuncs into an _append fragment on do_unpack instead.
> > >
> > > Fixes:
> > >
> > >     .. snip ..
> > >     No file to patch.  Skipping patch.
> > >     1 out of 1 hunk ignored
> > >     Patch 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch does not =
apply (enforce with -f)
> > >     ERROR: Logfile of failure stored in: .. snip .. /build/tmp/work/=
x86_64-linux/openjdk-8-native/252-r0/temp/log.do_unpack_and_patch.220625
> > >     ERROR: Task (.. snip .. /sources/openembedded-core/meta-java/rec=
ipes-core/openjdk/openjdk-8-native_252.bb:do_unpack_and_patch) failed with =
exit code '1'
> > > ---
> > >  recipes-core/openjdk/openjdk-8-common.inc | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-cor=
e/openjdk/openjdk-8-common.inc
> > > index c78bb2a..123e896 100644
> > > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > > @@ -46,6 +46,13 @@ do_unpack_delete_X11_wrappers() {
> > >      find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name=
 '*.java' -delete
> > >  }
> > >
> > > +do_unpack_append() {
> > > +    bb.build.exec_func('do_unpack_extract_submodules', d)
> > > +
> > > +    if not bb.utils.filter('PACKAGECONFIG', 'x11', d):
> > > +        bb.build.exec_func('do_unpack_delete_X11_wrappers', d)
> > > +}
> > > +
> > >  def package_config_option_cleanup(d):
> > >      distro_x11 =3D bb.utils.contains('DISTRO_FEATURES', 'x11', True=
, False, d)
> > >      distro_alsa =3D bb.utils.contains('DISTRO_FEATURES', 'alsa', Tr=
ue, False, d)
> > > @@ -155,9 +162,6 @@ def jdk_configure_options(d):
> > >      options =3D package_config_option_cleanup(d)
> > >      return options[3]
> > >
> > > -do_unpack[postfuncs] +=3D "do_unpack_extract_submodules"
> > > -do_unpack[postfuncs] +=3D "${@bb.utils.contains('PACKAGECONFIG', 'x=
11', '', 'do_unpack_delete_X11_wrappers', d)}"
> > > -
> > >  export DEBUG_BINARIES =3D "true"
> > >
> > >  ALTERNATIVE_PRIORITY =3D "50"
> > > --
> > > 2.26.1
> > >
> > >=20
>
> --
> Richard Leitner
> Hardware R&D / Senior Embedded Linux Engineer
>
> SKIDATA | Driving Your Digital Future
>
> SKIDATA GmbH
> Untersbergstra=C3=9Fe 40 | 5083 Gr=C3=B6dig/Salzburg | Austria
> [t] +43-6246-888-4245 | [m] +43-664-88616370
> [w] www.skidata.com
