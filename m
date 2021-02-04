Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.4697.1612424555108798652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 23:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JHvpqD6N;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id j11so1289516plt.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 23:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Z6dQve+Nyy3n+Y2llHNZBAihfxlOixFmjUCGDOvJgYc=;
        b=JHvpqD6Nud27Wixj0fmYJ6oLY/3T75U4gQB4oNV53cbL06EdlCEUp48Kza2k6mUlBT
         B9129ajplgHlzMebRqPwwRoAHFMVWj6wnJumJKRK0luzWaeD5denwAFSnGheaWom9S0c
         j4EChjAy1TdKGncxR3E7Pn58h8nQywhU6APJqPijHSYOgNivV1ndnYloeSpsITdur3we
         gCAMIf2R/aOLsS2BbQTsL8ipdj32qY0KZ01KoDG9SV38HrzRflIxFW4Dp/KrbRw0IFaY
         9KkU3mjDKSB4HYrcuxPZ31SqZ9YVxZyrYATg03u1IEZEfgAFh4nzzna0vNilMyyKr1pr
         wbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Z6dQve+Nyy3n+Y2llHNZBAihfxlOixFmjUCGDOvJgYc=;
        b=tZf0zW+lcT0hNkK7+zJufvKCIo/Trk+6EEcQxw2kxAh8U/uCF3qLl514NGtFJUFCA0
         +iTb6E7C/SVVnmTBb0rixiqjD/n4lVxW36cbIBMrnjV8ow7OAOyFjaBMkSWiLhddshWM
         gC8LRVc+qcD/QNN4U9dlKFhXH71QVuouXa/i1r7d+DknUCP/IJN5egOR8TyjD45Zmlyb
         wvdE8/BQ0iaZ2w6bQHdgeZNRw8PRwVWdFh30/WspS4z1U6xb1b8/GOGd30LWesorDAj3
         heBVb/h+zlI3cmXRQb/wQ6yIzv914KnSOX/jEGxr4pR3xium9Z5FJmdbJKeGxU7siPxn
         xc/Q==
X-Gm-Message-State: AOAM5312mVsMFmyS2mYrI5MRlyzgOYOsqSxtfMSxYGU0r9Bb/KV+btFi
	7P1t281ik9B2RJ5+THt5KfZhhDpfoyirdR5IRMiKxS9k
X-Google-Smtp-Source: ABdhPJxcsBJzncG1xjFb7qHr2mjpDV1cBdWArfFW1L7wOf0EwwQX6IgyAD+ch7BXnBCMmsUMKZuAqAHp0vKzGzk1lxI=
X-Received: by 2002:a17:90a:ec05:: with SMTP id l5mr4134683pjy.161.1612424554533;
 Wed, 03 Feb 2021 23:42:34 -0800 (PST)
MIME-Version: 1.0
References: <165B1F5C1261A475.15753@lists.openembedded.org>
In-Reply-To: <165B1F5C1261A475.15753@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 4 Feb 2021 08:42:23 +0100
Message-ID: <CALbNGRTgi3EwKAhZ0ryQ0e08cX=Nw9igSAZe01g1dQBxARixwg@mail.gmail.com>
Subject: Re: [oe] [PATC][dunfell 0/2] graphviz fix
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2021 at 9:36 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> Since [1] graphviz is broken - fix it by cherry-picks
>
> | ERROR: graphviz-2.40.1-r0 do_package_qa: QA Issue: graphviz: SRC_URI us=
es unstable GitHub/GitLab archives, convert recipe to use git protocol [src=
-uri-bad]
>
> [1] https://github.com/openembedded/openembedded-core/commit/72f2c45880af=
bba1745e5e0cbd841d7fd666f374
>
> Christian Eggers (1):
>   graphviz: Extend for nativesdk
>
> Khem Raj (1):
>   graphviz: Upgrade to 2.44.1 release
>
Ping?
