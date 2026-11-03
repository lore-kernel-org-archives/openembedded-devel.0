Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12702.1793716784363582377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vyPx9S7l;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab43af5e97so9431347b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793716783; cv=none;
        d=google.com; s=arc-20260327;
        b=V5QKkGohn+RfgRoEwUMsJIbsngRVVXc3uZ6k06bAROZab0AdbSDdigWXx1YDo7dB0Y
         AJ8fRfBPG6LELkLndygnf+9X6u5lgFudOfthoEVxO3wOhOshWE9YVcPssdDtZ7HK3cRT
         hksoiNHe5lmU0ZvUgSEGxjxt7lh/lWubzJaV0Qe3zAALxbcnQljqFU/nzLDO3Rf1sn32
         buSN5AR/Dq7hzNvcr0W9CnTVO9WEIHvgRZm0ty1q5hbyeHC72lOF2M0y58gD1ucGk8bx
         AL9QbLcwciELur7SHkibcjaiLqcVoCtOIOGzZxYn6RcPyegRcuyXSqYviXBGxPJ8lUsG
         /Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qWYSvHZJqARuRjXNDlqrjBC4OduK/9E6A56ZRamQzc=;
        fh=IJdHAHJGTGjXtfywiqHyE/fRWIn1m6IRgZklm0lQeXg=;
        b=eO/IUwkm/OOEA3SWKfQb14rpkjhzEIWu395uYjIJOl+EsOzdEl4C2XtMPa67j5tyWb
         IX60ahYVKex8zXftorTJ7bAkePQn9xTbVnmlpFXBfGK3G4d1mud6FTymAxjJL1GGwCOQ
         BcFuK0lQ3qLKrWbYMjopKKdbNG7NYV7uzhx095upyukzvY+deGyPHdNz1W62h9Ja5dxU
         hTX2lfq9K4GCJkJXKwJUVPmjRyHIu7H05Ss8v+N7jwBMkI5ZKsvVrVmxGEmHeY+RUbGH
         pPI13kD1SW7QZXYqbd187vY28AKxU4PKaNJvtl1rOmRfY1UmY1+s5fbIg1Z8ef8aArKN
         Lw6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716783; x=1794321583; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qWYSvHZJqARuRjXNDlqrjBC4OduK/9E6A56ZRamQzc=;
        b=vyPx9S7lQcfA5lFYElG4ueyLY1Vdw7gVuzpnbdv8sYMGG+RsEpr3EzojF/lcj7N1Dm
         wI53mtavXrTvN1lmGR9mptvQiFdMDxsu6iYAwwrSAls48E/VSdYr8+hK0DcOv5jHJmAR
         gy08FMOnFxngtF+URE7Qd/wLUoMJX10oY29RC5soXueRDtaGFP+3cwor4smKd4gl+J6W
         lQNyiogG4qoaZhrwbOPpJVtUOMuacIDkRgeJzI9qDnzkkBwsfmf15shSMlLA7Xgb53eU
         dR9H/zRydmSkUFt4jyIuG6YzXjlsapPUAf03iHnx5Bwp1IzDUprGSpjbuIlxQZYnt+D6
         F8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716783; x=1794321583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9qWYSvHZJqARuRjXNDlqrjBC4OduK/9E6A56ZRamQzc=;
        b=OYLOh9c6bDDEBs4mtQHhzOd9PXT2N1loyv2FisbCwdp+jUHugL1S7PASBNLSFK9J4y
         Be8Y7EHM/1fj5H6QzjS2q5uNZQ8+8nGWy8RN+N+6I+A54WLETnK2/pXeb9uJiBQ/aspX
         3fzXFVF34cTkP6Bm9PdLBH0FIIAS/LziJCDLh1zsBNIHU0qdJuUiqoO+zdxntw7pxiQ3
         PgBPMhzs/0tbKJ3nff5tKRMxZSXmwHQxhI2bcKyY2P+HJy4LShP8v89s8kSmoW8q/VDN
         ojd2jh2zei5vhvi9y1navt+CPC7awh1jQt4Wj9Qm5blYUPn6v+TdfW9DUpDkJue9NvZz
         nuJQ==
