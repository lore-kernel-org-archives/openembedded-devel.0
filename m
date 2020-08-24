Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web12.191032.1598260765316561109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vB2jvLY2;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id o184so4070779vsc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0spUrBv6tOtI00lEL8umyQhozGR+T+ybl5uY/0jmOI4=;
        b=vB2jvLY2/E1fzUoo17vfJkyteo/r6qeVGeaOLatD5C3nXI2iUYcxYKNIwG/rNbn5TO
         j0m98F8+oeQZFmLEbXRhcViTPHRwa4bVkerb9t0LjAWg+ffFbGyorBBuFmAcGxv4wfZl
         hOZHsS78CdaclTmpO5IsYdZiHtjHqYDuSf2fLyL+yoLyMVrrdbOenqhzFC5C27ictWFe
         VPuRETEY6Gxf+lLdE/p1E/qGaT8DmpOtmMw/r5C0W7UmeIYlSMbjWizAuuhE93tuLVNP
         dgnUDBJVLuvePXsP22x5Xp2S1tAkdXhHT7BnSvYWBe2I2mKhmNdL96wdcardWbhH7W83
         tV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0spUrBv6tOtI00lEL8umyQhozGR+T+ybl5uY/0jmOI4=;
        b=QEAzmrCbAJLarD1NJA++xJ1Wv4mw2lifSTUmHT0EQUF5gnTkjEyBMVjHdIOJp/Prfz
         EvO5Pi8OwwlAIlJTaj+elwh2P+S7qm6g6cNPj/QvjEytpDi3loQ3pHg7b7ni6O5JPP8i
         dUjcraPwr5G+HZJT8Wp0R3+TqsnaGlg9kicikOkGv+xvOTG6OlknWcNXazYBUoHWzHuI
         8JaK5Vjl9pKuwxX+furmLX22UyPLgTw/GnH5Cz4dbTJAsPSp2tvWbFKRFjtzDn8+hQ63
         o+nHJUJX4WFwlqncoPB6vVc3E6WUV52jVX7sUMMJq6NzYSZEZBMWHZVuoWIWIimBbU4W
         ZCZQ==
X-Gm-Message-State: AOAM531M3iYzmg9ksiUX1qyZz31E5uhYvpZmM886qHs+vLTygsKd9dMt
	CDC6xSHWItb4Q1ogaAoiYbmDKg1v1LKyQeHx9Do=
X-Google-Smtp-Source: ABdhPJyVXGEpl6t16o6eI7ZcQAi3Wre4TmsPECWtTSvnyJpHfHyhhhWh5+ToiO9OyIIl8PtK0TjTjZ8DXm5j+XZZFjU=
X-Received: by 2002:a67:f550:: with SMTP id z16mr1941920vsn.94.1598260764471;
 Mon, 24 Aug 2020 02:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200824062225.GD65616@pcleri> <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri> <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri>
In-Reply-To: <20200824091401.GB2286@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 Aug 2020 11:19:13 +0200
Message-ID: <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001ff5ef05ad9c158c"

--0000000000001ff5ef05ad9c158c
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2020 at 11:14, Richard Leitner <richard.leitner@skidata.com>
wrote:

>
> > http://deb.debian.org/debian/pool/main/o/openjdk-8/
>
> Are you aware of "stable" orig source archives of Debian? IIRC the ones
> in debian/pool/main are removed/updated when the debs are updated.
>

I usually start with that, and if the tarball is regularly removed, it is
possible to switch over to https://snapshot.debian.org/ which is stable for
any given timestamp (but the downside is that no new releases show up so
the latest version check has to look elsewhere).

But I would wait a few days; there is a high chance the official site will
come back soon.

Alex

--0000000000001ff5ef05ad9c158c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 24 Aug 2020 at 11:14, Richard Lei=
tner &lt;<a href=3D"mailto:richard.leitner@skidata.com">richard.leitner@ski=
data.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
&gt; <a href=3D"http://deb.debian.org/debian/pool/main/o/openjdk-8/" rel=3D=
"noreferrer" target=3D"_blank">http://deb.debian.org/debian/pool/main/o/ope=
njdk-8/</a><br>
<br>
Are you aware of &quot;stable&quot; orig source archives of Debian? IIRC th=
e ones<br>
in debian/pool/main are removed/updated when the debs are updated.<br></blo=
ckquote><div><br></div><div>I usually start with that, and if the tarball i=
s regularly removed, it is possible to switch over to <a href=3D"https://sn=
apshot.debian.org/">https://snapshot.debian.org/</a> which is stable for an=
y given timestamp (but the downside is that no new releases show up so the =
latest version check has to look elsewhere).</div><div><br></div><div>But I=
 would wait a few days; there is a high chance the official site will come =
back soon.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000001ff5ef05ad9c158c--
