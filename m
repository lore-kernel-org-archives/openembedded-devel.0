Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42982EB64CA
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 16:41:19 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.11441.1725727275096573165
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 09:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=spJq99jr;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.182, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso3316401276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 09:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1725727274; x=1726332074; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJWEsvhrcU0WsmHtJXE9dZkeIxA2dcl3W7bmNF48QD8=;
        b=spJq99jrS2ayHODAAu+LLrZye2aL4v5gQuIV8x/bEEAdXO45btmxvZItd3lEUfIK1o
         /N5+OGielcPS0UTI3fsnA6qeOdPuJ4Wy3r7SA5gXN3Bba2gMcfNfKfa3focERDRzx5Uk
         8dqigPB1DE7eI7YJWFp7G2h0AZLc1H2MzfFZU2wAkc60PMPEMuhF/qg37kgwlxldfaDU
         X330PihvGvSQnBi5BTy44wz9XvKOzqLOVf9RjdcaxIxsm+t7MqM0jSr+iguZEB2dO4Wj
         AVA/eQelzlVz+34ryiSVecgF9kdxOtYiQIXFA/mJ6pKXRwIEHkDJ7sgnfQfs9Z6EVOGv
         oifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725727274; x=1726332074;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJWEsvhrcU0WsmHtJXE9dZkeIxA2dcl3W7bmNF48QD8=;
        b=AhoP6FjhbiNSufdUJISPjTpVGORRKI3NyDnw3+RESQ46oqu2uivaj1CCdbGrsVJwxf
         fyssUvTs0W5rw+JIz3Xd/llqPe89EEYbT9ibAQbLh6JnWfhEBBx4iblzZ0l6dT9IqNUq
         Ne4wo4qI6UqJ83jb/ds+liB3bor2RKMBSWpFj4/PT+XAYjprz1q0/g+XKGPS0h3Pbk1L
         +hmX2OR9abz1aRqERynxfmkr+pYU3OighLvDaXd4/oDz4rHyJ415zNPyb3ITNqXAvWuc
         yprGcTx8Tld/xnxgpPHx5S64DqW7rCe7kRAtGyJpboCPdMq43VJ/mmwikLebx61DHQB7
         dagg==
X-Gm-Message-State: AOJu0YzQ0l/YnRQyPWX+rJQdDjCQWLryY0ZSw4OZFDtvEttSxtBrUKQT
	edIocxnWgRjdsQU2T8Bnf63spM+P173Bw+aWHOMffl/zIOJ8Mkk5jTOdEBCfQI2MLKmNqfJyA2Y
	jEj0=
X-Google-Smtp-Source: AGHT+IHn2ZG80OH4V86ft/IUSlJNGp0KCdfMRHGksW/O+mIMLbgOQAfL8VQKFUwmkGutFoMFV+gsUw==
X-Received: by 2002:a05:6902:2e09:b0:e11:6348:5d86 with SMTP id 3f1490d57ef6-e1d348753aamr6827435276.11.1725727273444;
        Sat, 07 Sep 2024 09:41:13 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d4b2cf2a0sm281529276.8.2024.09.07.09.41.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 09:41:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b47ff8a59aso29734657b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 09:41:12 -0700 (PDT)
X-Received: by 2002:a05:690c:dc6:b0:6b8:ae1e:2593 with SMTP id
 00721157ae682-6db44d6c73bmr81451507b3.8.1725727272464; Sat, 07 Sep 2024
 09:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240906184711.3654693-1-festevam@gmail.com>
In-Reply-To: <20240906184711.3654693-1-festevam@gmail.com>
Date: Sat, 7 Sep 2024 13:40:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo_vwb=zGw5m6hCdyN+q+uNwFSaKYUhnuKj1uCp1DBuMg@mail.gmail.com>
Message-ID: <CAP9ODKo_vwb=zGw5m6hCdyN+q+uNwFSaKYUhnuKj1uCp1DBuMg@mail.gmail.com>
Subject: Re: [PATCH] imx-cst: Add recipe
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br, 
	Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="0000000000000e060c06218a31e2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 16:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112116

--0000000000000e060c06218a31e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 6 de set. de 2024 =C3=A0s 15:47, Fabio Estevam <festevam@gmail.com=
>
escreveu:

> From: Fabio Estevam <festevam@denx.de>
>
> Add a recipe for the i.MX CST (Code Signing Tool) version 3.4.0.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
>

Thanks for sending the recipe. Once this patch is applied, please send a
pull request to remove that from our layer.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

--0000000000000e060c06218a31e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em sex., 6 de set. de 2024 =C3=A0s 15=
:47, Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail=
.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=
=3D"_blank">festevam@denx.de</a>&gt;<br>
<br>
Add a recipe for the i.MX CST (Code Signing Tool) version 3.4.0.<br>
<br>
Signed-off-by: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=
=3D"_blank">festevam@denx.de</a>&gt;<br></blockquote><div><br></div><div>Th=
anks for sending the recipe. Once this patch is applied, please send a pull=
 request to remove that from our layer.</div><div>=C2=A0</div></div><span c=
lass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. =
Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http:/=
/www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code=
.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mo=
bile: +55 (53) 9 9981-7854</div></div></div>

--0000000000000e060c06218a31e2--

