Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.5786.1620978565023336730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 00:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=ZcVBCDg8;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.53, mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f53.google.com with SMTP id t3so1229802edc.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Y7Uzh2m+IajB/avSeoNPG4BYMUkXiQmKY8YT2D6ZoM=;
        b=ZcVBCDg8AyViJ4n2bDwH5uHxQqyv0iT6HcJgmJtbGbOEZl/neo/B8Z3L/FBP4jbw2x
         Coco/XbbvSHgpoGNzqgHJjbHJbC1bkyfkwBQsOxrgqkTJBEMBUNmjjuBbFHHChNsIDk5
         JeFTMFn0gCNVvre2rZDsc3GZ1rNzZKaBWjRhMky/l1pzAqJ2Mec1VbXbVH7x9Hflu+0a
         B+yZHqIUUWtxfWGn/G/eCnpfduI3fwr2R+faDaqlrMYHX6v9TrbG1eMg+m26l1vg1Mzj
         7G1nHa1OIaXfdZG5z1hhugQO2Utt8PnQ51QY3VR6mteVDzzKhK2qLonOq+UQjv0FUA6k
         8OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Y7Uzh2m+IajB/avSeoNPG4BYMUkXiQmKY8YT2D6ZoM=;
        b=LnALaGMRnm2L5IvRbM9cBeGAPcYv+V4ZitM4eFp9K42LwPzT+o3+38PDuMQh4dnWdn
         +Zn+NGoJhPaGJWNONaz0kTmHXGAeGhvsw1tiXtVPkWKGbaUx06BacciTgQHq+hqI7Rt9
         V/JdesHtKgmftZqeGo3tRvl/2eeHm6TEW39dkk86fVfco8DxHK6SbiU2SD5Xkh8/hBGi
         +qh5j/3QP+VrX5yh0IymbFp6IEBan4kq94H3tjrwUqcMs+Dl2Ddo1YZGL8kZlOnuxpIx
         1p0YzwiJF7D/VJQoXngYbKDSqyub6Vu+TDHoZk1HgWkiKbc84dN3tDYrMhklk8VK4fEp
         yjrw==
X-Gm-Message-State: AOAM532+Xt7cesWV+yechV8LTicf0hAm2omx2tt19Zoq0xpe8+WnfrIp
	00d3GpqMfBnkIjFLRtmf9Wtu25chXbMYjwnfulMxTg==
X-Google-Smtp-Source: ABdhPJw5/T1grTBEvpslbVYpEn5sxJB4judaiCuKYbd9JnORrxOT2RdSb9fXs/KmD4sLzwYhoDva5AbMmn9j6jWi/Oo=
X-Received: by 2002:a05:6402:1158:: with SMTP id g24mr18734661edw.134.1620978562201;
 Fri, 14 May 2021 00:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210511171359.4534-1-brgl@bgdev.pl> <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
In-Reply-To: <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 14 May 2021 09:49:11 +0200
Message-ID: <CAMRc=MeT7xOkmV2qzs6F1yrbKt3s+MkJ5=ky8j7reop0+rRZhw@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pycocotools: new package
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> add it to test packagegroup as well in a followup please.
>
> On 5/11/21 10:13 AM, Bartosz Golaszewski wrote:
> > Add a recipe for building pycocotools - a Python wrapper for cocapi.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >   .../python/python3-pycocotools_2.0.2.bb           | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> > new file mode 100644
> > index 000000000..4821c313e
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY = "COCO is a large image dataset designed for object detection, segmentation, \
> > +           person keypoints detection, stuff segmentation, and caption generation."
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
> > +
> > +inherit setuptools3 pypi
> > +
> > +SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
> > +SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
> > +
> > +DEPENDS = "python3-cython-native \
> > +           python3-numpy-native \
> > +           libxcrypt"
> > +
> > +RDEPENDS_${PN} = "python3-matplotlib python3-pillow python3-profile"
> >

Hi Khem,

It looks like only the follow-up patch made its way into the
master-next branch but not the recipe itself. Could you please check
it?

Thanks,
Bartosz
