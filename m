Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.15899.1599908794305822212
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 04:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k84Y6mZG;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id v15so8206081pgh.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 04:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFiNBzI2gyn+j1ztqgAapGJ5ClnLmf7PcHficePr/ZE=;
        b=k84Y6mZGDJoHASGTuPtjiDCU+d0JJhpyrdc77y0mwMW0FyWeZuLioDIsrdbk1U8I/q
         OEncAA+QfNAyh7ZDMsu+T88vAPdkVz7G49rQMynJT+8WeEUp8VasbGJ6dcLuDQmXzskJ
         +68yyiFmtNIrTu9wtcygO/BZkwGgdR5+iFF1cb+XKrqpCLbibssClZwf0g9S+2IgGEEE
         bDXxMFNPUcZMFOse2KGfNmpvrYkprKyR6anpAU6s43AcF9SBmLSzovLtd+6kGRJbVRWj
         MOmnDLZG6DU74NPDxnJS0bB7NWRs9wY9nmpbOZ8wOe9xfFtETKlnHkuPXmnUVENSS5Bl
         BweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFiNBzI2gyn+j1ztqgAapGJ5ClnLmf7PcHficePr/ZE=;
        b=PE2QFRm4IAxcRUJ9c5y/XVhm/FpHaI/YxIDwYCVwOn9S39od2cr2vtEaZOLBDEiwBx
         EIyQHVaecWeIEGFGex5O9V73IuH6NGzXVjb9gVil6u13YnLjjvkVEjVlq65Q/5KbAA1z
         Zr+MklR0onoeg3W1vOr5extbdTocX/9kn7yD57RN5FdCGbaGWaBredZvym3XI/5Tc+0N
         qi8sUTVXd8W6JNuepZXz5frdVeDvf5YTo4pCUCCn4yvT3UD4mStfeOTslrO4Dle95SFq
         BF645hc5fYdkPOQyBCW51EhC6uKC21W7xF2lH8l9wxT13erom6lkKuvQq0IeGc26mJun
         lJ2Q==
X-Gm-Message-State: AOAM531mc15+mecV7+zYm70xsx/Qzt7aEEvUaGDsUI4hOlTdeyoQCwS7
	onr/tvz18pArYyHywQvh/heinpjP9T/gkP5Xvsg=
X-Google-Smtp-Source: ABdhPJw+3SflST/hCFAAERa+kEgs6L4INBNlUjehjoHAs4Xup6dV3dxYtu6J7Vo4HtlV3KLXUuj0wATwmuuQfZM4xRk=
X-Received: by 2002:aa7:8812:0:b029:13c:1611:6537 with SMTP id
 c18-20020aa788120000b029013c16116537mr5857529pfo.9.1599908793609; Sat, 12 Sep
 2020 04:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200912094427.3904-1-Martin.Jansa@gmail.com> <20200912094427.3904-2-Martin.Jansa@gmail.com>
In-Reply-To: <20200912094427.3904-2-Martin.Jansa@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 12 Sep 2020 13:06:22 +0200
Message-ID: <CALbNGRR3Yfx8YSY5S3=t4ZzUJffHCmjsVhekx4SZG46ueSg3wQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] st: fix indentation
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 12, 2020 at 12:09 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * using combination of 4, 2 and 1 space for indentation in the same file
>   sucks almost the same as tabs and spaces in the same file!
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Yeah - this is really one of the ugly recipes... Not your job but one
still has to ask git what it is building...

Andreas
