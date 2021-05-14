Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.12445.1621014475255498382
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 10:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Txb8ik9s;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id v18so40711qvx.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qsYwY8gWqxgcBHFhreiaQjUbfxr3PPQybQwPQzeE8qI=;
        b=Txb8ik9sudFyVW/groIyGQOHUGoWoUZ/Qd8qJ7i33YG9r8dtHYomQDmZMo0B/BscX6
         0TX3LJ0lc0LAU1wQ7cp2bxu6gHioZxY61ILFrLGJacx7/VeXSB2MKwhiVxWzkIyHGiuF
         k4RkGWsJqW3Vxw85dBwph1Y//hAxqbwyRzML3aP7nqvxFP19l1AQs4UJKzUJxse41w6w
         MOAjO/NYrcDdxQtAL5jJszJsLTuTEgNsOUgwSNBfmRhAoGlalLPWYOB3F1vZ0q//UEng
         bhjrlWxgoBacXHlBS4ctl6XpLuKEalxcxKr/ZvNKpPk3MoQAc2XlmulQW45kh4BwZYXS
         kPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qsYwY8gWqxgcBHFhreiaQjUbfxr3PPQybQwPQzeE8qI=;
        b=L3dDPdFz5Skltl2xM/KTEqV+BaVlUa3QBFTmUVOTGIrCaIqPKmNt1LgPkWJr/QHA2Q
         FP2X8nHS+vLpw+Nmi1ybripjs26Yad0MzvcTq6axSyRGZhyU3wFVkeDvaHgFfcg9Frug
         PKumreTqsE/dh8hwjM3lmap12o4oDCm6es6av/8U+X1D8InEPU/E0xFBT/f+6rfNvuj7
         4tAmtByhoeRLNhd+zLimglZKHr9uNhxy6Row8J8dgIXmm2bCbvnqYpgYoyhWS884gcVa
         uYbI9DOmrnrqYKXqwA58qhDLXIoE52lJ5Kb4ezldxbK22JYIoZBwYjeTsb5AhvyhAQLR
         4AIw==
X-Gm-Message-State: AOAM532yBAc7rBo0C6Os2O7vk/z6QP1LfKP2EzpzdTE56JBN+lX1gOOH
	+NP7dK+5oHN+NaOx/I9A0J86dKn7qgISJNF3it4=
X-Google-Smtp-Source: ABdhPJyyyoHlnZ5I/Tvx8WpVhqRzfgMAH5Ie9BewtmW2WHanJw/FQA3WqNOeybBdtRw4GJH9qyETntAcFnGFZHWUeME=
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr47604550qvs.55.1621014474388;
 Fri, 14 May 2021 10:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210511171359.4534-1-brgl@bgdev.pl> <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
 <CAMRc=MeT7xOkmV2qzs6F1yrbKt3s+MkJ5=ky8j7reop0+rRZhw@mail.gmail.com> <e597b092-104a-13f5-c4bc-bd928272bfe7@gmail.com>
In-Reply-To: <e597b092-104a-13f5-c4bc-bd928272bfe7@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 14 May 2021 10:47:27 -0700
Message-ID: <CAMKF1so8yJeEOhzA=qg-DJnxG_nuvKJ-SzGpBr+SzbEbNj=hiQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pycocotools: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz

I am seeing following on musl

https://jenkins.ccp.xcal.tv/jenkins/view/YP/job/Yocto-world-musl/3316/consoleFull

Should this package depend on virtual/crypt instead ?

Can you take a look

On Fri, May 14, 2021 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 5/14/21 12:49 AM, Bartosz Golaszewski wrote:
> > On Tue, May 11, 2021 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> add it to test packagegroup as well in a followup please.
> >>
> >> On 5/11/21 10:13 AM, Bartosz Golaszewski wrote:
> >>> Add a recipe for building pycocotools - a Python wrapper for cocapi.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >>> ---
> >>>    .../python/python3-pycocotools_2.0.2.bb           | 15 +++++++++++++++
> >>>    1 file changed, 15 insertions(+)
> >>>    create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> >>>
> >>> diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> >>> new file mode 100644
> >>> index 000000000..4821c313e
> >>> --- /dev/null
> >>> +++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> >>> @@ -0,0 +1,15 @@
> >>> +SUMMARY = "COCO is a large image dataset designed for object detection, segmentation, \
> >>> +           person keypoints detection, stuff segmentation, and caption generation."
> >>> +LICENSE = "BSD-2-Clause"
> >>> +LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
> >>> +
> >>> +inherit setuptools3 pypi
> >>> +
> >>> +SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
> >>> +SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
> >>> +
> >>> +DEPENDS = "python3-cython-native \
> >>> +           python3-numpy-native \
> >>> +           libxcrypt"
> >>> +
> >>> +RDEPENDS_${PN} = "python3-matplotlib python3-pillow python3-profile"
> >>>
> >
> > Hi Khem,
> >
> > It looks like only the follow-up patch made its way into the
> > master-next branch but not the recipe itself. Could you please check
> > it?
> >
>
> thanks for reminding me
>
> > Thanks,
> > Bartosz
> >
