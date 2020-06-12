Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.13696.1591939685869086284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sWFCq8h1;
 spf=pass (domain: linaro.org, ip: 209.85.166.193, mailfrom: arthur.she@linaro.org)
Received: by mail-il1-f193.google.com with SMTP id c75so7711231ila.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 22:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BQOGo5Z1U4HqOhguLRv6tnAUVRSgmQukJE7w/DIVJXg=;
        b=sWFCq8h18ZKcylz8YANgLyflVkcFsoyMq7dLB+aoYFpaXfyIDRzBuFzmI8WAhEB4nK
         HmgwcWEQVr/iG6RT+0SJGcvXca7Mxbqhb4gGblofMqMnGXKpr6kiZlxwPKnUov8+T2zb
         XADVdjHosLED53WDD9/0JQHfY59IkeQQYw7cj7K1rZy8rqagZqXoAbI6vihgO76UBT40
         C22efwli2nB0I7m9THZQZ65eHwLmi0Coyj4uRfjqNp0pOowtuFV0qNIxu9oB1naYsHRA
         qo7G/f7AILMZuP2Tnh1AaUX7nd9b63WpjKurbV1sY3y09N/fL2EbRAKzLckcbPbUwppb
         qorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BQOGo5Z1U4HqOhguLRv6tnAUVRSgmQukJE7w/DIVJXg=;
        b=hX1E71HUhvsPU+UZ2aNUCNzXY0Eml1qRktJUMRXo6gz/kS1o4nVQ0GnK5RCqSKHLbI
         qLhGUGSZOqJUigSsO4XTkq2/ZwXt48JI+neuuGEa9HabbcyR0+lsfGdOMSMbMVrCKslj
         hJgrrUAhWfdV+OR5UKgCyQ9JanILPyUo6A5fkM+OLU7OY7W04NXRM5eHK9HwMcbtMR3p
         i4LRiPV7zQO70UsRZPb/Xi52p/HEGZi6nVUsih+iLjoxiA6kr1/EQ4YYxKocLmrVF65S
         QaxZ/dhkQJDXi1SAdYWd1c0HepcD+NlAfUrxc/XRWqvGzI7p5XZi6ydnVVKdMRoj4Uej
         sGQA==
X-Gm-Message-State: AOAM5323qyRXP+dHENq+Y8oi9EqIMMPXAsmeOVwsJP0VlIOeJmTJ7iCp
	wICwTadoapgbF0ahWkqvlARj1LXzg5q35ALB5MoG5w==
X-Google-Smtp-Source: ABdhPJwwlHG2zbHjJJi3QznFqZf+QxdZ3lMr35Fc7DeHlk+VPbCEzsGIbOiip7sroJo+swXaKoEozKTXZKFMDMG4PJ4=
X-Received: by 2002:a05:6e02:f44:: with SMTP id y4mr11564266ilj.237.1591939685299;
 Thu, 11 Jun 2020 22:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200609142957.187352-1-arthur.she@linaro.org>
 <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
 <20200609215534.GW17660@denix.org> <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
In-Reply-To: <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Thu, 11 Jun 2020 22:27:54 -0700
Message-ID: <CAJ8hLzHt24_OpYUf92=qHpypsb3UpXuOhUm4MAoGoi23h1zh+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
To: Ross Burton <ross@burtonini.com>
Cc: Denys Dmytriyenko <denis@denix.org>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000724fb605a7dc5794"

--000000000000724fb605a7dc5794
Content-Type: text/plain; charset="UTF-8"

Hi Ross, Denys,
Thanks for your comments.
I've talked to the meta-intel maintainer.
He agrees to remove it from meta-intel and use this one instead, once it
gets merged.
I will revise the patch and send the v2 out.

Thanks,
Arthur

On Wed, Jun 10, 2020 at 4:59 AM Ross Burton <ross@burtonini.com> wrote:

> On Tue, 9 Jun 2020 at 22:55, Denys Dmytriyenko <denis@denix.org> wrote:
> > Huh?
>
> So that was the line that told me the recipe was basically copied from
> the file in meta-intel:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.25.bb
>
> But it appears that the inclusion of the xorg-app.inc file has been
> removed. If the recipe has been made standalone then cruft like that
> needs to be fixed.
>
> Ross
>

--000000000000724fb605a7dc5794
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Ross, Denys,<div>Thanks for your comments.</div><d=
iv>I&#39;ve talked to the meta-intel maintainer.</div><div>He agrees to rem=
ove it from meta-intel and use this one instead, once it gets=C2=A0merged.<=
/div><div>I will revise the patch and send the v2 out.</div><div><br></div>=
<div>Thanks,</div><div>Arthur</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 10, 2020 at 4:59 AM Ross Bur=
ton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 9 J=
un 2020 at 22:55, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" =
target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt; Huh?<br>
<br>
So that was the line that told me the recipe was basically copied from<br>
the file in meta-intel:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipe=
s-graphics/igt-gpu-tools/igt-gpu-tools_1.25.bb" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recip=
es-graphics/igt-gpu-tools/igt-gpu-tools_1.25.bb</a><br>
<br>
But it appears that the inclusion of the xorg-app.inc file has been<br>
removed. If the recipe has been made standalone then cruft like that<br>
needs to be fixed.<br>
<br>
Ross<br>
</blockquote></div>

--000000000000724fb605a7dc5794--
