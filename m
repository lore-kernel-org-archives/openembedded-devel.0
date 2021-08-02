Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2110.1627946094590069544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 16:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mj+6G4u0;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: b.hutchman@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id t3so19375674plg.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 16:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DsvZ4a+Yg2RIlxBk7KTlQw2U66SQLRueV8pivLK0gKA=;
        b=Mj+6G4u0AOj8RgWGaT9Oy1jyQj9yz1bZgE9/RQBomqBp98gCsl01WsJWW33jbuBsFW
         RfnM2P0P40qKHF/DVLtcw6CGq0BJmW9PP5N6ikVG2SnzfA6CmYiP8dUPEZmJt/cvuUKx
         B1NN99zEjJf4itHhcVJeoV6RV9HCCbhmmt2KWlczyRf4WuJQWE0vEBNa7N0u/wnxra5n
         wQPuvlL4auYGRn91NJQ/Hc2Bd7jgvyuO7TGY7dEIN/3Pw/ANkA4tIlDGSYzBHvfJkBVg
         4/BkLaGWIPOtZkZ7DpQbmUy2NSIi9c+TSJww5RnVGmRJGOZHQlvgEFFCQr2eMzVys+Hc
         u+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsvZ4a+Yg2RIlxBk7KTlQw2U66SQLRueV8pivLK0gKA=;
        b=rODD+fmAn+TOzJkvPelFvw8MEF+UZRgR+VSz60mV4TyxGkrbqb3vNeVEoh8ndbmRF2
         mPvEtdoJLpRqGD8WUCVwkenPj98mY+cM6FNrliJBX0srCqEJ6iiEDCKTK8+pDiYo21KX
         uj9kAPJ/zALG0GryuvR6KuP9oCGeqQuX6YojR2jKPmTuYOivtQPB+k+++fomtVoU5mnT
         /3TV6652ouwOq5OeXUzDt3/Fd6EGEu40XPJIV90C0bABVm9mRRuAGz0eW2XHqtZsX3KW
         hCcNw3WS9ZwK2ag1BXFLyrlIvrRNYRpEZ6inYv0DVfV5+B0Lw/6lAscP3eXs55VIXFoK
         8vuQ==
X-Gm-Message-State: AOAM530A0CItgoN4R5IUHAww4Mq7wOBNYHppiyyD3qyNqC/j77lJ5P0r
	XccbHlTL0bNqoMc3xJtObSFEzPAdzQt9oXmKBfM=
X-Google-Smtp-Source: ABdhPJx9566zFw6FGp8pPtPX/pOXDCnTl1etyEVXoilm/EIclL6qAaYu6Hn4QO+yLNSDpfFLlCSbdERVFlA9XOG21Co=
X-Received: by 2002:a63:124a:: with SMTP id 10mr268567pgs.34.1627946093910;
 Mon, 02 Aug 2021 16:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
 <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com> <CAFZh4h8r3XOuNWA-3h9yraUZ+U7PLnPd7hxDLcyEQGiVM6EqrA@mail.gmail.com>
 <CAMKF1sosZLX7Ha7N23c+x=coBbzaavajL=+vmiXFXmZ86oDZTQ@mail.gmail.com>
In-Reply-To: <CAMKF1sosZLX7Ha7N23c+x=coBbzaavajL=+vmiXFXmZ86oDZTQ@mail.gmail.com>
From: "Brian Hutchinson" <b.hutchman@gmail.com>
Date: Mon, 2 Aug 2021 19:14:42 -0400
Message-ID: <CAFZh4h-oyyAdWC-vceBEJuUgZMEL7h7f5CRRO3f6yx6iY-zs7Q@mail.gmail.com>
Subject: Re: [oe] Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a41ce205c89bbc98"

--000000000000a41ce205c89bbc98
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 7:06 PM Khem Raj <raj.khem@gmail.com> wrote:

>
> I meant build an image like you do and then add cryptsetup and do a build
> again this all after enabling build history then check build history repo
> and it will have the information on top commit about what changed and which
> all packages got added and how much are they adding to size
>

Use both:

INHERIT += "buildhistory"

BUILDHISTORY_COMMIT = "1"

???

I've never used it before.

Do I have to smoke /tmp and rebuild everything?

Regards,

Brian

--000000000000a41ce205c89bbc98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 7:06 PM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></d=
iv><div dir=3D"auto">I meant build an image like you do and then add crypts=
etup and do a build again this all after enabling build history then check =
build history repo and it will have the information on top commit about wha=
t changed and which all packages got added and how much are they adding to =
size=C2=A0</div></blockquote><div><br></div><div>Use both:</div><div><br></=
div><div><div class=3D"gmail-informalexample"><pre class=3D"gmail-programli=
sting">INHERIT +=3D &quot;buildhistory&quot;</pre></div><div class=3D"gmail=
-informalexample"><pre class=3D"gmail-programlisting">BUILDHISTORY_COMMIT =
=3D &quot;1&quot;<br><br>???<br><br></pre><pre class=3D"gmail-programlistin=
g">I&#39;ve never used it before.<br></pre></div></div>Do I have to smoke /=
tmp and rebuild everything?</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">Regards,</div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">Brian<br></div></div>

--000000000000a41ce205c89bbc98--
