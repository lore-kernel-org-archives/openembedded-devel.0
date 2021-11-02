Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DE8C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 02:47:51 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.4366.1635821270375978572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 19:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G+gc4j6x;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id r8so4628583qkp.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xQMRYZ+aiTb4SZg69dw4ClUWxymBE6DiW1B0f1Zy1hQ=;
        b=G+gc4j6xLHuTMOq/qKS91k5lof/gJWqKtSdX0tUgvNHp6h34cm4A/zAlX1LSeDl1Fd
         S8bJLrXUEmixT2zVHzW6BpJV3VCbUZorhj/K1KLM5pCXQ4HThLfz3BYMDxSbz+IdAiKo
         mWbhKxZmEFA+Pt6jmaVR7rPlR180QzogpYJjFi+7a2BneaAHwBcZzC9QiXYANl2TYXNx
         1AYw5+FFkDMUC5ypsL2k2GnpDa8cq9vyQ3nIpNHI4ujvv/P7cBVxnjLPV4dyFL8D+Way
         GsHM6k21MIsbnzGytLvOhUBDVGcOkwjVNYznkfyYHSNdPuTxlDHRcUVZR1YFtqdXV7pN
         Jyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xQMRYZ+aiTb4SZg69dw4ClUWxymBE6DiW1B0f1Zy1hQ=;
        b=SfymRUi6mpnYVEQSfAIKXCvJdjVIYlWZaQlaK4EOJD+5Dr2u36imzpL+gLKYdpwu1g
         4TLwR5aKaTtopqIE6DIM4C9iExjA8G8yi8q1mGhuo1A219IOReMzVMm3YbG4OSLZCDdd
         x6T4gpwEdG8cY7lwMiYa5GLFCLYQbhdj/ZzagBMaZN2O1Uu3hysWzU0WFnucqflwmFSP
         uO0No2eIh/+f+8omQpPzTIWa7EeaGu0vuEGqjQjp1kN1DXqMBr5cGcviZeqMjvRG+lRD
         yjkVacR6vqqNoS6mBQFUzAw8RRpCSqETQIJT0J7yvRD0OykbMkL+8rNiu681TiV5vW4P
         bbMg==
X-Gm-Message-State: AOAM5316QM5yk1mOVZn6sKMjoUiB6KJhGOWGoT0Ljwdq1fpU9hyZvJl8
	/7nvOdaXKGcnH6xmFY1oRJ0MvmYIUxlUbYOBK/SHc/4v
X-Google-Smtp-Source: 
 ABdhPJzQMB5I8fPanfENwn/cEcHxgQ3wSnEs5rb2DEudl3WHkDSCVMd17UenXB+fsPh297Nx+cBil8Fmw8dYa5OQUfg=
X-Received: by 2002:ae9:e108:: with SMTP id g8mr25951961qkm.98.1635821269245;
 Mon, 01 Nov 2021 19:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211102005253.38996-1-changqing.li@windriver.com>
 <CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com>
 <16B3968C63382D57.22938@lists.openembedded.org>
 <eb8c3f95-37f3-024f-8aa0-c0736a22ab82@windriver.com>
In-Reply-To: <eb8c3f95-37f3-024f-8aa0-c0736a22ab82@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2021 19:47:38 -0700
Message-ID: 
 <CAMKF1spTs0mW_gxERS+aNsuHokfF6SOtAu3zOXmot0Go=HZAog@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mozjs: fix powerpc compile failure
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab63c905cfc55144"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 02:47:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93765

--000000000000ab63c905cfc55144
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 7:13 PM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 11/2/21 9:30 AM, Changqing Li wrote:
>
> On 11/2/21 9:01 AM, Khem Raj wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> Can you rebase it on top of master-next and resend please
>
> OK
>
> Sorry,  just find that master-next already have a patch for ppc build
> failure and can cover this condition.
>
> so this patch is not needed any more.
>
>
Right thanks

> Thanks
>
> Changqing
>
>
> On Mon, Nov 1, 2021 at 5:54 PM Changqing Li <changqing.li@windriver.com>
> wrote:
>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> powerpc disable jit by default and also have compile failure:
>> WasmFrame.cpp:57:76: error: static assertion failed: Aligned after
>> pushing DebugFrame
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  .../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch     | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git
>> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
>> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
>> index f308b4863..cc2673e74 100644
>> ---
>> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
>> +++
>> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
>> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    protected:
>>   #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
>>  +    (defined(JS_CODEGEN_NONE) && \
>> -+     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__)) || \
>> ++     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__) ||
>> defined(__powerpc__)) || \
>>       defined(JS_CODEGEN_X86) || defined(__wasi__)
>>     // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86
>> DebugFrame is only
>>     // 4-byte aligned, so we add another word to get up to 8-byte
>> --
>> 2.17.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93763): https://lists.openembedded.org/g/openembedded-devel/message/93763
> Mute This Topic: https://lists.openembedded.org/mt/86756698/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
>

