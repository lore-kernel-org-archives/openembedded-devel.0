Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F79E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 14:24:05 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.31017.1725805436559943678
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 07:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuPf3JqV;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e1b35030aeso1371515eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725805436; x=1726410236; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JyJ+h4zfgueHU5a24B35ZT41HFP9W530kRoNNvTqH9w=;
        b=SuPf3JqVE5Cu6ADwPOz+uV7PbCancwTcqKV9OUZCBaXrXrH8KoQ2Slg05EfyKJOB1f
         dkWSGegp9Sy8gOM1zQnzDfIHqEOESHOlsK7Tl6QCKtHn3p/G8XEdpJknsTtZZnDTnGX8
         SdE3HcLQxqRjdHSgknpOTPkUt4g70e9FwYtow8UPSc6x/yt/Li4x41/6w6yBpRBkO/t7
         ci9W3LAwXAIuIayXdcXGEF/jy4k4Xm/fkmCOeJE9p/M/ogurt3PguZmBFj+pf6Plobsu
         k9s9mHE9N7Wa5PKhPNFy75hwaSe3B2ljtMqyh2ApB1SG2YvPhE1U32c8qUWJ/FGbrSYw
         yJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805436; x=1726410236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyJ+h4zfgueHU5a24B35ZT41HFP9W530kRoNNvTqH9w=;
        b=lK60GSWy+UaCeZMhfWWbdY81AYlK+XISdl5AB999oSjlPdgLLEDQWKFZqVCwMl8/jO
         7B1+PcQLyimfvmKwF/M4jaI1jnEIMjBeEGF66bUv+/9fMfUg1C5taTVEn3oUMirXBc5C
         tMWqUjy4rw9/ojOEkTelALoj8cIlhzS2K0cc38YRJXzpE1WPZAfeuiCxlMaPSmNSvK1s
         R3KxvCcN7ChakcGzV1jfAhF0qGsxvDIv4WJWXsn2RfKVsngrmhlnasAke6yWQhGjBOIx
         N/V04+LA4jvQsEl6E20TSYUnuUOJUvo9iONu81J015zzL0uq6COtXh7xM6smYVpIsBh/
         0tSg==
X-Gm-Message-State: AOJu0YwbEkKpoMuLi6auDpIgNwIgSQ3jkWVjHe80VzypaBHbKgM6Okx8
	DiBp5LPm0uu9bcE/2Qe8gzJ+bxAVve/Kxm5UiQyYc1qpC0UvNsZmGAe0awuo6MbA9wiWyNCHjZW
	7zGAcwbOoTWE2itmF6hzIYWkOtfg=
X-Google-Smtp-Source: AGHT+IF1f9cQUqH0t8dybQRL4VYlDXLbxONxcC5sgKtjRosyAnqRb+cducc7r/Iuym2381RhJIv7NRFLlvz6CNQm7xE=
X-Received: by 2002:a05:6820:16a3:b0:5c4:68b8:e27f with SMTP id
 006d021491bc7-5e1a9d2332bmr9059160eaf.6.1725805435668; Sun, 08 Sep 2024
 07:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240902162710.1284914-1-martin.jansa@gmail.com>
 <17F17A4E8C380788.17352@lists.openembedded.org> <CA+chaQcOfZrNWvVF5q+1otfTfif8k0Tie_2V-0wcsshBNBfB8A@mail.gmail.com>
In-Reply-To: <CA+chaQcOfZrNWvVF5q+1otfTfif8k0Tie_2V-0wcsshBNBfB8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Sep 2024 07:23:45 -0700
Message-ID: <CAMKF1so0zOeuE-xuXAVPLinEto1A=pkB=ty9BPY0gVZRA2dD4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] python3-matplotlib: add native RSS to
 -fmacro-prefix-map to fix buildpaths QA
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1cffd06219c63de"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 14:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112140

