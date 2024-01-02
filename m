Return-Path: <iillyyaa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9DFC47079
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 22:25:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.336.1704234304876036554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 14:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HcKqmf5v;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: iillyyaa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a279ce3aab9so368190366b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 14:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704234303; x=1704839103; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JjlSjY7GSzridegX3qMo50wsdWYqS3FqLph+4QJ7je0=;
        b=HcKqmf5vunQ1Qax/qweV/Ry4S63/8sQ0qF1dVDB9dtzDNQcOeWy4LBGIaJjY8XMhQs
         T7YW+0eZTaf8qIcLcH2PZ3aLQoCeYO68eeX4/ZO1dFxfFspW9qIGIYyXG0dsluCoPdYT
         vrl8O59x/Oh0AzFvIfgIOk+xgdUsa5U9kCEIB6FDb/pfvVFIH3FBnh3Bst0SfjDoOnww
         Ac9UjVxkFmg4qeO29GkU+CIULjifP5QtToaVvUKBvZEX8PwktOs/5AvbUCRGpKV9FU0B
         sWSA8eOzM/MBGYax006CoOVOFwGjj5hObbWVWoNrkgpsUWnb0jQpdCLNzMvou8T7+Bro
         CD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704234303; x=1704839103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjlSjY7GSzridegX3qMo50wsdWYqS3FqLph+4QJ7je0=;
        b=ugIrEVKs0Ye2CPElyP+E52uRrzF7sz7joAI1UixFn8LAsbzX4CTBbLeScMIHq9TR3k
         lENuBK9vlNOI8OLTVoZc0/W80xtAVl5kZkVUWEd5UtP1bEOR/4ypA+AAil4Rtgf5NHrW
         0Wt/fcTx3wJo8OU33kgfCOOXsVyYmulxplaf9Ixo9Rosu1LFkkDdwNJ3dVMxaNceqz5E
         RBrI9F3Lz0lEAmEAHx0yBx62x7VGpx26eErfvGnrI82MS/QNS2O9ruiMQFVJzLHeb7o5
         CZfnXYrUqmek9hy10LrTb6Cwx3Nm51Bvau3fgXYEHacvthqqPHmA7Z13gJ5DOVvgz3Df
         yIaw==
X-Gm-Message-State: AOJu0Yx0j0+vT/RXNZO5oPw6MPtDbbf5+zeZQjIOFGEfXah8i272B1Pe
	WMhtC3BlkbwUIEGwowqhMafS8jCDonmcww6ZOl8=
X-Google-Smtp-Source: AGHT+IEnjuajxqj10Pd/tDNMRS7gxXoFe0gaaaXnQqt+1cN8rWudCzD/5/M9lmxSvr53h0b6M9SI1KOZVEuMW8DVmOQ=
X-Received: by 2002:a17:907:c93:b0:a28:5573:aa63 with SMTP id
 gi19-20020a1709070c9300b00a285573aa63mr248181ejc.224.1704234303143; Tue, 02
 Jan 2024 14:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20240102210554.843148-1-iillyyaa@gmail.com> <CAMKF1sqwWaq=v31nD+YRg_6YXYA573-9QO-ATDJ8=OMaePth2w@mail.gmail.com>
In-Reply-To: <CAMKF1sqwWaq=v31nD+YRg_6YXYA573-9QO-ATDJ8=OMaePth2w@mail.gmail.com>
From: Ilya Kriveshko <iillyyaa@gmail.com>
Date: Tue, 2 Jan 2024 17:24:51 -0500
Message-ID: <CAFn2fAvD2rNdYZ7O9pGoKxf=bWAay1=zxOnGq+0amQBm0cwLiA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] srecord: fix install prefix
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040c07d060dfdf8cf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 22:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108021

--00000000000040c07d060dfdf8cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 4:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> It will be good to add the tag to point to location of upstream
> submitted location
>
> Upstream-Status: Submitted [url detailing where the submission activity i=
s]
>

Sorry, I should have anticipated this.  Still learning the submission
process ropes.
Thank you, and stand by for an updated patch.

--00000000000040c07d060dfdf8cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 2, 2024 at 4:49=E2=80=AFPM Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">It will be good to add the tag to point to location of u=
pstream<br>
submitted location<br>
<br>
Upstream-Status: Submitted [url detailing where the submission activity is]=
<br></blockquote><div><br></div><div>Sorry, I should have anticipated this.=
=C2=A0 Still learning the submission process ropes.</div><div>Thank=C2=A0yo=
u, and stand by for an updated patch.</div><div>=C2=A0</div></div></div>

--00000000000040c07d060dfdf8cf--

