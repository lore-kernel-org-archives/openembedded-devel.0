Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DB1CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:34:47 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.284695.1697643277980509611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DoX+WOfj;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so78390711fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697643276; x=1698248076; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLyAHANQCGEBp24NSUwiOfHxXNKY8QbAdd7r067KznM=;
        b=DoX+WOfjnhRnHHHZnEoNIJ5RjWCEXlPLcX8AjqhPtj+F0ufHBIr3zHaOtsu9np1U40
         idmfnuwfcNZJmDarA6e47vdHc0O0AeGf3Nha2MNVmErSG5uK9VdpEtMS78pfW4KA+ZEa
         lvxEy55xMb5H0IO0FvEIFPd6RkFZRMx0dApURWXtdybvUOlgy7O2YOiyOMUcIf/Md/FT
         ZLDt3dZAhVOs449dw4syctvuUdGCs1pfCAR6IPv8+RqqLMkF5Et/bz1mcIK4AVqR3iF4
         NHY5eICAEnIVHK6GNtFA6Vxx6/Og6PFvmwAjjaVZopVjnMJO80rfR3mAJz8COVaBu0C6
         eGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697643276; x=1698248076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLyAHANQCGEBp24NSUwiOfHxXNKY8QbAdd7r067KznM=;
        b=S5zMgdcralDsIVe4EuDXTDByKrmYLC65Co/M2gGK3N+ATbHliXIzDnsESbk4b9vzBz
         MAQaK8WWsCEIlS9H3pgkDFTSN3In29YmOpT5jLoN0+/UOtDs1lBm4x9aHA/0k9hZBA4M
         VHYVr37b8LxBe5loD6rZaEcfTUo22yLxZGInVWvPbK3EJqKTuv1ooCfNi2zs6aqWcUKH
         IJ0MsmNNWX2Lm3SE2nBZefolu/8QT8x0CfYnVTdpxq2PqueWMrmRhtv+Awmk3RZFReqT
         uyJDPStAdzkJBUufSxkQEAz5JZ64UQMFs38W4mig1N4/ZHggD+/HQEdhoVoCytI5TKLI
         Mv7Q==
X-Gm-Message-State: AOJu0Yxc/smuwJnVNkFk7XIcawtgYkLdu5JZv+3VkRTRSVSSxuaeCywW
	qMrTcwqG0In3APpWPk51EjeyR5GyBKSRzKMFPAw=
X-Google-Smtp-Source: AGHT+IEyUaWr/EE9PsI2nGSO/DfDq036x613jMBBeBUKlAbqRA47JZ10annw5zBIhrfzz/EWgIcySb3GUGb8c40mO6E=
X-Received: by 2002:a05:6512:33d0:b0:503:2e6:6862 with SMTP id
 d16-20020a05651233d000b0050302e66862mr4862945lfg.32.1697643275938; Wed, 18
 Oct 2023 08:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com> <B44E7E80-2B09-47F4-9F8F-4741F4683197@arm.com>
In-Reply-To: <B44E7E80-2B09-47F4-9F8F-4741F4683197@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Oct 2023 17:34:23 +0200
Message-ID: <CA+chaQcVuT5k+AT0gqxjaORYNrRCfnoR=zO32Ceo8j5ci2GFNQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Ross Burton <ross.burton@arm.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006af0ab0607ff6094"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 15:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105578

--0000000000006af0ab0607ff6094
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 5:27=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> On 18 Oct 2023, at 13:28, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> > I don't quite see why every project/recipe should fix this independentl=
y
> when the simple workaround for this yocto-specific issue is available
> (namely the use of SYSROOT_DIRS).
>
> I=E2=80=99d say the one fix should be done in the protobuf cmake fragment=
s.  It=E2=80=99s
> trying to find a binary _it can=E2=80=99t run_ which is wrong.
>

It's not that bad as long as it doesn't really plan to run it (only check
that it exists and that its fragment doesn't reference missing files).

The same fragment will be used from PN-dev if someone tries to use protobuf
on target and in that case the binary should exist and run. Good luck
trying to provide different cmake fragments to be used from target protobuf
in RSS and from target protobuf-dev on target.

Cheers,

--0000000000006af0ab0607ff6094
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 18, 2023 at 5:27=E2=80=AFPM Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 18 =
Oct 2023, at 13:28, Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail=
.com" target=3D"_blank">samuli.piippo@gmail.com</a>&gt; wrote:<br>
&gt; I don&#39;t quite see why every project/recipe should fix this indepen=
dently when the simple workaround for this yocto-specific issue is availabl=
e (namely the use of SYSROOT_DIRS).<br>
<br>
I=E2=80=99d say the one fix should be done in the protobuf cmake fragments.=
=C2=A0 It=E2=80=99s trying to find a binary _it can=E2=80=99t run_ which is=
 wrong.<br></blockquote><div><br></div><div>It&#39;s not that bad as long a=
s it doesn&#39;t really plan to run it (only check that it exists and that =
its fragment doesn&#39;t reference missing files).</div><div><br></div><div=
>The same fragment will be used from PN-dev if someone tries to use protobu=
f on target and in that case the binary should exist and run. Good luck try=
ing to provide different cmake fragments to be used from target protobuf in=
 RSS and from target protobuf-dev on target.</div><div><br></div><div>Cheer=
s,</div></div></div>

--0000000000006af0ab0607ff6094--

