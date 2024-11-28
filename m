Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D05D690EB
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 08:27:06 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.90831.1732782409121945922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 00:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1Mp43wm;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ea467fda32so341608b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 00:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732782408; x=1733387208; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=siRhoePEg6FxN6lucmfks7o0vKbWsevfcZ7MidV6br0=;
        b=g1Mp43wmRbpK5YteSixzI87UE7QD6NVWbx55jUZp1PKVewnh+Ju+ti4KeTtRsiqrRo
         UmpiGeubSBQ2mRBxX3hvBY/6BLNsCiQKSLMA237YKj88dEytxDdG5VEGF/UvbmuCbwWc
         4NNdjtQ+N2scxIarQ+B4Uk/N6X767ot6zWw3ais5x8aJhL2X8niK13wLATUfSetQd6X9
         Tcip2NMajDZMgAF4pVd9tWyjqffhR913SMZ1rwK8Y1lIYVoIe4hXfovGxUP0coiGp4Gh
         ddwvxGV+Z2LX3ctGKGuE/dbjjHq23zemk87CYIoUNPfQLEyQ5uPqkI7tt2N8Fsx3PTf8
         uIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732782408; x=1733387208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siRhoePEg6FxN6lucmfks7o0vKbWsevfcZ7MidV6br0=;
        b=pKwwa8hNbX2OmNbtCFli5JItn5J4CDQSWKdETumt1we8HScpBLl4d/yL4lsycvWhr/
         kVkxLJ1Bbtx8RoSWBTuO/sZw+Zz2FFx8Nh7nYEPyXGWqOKBRKo8vfzp1EV0uiI9i55Bj
         f4IddUZgQRtonPwg3leZOB1VGuJVPI3Ty/iLKow7JUP1fjR63f0f8mBp+8AUw+Fu9yks
         JHlgk0XDw2R9E879QW33qQqclt5AQLAuWX8UmAU/eMo84CyV1Xgb5RspcUQwn5w4H4bP
         BzZKUG9o9wqpNPjqiC5s1rKf9u5LDwP0A6dNM9XpWMj1AGbjROehOdLqgZaiuWCa+ypx
         ICSw==
X-Gm-Message-State: AOJu0YzQRrXaSksXTfZZbm4GM+qre+zE9lrY96/FueZ1qfY/eJ+z5FKY
	zGMSg4Emm9NVbFzw5n7Trvo5OXW1cNgTl/VXltG35XVVbaUXbyV051TgwCOOR3xOmp4YWMIS7xI
	KA5Cwc6lYWI3PPmRvlhS1At71IG4=
X-Gm-Gg: ASbGncuKfW2lI7jLnZPXTTFon0oVWxuYEJDk6t+XyRTUOYzpGJ3zHop30Jf64oHp68J
	ccJmbiNIfrnL5FpK5JwDsWdiRspszhp3tNREwL+um9hdKtZJLzy3/ZYit+VI6OIU=
X-Google-Smtp-Source: AGHT+IFgDn/MRcHEcg0tmRg1ZzkSSkddkeaooDW4PGm5u5KXdFdsoRmWdYdSS+JNhFO3IT2W9X6BRtkgqeUxsyqcDac=
X-Received: by 2002:a05:6808:2010:b0:3ea:50a8:4587 with SMTP id
 5614622812f47-3ea6dbd39d5mr6088786b6e.10.1732782408187; Thu, 28 Nov 2024
 00:26:48 -0800 (PST)
MIME-Version: 1.0
References: <a3a50dd2-bb9a-45e9-a376-505dc7dfd04a@windriver.com>
In-Reply-To: <a3a50dd2-bb9a-45e9-a376-505dc7dfd04a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Nov 2024 00:26:37 -0800
Message-ID: <CAMKF1sqX_WXLe8+zrtQXWnm=_TRXCryrN-2_1OHP-_xiANL=dw@mail.gmail.com>
Subject: Re: new objtool warnings with gcc-14.2
To: Bin Lan <Bin.Lan.CN@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e9c8f40627f4d7b8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 08:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114103

--000000000000e9c8f40627f4d7b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:29=E2=80=AFPM Bin Lan <Bin.Lan.CN@windriver.com> =
wrote:

> Hi,
>
> When building linux-yocto-6.6.y with defconfig on x86-64 with gcc-14.2 ,
> I got the following error:
>
>      AR      built-in.a
>      AR      vmlinux.a
>      LD      vmlinux.o
>      vmlinux.o: warning: objtool: .export_symbol+0x332a0: data
> relocation to !ENDBR: stpcpy+0x0
>      OBJCOPY modules.builtin.modinfo
>      GEN     modules.builtin
>      MODPOST vmlinux.symvers
>
> This is caused by gcc. Refer to
>
> https://lore.kernel.org/lkml/20240802093552.GG39708@noisy.programming.kic=
ks-ass.net/T/
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116174#c6
>
> The issue is fixed in GCC14.3 and GCC15.
>
> Can we upgrade yocto gcc to 14.3? Thank you.
>

Thanks for report. GCC 14.3 is not yet released however we can certainly
cherry pick the patch into our patches for 14.2 until we upgrade to 14.3


> B.R.
>
> Bin Lan
>
>
>

--000000000000e9c8f40627f4d7b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 27, 2024 at 7:29=E2=80=AFPM Bin Lan &lt;<a href=
=3D"mailto:Bin.Lan.CN@windriver.com">Bin.Lan.CN@windriver.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">Hi,<br>
<br>
When building linux-yocto-6.6.y with defconfig on x86-64 with gcc-14.2 , <b=
r>
I got the following error:<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-in.a<br>
=C2=A0=C2=A0=C2=A0=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.a<br>
=C2=A0=C2=A0=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o<br>
=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o: warning: objtool: .export_symbol+0x332a=
0: data <br>
relocation to !ENDBR: stpcpy+0x0<br>
=C2=A0=C2=A0=C2=A0=C2=A0 OBJCOPY modules.builtin.modinfo<br>
=C2=A0=C2=A0=C2=A0=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 modules.builtin<br>
=C2=A0=C2=A0=C2=A0=C2=A0 MODPOST vmlinux.symvers<br>
<br>
This is caused by gcc. Refer to <br>
<a href=3D"https://lore.kernel.org/lkml/20240802093552.GG39708@noisy.progra=
mming.kicks-ass.net/T/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/lkml/20240802093552.GG39708@noisy.programming.kicks-ass.net/T/</a=
><br>
<br>
<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116174#c6" rel=3D=
"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D116174#c6</a><br>
<br>
The issue is fixed in GCC14.3 and GCC15.<br>
<br>
Can we upgrade yocto gcc to 14.3? Thank you.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for repor=
t. GCC 14.3 is not yet released however we can certainly cherry pick the pa=
tch into our patches for 14.2 until we upgrade to 14.3=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)"><br>
B.R.<br>
<br>
Bin Lan<br>
<br>
<br>
</blockquote></div></div>

--000000000000e9c8f40627f4d7b8--

