Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.4898.1616588051021522027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 05:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cpFUUprh;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id h13so27346963eds.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 05:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NlWyr4FXgI7DNZjEttY7uogP4nHgsFWDgvvSEDL8gVQ=;
        b=cpFUUprhqugUHzQxrCoNzhp3asNwfnjngogI73JEm0lp60RyXZiK67s/UEZX75da51
         8T6ermF+vb4Mm7hYK3zWSiUzmLVOX9SBaXwlMvgwYLg3e7J9aDP+yADdppTFgQT19ekv
         YXzpzeHPO4LTXn2Plhu8+exVMMu4p76YGWgOAfpb+XaOVjXRshUZ8JuiSJcJnLdDfNvu
         0wKGzVb/kAxir0/5i7muaTt/mTrJ+yl4krzSFkfwbh/OYUskISv7iYyP+DbstBBTrM6H
         r1sgbC/2c+yu/e8ykeL2g6vPNnChFdAr3QiVDGxbwlmhK0xRX1W/gOzcoWsM0espEvPh
         SzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NlWyr4FXgI7DNZjEttY7uogP4nHgsFWDgvvSEDL8gVQ=;
        b=WdXpETa9PeTXG9PVTAP6ucLvpelMvEZiT1colSajM46BdsaxEBXRQPcuhsZEAsoJuB
         sMXLpJzs/vWxoxIjgfu99dN0v1i/gTA9E7wPlViRDAT9dcdEBSR9xOuiIlNcR5MqsGRA
         7zvUB2W0q1nWmOKFIE3IQPd3tBBnRoYnj/+rWAbi4EgXc0dcgotxUNekSmA2lqE4D9SK
         FnA+HxikSHARMOut3/fOAXdJGCmD/+eHSuto1kqbTBurnoaAv7L6EKQxn/60wJH+ZEex
         eFp86DD7Y0IffghJpCIid78AWWDYrGVlANFCA3fD88PFBE4yCLdwPJ+bsPX2XXvJSWP4
         S5SQ==
X-Gm-Message-State: AOAM530s+Uv6GjPNpx4VY78rQG64Eg2pXiw9rT3qVKVlAUYWalht3z3o
	8cdJS/d0UP37sQlobOhJn+scDTVXm+KCDH3+L8E=
X-Google-Smtp-Source: ABdhPJzeBQvgr83SZZYuCz4BTHJ7Z6ZPTrozV6YcPk7layMPUUmpUUcXfsEjE5bdPJowAfMoZbrjAwu23621f45FOP8=
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr3150887edr.264.1616588049376;
 Wed, 24 Mar 2021 05:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210219125845.29016-1-anbelski@linux.microsoft.com> <166670501E1BA6E4.11921@lists.openembedded.org>
In-Reply-To: <166670501E1BA6E4.11921@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 24 Mar 2021 13:13:58 +0100
Message-ID: <CA+chaQeNoPZANexNTBE2EdWBQyiV+pGvsMrEO5HQrT0g3ena+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] abseil-cpp: Relax build requirements
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Anatol Belski <anbelski@linux.microsoft.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006e685405be473ce7"

--0000000000006e685405be473ce7
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 23, 2021 at 6:23 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> You should remove abseil-cpp from the _remove in the packagegroup as well,
> see:
>
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64
> = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)}
> concurrencykit"
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64
> = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"
>
> Please send follow-up patch.
>

Still no follow-up patch, I'll send it myself.

--0000000000006e685405be473ce7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 23, 2021 at 6:23 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Y=
ou should remove abseil-cpp from the _remove in the packagegroup as well, s=
ee:<div><br><div>meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb=
:RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 =3D &quot;${@bb.util=
s.contains(&quot;TUNE_FEATURES&quot;, &quot;crypto&quot;, &quot;&quot;, &qu=
ot;abseil-cpp&quot;, d)} concurrencykit&quot;<br>meta-oe/recipes-core/packa=
gegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_rem=
ove_x86-64 =3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;=
corei7&quot;, &quot;&quot;, &quot;abseil-cpp&quot;, d)}&quot;<br></div></di=
v><div><br></div><div>Please send follow-up patch.</div></div></blockquote>=
<div><br></div><div>Still no follow-up patch, I&#39;ll send it myself.</div=
></div></div>

--0000000000006e685405be473ce7--