--000000000000f1cffd06219c63de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 12:35=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Khem: please drop this one from master-next
>
> It was added in the default DEBUG_PREFIX_MAP in oe-core now.


Yes thanks I was adding it for testing a local issue I was seeing with
clang. Thanks for letting me know regardless


>
> On Mon, Sep 2, 2024 at 6:30=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This is related RFC patch just sent to oe-core ML:
> > https://lists.openembedded.org/g/openembedded-core/message/204110
> >
> > On Mon, Sep 2, 2024 at 6:27=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com>
> wrote:
> > >
> > > * fixes:
> > >   ERROR: lib32-python3-matplotlib-3.7.2-r0 do_package_qa: QA Issue:
> File /usr/lib/python3.12/site-packages/matplotlib/_
> tri.cpython-312-i386-linux-gnu.so in package lib32-python3-matplotlib
> contains reference to TMPDIR [buildpaths]
> > >
> > > * there is native RSS already but only in -fdebug-prefix-map
> > >
> > > * it fails only with multilib where target RSS isn't substring of
> native RSS
> > >
> > > * comparing _tri.cpython-312-*-linux-gnu.so cmdline for regular x86-6=
4
> and lib32-python3-matplotlib i586 build shows:
> > >
> > >
> --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2
> \
> > >
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2
> \
> > >
> --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2
> \
> > >
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2
> \
> > >
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot=3D
> \
> > >
> --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot=3D
> \
> > >
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot-native=3D
> \
> > >
> +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2
> \
> > >
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2
> \
> > >
> +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2
> \
> > >
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2
> \
> > >
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D
> \
> > >
> +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D
> \
> > >
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native=3D
> \
> > >
> > > * the buildpaths are header files from native pybind11
> (Pybind11Extension)
> > >
> https://github.com/pybind/pybind11/blob/master/pybind11/setup_helpers.py#=
L89
> > >
> > > $ strings package/usr/lib/python3.12/site-packages/matplotlib/_
> tri.cpython-312-i386-linux-gnu.so | grep oemllib32
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/../detail/common.h
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/../detail/../pytypes.h
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/class.h
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/../detail/type_caster_base.h
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/pybind11.h
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/gil.h
> > >
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/gil_safe_call_once.h
> > >
> > > * I'm not familiar enough with pybind11 to find a way how to configur=
e
> it to
> > >   use correct include dir, the issue already exists in regular x86-64
> dir, but
> > >   not caught by buildpaths, because, the:
> > >
>  -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot=3D
> > >   is enought to mangle the hardcoded paths (leaving only '-native')
> like this:
> > >
> > > strings
> ../3.7.2-x86-64/package/usr/lib64/python3.12/site-packages/matplotlib/_
> tri.cpython-312-x86_64-linux-gnu.so | grep pybind11/include/pybind11
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail=
/common.h
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pytype=
s.h
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail=
/class.h
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail=
/type_caster_base.h
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pybind=
11.h
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil.h
> > >
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil_sa=
fe_call_once.h
> > >
> > > * there is also:
> > >   WARNING: lib32-python3-matplotlib-3.7.2-r0 do_check_backend: QA
> Issue: inherits setuptools3 but has pyproject.toml with
> setuptools.build_meta, use the correct class [pep517-backend]
> > >   but just changing the inherit doesn't work in this case, I'll leave
> that
> > >   to someone actually using python3-matplotlib
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  .../recipes-devtools/python/python3-matplotlib_3.7.2.bb      | 5
> +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/
> python3-matplotlib_3.7.2.bb b/meta-python/recipes-devtools/python/
> python3-matplotlib_3.7.2.bb
> > > index 72c369100a..2886060a9e 100644
> > > --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> > > @@ -68,3 +68,8 @@ do_compile:prepend() {
> > >  }
> > >
> > >  BBCLASSEXTEND =3D "native"
> > > +
> > > +# otherwise pybind11 paths from STAGING_DIR_NATIVE end in _
> tri.cpython-312-i386-linux-gnu.so
> > > +# when STAGING_DIR_NATIVE doesn't start with STAGING_DIR_HOST (e.g.
> for lib32-python3-matplotlib)
> > > +# http://errors.yoctoproject.org/Errors/Details/801217/
> > > +DEBUG_PREFIX_MAP:append =3D " -fmacro-prefix-map=3D${STAGING_DIR_NAT=
IVE}=3D"
> > > --
> > > 2.46.0
> > >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112124):
> https://lists.openembedded.org/g/openembedded-devel/message/112124
> Mute This Topic: https://lists.openembedded.org/mt/108229723/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f1cffd06219c63de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 8, 2024 at 12:35=E2=80=AFAM Martin Jansa via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;mart=
in.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Khem: please drop this one from master-next<br>
<br>
It was added in the default DEBUG_PREFIX_MAP in oe-core now.</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Yes thanks I was adding it for =
testing a local issue I was seeing with clang. Thanks for letting me know r=
egardless=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex" dir=3D"auto"><br>
<br>
On Mon, Sep 2, 2024 at 6:30=E2=80=AFPM Martin Jansa via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targ=
et=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; This is related RFC patch just sent to oe-core ML:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
204110" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/204110</a><br>
&gt;<br>
&gt; On Mon, Sep 2, 2024 at 6:27=E2=80=AFPM Martin Jansa &lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
; wrote:<br>
&gt; &gt;<br>
&gt; &gt; * fixes:<br>
&gt; &gt;=C2=A0 =C2=A0ERROR: lib32-python3-matplotlib-3.7.2-r0 do_package_q=
a: QA Issue: File /usr/lib/python3.12/site-packages/matplotlib/_<a href=3D"=
http://tri.cpython-312-i386-linux-gnu.so" rel=3D"noreferrer" target=3D"_bla=
nk">tri.cpython-312-i386-linux-gnu.so</a> in package lib32-python3-matplotl=
ib contains reference to TMPDIR [buildpaths]<br>
&gt; &gt;<br>
&gt; &gt; * there is native RSS already but only in -fdebug-prefix-map<br>
&gt; &gt;<br>
&gt; &gt; * it fails only with multilib where target RSS isn&#39;t substrin=
g of native RSS<br>
&gt; &gt;<br>
&gt; &gt; * comparing _tri.cpython-312-*-linux-gnu.so cmdline for regular x=
86-64 and lib32-python3-matplotlib i586 build shows:<br>
&gt; &gt;<br>
&gt; &gt; --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-=
matplotlib/3.7.2 \<br>
&gt; &gt; --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-=
matplotlib/3.7.2 \<br>
&gt; &gt; --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-=
matplotlib/3.7.2 \<br>
&gt; &gt; --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-=
matplotlib/3.7.2 \<br>
&gt; &gt; --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/recipe-sysroot=3D \<br>
&gt; &gt; --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/recipe-sysroot=3D \<br>
&gt; &gt; --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/python3-matplotlib/3.7.2/recipe-sysroot-native=3D \<br>
&gt; &gt; +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug=
/lib32-python3-matplotlib/3.7.2 \<br>
&gt; &gt; +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug=
/lib32-python3-matplotlib/3.7.2 \<br>
&gt; &gt; +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug=
/lib32-python3-matplotlib/3.7.2 \<br>
&gt; &gt; +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug=
/lib32-python3-matplotlib/3.7.2 \<br>
&gt; &gt; +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \<br>
&gt; &gt; +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \<br>
&gt; &gt; +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemll=
ib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native=3D \<br>
&gt; &gt;<br>
&gt; &gt; * the buildpaths are header files from native pybind11 (Pybind11E=
xtension)<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/pybind/pybind11/blob/ma=
ster/pybind11/setup_helpers.py#L89" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/pybind/pybind11/blob/master/pybind11/setup_helpers.py#L89<=
/a><br>
&gt; &gt;<br>
&gt; &gt; $ strings package/usr/lib/python3.12/site-packages/matplotlib/_<a=
 href=3D"http://tri.cpython-312-i386-linux-gnu.so" rel=3D"noreferrer" targe=