--000000000000ab63c905cfc55144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 1, 2021 at 7:13 PM Changqing Li &lt;<a href=3D"=
mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">

 =20
  <div>
    <p><br>
    </p>
    <div>On 11/2/21 9:30 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>On 11/2/21 9:01 AM, Khem Raj wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt">
          <p class=3D"MsoNormal" style=3D"line-height:12pt;background-color=
:rgb(255,235,156)"><b><span style=3D"font-size:10pt;color:rgb(156,101,0)"><=
/span></b><span style=3D"font-size:10pt;color:red">[Please note: This
              e-mail is from an EXTERNAL e-mail address]<u></u><u></u></spa=
n></p>
        </div>
        <div>
          <div dir=3D"auto">Can you rebase it on top of master-next and
            resend please <br>
          </div>
        </div>
      </blockquote>
      OK<br>
    </blockquote>
    <p>Sorry,=C2=A0 just find that master-next already have a patch for ppc
      build failure and can cover this condition.</p>
    <p>so this patch is not needed any more.</p>
    <p></p></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Right thanks=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)"><div><p dir=3D"auto">Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite"></blockquote></div><div><blockquote type=3D"c=
ite">
      <blockquote type=3D"cite">
        <div>
          <div><br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 1, 2021 at
                5:54 PM Changqing Li &lt;<a href=3D"mailto:changqing.li@win=
driver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)"> From:
                Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
                <br>
                powerpc disable jit by default and also have compile
                failure:<br>
                WasmFrame.cpp:57:76: error: static assertion failed:
                Aligned after pushing DebugFrame<br>
                <br>
                Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
                ---<br>
=C2=A0.../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
                =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git
a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32b=
it-arch-fix.patch
b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32b=
it-arch-fix.patch<br>
                index f308b4863..cc2673e74 100644<br>
                ---
a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32b=
it-arch-fix.patch<br>
                +++
b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32b=
it-arch-fix.patch<br>
                @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
                =C2=A0 =C2=A0protected:<br>
                =C2=A0 #if defined(JS_CODEGEN_MIPS32) ||
                defined(JS_CODEGEN_ARM) || \<br>
                =C2=A0+=C2=A0 =C2=A0 (defined(JS_CODEGEN_NONE) &amp;&amp; \=
<br>
                -+=C2=A0 =C2=A0 =C2=A0(defined(__riscv) &amp;&amp; __riscv_=
xlen =3D=3D 32)
                || defined(__mips__)) || \<br>
                ++=C2=A0 =C2=A0 =C2=A0(defined(__riscv) &amp;&amp; __riscv_=
xlen =3D=3D 32)
                || defined(__mips__) || defined(__powerpc__)) || \<br>
                =C2=A0 =C2=A0 =C2=A0 defined(JS_CODEGEN_X86) || defined(__w=
asi__)<br>
                =C2=A0 =C2=A0 // See alignmentStaticAsserts().=C2=A0 For MI=
PS32, ARM32
                and X86 DebugFrame is only<br>
                =C2=A0 =C2=A0 // 4-byte aligned, so we add another word to =
get up
                to 8-byte<br>
                -- <br>
                2.17.1<br>
                <br>
                <br>
                <br>
                <br>
              </blockquote>
            </div>
          </div>
        </div>
      </blockquote>
      <br>
      <fieldset></fieldset>
      </blockquote></div><div><blockquote type=3D"cite"><pre style=3D"font-=
family:monospace">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#93763): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93763" target=3D"_blank" style=3D"font-family:monos=
pace">https://lists.openembedded.org/g/openembedded-devel/message/93763</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86756698/3616=
873" target=3D"_blank" style=3D"font-family:monospace">https://lists.openem=
bedded.org/mt/86756698/3616873</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org" target=3D"_blank" style=3D"font-family:monospace">openembedded-devel+o=
wner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank" style=3D"font-family:monospace">https://lists.ope=
nembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:changqing.l=
i@windriver.com" target=3D"_blank" style=3D"font-family:monospace">changqin=
g.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000ab63c905cfc55144--

