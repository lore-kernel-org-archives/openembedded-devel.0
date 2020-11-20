Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web09.1010.1605903506220737796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 12:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jyenyFEC;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 10so8955367pfp.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 12:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cis4nAiKgKpAkv/9evjnIJ+neQV9c6MGuJuJtjtpbyE=;
        b=jyenyFEC9R9xxzKejsSfpYh6rQ48bJUqY84MWNMdaXngYI0MCrhDwaypiH8VtT6IHT
         DiHI87DNY8XoVksXuSvIvFc3JFzz9AAEqrWkJeM2SgX7ezO6Cw81v538droiuEhNmKu2
         LnzHJSXFUPUrG3Xyspk4uqNsLxj1WO0y5jOY0IflbemlvTsDzIezyLS4q0vAf+U1c1QX
         c64gBCpOWZV7uNJk/iYOql6Q5wvTSitRgFBH+Q/Ba8kYiNDVSAaPV/ss0CEIgfS5dskH
         bLcS1QqGRxNxZ69rzO8GSAXEJmWOsEeQ/EkW+zdGipo+DWevdLDYVEffV9hqPUJYxu+S
         pj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cis4nAiKgKpAkv/9evjnIJ+neQV9c6MGuJuJtjtpbyE=;
        b=MN4Vj6OzN2eIiOBPl3fuFn0KQZEKPQ+i+shX+PoPMQ/KspT6olCvXoLztoS2EuWTkr
         5vv/QdKMGZjloDdJArqxjYMzZyfYSAcDmUqwNpqXhmI2NoUZ7A61otwRUAExS4J5majg
         9NeKcdzI8unRlH5P/pzQ9K2CHQmkrZ9U01jLoziQrh7C44xa4YGOayrnYuXek01Vb/kR
         s+bm1ENyAFWpMWMZlS5fbFuvSxWNyoIYEYITnI+ZViIt7m2awS+x9LcrLyqyik5Lfw4M
         EKytuB6vYS1derqdLgWbo78mTkLglJD96GzCMyuIp6EIkl3LmKjWWeiH71HmfHVqtY0T
         DSkg==
X-Gm-Message-State: AOAM533l0WC7BsX7rZiROD5Q7Hkjh4QtgnzDQBVUQtiACIghtE5z6JSz
	WAesPaGMd9AYHocWfPmSXvDtUtaV6slCE9/+cak=
X-Google-Smtp-Source: ABdhPJwkKNGJHFSDOlBBjHAfGgd1ihfA7ROtqIJ+zBYHMCmg4PkDXcV/fA92j8BdkgTW6Y7h6bb66Iu3OT5JmqNtdmg=
X-Received: by 2002:a17:90a:6042:: with SMTP id h2mr12616551pjm.77.1605903505646;
 Fri, 20 Nov 2020 12:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20201119074134.6963-1-kai.kang@windriver.com>
In-Reply-To: <20201119074134.6963-1-kai.kang@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 20 Nov 2020 21:18:14 +0100
Message-ID: <CALbNGRRv0h52taHB2zB6ieiprpmPDTPzVvrKJxnMZXiaioUL+A@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH 0/4] Update 4 recipes in meta-xfce
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2020 at 8:41 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
>
> Kai Kang (4):
>   xfce4-cpufreq-plugin: 1.2.1 -> 1.2.2
>   xfce4-weather-plugin: 0.10.1 -> 0.10.2
>   xfce4-mailwatch-plugin: 1.2.0 -> 1.3.0
>   tumbler: 0.2.9 -> 0.3.1
Although tumbler is a dev-release, I am fine with the whole series.

Andreas
