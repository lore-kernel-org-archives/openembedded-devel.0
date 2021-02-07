Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.24868.1612726151561087696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFmpsVRA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id t5so15667747eds.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q+3ed7ZytVV6d7De2El/P8/JMuJ1G+1xI9WOn4mxxoM=;
        b=VFmpsVRAcBqjA2vUG0A4yxIg2ZqGwbhK9H0baejn7hhahVhlzilncubOICg6PQneC8
         +CFh7INQuOZEfzlrOe20R6CUWTfnAj4ukjWFhATiklWI112iTszeqthwjSzgh+aMSlLT
         x+WGlGPOtjHs1NZCEzSgkjg9dr58xp7YmGMjMVKPKteBORIlN01oYpnxRE1lLmkQWfq7
         hUMXhByeBYNcRTpZ0elsqE5qa91s58oEgYe+S3O0Jj1Ef6SCjqqaXnDQMrey0Omo1i6m
         kDSQhiEbUNuSoYinxDgi48TQyLJVAkYigb6deh7Q63Epo2pn7t8HIMAW0c62TobLRFAO
         iZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q+3ed7ZytVV6d7De2El/P8/JMuJ1G+1xI9WOn4mxxoM=;
        b=G2TwKpE3Z7GHVCw73WlnHax6rmBIXFTOwPDqWWDuIHfl1NxP/mZ+c6jzQRalMTkOdF
         +n/DL4uYOsjqu3hDNMVdmQkIA0g+JXB/YM/0DG25uAWHIY3VElYi5/u3CQID8MG2sdFc
         D51m/r/h2d3zLYoIIL+MSlbHpM3S7xVpwuPeJUTZJz659+1UFaohvXQ4eAc7x2V6Xv9S
         C7cV2wu5VLpH2K3/+vNUsb3jOOKvdlwmOasHIwYyzPWoDnxMO9DFVvtvojGyblyiLeI5
         uNVezKTg3KOoVkYEzYrJxU1zaQJ1Qm3ct8G0W1x3trKWPBnue8F+ao/PccucWNhiChDU
         nPSg==
X-Gm-Message-State: AOAM530QD/I4D1X7lCMRv4uZx/sXhZexSTo017zCN5/dYaefdSDb5wHT
	edrO1iz9hbc8gKnXw8C5uAk9TPnaESVrq4/NFZ0=
X-Google-Smtp-Source: ABdhPJxALMSxTxlV1HLjPij3z4Wa06Fyc0yi6NFxMl4gg5xO7njJJ2TKlTaTewtNKHaVFhEJ3sfPRV+jJOx+9drOJtA=
X-Received: by 2002:a50:cc4d:: with SMTP id n13mr13630079edi.337.1612726150026;
 Sun, 07 Feb 2021 11:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20210207192056.30420-1-akuster808@gmail.com>
In-Reply-To: <20210207192056.30420-1-akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 7 Feb 2021 20:28:59 +0100
Message-ID: <CA+chaQde30a46vvvQUBzdx-gwj_RBmBpfaP37Va_6DMnNdgPLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe/README: add Ubuntu 20 req.
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004af56d05bac4110a"

--0000000000004af56d05bac4110a
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 7, 2021 at 8:21 PM akuster <akuster808@gmail.com> wrote:

> When building on Ubuntu 20.04, luajit needs 32bit support
> so install 'gcc-multilib'
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/README | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/README b/meta-oe/README
> index 8d787df68b..9034342643 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -14,6 +14,9 @@ e.g. on archlinux based distributions install
> prerequisites like below
>
>  pacman -S lib32-gcc-libs lib32-glibc
>
> +Ubuntu 20.05
> +sudo apt-get install gcc-multilib
>

This is true for older ubuntu versions as well, so I would drop the version
here (or fix the typo in it)

Also I don't see this in master branch.

+
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe]' in the subject'
>
>  When sending single patches, please use something like:
> --
> 2.17.1
>
>
> 
>
>

--0000000000004af56d05bac4110a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Feb 7, 2021 at 8:21 PM akuster &l=
t;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">When building on Ubuntu 20.04, luajit needs 32bit support<br>
so install &#39;gcc-multilib&#39;<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/README | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/README b/meta-oe/README<br>
index 8d787df68b..9034342643 100644<br>
--- a/meta-oe/README<br>
+++ b/meta-oe/README<br>
@@ -14,6 +14,9 @@ e.g. on archlinux based distributions install prerequisi=
tes like below<br>
<br>
=C2=A0pacman -S lib32-gcc-libs lib32-glibc<br>
<br>
+Ubuntu 20.05<br>
+sudo apt-get install gcc-multilib<br></blockquote><div><br></div><div>Thi=
s is true for older ubuntu versions as well, so I would drop the version he=
re (or fix the typo in it)</div><div><br></div><div>Also I don&#39;t see th=
is in master branch.</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
=C2=A0Send pull requests to <a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org<=
/a> with &#39;[meta-oe]&#39; in the subject&#39;<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000004af56d05bac4110a--
