Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.190702.1598258870463283424
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 01:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wittra.se header.s=google header.b=L5kNFFrM;
 spf=pass (domain: wittra.se, ip: 209.85.208.67, mailfrom: chencheng@wittra.se)
Received: by mail-ed1-f67.google.com with SMTP id l23so7294560edv.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wittra.se; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrlobKQsImLEVWm6A/vzfmG6bwhUghNnpCzkSn7k1/0=;
        b=L5kNFFrMbIWPDjUiez9PI+cBEUGdtualSmOskR87kEUh/Miw/4SrswaGzVg67Os/BW
         ltcLNaSCDDnP8r1naECpR2GmskFtYzsRHXl9BulFU1uYdNYHTgxJ6NaEUIQ2KdbHSMyt
         RyAr+kNKCiLFX596PxkKkxJ39R4TqK3FuIIRdBOu9t3H+odLY0753Ni0Ry/AMpSrIOIG
         L8iJt7UTpX/QNV7YQ7b46hK2FEEUfudERqLls4mkURQYYGLBoWEv3DBAEnjuGrJBGp9L
         a7NIHk3qgn/v0kxhAcXO/qJ4u4fh9ZOge7FoQ+lb0Dss1oTBqICAR43uAnB1XdW3O6ZA
         GGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrlobKQsImLEVWm6A/vzfmG6bwhUghNnpCzkSn7k1/0=;
        b=Khlwiuffnjv+76N3cNYU4o+9TkIsuAF85gzpXO5NMQ6GD/YoWkNYrCcWNyadhs+vMW
         gH2PO49nnyV5fgPfXbpAW7jppDdw/SffwdkaNHvfgYkFa/0IudDXcdZErY4PNANl0PJA
         m4LbGK9I0UOadv6Lb9vkQLjFMh7acUMUPk1OsQ5bP+Z7PfdB5acyfe5lcYsFZXD+PWHo
         t2TpNCrQ9P/FCcZP2BBAWbNAqzuw5B3stEc+vMoh6q7quxIx3WSNBlQwO2SMBCkPSGQA
         hikM1ZAa92HHscCxRCL5jIxXRN29J4zv1zQs5N5THFE/5PC1wQcAugDtFdraa0XwVpsH
         51mQ==
X-Gm-Message-State: AOAM533sj7xQR6hbzSIkleaWbxecXDyrUt5ZX/yLO4kphU53uUiKD1gg
	Mj+qjNE6WfS4SnzHtS2O8pJYfMY4GS2Tcjvfkakjlg==
X-Google-Smtp-Source: ABdhPJzvTvW1ImoYiVCBOpkzxJmyaRoYTeHAAvVCz23Jfa4eSsAVFhzpIRNTdSJtNTz/dGOu4hHd9h4DQfOcko4Q790=
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr4228935edq.59.1598258868825;
 Mon, 24 Aug 2020 01:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
 <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com>
 <20200824065011.GE65616@pcleri> <CANNYZj_CMwME4mhX0FfhVJbe94eW00TzjXuthWqWBCg3tJULHA@mail.gmail.com>
 <20200824074554.GF65616@pcleri>
In-Reply-To: <20200824074554.GF65616@pcleri>
From: "Chencheng Zhang" <chencheng@wittra.se>
Date: Mon, 24 Aug 2020 10:47:38 +0200
Message-ID: <CAE5diG17Z6Mte=_mAxtU_=9u6cSgvWm=m6WtSsDqkv8Ot1OjLQ@mail.gmail.com>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, ricardo@ribalda.com
Content-Type: multipart/alternative; boundary="00000000000022ca0b05ad9ba480"

--00000000000022ca0b05ad9ba480
Content-Type: text/plain; charset="UTF-8"

Hi again,
Got another error:
ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure for URL: '
https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=openjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=openjdk'.
Unable to fetch URL from any source.
/Chencheng

On Mon, 24 Aug 2020 at 09:45, Richard Leitner <richard.leitner@skidata.com>
wrote:

> On Mon, Aug 24, 2020 at 09:24:21AM +0200, Alexander Kanavin wrote:
> > Thanks! But I guess dunfell needs the same set of fixes?
>
> Yes. I'm currently running some tests and if they succeed I'll backport
> a set of patches.
>
> regards;rl
>
> >
> > Alex
> >
>

--00000000000022ca0b05ad9ba480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi again,<div>Got another error:<br>ERROR: openjdk-8-nativ=
e-265-r0 do_fetch: Fetcher failure for URL: &#39;<a href=3D"https://hg.open=
jdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dope=
njdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk">https://hg.openjdk.java=
.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dopenjdk8-26=
5-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk</a>&#39;. Unable to fetch URL fr=
om any source.<br></div><div>/Chencheng</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020 at 09:45, =
Richard Leitner &lt;<a href=3D"mailto:richard.leitner@skidata.com">richard.=
leitner@skidata.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Mon, Aug 24, 2020 at 09:24:21AM +0200, Alexander Kana=
vin wrote:<br>
&gt; Thanks! But I guess dunfell needs the same set of fixes?<br>
<br>
Yes. I&#39;m currently running some tests and if they succeed I&#39;ll back=
port<br>
a set of patches.<br>
<br>
regards;rl<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
</blockquote></div>

--00000000000022ca0b05ad9ba480--
