Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web08.5909.1623740019346572426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 23:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TlSfPA9a;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id i17so4724443vkd.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jun 2021 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npDCZZyO0yBu+KiZJQxzGOIzop2b88wa0FiFoYoh7pE=;
        b=TlSfPA9aNTs5MEChYI7R7CfD5iKG6uF2Z7r6BoC/dX3nWWVQ2+Nr2vCuOO0GzXnSLs
         3Ytprir9adP8PHhp9/y/MT8XZw5MHglrJ23fp1XjTX4HP3nrExLTeLqF7rbS25pamU4k
         2bS81e2vTBkBsWDmwKA5urJosT0+Q7SpcyDKQh12UgVNF5tyszBGw8eLzsq6ZhERA6jB
         mQrIa7RHzWMC2p/6vNZtEZMNgmQ2ZYILt3gg43/NHgTxfhofLoGg+KrSNfpqKqHX1UAb
         Jd8YvWyJ6YWxBvz1YHtnkdtq4qBvmxETdvnqqMeQsKhkEDNVxEZHl3aNbHbqY+hS+hzK
         MNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npDCZZyO0yBu+KiZJQxzGOIzop2b88wa0FiFoYoh7pE=;
        b=MtPBvJ54vhM7pXJa/237hLf72xXtJ//LZMUMB6ZpvK/jDCuGWc3kyTMkiaapk9gmM/
         qz57jWWEc5D6sVr6NT/70lMoDUKTieoY6ExVNEpgZM8GffFXuHeaDFdNKr+JYIDEs+bC
         WpkqD2Zg2m+0zBNkJ4Uo7Hxw6gX/fOKoWnT3Wy4hmAEvvbG7Ua8PHBA8IZ6kb6PMcBx2
         c3PUs4Pf/JF8IK2W+7u7K/+Mxk16GkKWtQgcr83BA3xEcvUlUqY4cRtNp2VYcArwQXH5
         xo4c2uqRkCA/dMfPUZYPX/FUhE+2Nd6kN7qhNp+I8UsE4RIXz0ZD68nr+klUlnA357b4
         Qlzw==
X-Gm-Message-State: AOAM530kYn3u2wubZtkIloRZNCgvb6wYT0oX5l0U4D63ZPcBnNtLmmX0
	85IxML1ZgnNDYdfVtP+qP/C/SayCBWWBcBajAcw=
X-Google-Smtp-Source: ABdhPJzg7K8B+MWQ9re6oG0Y2EKd6T+A8ND6lLA8NbFLE8P4uaZ1aqzBO0RVfefvt5oKJH6yJSxbmEXmnHTAexAg7RQ=
X-Received: by 2002:ac5:cbc5:: with SMTP id h5mr2649948vkn.7.1623740018278;
 Mon, 14 Jun 2021 23:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <98hT.1623132594082542882.bzIp@lists.yoctoproject.org>
 <CANNYZj9r_eZ8ZHEo801viRNuBekefmvKuqtLfKsKTQncw+uw-w@mail.gmail.com>
 <YMe6JtmeJc1NiRYZ@brokenbit> <ec0d85da208aa26517a50ea998b855a5aa0d1455.camel@linuxfoundation.org>
 <YMfKw9F6qY7daERE@brokenbit>
In-Reply-To: <YMfKw9F6qY7daERE@brokenbit>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 15 Jun 2021 08:53:26 +0200
Message-ID: <CANNYZj8DDhPseB_Vzr4oboJgQn6VY5LbRym6-Tp7=peHfKTJvw@mail.gmail.com>
Subject: Re: [yocto] [meta-java] icedtea7 fetching error
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"George.Mocanu@rinftech.com" <George.Mocanu@rinftech.com>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ff44d005c4c86e26"

--000000000000ff44d005c4c86e26
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jun 2021 at 23:31, Richard Leitner - SKIDATA <
Richard.Leitner@skidata.com> wrote:

> Thank you very much Richard!
> The openjdk8 tarballs are now hosted at
> https://downloads.yoctoproject.org/mirror/sources/
> with their local download names.
>
> Unfortunately I currently don't have the time and resources to provide a
> patch for fixing the URLs and adding the mirror.
> So help is greatly appreciated!
>

Unfortunately I think you mirrored the wrong tarballs. The problematic ones
are specifically the six tarballs coming from
http://icedtea.classpath.org/hg/
and I am not seeing them mirrored. See the original error at the start of
this thread:

--2021-06-07 17:24:33--
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2
Resolving icedtea.classpath.org (icedtea.classpath.org)... 172.104.137.120
Connecting to icedtea.classpath.org
(icedtea.classpath.org)|172.104.137.120|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-06-07 16:21:05 ERROR 404: Not Found.


Alex

--000000000000ff44d005c4c86e26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 14 Jun 2021 at 23:31, Richard Leitner - SKIDATA &lt;<a href=
=3D"mailto:Richard.Leitner@skidata.com">Richard.Leitner@skidata.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thank yo=
u very much Richard!<br>
The openjdk8 tarballs are now hosted at <a href=3D"https://downloads.yoctop=
roject.org/mirror/sources/" rel=3D"noreferrer" target=3D"_blank">https://do=
wnloads.yoctoproject.org/mirror/sources/</a><br>
with their local download names.<br>
<br>
Unfortunately I currently don&#39;t have the time and resources to provide =
a<br>
patch for fixing the URLs and adding the mirror.<br>
So help is greatly appreciated!<br>
</blockquote><div><br></div><div>Unfortunately I think you mirrored the wro=
ng tarballs. The problematic ones are specifically the six tarballs coming =
from <a href=3D"http://icedtea.classpath.org/hg/">http://icedtea.classpath.=
org/hg/</a></div><div>and I am not seeing them mirrored. See the original e=
rror at the start of this thread:</div><div><br></div><div><pre><span>--202=
1-06-07 17:24:33--  <a href=3D"http://icedtea.classpath.org/hg/release/iced=
tea7-forest-2.1/archive/f89009ada191.tar.bz2" target=3D"_blank">http://iced=
tea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.b=
z2</a>
Resolving <a href=3D"http://icedtea.classpath.org" target=3D"_blank">icedte=
a.classpath.org</a> (<a href=3D"http://icedtea.classpath.org" target=3D"_bl=
ank">icedtea.classpath.org</a>)... 172.104.137.120<br>Connecting to <a href=
=3D"http://icedtea.classpath.org" target=3D"_blank">icedtea.classpath.org</=
a> (<a href=3D"http://icedtea.classpath.org" target=3D"_blank">icedtea.clas=
spath.org</a>)|172.104.137.120|:80... connected.<br>HTTP request sent, awai=
ting response... 404 Not Found<br>2021-06-07 16:21:05 ERROR 404: Not Found.=
</span></pre></div><div><br></div><div>Alex<br></div><div><br></div><div><b=
r></div></div></div>

--000000000000ff44d005c4c86e26--
