Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.29.1621020535678522723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 12:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=SFqRzRmk;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.49, mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f49.google.com with SMTP id l7so35925435edb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fYmJKojfqG9EZ5k/I1f+RuQtnn25FBnWYIIE4PnaSug=;
        b=SFqRzRmkrjYIL4vo894WoyIH6Dxh6Byo3yJCsl+sfuOTBQ0KzwVy5dutKhN9cjlo4+
         voaZEfU7aynDyliLpgVIUmMR1h/MZ/8VIubzQlwGOHk1s0oGaoNokCysN0/3nhsY9IKx
         4tpAIQFLtGTMqWR59OCZDY8ME/qBBEXLs2R6BhN2oURyV7FgYcvMFvdNQXz8HpuoZ+X9
         XjnO2woy6Jf0byNJXt/LsnphI5NfHOyI4x3I/0zQ81brDl0ywgzJCo9vFBW+Bt3x02t/
         uh7VjZvCDR0yfo9DDAKP0o7CV4LmlVoOGdvAuX6VHGNkY42tCWQxt0dvmbceV+Z+dEiY
         FCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYmJKojfqG9EZ5k/I1f+RuQtnn25FBnWYIIE4PnaSug=;
        b=NJUaT5YmQeku2odYqbyZIVLxPz1xJ3tI5znMMO7A0lb1DLw+888ra4a+v3eyb0cc3Z
         DtTJTVu2hYZiifHL+enpnZpUl0CyQrcQlJjDrtifTyKrt/vO1AOJm26GDcydY1K24h5+
         olhikzzXrA0nKFDUeZLAVK+ao5djAYpOP9EAFsKB9IsBAm++adgKBzy9lK25KzkY+KWt
         nZhoumb7pqIMIRAm3jVoesgYibqDpEIa7592lNNORjKe7oBRAzWhn6J7M+jxrIYjZB2E
         F4XDVpNyroDmtCWPX++KV4ucuBcDjcyeL+Ab7xVUtCC4bm5RKt7GZWpKeS2w1JC9D9zw
         kJ4Q==
X-Gm-Message-State: AOAM532UezVprUk6EJS+aaxG6Uc296xUu+W7IPy18nKSLEG+YslBP28t
	yJPYy3Lj5GiosYtiZeJ3PeNyrsQ1clUAY0ElGSQEOQ==
X-Google-Smtp-Source: ABdhPJwDyQX4PEmAsDR4WUrI4lukoFdFq6dl6E6FxdEaBqxIEuQPX5w5tVEWBXl+7yiDls2pt5XqEFwee9g62urMFik=
X-Received: by 2002:a05:6402:1158:: with SMTP id g24mr21985761edw.134.1621020534145;
 Fri, 14 May 2021 12:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210511171359.4534-1-brgl@bgdev.pl> <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
 <CAMRc=MeT7xOkmV2qzs6F1yrbKt3s+MkJ5=ky8j7reop0+rRZhw@mail.gmail.com>
 <e597b092-104a-13f5-c4bc-bd928272bfe7@gmail.com> <CAMKF1so8yJeEOhzA=qg-DJnxG_nuvKJ-SzGpBr+SzbEbNj=hiQ@mail.gmail.com>
In-Reply-To: <CAMKF1so8yJeEOhzA=qg-DJnxG_nuvKJ-SzGpBr+SzbEbNj=hiQ@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 14 May 2021 21:28:43 +0200
Message-ID: <CAMRc=Me8aGdofAXoaY4bvcgy8UPfToVmv-CytBLb2xqKHhx=fQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pycocotools: new package
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 7:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Bartosz
>
> I am seeing following on musl
>
> https://jenkins.ccp.xcal.tv/jenkins/view/YP/job/Yocto-world-musl/3316/consoleFull
>
> Should this package depend on virtual/crypt instead ?
>
> Can you take a look
>

Hi Khem,

This asks me to log into some Comcast thingy. Can you link it differently?

Best Regards
Bartosz Golaszewski
