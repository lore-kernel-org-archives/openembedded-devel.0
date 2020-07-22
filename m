Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.13091.1595398366106084340
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 23:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bZQmA98/;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id m9so552670qvx.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eLTqMi2+fN1NNUVk9+UeNRNh4Lg+qWoh6wO/V2qJBdM=;
        b=bZQmA98/zNfrYQI6m00We/C8YXy3eSkdfG5qsRVlLaHauW35f30Vx11M6giumWrFQo
         RE7TCOJB8Hb4xE7db0d2gsaLVE9GdsGO9diLHUbfG/54dhuLNwIWbUpleUU0oaPAQtU5
         Jx1/4XDHOQDlqJnrHoTNDN7FT9AZqQ9TlNF0WD4aB9Mfweh0kvlK//RscDheGhhkwZ2d
         OiJMFsbCyhfLG672wIZUvxG0ZXqb1y0HVv2RymPcTvNCieda0pxBhjZCBRrU1gW9xaUs
         dH9o0iU2LZ5+ekDXIxi9SIuy9BfevKaA9tBvHMImO9Zb127XzbzsNwJGqqFU4jGdLLhN
         /kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLTqMi2+fN1NNUVk9+UeNRNh4Lg+qWoh6wO/V2qJBdM=;
        b=nLXYbxERS+BdIE+mLlT0rGj46+rN2Em+jU/vHU85BvKXdJOQVoTJSLyWZb+O984fBs
         NCaZxr3/bukxuL6DVoyFisMU9haQlOQpDuopmbTYKtJ/AsE+8pvNxxwVIqc0iQP4tdYw
         0Hmu5rTt+lHHbszDmXcdTyyDG4hKLzbEJ5rfIXeNPl84f3k+T3roBbuj1lCG79wGKZET
         NziDS7TgUtZHcbAhATAihuV+p2SLTnpIHCKmLpYl2FEqrnMbV+G0SFquJ/LQ8CGE4832
         IksWebDXTZpRKdUai44Mj3jbs6VNRLe3hWrhUd78dQJqjix7KLDFla3fmM6KaUuH3cee
         7xHg==
X-Gm-Message-State: AOAM531oIxyBXpjRtqVQfoIpCeVZqO83mlY4RdVGaugqAN7x63w6a43/
	ZkXjo/NUSY3xPNZGni+rOKF9aZJ8Lyrxhl1AF3E=
X-Google-Smtp-Source: ABdhPJxSGP+6D7WCqNPmqPoIO3A7NtgSCnRYQa+gCnKGKfTHEekG9DN5l/bONr5zNzZyXwFNZX7GR+ixU4ha1boCb20=
X-Received: by 2002:a0c:e80c:: with SMTP id y12mr29993923qvn.146.1595398365102;
 Tue, 21 Jul 2020 23:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <Groupsio.1.r1IR.1595027300766544396.xk9I@lists.openembedded.org>
In-Reply-To: <Groupsio.1.r1IR.1595027300766544396.xk9I@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 21 Jul 2020 23:12:34 -0700
Message-ID: <CAMKF1spPzsNN4nqpZH-AY8L-Fn2yH1-Ny80v1b3My0Jiz6BHjA@mail.gmail.com>
Subject: Re: [oe] [meta-openwrt] Fix various build failures with Zeus #error
To: Matthew Stanger <stangerm2@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d3c7ab05ab01a0b1"

--000000000000d3c7ab05ab01a0b1
Content-Type: text/plain; charset="UTF-8"

Thanks I have merged these into master

On Tue, Jul 21, 2020 at 2:34 PM Matthew Stanger <stangerm2@gmail.com> wrote:

> [Edited Message Follows]
> There were several build errors in the meta-openwrt layer that Khem
> maintains against Zeus OE/poky. These are the patches I used to get it
> building. If they are helpful to Khem/community please feel free to use
> them.
>
> https://github.com/kraj/meta-openwrt/compare/master...stangerm2:master
> 
>

--000000000000d3c7ab05ab01a0b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks I have merged these into master=C2=A0</div></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Jul 21, 2020 at 2:34 PM Matthew Stanger &lt;<a href=3D"mailto:st=
angerm2@gmail.com">stangerm2@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)"><p>[Edited Message Follows]</p>
There were several build errors in the meta-openwrt layer that Khem mainta=
ins against Zeus OE/poky. These are the patches I used to get it building. =
If they are helpful to Khem/community please feel free to use them.<br><br>=
<a href=3D"https://github.com/kraj/meta-openwrt/compare/master...stangerm2:=
master" target=3D"_blank">https://github.com/kraj/meta-openwrt/compare/mast=
er...stangerm2:master</a>
<br>
</blockquote></div></div>

--000000000000d3c7ab05ab01a0b1--