t=3D"_blank">tri.cpython-312-i386-linux-gnu.so</a> | grep oemllib32<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/detail/../detail/common.h<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/detail/../detail/../pytypes.h<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/detail/class.h<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/detail/../detail/type_caster_base.h<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/pybind11.h<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/gil.h<br>
&gt; &gt; /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-pytho=
n3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/=
pybind11/include/pybind11/gil_safe_call_once.h<br>
&gt; &gt;<br>
&gt; &gt; * I&#39;m not familiar enough with pybind11 to find a way how to =
configure it to<br>
&gt; &gt;=C2=A0 =C2=A0use correct include dir, the issue already exists in =
regular x86-64 dir, but<br>
&gt; &gt;=C2=A0 =C2=A0not caught by buildpaths, because, the:<br>
&gt; &gt;=C2=A0 =C2=A0-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work=
/core2-64-oe-linux/python3-matplotlib/3.7.2/recipe-sysroot=3D<br>
&gt; &gt;=C2=A0 =C2=A0is enought to mangle the hardcoded paths (leaving onl=
y &#39;-native&#39;) like this:<br>
&gt; &gt;<br>
&gt; &gt; strings ../3.7.2-x86-64/package/usr/lib64/python3.12/site-package=
s/matplotlib/_<a href=3D"http://tri.cpython-312-x86_64-linux-gnu.so" rel=3D=
"noreferrer" target=3D"_blank">tri.cpython-312-x86_64-linux-gnu.so</a> | gr=
ep pybind11/include/pybind11<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/detail/common.h<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/pytypes.h<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/detail/class.h<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/detail/type_caster_base.h<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/pybind11.h<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/gil.h<br>
&gt; &gt; -native/usr/lib/python3.12/site-packages/pybind11/include/pybind1=
1/gil_safe_call_once.h<br>
&gt; &gt;<br>
&gt; &gt; * there is also:<br>
&gt; &gt;=C2=A0 =C2=A0WARNING: lib32-python3-matplotlib-3.7.2-r0 do_check_b=
ackend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptoo=
ls.build_meta, use the correct class [pep517-backend]<br>
&gt; &gt;=C2=A0 =C2=A0but just changing the inherit doesn&#39;t work in thi=
s case, I&#39;ll leave that<br>
&gt; &gt;=C2=A0 =C2=A0to someone actually using python3-matplotlib<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-matpl=
otlib_3.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.7=
.2.bb</a>=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-matplotlib_3.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-matplotlib_3.7.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-matplotlib_3.7.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-matplotlib_3.7.2.bb</a><br>
&gt; &gt; index 72c369100a..2886060a9e 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-matplotlib_3.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplo=
tlib_3.7.2.bb</a><br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-matplotlib_3.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplo=
tlib_3.7.2.bb</a><br>
&gt; &gt; @@ -68,3 +68,8 @@ do_compile:prepend() {<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# otherwise pybind11 paths from STAGING_DIR_NATIVE end in _<a hr=
ef=3D"http://tri.cpython-312-i386-linux-gnu.so" rel=3D"noreferrer" target=
=3D"_blank">tri.cpython-312-i386-linux-gnu.so</a><br>
&gt; &gt; +# when STAGING_DIR_NATIVE doesn&#39;t start with STAGING_DIR_HOS=
T (e.g. for lib32-python3-matplotlib)<br>
&gt; &gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/80121=
7/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Err=
ors/Details/801217/</a><br>
&gt; &gt; +DEBUG_PREFIX_MAP:append =3D &quot; -fmacro-prefix-map=3D${STAGIN=
G_DIR_NATIVE}=3D&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.46.0<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112124): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112124" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112124</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108229723/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108229723/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f1cffd06219c63de--

