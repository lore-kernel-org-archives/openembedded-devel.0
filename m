Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.3639.1615969812702290035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 01:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=vUYsYNUm;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.54, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f54.google.com with SMTP id dx17so1204009ejb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Mar 2021 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PXpQ8oYShkx2kQK53+yXQmE7D0nyDWvqBb2dwLc4xMs=;
        b=vUYsYNUmX+zreH1G22bT7Xbt2xjZPRO5S0gDvHH1sGwr9UQkMX7Ki7njuQCbv+fNyq
         l+ZyHutMf1uBSj5BDbI4k3yH/yK0MWMHdIohk1GnwLyNvmaAVFGENHXBbFvbikkgq4X/
         a1renXHtUXbETBuUjZsrBSlkqsK9Yl7C4qbGeWEv7r2vF9JNtUJHz9gIWYyNlnO80SFO
         2ZCnfJOO6YOJpXk3NsW5ZGCIv2bXLgEm/V9jNA+DxcTJcKUdkTj155h2BNy88PvmJ07x
         1UbeVCDxO0woTyjpNROFqXAquayDZ7ay0ZX67toJj+RFEhXbqn+SDDh5lv68sPEXR4Vo
         51vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PXpQ8oYShkx2kQK53+yXQmE7D0nyDWvqBb2dwLc4xMs=;
        b=n0X9gwyQ/yCZc2QCSaH1SeGm/JmGTvXNmLbrN3uFnpxnKezrsPd4jYv0K1KSHjpp9H
         qvR6YLAiitUG7JZrqXQwvLkCqR4XKutG+rLXoqkKMrEo9asyL30dD/yQYcg9U+odZZpr
         +hN6f0Si0F62vk+94d7A+EL627tKmUWSFntDWWuJOhSa0/OP1uo2jKeF0gSoBa6e2w7h
         VEQZlGY8gpkLNuPAlSXM7OlA08cxtk48zTKa9ZxA1V7vEJkKmtfnEye8hwZ9lrq1ph9l
         mtrGQ7dStHLjPW+Yz8dp2rIx6TK/yTMOy0+4AnBJMcjxB6XSD6qN4B6KbuLVkRhPVO89
         rOlA==
X-Gm-Message-State: AOAM5337n0Y5YNwskazuP+YKsC+0geIn5BoEWmMygqqcQMIKxKXcrorf
	1Z52kZzaHvtKXjENJV9quuSFezRtnSBCfom6Vvu0GA==
X-Google-Smtp-Source: ABdhPJxf7axZgwL039RYL2itmcER2RlUNalfyXlZpSku0s1ZBtlsovk2/TZzcyitudwutK5qGPUV8jaBOHazEkKyVMU=
X-Received: by 2002:a17:906:4bce:: with SMTP id x14mr33694496ejv.383.1615969811149;
 Wed, 17 Mar 2021 01:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210316144242.5951-1-brgl@bgdev.pl> <4eead083-0413-1905-e77e-af261cf981bd@gmail.com>
 <166CE9C7E6A85356.14034@lists.openembedded.org>
In-Reply-To: <166CE9C7E6A85356.14034@lists.openembedded.org>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Wed, 17 Mar 2021 09:30:00 +0100
Message-ID: <CAMRc=Mdo8o5O4mPGeTkrM6b4jSZfboHUREhXLpzE9e3BukcQNA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pythonping: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 8:36 PM Bartosz Golaszewski via
lists.openembedded.org <brgl=bgdev.pl@lists.openembedded.org> wrote:
>
> On Tue, Mar 16, 2021 at 4:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > please add it to packagegroup-meta-python as well in a followup
> >
>
> Will do, thanks!
>
> Bart
>

I see you already added it in commit
1af22ed63bbc6aab3c2b126840ec59e5f05ea163, thanks!

Bartosz
