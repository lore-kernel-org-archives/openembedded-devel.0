Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.191805.1598262938714356260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ighKuOt9;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id x17so2420419uao.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2EAhcjSPVfllZG/erRojZDJx5rbJZNJqZ/nJwNHkkOs=;
        b=ighKuOt9ipzQNjxSYX++mGAoG1n5Xiq4SO5fBKKad+3/S2lcWumQW5P04+nvGlbI0N
         6cjiZx1CbWl3bcdexllSUHKVGowTQxf8XNYTvZrw4qrKc1CxSqHvHmjCV46DThL5A4XP
         /frEXtxcjFZ4rQyD9Us0gdJkvb3m5v4kRomrRfTyuYtnReGNdbjpJs+a4V0RgNiER4So
         nvsU+lOjeJ6qRaMTKRV1WuYI5H2bkUoAHtBN5zufnwwzQ62xnoHT4hcA1Gy906JNYR3G
         Pmo+29N1Y1VjES4XFFbtUgQMDgj01A7MbKPwPDPmbJYAeMI9j49u2h8XMNnzRtn97kSO
         p5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2EAhcjSPVfllZG/erRojZDJx5rbJZNJqZ/nJwNHkkOs=;
        b=jEu0Y/i0ZKL+9c0JA1M+jLUP7z6BE2Q/e1JrWE7OadoQ++/laLREWL2CQxi5OTt60f
         aG75G6hpcrLiSnqouorQo70JqlplZ6qEMRaBBXa91gyWqBo9yo3lBKodB1TzFF/JJRi3
         WNUGtFzDO3Iba2NdXiizXAPdZU95pJKo7VR6DpURJGdFSeMnF5lsj/avAmrW1OOtD0F9
         N0E98OKHrpLuCJE7g1RBbhALs9iMlThrbbArADPg0R0wb5l0Em1xPsvScOFyBfzjPJN8
         1SS7qrazHTBODnsMsdBSTClDgqI0aSp9SQdtJog4jP214HoyCFIBSQBv7FcQNOulm9yV
         W6cg==
X-Gm-Message-State: AOAM532Qx5fhG8xZimJfpiCz0s0onu/PbOV1qHt1qNbZ0/lBexijbWp0
	Op9/aRx/fEUB8qEiUjg2DJnaAkogkbYN1XAG6nA=
X-Google-Smtp-Source: ABdhPJxRNL8hAIBYdzPdY19o6fpNXik7QgpWaY8Z9YzUCNqxfg5HBlcy7BPz0LIWI7xen9F4ifSZgsSyPCzKzfftc+E=
X-Received: by 2002:ab0:6950:: with SMTP id c16mr1785183uas.71.1598262937780;
 Mon, 24 Aug 2020 02:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200824062225.GD65616@pcleri> <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri> <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri> <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri>
In-Reply-To: <20200824093831.GC2286@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 Aug 2020 11:55:25 +0200
Message-ID: <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa063005ad9c9677"

--000000000000aa063005ad9c9677
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2020 at 11:38, Richard Leitner <richard.leitner@skidata.com>
wrote:

> > I usually start with that, and if the tarball is regularly removed, it is
> > possible to switch over to https://snapshot.debian.org/ which is stable
> for
> > any given timestamp (but the downside is that no new releases show up so
> > the latest version check has to look elsewhere).
>
> Thanks for the info. So snapshots.debian.org is OK for OE/YP?
>

Yes, it is used in several places in oe-core, and is a de facto standard
approach for dead upstreams.


>
> >
> > But I would wait a few days; there is a high chance the official site
> will
> > come back soon.
>
> Yeah, looks like it works again. At least my downloads succeeded now.
>

Still not working for me (or it is taking a really really long time):

ak@linux-f9zs:~/development/meta-java> wget
https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
--2020-08-24 11:50:18--
https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:443...
connected.
HTTP request sent, awaiting response...

Alex


>
> >
> > Alex
>
> regards;rl
>

--000000000000aa063005ad9c9677
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 24 Aug 2020 at 11:38, Richard Leitner &lt;<a href=3D"mailto:=
richard.leitner@skidata.com">richard.leitner@skidata.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I usually star=
t with that, and if the tarball is regularly removed, it is<br>
&gt; possible to switch over to <a href=3D"https://snapshot.debian.org/" re=
l=3D"noreferrer" target=3D"_blank">https://snapshot.debian.org/</a> which i=
s stable for<br>
&gt; any given timestamp (but the downside is that no new releases show up =
so<br>
&gt; the latest version check has to look elsewhere).<br>
<br>
Thanks for the info. So <a href=3D"http://snapshots.debian.org" rel=3D"nore=
ferrer" target=3D"_blank">snapshots.debian.org</a> is OK for OE/YP?<br></bl=
ockquote><div><br></div><div>Yes, it is used in several places in oe-core, =
and is a de facto standard approach for dead upstreams.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; But I would wait a few days; there is a high chance the official site =
will<br>
&gt; come back soon.<br>
<br>
Yeah, looks like it works again. At least my downloads succeeded now.<br></=
blockquote><div><br></div><div>Still not working for me (or it is taking a =
really really long time):</div><div><br></div><div>ak@linux-f9zs:~/developm=
ent/meta-java&gt; wget <a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/a=
rchive/jdk8u265-ga.tar.bz2">https://hg.openjdk.java.net/jdk8u/jdk8u/archive=
/jdk8u265-ga.tar.bz2</a><br>--2020-08-24 11:50:18-- =C2=A0<a href=3D"https:=
//hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2">https://hg.o=
penjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2</a><br>Resolving <a=
 href=3D"http://hg.openjdk.java.net">hg.openjdk.java.net</a> (<a href=3D"ht=
tp://hg.openjdk.java.net">hg.openjdk.java.net</a>)... 137.254.56.63<br>Conn=
ecting to <a href=3D"http://hg.openjdk.java.net">hg.openjdk.java.net</a> (<=
a href=3D"http://hg.openjdk.java.net">hg.openjdk.java.net</a>)|137.254.56.6=
3|:443... connected.<br>HTTP request sent, awaiting response...</div><div><=
br></div><div>Alex<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; <br>
&gt; Alex<br>
<br>
regards;rl<br>
</blockquote></div></div>

--000000000000aa063005ad9c9677--
