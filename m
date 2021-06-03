Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.148.1622733131055450792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rh+/e55k;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id k4so6309046qkd.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sTxqbLiwQqApmwKK+baqNSuWZbCF6WItDGKGgdG1Apw=;
        b=rh+/e55kZJx7YzcoKpJZvsJAw/EHDhlUVQdn4qb3P1g0t8zMh09WQNt/Hg/jYKVVVo
         20MglAV0pC/I8sbvEJpKCltDOsiv0foQpsyevtM5BJVfshBUiCAdYck5zbNszE02fmoP
         vhU7DtRmNIQ8E7tvgZLjag245fJWW7kSIphXfBkSSRBT6KGFuxLJ87bDo+ZIU8JQftWn
         QtWGiXj9GyqnqbtgRFZiJAzO9YUIqc+LCDrZ3eR6QgqHa6gasJ1iYFYUUqBVXakwphWH
         hL3QwJnIC8XTeuEtBFEm5rrCGBltnFBtcRK1/+J06B5ZnQRI+dT53OOePlxZUmVedRt0
         TBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sTxqbLiwQqApmwKK+baqNSuWZbCF6WItDGKGgdG1Apw=;
        b=IoMBkoslaCmHgXjSOUMdReCMBZF2NZnVvYv1OLSCBfzCyN9ZTDUHdbOShgfEMdUEgG
         T2IdzvLTxw24FAIenPVV5/kQ75Xr262elHKWejmANCEos3s+EYsCaHP4ep0dutt7LaHh
         2v9d4LYR5DSBYdFQoBEiqAXHyPog2qqfuRhPoDMEbtvMCN9POw3HAvsVAyQhlUmDuBTh
         dgfjB7BxbSipHbQiuYfb0e2Nm8cg1BBCrb03B+QblzBIIYVbcnSZ2PtxUhfMeVjnaYwJ
         Ib38ggYh3BD69g/P3SfK/92k4cJLaxh+GzzccnH4q5OzaEmnh3ElRaeO44nDgaCIakOq
         8/nw==
X-Gm-Message-State: AOAM530oIydSXCVLnjMW+Z3bKdKIeyQzY131K5f+tw70HE65lHw+v9tn
	dJnf3/VxZvSMOcuV6FkQFJTs+fRvPS3r9BJ4mck=
X-Google-Smtp-Source: ABdhPJyZ73fEGDThUpRAGTs8LLNX9GTqN90jg9LmtZ+f80gKHzClkqzsBkxsiztzsBBHa8GnkCpyjqQBMigktqsfVms=
X-Received: by 2002:a37:855:: with SMTP id 82mr80079qki.25.1622733130121; Thu,
 03 Jun 2021 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <CAMKF1spuC4GysJgyQdze0T6h0Vf3RtMpPU1bKsOQA=L2FuA7ZQ@mail.gmail.com>
 <CAMpxmJXBzL8QaAoLAB6cD8W8_mbBhjJ+d=gM8CGvQkBSPLDPtw@mail.gmail.com>
In-Reply-To: <CAMpxmJXBzL8QaAoLAB6cD8W8_mbBhjJ+d=gM8CGvQkBSPLDPtw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Jun 2021 08:11:59 -0700
Message-ID: <CAMKF1sr96-CTLz96eyS0um1t8uAFCuUMg1Qpk9707aMK6e0r5Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 0/9] libgpiod: ptest improvements
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Armin Kuster <akuster808@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c945dc05c3ddff10"

--000000000000c945dc05c3ddff10
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 1:10 AM Bartosz Golaszewski <
bgolaszewski@baylibre.com> wrote:

> On Thu, Jun 3, 2021 at 2:03 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Bartosz
> >
> > I am seeing this warning on AB
> >
> > stdio: WARNING: libgpiod-1.6.3-r0 do_install_ptest_base: libgpiod
> > test-suites need the gpio-mockup
> >
> > Can you look further into this please ?
> >
>
> I don't have to look into it - this is the behavior introduced by
> patch 8/9. If using linux-yocto, building the ptest package for
> libgpiod doesn't make sense without including feature/gpio/mockup.scc
> in KERNEL_FEATURES. The test-suites simply won't work. I don't see any
> way for implicitly pulling in kernel features so I thought that the
> second best option is to warn if we don't detect it as already
> configured.


Right some way to inform user would be improvement

>
>
> Bart
>

--000000000000c945dc05c3ddff10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 3, 2021 at 1:10 AM Bartosz Golaszewski &lt;<a h=
ref=3D"mailto:bgolaszewski@baylibre.com">bgolaszewski@baylibre.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Thu, Jun 3, 2021 at 2:03 =
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bartosz<br>
&gt;<br>
&gt; I am seeing this warning on AB<br>
&gt;<br>
&gt; stdio: WARNING: libgpiod-1.6.3-r0 do_install_ptest_base: libgpiod<br>
&gt; test-suites need the gpio-mockup<br>
&gt;<br>
&gt; Can you look further into this please ?<br>
&gt;<br>
<br>
I don&#39;t have to look into it - this is the behavior introduced by<br>
patch 8/9. If using linux-yocto, building the ptest package for<br>
libgpiod doesn&#39;t make sense without including feature/gpio/mockup.scc<b=
r>
in KERNEL_FEATURES. The test-suites simply won&#39;t work. I don&#39;t see =
any<br>
way for implicitly pulling in kernel features so I thought that the<br>
second best option is to warn if we don&#39;t detect it as already<br>
configured.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Right=
 some way to inform user would be improvement=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
<br>
Bart<br>
</blockquote></div></div>

--000000000000c945dc05c3ddff10--
