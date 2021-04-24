Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.4939.1619260657333031092
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O/RPfu0x;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id g14so480723edy.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLyM+VfpRJW9DyS6jfRr8UXnlQEtGQEJmjp++U6yWyc=;
        b=O/RPfu0xBqNw046/eUBrfS58KGOhdYZu8is74mMj9/w9k85bM+RnyRdV+CP6LwY4LC
         b6yszsPT16SUji61OJriikMngn6aniTV9Vwe+mkDU+6ddvO78xHKuJJs063dljYA90u6
         50aN6ZqRgBUVPjovK1IHIkrOiHVopn0dmYPuS6S4Yc+z/nluBIg9WA2WPWhlYlb/5tYj
         NaH7EMb17V9D5Xnwzmd0lQcA68dRT8aADTJJA2eFbW2ndkwnZu5JuyZTqvdPd5DrMCgv
         R5rAa/N+XIo/ELIkisg4T6Qbk4B034IOpcA18ZwIrdZJK8Ma6ZjX70Dnaxtd+fVRXqYH
         iZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLyM+VfpRJW9DyS6jfRr8UXnlQEtGQEJmjp++U6yWyc=;
        b=SqBXyrmePScSdqopHOhsg87Lqc0H65X07tz7jX3hKUm69OrfAf2HdWDgHdlRgSmBJ5
         MehVitbwGXpuk5G3oO86jSvwqPhywwt85ZzsbbGNOIdr+4ECv/3F5FWDR49rKRuwKnCz
         pLPP6Wwq7yImk8Ia7bnUUepLKRztQb9G5zG7FntyeSCgCIOOC7fc54kI54z0XxdKoZwm
         UsSgAntzIMw3KQSgcBeKdN1QWygYHusJz0SkeZRUGg2PsQy4XaDZOG0MxOLGhZ2X4lgm
         4Upy9pr16SC7b0gSSMPCHXH3gZiKN1h6QSgy+/1TQB5zB3zQpdOTqBtz0rKTPob8v1vh
         Tmyg==
X-Gm-Message-State: AOAM530wZSEi7atJfFN95tMQr2R/vsKksyJkMO+NnmuO4xT0j2vTy8Mu
	E/WNjIHZf16220DkvpnTHIyu9t9MwZ8yrOKe4pc=
X-Google-Smtp-Source: ABdhPJwcidosFNIPmbk7GHEwZG1yu2nbamT2k3hVGXal7QMwaPcFuqonnKFv6SmlRNpDK5+1fNPmNBvYY4simBzWH/8=
X-Received: by 2002:a05:6402:42c3:: with SMTP id i3mr9654939edc.270.1619260655998;
 Sat, 24 Apr 2021 03:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619228936.git.akuster808@gmail.com>
In-Reply-To: <cover.1619228936.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 24 Apr 2021 03:37:24 -0700
Message-ID: <CA+chaQfOVE4U0L9Oz-GGOO9ZRRGhyG7weP+FBSe9LNQxHGWBwA@mail.gmail.com>
Subject: Re: [oe] [dunfell 0/6] Dunfell patch review April 23rd
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000331b1005c0b58036"

--000000000000331b1005c0b58036
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Fri, Apr 23, 2021 at 6:50 PM Armin Kuster <akuster808@gmail.com> wrote:

> Please have comments back by Sunday.
>
> The following changes since commit
> 430ef96fe65f62d8da995f446d5b9b093544f031:
>
>   wireguard: fix build issue with updated 5.4 kernel (2021-04-07 08:55:15
> -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut
>
> Martin Jansa (3):
>   uml-utilities: fix installed-vs-shipped with usrmerge
>   telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
>   libyui: switch to libyui-old repo which still has this SRCREV
>
> Mingli Yu (2):
>   hostapd: fix CVE-2019-5061
>   hostapd: fix CVE-2021-0326 and CVE-2021-27803
>
> Stefan Ghinea (1):
>   hostapd: fix CVE-2021-30004
>
>  .../hostapd/hostapd/CVE-2019-5061.patch       | 854 ++++++++++++++++++
>  .../hostapd/hostapd/CVE-2021-0326.patch       |  43 +
>  .../hostapd/hostapd/CVE-2021-27803.patch      |  54 ++
>  .../hostapd/hostapd/CVE-2021-30004.patch      | 123 +++
>  .../hostapd/hostapd_2.9.bb                    |   4 +
>  .../telepathy/telepathy-glib_0.24.1.bb        |   4 +-
>  .../uml-utilities/uml-utilities_20040406.bb   |   5 +-
>  .../recipes-graphics/libyui/libyui_3.6.0.bb   |   2 +-
>  8 files changed, 1084 insertions(+), 5 deletions(-)
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
>
> --
> 2.17.1
>
>
> 
>
>

--000000000000331b1005c0b58036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by:=C2=A0Martin Jansa &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com">martin.jansa@gmail.com</a>&gt;</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 6:50 =
PM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Please have comments back by Sunday.<br>
<br>
The following changes since commit 430ef96fe65f62d8da995f446d5b9b093544f03=
1:<br>
<br>
=C2=A0 wireguard: fix build issue with updated 5.4 kernel (2021-04-07 08:5=
5:15 -0700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openemb=
edded-contrib</a> stable/dunfell-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/meta-openembedded-contrib/l=
og/?h=3Dstable/dunfell-nut" rel=3D"noreferrer" target=3D"_blank">http://cgi=
t.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/dunfell-nut</a=
><br>
<br>
Martin Jansa (3):<br>
=C2=A0 uml-utilities: fix installed-vs-shipped with usrmerge<br>
=C2=A0 telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings=
<br>
=C2=A0 libyui: switch to libyui-old repo which still has this SRCREV<br>
<br>
Mingli Yu (2):<br>
=C2=A0 hostapd: fix CVE-2019-5061<br>
=C2=A0 hostapd: fix CVE-2021-0326 and CVE-2021-27803<br>
<br>
Stefan Ghinea (1):<br>
=C2=A0 hostapd: fix CVE-2021-30004<br>
<br>
=C2=A0.../hostapd/hostapd/CVE-2019-5061.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
854 ++++++++++++++++++<br>
=C2=A0.../hostapd/hostapd/CVE-2021-0326.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 43 +<br>
=C2=A0.../hostapd/hostapd/CVE-2021-27803.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 54 ++<br>
=C2=A0.../hostapd/hostapd/CVE-2021-30004.patch=C2=A0 =C2=A0 =C2=A0 | 123 +=
++<br>
=C2=A0.../hostapd/<a href=3D"http://hostapd_2.9.bb" rel=3D"noreferrer" tar=
get=3D"_blank">hostapd_2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0.../telepathy/<a href=3D"http://telepathy-glib_0.24.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">telepathy-glib_0.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../uml-utilities/<a href=3D"http://uml-utilities_20040406.bb" rel=
=3D"noreferrer" target=3D"_blank">uml-utilities_20040406.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0.../recipes-graphics/libyui/<a href=3D"http://libyui_3.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libyui_3.6.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=
=C2=A02 +-<br>
=C2=A08 files changed, 1084 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-=
2019-5061.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-=
2021-0326.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-=
2021-27803.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-=
2021-30004.patch<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000331b1005c0b58036--
