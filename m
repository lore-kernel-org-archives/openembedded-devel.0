Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.12960.1613759642309902878
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 10:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vhj+zHve;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id lu16so15230366ejb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tj51HBZMqldyAghqiB+2KHJdbLtaUpphsKY+21YBsGc=;
        b=vhj+zHve1dVj38pY+8KINnOUllx5fvg+xU2NpFfEZbkcvlWp5TukPGheBpbFyFzqWE
         xQy0k/k15voorCXHwKL2GZ4Bia25D66jhhIieskTv8CMEb+doX8EVkGoZ/hphsBcOzEh
         cwwpnEg8aGwGMC6esMvtQGLPT43oCZMNTYotIlkqbZxAC9ONUpCW0O1xPg9Am9C/FZhb
         4i2C2Iscn4/fyik1XruAxI1rWwre70PfhFhLnTuXf28vwmCp2uG+jU3zDMvqSegE2EQi
         NpO8kiZ8Qxkhy2STCsWUWX23E0L8znxWyRrZ+2hctYoQuRW3XDj9roIcVBme0kcJv4ph
         eRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tj51HBZMqldyAghqiB+2KHJdbLtaUpphsKY+21YBsGc=;
        b=GTIR9+bG0M96IeU0cu+mDYg1fKc3Xrpop47aONYJ46WWF/q7HA1K9LU3qCeJdIKgmv
         LyGofmJH8tVHa9s/8V27S2G4EyMV4cGdqhz/5uCL/QHXDb7raM8fPAiIF4hIxRc84bo1
         2b0N2sO/kEVD7n43BDCUzeHYWg8k7knhLSVJaXkuglGL89VXMnbUFxg4/G9AgsWeC3UB
         e2MfNOiZ5m/zcXEVynWuur8R2BF+KMYVmOaW/A37225cwUBKTnsnQY0m9W0MkCLeD8Ws
         00kyElng7Qb0NexAhB5Wjhm/pvqmf4wOpTiE8hiMXoGII1jrgQ5Fk+pmYB+TBU14AR/w
         q5UA==
X-Gm-Message-State: AOAM531ayfxIuQXIfdRvI5yYzR+kMdBB8mr5IL2WeKkY1MbN/QZrCPt+
	vHHeh5y66X6vxil/J7mKJc7LteUqGNHYdYRFyIk=
X-Google-Smtp-Source: ABdhPJy2QCF881lIQZASQIqTd4UuW/iGwj938GCpuVYdXKqAM1ljpajhNaHrqI0yEYKe4yRBlCk0cZ9yQyBLG9ckEoE=
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr9730390ejq.137.1613759640581;
 Fri, 19 Feb 2021 10:34:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1613440394.git.akuster808@gmail.com> <20210216095535.57niv5clax3lzwlr@jama>
 <98cfdeec-d542-5eca-3c3e-3eeabc8ca334@gmail.com>
In-Reply-To: <98cfdeec-d542-5eca-3c3e-3eeabc8ca334@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 19 Feb 2021 19:33:49 +0100
Message-ID: <CA+chaQfnt847kkqddFwpomSGEZuK1u2qgA2iFJHRHmOrv2t6QQ@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/11] Patch review Feb 15th
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000213ab105bbb4b256"

--000000000000213ab105bbb4b256
Content-Type: text/plain; charset="UTF-8"

lets fix the parsing :)

dunfell-next
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Tue, Feb 16, 2021 at 4:58 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 2/16/21 1:55 AM, Martin Jansa wrote:
> > On Mon, Feb 15, 2021 at 05:58:08PM -0800, akuster wrote:
> >> Here is the next set for review.
> >> Please have reviews back by Wednesday
> >>
> >> The following changes since commit
> de37512b25c1f8c6bb6ab2b3782ac0fe01443483:
> >>
> >>   gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.openembedded.org/meta-openembedded-contrib
> stable/dunfell-nut
> >>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut
> > Please include
> > https://lists.openembedded.org/g/openembedded-devel/message/89395
> > as well.
> got it thanks.
> Armin
>

--000000000000213ab105bbb4b256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>lets fix the parsing :)</div><div><br></div><div dir=
=3D"ltr">dunfell-next<div>Acked-by: Martin Jansa &lt;<a href=3D"mailto:Mart=
in.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 16,=
 2021 at 4:58 PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
<br>
On 2/16/21 1:55 AM, Martin Jansa wrote:<br>
&gt; On Mon, Feb 15, 2021 at 05:58:08PM -0800, akuster wrote:<br>
&gt;&gt; Here is the next set for review.<br>
&gt;&gt; Please have reviews back by Wednesday<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit de37512b25c1f8c6bb6ab2b3782ac0f=
e01443483:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)<br>
&gt;&gt;<br>
&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/meta-open=
embedded-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org=
/meta-openembedded-contrib</a> stable/dunfell-nut<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/meta-openembed=
ded-contrib/log/?h=3Dstable/dunfell-nut" rel=3D"noreferrer" target=3D"_blan=
k">http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/d=
unfell-nut</a><br>
&gt; Please include<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/89395" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/message/89395</a><br>
&gt; as well.<br>
got it thanks.<br>
Armin<br>
</blockquote></div></div>

--000000000000213ab105bbb4b256--
