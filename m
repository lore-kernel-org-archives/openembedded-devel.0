Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.429.1621022609664641657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 13:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a+dYbq8U;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id a2so142029qkh.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DBOWyI5WnJh6P6bG34GmDL58zNndcy3Pu/dkIro350g=;
        b=a+dYbq8Uml6XrFqd8U/cUuvgIEyTXYGlRrAEt9ZtFSCcQdHt3UEYWOSS5O7utGMqqY
         qaKSWeEjHunOuTa6uB8s/xGv7+/u63c2O0IbIk7jXbwPv3MdfTm3k2DhGpvW6P2gNWrV
         +KwGmLAvl6WsWSyov1KzsCOXLLeG8IX0gxHxhylEOr7aA6jX+QBvO7L+I+DV1xT8ZLr1
         z0YTqb2thmQSDV4eXmsaTCMIBLrG/6eiKce8tIqY2SewTVDWZMROWMS9m7oM6GKCX/23
         jv+kj1WwJBdD8mRw1B8Am6H27N3YxyeIyqoslhMuSJ7o7RY5gkRPVY4cIM72HtvAIQh/
         YjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DBOWyI5WnJh6P6bG34GmDL58zNndcy3Pu/dkIro350g=;
        b=tn2TWuIzZAFbtzb2aFeTQS9fmYjZ77prnQV1dMaq7Onb7nirMopz/9ePy6VHzuVwKh
         Hb/BkNJsoz1jLdhUJfYAxHF1UDcIQ7V3mJ3vdz+h/2SbD6R2puZ8YDLEiVnOgaSTV00Q
         UYN5zrw8theinpKq8rCQC42XE+WJcRA2HRJzvDy9hdMfJrqJ0A5gHl0E0oLovL+uBaBy
         9GgwJUAmx1q+iq4rONezZlC7n+9sTdIaa1RdQ2kkII5RhofI+n5wcKlJlMJYvPZ7gXZu
         mHFcdgqe0crFTw3wCbj8maSm4w7UpMg1SLbKLLH8ZHm7qLq7uYwYJjFFLxFhESlUWVPH
         gW/w==
X-Gm-Message-State: AOAM533gzuFSq1UQmXZ02YG8eAn7Jsz38w19DCjgE6Ued9drReBycaIu
	2oW8NpzNFE27emc/ngdmEQ0ELIRBSeW41ohYi0c=
X-Google-Smtp-Source: ABdhPJz83VJqJeK/zbImqok6HAF4ksXq+1BDlck6USXytHBba5jv2tltMu69p7yjZMXD4j3Rb6qH75kcSef5b+G+SsQ=
X-Received: by 2002:a05:620a:24b:: with SMTP id q11mr26945469qkn.25.1621022608594;
 Fri, 14 May 2021 13:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210511171359.4534-1-brgl@bgdev.pl> <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
 <CAMRc=MeT7xOkmV2qzs6F1yrbKt3s+MkJ5=ky8j7reop0+rRZhw@mail.gmail.com>
 <e597b092-104a-13f5-c4bc-bd928272bfe7@gmail.com> <CAMKF1so8yJeEOhzA=qg-DJnxG_nuvKJ-SzGpBr+SzbEbNj=hiQ@mail.gmail.com>
 <CAMRc=Me8aGdofAXoaY4bvcgy8UPfToVmv-CytBLb2xqKHhx=fQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me8aGdofAXoaY4bvcgy8UPfToVmv-CytBLb2xqKHhx=fQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 14 May 2021 13:03:02 -0700
Message-ID: <CAMKF1spLiKQXoT1=vz=5zR7H088sxD69UNDO-q2-FFR9fOW_=Q@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pycocotools: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Ah I did mean to send a different link from OE builders here it is

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/2635/consoleFull

Look at the top just before it prints "Build Configuration:"

Hope this helps

On Fri, May 14, 2021 at 12:28 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, May 14, 2021 at 7:47 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Bartosz
> >
> > I am seeing following on musl
> >
> > https://jenkins.ccp.xcal.tv/jenkins/view/YP/job/Yocto-world-musl/3316/consoleFull
> >
> > Should this package depend on virtual/crypt instead ?
> >
> > Can you take a look
> >
>
> Hi Khem,
>
> This asks me to log into some Comcast thingy. Can you link it differently?
>
> Best Regards
> Bartosz Golaszewski
