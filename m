Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.5849.1622796775815464784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 01:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LuU9BiK0;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ba2so8525533edb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DoJlznVHjmFPlZAzBp0YOrDboStbSsrKayeBxO7nLC0=;
        b=LuU9BiK0VqBrlJRcF6sRCxRyDtQo3nqxMmeXzOsqi/S+2b6dLRos+y7nxBjDj4b+Vt
         bZfBz5P/AwpI8GOplS6UGQ0MFnKp69UV6sqwSVJw4/x7P1QYXv55gyqZGc/lFIPBHgyg
         PPaAKJ9ZVXGnOgTXlLEguywQJvfSRu8lEKyLeQMoHMCLV0r0rej/CwU2UcKboC28a5JI
         unO3pbszvYi3o2ys9b0MGYfzmfD6pi8d8HvTxQM4p0Spc7XzzRWovj91PKo/7RNRpJqs
         kyqOeIFDf20dJ6RIQZEaRLZknaI6vlIBoQOuJtgM6tJZipQCCd3EWtEHe2GQD3HURb+0
         INDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DoJlznVHjmFPlZAzBp0YOrDboStbSsrKayeBxO7nLC0=;
        b=Un7S9V9J1O9odd/ITsO1IF53hVQNXXLfND2IV03kNBqW+n2nV/+O4TTid9cRb4TZLm
         nuSDNYCEf7qXj3iRpWQ4X7kzNpptQqVUrV96qjNPIwIdHdhwqL7kWryhE5ojjKXQGBJ4
         yqQVzTOTp5lhzgMhuhYDlUIGPBul+gr249q/yq7+FB9EB2wE53rP2ilPlkv0ilFxljhR
         3jPxOS4y8zNrrEH9bTccWCReWxERuHjqSiONPlt3Bl1aRoM8oJWbec9emDcvViCBXfd7
         h+/Q+McAgaCGS4Ol0altTikgkMNHN2rSKLzffMyz3oxRJ+RvsAumI3+rg5nevI+HA8lw
         JLQw==
X-Gm-Message-State: AOAM530OukzQLJ+b2Ne2mX217jQaWRQVUyl+rY/SdJ+v4dxl6Bgf/qiP
	PjNKWKYrP//DRlho6Wp8T4kLqaq22O3xCkXDqxYsR25wn6Y=
X-Google-Smtp-Source: ABdhPJwuBnEQo8nUdWDDqx1WDIvkemB/E/SBgTEmeE9rHP4rxRyB3Nteq3tURn3cx59shocSppNMzTUNloOpDeij+10=
X-Received: by 2002:a05:6402:754:: with SMTP id p20mr3446317edy.311.1622796774117;
 Fri, 04 Jun 2021 01:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210604014438.33958-1-kai.kang@windriver.com>
In-Reply-To: <20210604014438.33958-1-kai.kang@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 4 Jun 2021 10:52:43 +0200
Message-ID: <CA+chaQf3SGiUJSg57umnwTQ8gMtAmrFLTSsTw=xeB2GYzaRSpQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] layers: set LAYERSERIES_COMPAT with honister
To: kai <kai.kang@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000043944905c3ecd151"

--00000000000043944905c3ecd151
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 4, 2021 at 3:44 AM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Set LAYERSERIES_COMPAT with 'honister' which align with oe-core.
>
>
I think it's bad practice to claim honister support this early in its
development cycle. It won't happen with well-maintained layers like
meta-oe, but if some less frequently updated layer sets the compatibility
with honister now and then doesn't get necessary updates to stay compatible
with honister in next 4 months, then whole purpose of LAYERSERIES_COMPAT
will get broken just by claiming the compatibility too soon (without even
knowing what final honister will contain).

Changing it after release freeze in oe-core seems much better time to do it.

The same does apply on the meta-qt5 PR you've sent today
https://github.com/meta-qt5/meta-qt5/pull/416/commits

Cheers,

--00000000000043944905c3ecd151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jun 4, 2021 at 3:44 AM kai &lt;<a=
 href=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" =
target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Set LAYERSERIES_COMPAT with &#39;honister&#39; which align with oe-core.<br=
><br></blockquote><div><br></div><div>I think it&#39;s bad practice to clai=
m honister support this early in its development cycle. It won&#39;t happen=
 with well-maintained layers like meta-oe, but if some less frequently upda=
ted layer sets the compatibility with honister now and then doesn&#39;t get=
 necessary updates to stay compatible with honister in next 4 months, then =
whole purpose of LAYERSERIES_COMPAT will get broken just by claiming the co=
mpatibility too soon (without even knowing what final honister will contain=
).</div><div><br></div><div>Changing it after release freeze in oe-core see=
ms much better time to do it.</div><div><br></div><div>The same does apply =
on the meta-qt5 PR you&#39;ve sent today=C2=A0<a href=3D"https://github.com=
/meta-qt5/meta-qt5/pull/416/commits">https://github.com/meta-qt5/meta-qt5/p=
ull/416/commits</a></div><div><br></div><div>Cheers,</div></div></div>

--00000000000043944905c3ecd151--
