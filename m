Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.7705.1620142861828115153
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 May 2021 08:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nq0xvWiI;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id r13so4646318qvm.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 May 2021 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYdYo3aYWYeCohuO6gJi3JFue9PH67rOj/pBVzyzgd4=;
        b=Nq0xvWiI9K0TA08gBdmyujNIqRtHYkAhLJ1PawsLArbWLXAeBZJBYw3UIOwQn6Prda
         /k6qKaz7o2LrCiEXhUie8gUmWFh4CYipnFndvl37xH/3iIiot9cSO/6hSXB9r9T0mlWE
         QkKFd9+G4Aft2QmdDpgWQyy2xlQUmHsKDG5mN/yfKYRL2X+YKY+eB4ucOrO5wZbF0Oa6
         JMgTojdWI8Ve2pI9uT0SjeFgj4Nlu6Y8rwNKLjq6AdQAuuylRw1tJmTPhUf58LUxcYEI
         6+wHhv2uFFyUHPEB8u4sdhtPdfrFqDcA6161QCth8Qntde/3FAaOVPYZY7Y3CmX7YJ55
         mX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYdYo3aYWYeCohuO6gJi3JFue9PH67rOj/pBVzyzgd4=;
        b=VKiiv/BCrjF4a7TeSGC4viFbLu0tsM/iECEYBkADICh/mNXkZvfoZ8u2J8wrftRL6i
         PgJBWhz1+EYKaR6vzhnYnzCbzOo3i9sFSBK0QHxIKpsXNQrgIl59n21omwNoN7zSCMC1
         GkAYfZu19YNh6N7ccHsTzho7xGf0ABVat0XpYCTEqDYxOtHcGQwdHf8/UYTZeh26rlJb
         YzKVpsGeFoZDqI4YszE6OR6EWwAOD373mTe4OlKhpYrgTAQUR23bPlAk0HGcMhHgiNk0
         eXm3Cm9I63G7SWlnSJwmFQMPrRor7VUwvSq9jV/CGkM4dfQtNPXDRQVl+t/43x0ocXJp
         Vn4w==
X-Gm-Message-State: AOAM5330v/fvu3gycEePs+76AKV4AxiDFv2vcItjwy8fABdRI1TcOjO0
	sSy0HiEh8mANeE4r7Y5uMVuNucFiOuE1tW3fx9Q=
X-Google-Smtp-Source: ABdhPJzVsjSk9SpxvHouiBBnWf5ZD/Td0h/KFCzpr5BYGUmntffbLUyv44AN94Qg7DuPSRfC2TYaQ8jA6ToA/67ey8g=
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr15467699qvs.55.1620142860816;
 Tue, 04 May 2021 08:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <e32ab99e-1a15-aeb1-160d-b1638eda0d7a@detectomat.com>
In-Reply-To: <e32ab99e-1a15-aeb1-160d-b1638eda0d7a@detectomat.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 4 May 2021 08:40:34 -0700
Message-ID: <CAMKF1sq=HUmS3aubBqmsvALD4SsHDMKXjb-v1EVJNw3NB_=Azg@mail.gmail.com>
Subject: Re: [oe] [PATCH] Fix parsing revision of SVN repos with redirects
To: Harald Brinkmann <harald.brinkmann@detectomat.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please send it to bitbake-devel mailing list.

On Tue, May 4, 2021 at 3:52 AM Harald Brinkmann
<harald.brinkmann@detectomat.com> wrote:
>
> svn was printing a message when encountering HTTP redirects.
> This confused the revision parser.
>
> Signed-off-by: Harald Brinkmann <Harald.Brinkmann@detectomat.com>
> ---
>   bitbake/lib/bb/fetch2/svn.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/fetch2/svn.py b/bitbake/lib/bb/fetch2/svn.py
> index 971a5add4a..5c305c4a75 100644
> --- a/bitbake/lib/bb/fetch2/svn.py
> +++ b/bitbake/lib/bb/fetch2/svn.py
> @@ -86,7 +86,7 @@ class Svn(FetchMethod):
>           if command == "info":
>               svncmd = "%s info %s %s://%s/%s/" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module)
>           elif command == "log1":
> -            svncmd = "%s log --limit 1 %s %s://%s/%s/" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module)
> +            svncmd = "%s log --limit 1 --quiet %s %s://%s/%s/" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module)
>           else:
>               suffix = ""
>
> --
> 2.26.2
>
> 
>
