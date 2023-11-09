Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FDBC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 13:35:55 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.121217.1699536954113294224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 05:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BpO7pifx;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4ac211e5bbbso1260574e0c.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699536953; x=1700141753; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m5VxLS0Gl/fwNsIXBhD+EUnLVJYA3WFSuLVJlZ50JmE=;
        b=BpO7pifxjh6xDcnx/Fi/mHBhilGxRMVja7jGA/DnOBXuni5/NOZxg4uWw7e3aZJ68R
         eHPZi54SumSGtO3N/TKvKKwWqOBbuB8aSylX0qpH/nkQK25MfN/39xZtNzvwXH0X7njZ
         p3zIoTuhUejF/mQiUXs//YGeCmyM/J0WAkj/n0XhRsPaM7TRUotEMMgR3UnGJM5i0xTJ
         AiJ6z1q7DCLJroKF8nalpNkWtwNfM4Ln1vWd4CRdjSRYkizBIUDvQMJ6hszJaQa2At8l
         Eg0UtRHk4J4E5X5XvoAMCftLpp34C04w0zK6VzD8yalZPJaBlmw37psR7wwiUFJA/cwu
         mzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536953; x=1700141753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5VxLS0Gl/fwNsIXBhD+EUnLVJYA3WFSuLVJlZ50JmE=;
        b=brH5I4oi4vIBzVU69uGkHmnuXs7juE/Xx60xD64dHQRO5pgbYSSS9eBIompZ8p/fZW
         Rf2PFPjE/OjiLKbxY2Dr/MiG2uR+K3kKgOO7cO8kaJMJlUJPLR3geQpOCXWKqAYVMws8
         zfdMwq9NiJt9++PKkbTRsdTakArOleAPmGT42KLQCwoszZHFLIza4wRarLCyZ6pBV1Vs
         3IZx4yHas61lRN1uqrGPeXjciRViLKzip247yb6R5Vag23ViNUS2kB1BNRhG87ttdSAV
         f4VbylZU0YXZdzoBNrGVZHE0szC9i/KoxdiHJknXhCHOqsmXgnGZViO3gkDf1Pfsdnjr
         ayyA==
X-Gm-Message-State: AOJu0YxGwMieGAKXIcwFrh3IgnKqlDN3efXmorFxeBANmmYCydCOAeXA
	4xU/o5OtYtl4rx7BZL8XN2UjR2blvZ8ygeEArIY=
X-Google-Smtp-Source: AGHT+IG/51zn0qwzf1b+CAj5gzCru0SwRdhbYgX7szkO6sA1dCdOJ9M+Kl1uts86Zb38dZR2T//qTKX42iFoREmzqdA=
X-Received: by 2002:a05:6122:290b:b0:4ab:d9a7:3d13 with SMTP id
 fm11-20020a056122290b00b004abd9a73d13mr652681vkb.7.1699536953059; Thu, 09 Nov
 2023 05:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com> <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com> <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org> <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com> <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com>
In-Reply-To: <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 9 Nov 2023 15:35:41 +0200
Message-ID: <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005ead9b0609b848e9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 13:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106518

--0000000000005ead9b0609b848e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DEPENDS +=3D "protobuf" is enough to have dependencies resolved.

Problem is that bitbake's do_populate_sysroot does not take anything from
bindir.
This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to not get the
protoc binary into the recipe_sysroot as expected by CMake.

This can be fixed with SYSROOT_DIRS.

On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> Hi Cl=C3=A9ment,
> No, the issue is when you just build nativesdk recipe (we are not at the
> stage to use the SDK yet).
>
> And that was exactly my question how to propagate the dependency correctl=
y
> for nativesdk build.
>
> Regards,
> Slava
>
> On 09.11.2023 01:13, Cl=C3=A9ment P=C3=A9ron wrote:
>
> Hi Samuli,
>
> Le mer. 8 nov. 2023, 22:30, Samuli Piippo <samuli.piippo@gmail.com> a
> =C3=A9crit :
>
>> Hi Cl=C3=A9ment,
>>
>> Were you able to reproduce the issue?
>>
>
> Sorry I'm on vacation without access to a laptop at the moment.
>
> But if I understand the issue is not related to a target or native recipe=
s
> issue, right?
>
> It's only when building the SDK and then try to build an application with
> it right?
>
> Maybe there is a missing dependency when building the SDK.
>
> Regards,
> Clement
>
>
>

--0000000000005ead9b0609b848e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>DEPENDS +=3D &quot;protobuf&quot; is enough to have d=
ependencies resolved.</div><div><br></div><div>Problem is that bitbake&#39;=
s do_populate_sysroot does not take anything from bindir.</div><div>This le=
ads to nativesdk-(qt)grpc&#39;s do_prepare_recipe_sysroot to not get the pr=
otoc binary into the recipe_sysroot as expected by CMake.<br></div><div><br=
></div><div>This can be fixed with SYSROOT_DIRS.<br> </div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Nov 20=
23 at 12:19, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uv=
v.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>Hi <span>Cl=C3=A9ment,<br>
        No, the issue is when you just build nativesdk recipe (we are
        not at the stage to use the SDK yet).<br>
        <br>
        And that was exactly my question how to propagate the dependency
        correctly for nativesdk build.<br>
        <br>
        Regards,<br>
        Slava<br>
      </span><br>
      On 09.11.2023 01:13, Cl=C3=A9ment P=C3=A9ron wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div>Hi Samuli,<br>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Le mer. 8 nov. 2023,
              22:30, Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmai=
l.com" rel=3D"noreferrer" target=3D"_blank">samuli.piippo@gmail.com</a>&gt;
              a =C3=A9crit=C2=A0:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div dir=3D"ltr">
                <div>Hi <span>Cl=C3=A9ment</span>,</div>
                <div><br>
                </div>
                <div>Were you able to reproduce the issue?<br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Sorry I&#39;m on vacation without access to a lap=
top
          at the moment.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">But if I understand the issue is not related to
          a target or native recipes issue, right?</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">It&#39;s only when building the SDK and then try =
to
          build an application with it right?</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Maybe there is a missing dependency when
          building the SDK.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Regards,</div>
        <div dir=3D"auto">Clement=C2=A0</div>
        <div dir=3D"auto"><br>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--0000000000005ead9b0609b848e9--

