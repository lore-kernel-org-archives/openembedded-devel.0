Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD60CCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:09:38 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1502.1761840574132846555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 09:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QJmbROIy;
 spf=pass (domain: mvista.com, ip: 209.85.208.41, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c2d72582cso2134733a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761840572; x=1762445372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8xD4tS2GaZi1LKBaL2luyK3rWtCGfyoA4MgIGJiPZkE=;
        b=QJmbROIyT27WfrCXq4dFAqreAG7MGnfnswgZiWtFwaytBkU7bs39aOj2P174BYLAa1
         0XAWsQdTuCiUsu7D84mRGS2ieE/YMLlY+myX4QtY+2iEEwtghWOWlAToOvO7hoMN1J4f
         dlDcbq8YfJSPMa/yP0h5OMxvG27miOmPMpnKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761840572; x=1762445372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xD4tS2GaZi1LKBaL2luyK3rWtCGfyoA4MgIGJiPZkE=;
        b=CfJVAcYKXMyV8GmJejoacK3Hlsnb1xzB7ui3EfHKMGixyUdNuT6LFiGsooThvBwv33
         Em2UDYzVemDrWpWzH9ATwKbRh6/QVn7u3S5FC5I+vIDpMBAmW3ug7ZHnoaM2Mn9Uy56j
         b31jEbWD+H1J/fFcLr4VUalrwGNawFx7tMKx5689Hyf2QTLgbL7Go1YY/Zl/0tGfDSRp
         V69ShV78DTe5TbHn53Ff5FFxnJYoC9S7s0/Zse8efIMGaJ72D9PHcMGuYBsD3uEgtxY+
         Klz9fXTMKQbX+GLjAbmHZYR/RbvKk/mzOybehQdC1XxRyA9mNfkDGUH3FtjQZl+FHwTp
         SGhQ==
X-Gm-Message-State: AOJu0YwjC5mu/K+jqwT3BwmHZMJikgaQFjoj2XWplcGEC9RIPZien8E0
	E4399olf5Hn0CrngjdEGp77NwnMQWfD60dlzcBQbMNrdZYAvxSfMv5ODnfeVbYCBq7NLz9H7na8
	JLSEsK+BERcoaOvCOFYmMY5biQzRldEYQA2I9bRGw+YJ6J3hVFQNz
X-Gm-Gg: ASbGncu5zkHwaFxFFtadSEDfMPAsCWmoqjDSF57NzDr5eOje0aSog3NJ717fbk35jMh
	vhJuBaEqTwl90ys7V7cOW0Q8qcmvQMn0+YH7uGXTNuYAoswme5Kb4dNWEYY2ST9tncs72ELv2yd
	Ds7urXA1Twky90f4jPuOpjxCrtRBH4RyfN9SYKBz4jeDVxV8Xt/+NRO5CFane/FgKUH33w0XdYn
	3BIx/t0PFhgRcUz2KGeVho8Np0ewoiGUfKv9J6hsZ1zIFjK0dHTcpIeebO7KbD4bqk+pwxPa+JZ
	lDd6CV9xD1zLElD0vno=
X-Google-Smtp-Source: AGHT+IFJ2xJEoritqYEA3mPCy/3X3Z35GSISnAHcQ5b9f0obhYV11ml/NsQV+fmngrxZ0PSjJf0YccbQgM/GpUBmW9Q=
X-Received: by 2002:a05:6402:20c4:10b0:640:6650:918f with SMTP id
 4fb4d7f45d1cf-64066509554mr2017098a12.21.1761840572006; Thu, 30 Oct 2025
 09:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251015042222.121285-1-vanusuri@mvista.com> <20251015042222.121285-3-vanusuri@mvista.com>
In-Reply-To: <20251015042222.121285-3-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 30 Oct 2025 21:39:18 +0530
X-Gm-Features: AWmQ_bn8OdQ0bOcU_A0sIYGFLRhoV9MNlizwEaaPXKtN_Hj3dkHfT03um5Bim4s
Message-ID: <CANQUz1-O8w43=4JNjGXunBDEEZOE33g9qd_qPmrRwxQ2K_6wLg@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 3/3] redis: upgrade 6.2.18 -> 6.2.20
To: openembedded-devel@lists.openembedded.org, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007216760642627980"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121208

