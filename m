Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.7833.1621696530622831087
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 08:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lTU6lUzd;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id ot16so10539243pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k0/PyATz+bdktHYcOazL6chrRz1QogIQmCVaOotUb7U=;
        b=lTU6lUzdsR161k/AnphTQv6H5clG74kecJ7g3ewo2/judmragR+DIMB8bcLNq1tmbb
         PBioixrI0WeTjnlzYAB/7OrX9BNgTNGyl0Ttbd5Zw1SBR4/dKcpWT/rDUw6Li9ncsQnh
         fHfgSDWEFReuNqN+e6SK4v6sOFKsV31UrYxGDkyebR1U2SJh65Hs6S+HqNOzJO3lr7Ge
         EwzhLeV9wTyB/A+aE/VdGzMekVaxRVbZ3Bw/WoL/nF6R2OoOReipNI75TdPNQXxk8kdS
         Nj90b9aKjX8ZsXXNjg3M7YhBvvTw8XDMd+sC4kDqsQZds9Wl8wbTpo1M1JP2DqLbbkxY
         4u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k0/PyATz+bdktHYcOazL6chrRz1QogIQmCVaOotUb7U=;
        b=ARx5ObiUe5y/Un7M6QMCqNyjU7U7ZXAFz3WS71sxv24aBjo7POuD59sKpDtnqN2uPd
         vx/k33ernDLPb8KnTscafGFmB7OdJ1kpSJ1HXTDESlz7lzi3k/9OI6gDhYu0vP8eHQLm
         AfBtE1kJuNXUG3UEnZQO6M9xi8YWdOYuyfpZfPTnFxE3EOimf7navHyXKIFx517xdria
         nW4wr/t94puh3aoJpngX8tQrQb7YG2/63rvKvr4kOg5iLVRXdAT5SaaNk0EGFjA9FBDM
         1PtBocMxp3r9yT0Orms07K6Vab3inFSm2Cyy5rOt0JaHtOLgwgyP6bjL+gUzuTbMrDk5
         nBWA==
X-Gm-Message-State: AOAM530EGbKZHDEYX8LnmPF+RfJx4MOEqR5l9e/66Zs2dGWChtF7UmQ1
	MAQePOpUA2W7qoq0BMuyVnjezBF+O8XFP71Xbew=
X-Google-Smtp-Source: ABdhPJxFyqa6BBFRUl9X4R370D81diCCSKDsiFvzydMmY5XdHn4fii2cZYOx+0s/wq0AdOtcICrB/kGK0vega97JqDQ=
X-Received: by 2002:a17:90b:687:: with SMTP id m7mr15702221pjz.133.1621696530188;
 Sat, 22 May 2021 08:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
 <20210522013521.588774-13-schnitzeltony@gmail.com> <CAMKF1srHF+Wj8EzoqjQ9AfmoPVvnp-GH_49fMYHod0DZ7WN3rA@mail.gmail.com>
In-Reply-To: <CAMKF1srHF+Wj8EzoqjQ9AfmoPVvnp-GH_49fMYHod0DZ7WN3rA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 22 May 2021 17:15:18 +0200
Message-ID: <CALbNGRQiTeFFPkWoxQkdQaJmMhGryOojogfCxrdGewStts6K0A@mail.gmail.com>
Subject: Re: [oe] [PATCH 13/17] protobuf-c: upgrade 1.3.3 -> 1.4.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 22, 2021 at 2:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing errors
>
> https://errors.yoctoproject.org/Errors/Details/585453/
> https://errors.yoctoproject.org/Errors/Details/585452/

Look like [1] - will adjust to CMake tonight and send V2.

[1] https://github.com/protocolbuffers/protobuf/issues/5144

Andreas