X-Gm-Message-State: APuU4Z9ceubjWEYW5bL/7BBOAgeST3fEEEk3QinCSUaJhjI2qKM5ZUAd
	BZkWwEYssulQOcQuNLTlcWpkCjAm7v0g0sr/TE4T0NmJfijJns1fHoZ/bXEZ7SN3uQjSR+Xp2Xu
	5wuAnax0Whcfn2LCRsdh7bTVg1j9szE9i//Vi
X-Gm-Gg: AYBFou2h9IEosNXs76BFaSZ2uNe6hvOHJ2/f1GIG9eCNJckoP8zyaPO/goz9865o4fd
	bGrdJob6aWZ3w33GG8B92WDrUosSDbHvBQ+g1Zsu0FJWHV6yDzI17YDaOi7WFYvjE/thckZhg/t
	Vh9lFtBjhM0U35PNBB7En8nUGWGvAa2ubZW0nR+aaC5vysuXvUi1XhovS5xLXfJd2LLY/1ShEGL
	k15Ft+uwzg+Dea8mYibqNALVSGnsQJyKHXaLMu6vZu3pBvfV64acfd/5jrJ0dmYv9djRee3OWwZ
	cnkaUMxBWaAQwoLF1a8wEWDBRZ7zw9HvygV3tcFYg+PfsJWfcg5jQo4FuGS8OpHQ4TJY6fkeXQa
	WyAot0+lbLPusMS1IeyTvuccUYERIb0bePd0pPEn4DQBY08wmy55WheZc8pSYQJmgajsvRUMonK
	Zmz3DLnN4pPITNYfrzqNrJcZVnhUpvLxSIt3siXrkExQBgGWOvtX4uBvCKj5jwPc4Eh1cSNpHbq
	Rjwx0y6OoEHQG8fb3OPmje6T2kUSx9WE4iSMr0MGAlQTzZTo0RkrxLI29IEBhMMhNEYcaxAvx4/
	tOBJVUylGjk2fqeJpgpNbq4CuAc22WPsSzZX456j2djwOAzRD8Qp6x3r+YjjBoyD7GWmhmvTFoT
	lbsqfaWY4HeLaXtet16dA81AQpdcCLt0D2CKdlUPYXSQ=
X-Received: by 2002:a05:690c:800c:20b0:8b1:60a0:c311 with SMTP id
 00721157ae682-8b2b67c6b9fmr65419137b3.33.1793716783401; Tue, 03 Nov 2026
 06:39:43 -0800 (PST)
MIME-Version: 1.0
References: <64AB777D-1126-44BA-8715-7DB116CE4CF3@geanix.com>
In-Reply-To: <64AB777D-1126-44BA-8715-7DB116CE4CF3@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2026 06:39:17 -0800
X-Gm-Features: AclHuK8bhWXpPBnwLcmiZNDrSnmMqGlQIsxMoNsv8e_BdVkPgT-agtnhiQ3eEQ0
Message-ID: <CAMKF1sqz2OfLvRpvFTM3yhyLw1-=_J75-FGj2-09BU8YcwRpVQ@mail.gmail.com>
Subject: Re: [meta-oe] uutils-{findutils,diffutils,grep}
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b3d09e065f603bcc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131788

--000000000000b3d09e065f603bcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:10=E2=80=AFAM Sean Nyekjaer <sean@geanix.com> wrot=
e:

> Hi Khem,
>
> Would it be okay to send patches for adding
> uutils-{findutils,diffutils,grep}, they are all in =E2=80=9Cbeta=E2=80=9D=
?
>
> Guess it would be okay to wait with the rest as they are in =E2=80=9Calph=
a" and
> =E2=80=9Cin progress=E2=80=9D...
>
>
I would suggest to wait for the release unless there is a compelling reason
to upgrade to a
beta/alpha version.


> /Sean
>

--000000000000b3d09e065f603bcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, =
2026 at 4:10=E2=80=AFAM Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com=
">sean@geanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi Khem,<br>
<br>
Would it be okay to send patches for adding uutils-{findutils,diffutils,gre=
p}, they are all in =E2=80=9Cbeta=E2=80=9D?<br>
<br>
Guess it would be okay to wait with the rest as they are in =E2=80=9Calpha&=
quot; and =E2=80=9Cin progress=E2=80=9D...<br>
<br></blockquote><div><br></div><div>I would suggest to wait for the releas=
e unless there is a compelling reason to upgrade to a</div><div>beta/alpha =
version.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
/Sean<br>
</blockquote></div></div>

--000000000000b3d09e065f603bcc--
