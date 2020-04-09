Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web12.16066.1586458119374750567
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 11:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPJ0uG1v;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id f63so287462vkh.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6x1CWO2PKeVMY9Z68tC4HvFKH5P2yYoUQsVW+9dESVE=;
        b=EPJ0uG1v5zNKXIo1STTPaF0TtcTJGdEiALUZr5tflLx2o/Du0Wjn/Ev7TitihlOuyL
         atuAGk2UveCxQrM9LIVxpW1ODwTeuwuId4Y6D1xeNUtcH0t9R6WlaFtBziaJ3EtxjW6e
         0apwFAMy5gEk8sI7mnWGB2c4PlL50AiEWnC3GoMMmAX1/GhVp846eaKgh8GPdLqBGZ5z
         yKtAE4U12eMaJnOX8ushEBtLYC8floPnlurkWh6KNHw6KT/k9OQ/Il0q4fcAi79V2cQP
         9F+CgdwV6YZl3DhMoR7EguFa2kmFaL/6PzAQ5Zj4rVmknC5Sk3MKmtAk/QTYnfc/S9RH
         gLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6x1CWO2PKeVMY9Z68tC4HvFKH5P2yYoUQsVW+9dESVE=;
        b=Bhdo3wbpDGeppldG/AIqZ3an4cHItiJB+foB7+v/mLWSjcQaRDmgKgEuUjAkNeMk11
         gqTyknwun4ZGDyxa5p/aH/WotZWwSYCTWya0AfFzX6sJlOEUmj2dlFcZdHKG7hKp4iWE
         KG+phd95oHVFNZEV0UUlg/O3BbaysGeLlzCZu/N3sBwx5H9FVJldK18Niy/U86KRoFZS
         xbCZuSCJxveZj0hHMoRf+trEN9C61CR+0a0VyKz/+M4wjP3X6uq5JrowCaGkuSZVRIMZ
         3JHzm+jMOi+3hA29mqUbjjfuJE3LQjHH8MSF2203QassEWKot+WtCNvYoM0QncWagoZQ
         G7Jw==
X-Gm-Message-State: AGi0Pub5W7OVj2f4CIO5OWTjdYom4MHqREC7AWIRy4pXPWT8IIlIepTh
	BxlGo9g/87ZV7fh0/Psm0CK4DP7116Sh0Oy69mA=
X-Google-Smtp-Source: APiQypJPPar9c/8F/7sLC9JXXUe8taSIV1pSErSrG1QqzhE64S8phrtg+V9x3wevD7narrVgI09+lEITTZTMEqyaBY8=
X-Received: by 2002:a1f:bf95:: with SMTP id p143mr936415vkf.29.1586458118571;
 Thu, 09 Apr 2020 11:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200409182456.18002-1-joe.slater@windriver.com>
In-Reply-To: <20200409182456.18002-1-joe.slater@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 9 Apr 2020 20:48:27 +0200
Message-ID: <CANNYZj-OU=qXAGJTPA0_m61WvM_gpWWr9nn0FsA910opBc+KUA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/1] libnma: allow building nor mipsn32
To: Joe Slater <joe.slater@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000009bc8ae05a2e01021"

--0000000000009bc8ae05a2e01021
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Apr 2020 at 20:25, Joe Slater <joe.slater@windriver.com> wrote:

> go introspection is not support for mipsn32, so we must not try to build
> vapi support.  Using sed allows us to change the meson option, if it is
> present, to be set correctly, and is more flexible than a patch would be.
> +
> +# go object introspection is not supported for mipsn32, so we must
> disable trying
> +# to build vapi.
> +#
> +do_configure_prepend_mipsarchn32 () {
> +    sed -i "/^option('vapi/ s!true!false!" ${S}/meson_options.txt
> +}
>

Wait, what? Why don't you set the option directly:
EXTRA_OEMESON_mipsarchn32_append = "-Dvapi=false"
instead of hacking the default value with sed?

Alex

--0000000000009bc8ae05a2e01021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Apr 2020 at 20:25, Joe Slater &=
lt;<a href=3D"mailto:joe.slater@windriver.com">joe.slater@windriver.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">go introspection is not support for mipsn32, so we m=
ust not try to build<br>
vapi support.=C2=A0 Using sed allows us to change the meson option, if it i=
s<br>
present, to be set correctly, and is more flexible than a patch would be.<b=
r>
+<br>
+# go object introspection is not supported for mipsn32, so we must disable=
 trying<br>
+# to build vapi.<br>
+#<br>
+do_configure_prepend_mipsarchn32 () {<br>
+=C2=A0 =C2=A0 sed -i &quot;/^option(&#39;vapi/ s!true!false!&quot; ${S}/me=
son_options.txt<br>
+}<br></blockquote><div><br></div><div>Wait, what? Why don&#39;t you set th=
e option directly:</div><div>EXTRA_OEMESON_mipsarchn32_append =3D &quot;-Dv=
api=3Dfalse&quot; <br></div><div>instead of hacking the default value with =
sed?</div><div><br></div><div>Alex<br></div></div></div>

--0000000000009bc8ae05a2e01021--
