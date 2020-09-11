Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.7876.1599867299215033118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 16:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AQlgDCtW;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id r25so12909442ioj.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 16:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqVZhCauztMzJQg2AyFM7uuzf8blecbzGVkQDuD7bUw=;
        b=AQlgDCtW6TEb6aY1MYpniL7yB7aAEGK3F0KkLTJ1xEtJTvCdVHu4YxPVX5uRrqb5ru
         3vlefpKczd6JE0ykMsYpHjgTOXWPhN/YGC05Jz9jY/HKt45PU5EoHEC3KKt0zyErjGqg
         jfDvL124zH4ZfegVZUE5+coB0QdhFfnPWfJXz5IHgt24w5l0MVM7u5zR/vdLyVx1NUei
         uv/32oOwQTBoL4218dQIcGiR4BmBVoSzxxS0fCngoHITtfUdwVIu3zQH4n2Kd+6ddphF
         DziPTpgnqlR1cjJPfZN5UMvBCXVBsLMeBzoDAVdLzL9s/Ln/B4jW74jsLgPPjTQtsAiw
         /A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqVZhCauztMzJQg2AyFM7uuzf8blecbzGVkQDuD7bUw=;
        b=Zx0m2n/S59v1mB4YxmhIKOIKEOZWmc8kiiaO4RK6SLyKqt3OxMDOVnjU1FG7uqQzsC
         PWUgI4zvgvNi+984ZNM16IxBU/scz5d+LXQCqeN7hCWogKyCiSg6NPCaAngAFHa3bqm/
         A6AkD4uplIvtuG6pZnairUTNVYmByAEUDEaDq3v4dnte7amgUJ989q3LpZzL2bZO4CGc
         Fstrg1ZI5uWsxghS58YP8dLb8zTK4t4zi6NinZPyl3i3Xa6EIv2x63RCBQKX0VEUb2ZT
         PuS/8IjzsXNTApfiZm8nR4YvAK0SyhPlkGqVbMg6HxVrEUmmWo7T3nVTFtFxM5bpwURy
         gSxQ==
X-Gm-Message-State: AOAM5305UTU2fSWlj9vpM8jiU7DwukRJ7O/hlsfYVv6ggVbQ6PNvcTdb
	5XItvVdVukjr5LdFM4tCorOMToThBbqFfh3GrIw=
X-Google-Smtp-Source: ABdhPJy269XeXe7lWrpexD5p56i1F9vg3P7JBRDj9jdpqY72hsC5zG7Hcz0d/IDwTPeD5mbgNoPJ2Gn9zFb1pjNsyzI=
X-Received: by 2002:a05:6602:2293:: with SMTP id d19mr3676706iod.45.1599867298531;
 Fri, 11 Sep 2020 16:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200611020109.17481-1-Babak.SarAshki@windriver.com> <13049.1598476391090981691@lists.openembedded.org>
In-Reply-To: <13049.1598476391090981691@lists.openembedded.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 11 Sep 2020 16:34:47 -0700
Message-ID: <CANx9H-AUWDQz8ik9m=8ex3JzLL-V8CtuRyrAP6vL7ABVUGWR_w@mail.gmail.com>
Subject: Re: [oe] [meta-python2][warrior][PATCH] python-kombu: add recipe
To: Babak Sarashki <babak.sarashki@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000044cc005af12226b"

--000000000000044cc005af12226b
Content-Type: text/plain; charset="UTF-8"

You specifically targeted the Warrior release with a new recipe. This
breaks our stable branch policies. Also, Warrior is EOL. If you would like
to add the recipe to the development branch, please resubmit. I will also
consider backporting to Dunfell.

On Wed, Aug 26, 2020 at 2:13 PM Babak Sarashki <babak.sarashki@windriver.com>
wrote:

> ping 
>

--000000000000044cc005af12226b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You specifically targeted the Warrior release with a new r=
ecipe. This breaks our stable branch policies. Also, Warrior is EOL. If you=
 would like to add the recipe to the development branch, please resubmit. I=
 will also consider backporting to Dunfell.</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2020 at 2:13 PM =
Babak Sarashki &lt;<a href=3D"mailto:babak.sarashki@windriver.com">babak.sa=
rashki@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">ping
<br>
</blockquote></div>

--000000000000044cc005af12226b--