--0000000000007216760642627980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any Update on this ?

Thanks & Regards,
Vijay

On Wed, Oct 15, 2025 at 9:52=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Gyorgy Sarvari <skandigraun@gmail.com>
>
> Changelog:
>
> 6.2.19:
> (CVE-2025-32023) Fix out-of-bounds write in HyperLogLog commands
> (CVE-2025-48367) Retry accepting other connections even if the accepted
> connection reports an error
>
> 6.2.20:
> (CVE-2025-49844) A Lua script may lead to remote code execution
> (CVE-2025-46817) A Lua script may lead to integer overflow and potential
> RCE
> (CVE-2025-46818) A Lua script can be executed in the context of another
> user
> (CVE-2025-46819) LUA out-of-bound read
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 1a22715b82584696dec489914d8bb9ccf73b5600)
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../recipes-extended/redis/{redis_6.2.18.bb =3D> redis_6.2.20.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/redis/{redis_6.2.18.bb =3D> redis_6.2.20=
.bb}
> (96%)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
> b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_6.2.18.bb
> rename to meta-oe/recipes-extended/redis/redis_6.2.20.bb
> index a5938b641a..6eaf885f2f 100644
> --- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
> +++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
> @@ -18,7 +18,7 @@ SRC_URI =3D "
> http://download.redis.io/releases/${BP}.tar.gz \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
>            "
>
> -SRC_URI[sha256sum] =3D
> "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
> +SRC_URI[sha256sum] =3D
> "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
>
>  inherit autotools-brokensep update-rc.d systemd useradd
>
> --
> 2.25.1
>
>

--0000000000007216760642627980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any Update on this ?<=
br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Oct 15, 2025 at 9:52=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mv=
ista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Gyorgy Sarvari &lt;<a href=3D"mailto:ska=
ndigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
<br>
Changelog:<br>
<br>
6.2.19:<br>
(CVE-2025-32023) Fix out-of-bounds write in HyperLogLog commands<br>
(CVE-2025-48367) Retry accepting other connections even if the accepted con=
nection reports an error<br>
<br>
6.2.20:<br>
(CVE-2025-49844) A Lua script may lead to remote code execution<br>
(CVE-2025-46817) A Lua script may lead to integer overflow and potential RC=
E<br>
(CVE-2025-46818) A Lua script can be executed in the context of another use=
r<br>
(CVE-2025-46819) LUA out-of-bound read<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
(cherry picked from commit 1a22715b82584696dec489914d8bb9ccf73b5600)<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-extended/redis/{<a href=3D"http://redis_6.2.18.bb" rel=3D=
"noreferrer" target=3D"_blank">redis_6.2.18.bb</a> =3D&gt; <a href=3D"http:=
//redis_6.2.20.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.2.20.bb</a>=
} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_6.2.18=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.2.18.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_6.2.20.bb" rel=3D"noreferrer" target=3D"_blank">redis_6.=
2.20.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_6.2.18.=
bb" rel=3D"noreferrer" target=3D"_blank">redis_6.2.18.bb</a> b/meta-oe/reci=
pes-extended/redis/<a href=3D"http://redis_6.2.20.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">redis_6.2.20.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-extended/redis/<a href=3D"http://redis_6.2.18.b=
b" rel=3D"noreferrer" target=3D"_blank">redis_6.2.18.bb</a><br>
rename to meta-oe/recipes-extended/redis/<a href=3D"http://redis_6.2.20.bb"=
 rel=3D"noreferrer" target=3D"_blank">redis_6.2.20.bb</a><br>
index a5938b641a..6eaf885f2f 100644<br>
--- a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_6.2.18.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_6.2.18.bb</a><br>
+++ b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_6.2.20.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_6.2.20.bb</a><br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.redis.io/rel=
eases/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downloa=
d.redis.io/releases/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Define-correct-gregs-=
for-RISCV32.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;470c75bac73d7390be4dd66479c6f29e86371c5d380ce=
0c7efb4ba2bbda3612d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7f8b8a7aed53c445a877adf9e3743cdd3235185241701=
35a58c0702f2dba6ef4&quot;<br>
<br>
=C2=A0inherit autotools-brokensep update-rc.d systemd useradd<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000007216760642627980--

