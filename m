Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D74AC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 08:44:33 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.23535.1699605872929933437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 00:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ia4p4uC+;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-45db499e2faso813676137.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 00:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699605872; x=1700210672; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MZxz8Q1MwjK17yNkir5MjtcocPNvWTNI4j/AEVOmQzs=;
        b=Ia4p4uC+bGeljrMA1fpC8PppBjkK/TttLoMVopHGyI0lUHqiXRr9K0Ez7wLf79OjFv
         XxH2wBbm6ZU65x25CcftO5F4DF5KrQTpSnECixR7dmFbWMItYBz5GijlFTp0CscdSJMt
         oyT5WQAn1hXUTxAV43vsMjAPnCQCQQI6w4Zdm/rLLtn1bJHYHz/4s6taqCbY6oC10knH
         +48EuH50WSK532zTiGl24IV7ClyRkHjlDqYwBU7cW5RwzFxuoiNYEelhjEvLcfYYLTj6
         Bf6ba5k5BXcsNNz2W4g8icQ1B7Ise0gSfh3xujfEfL6zU/GaBClfYQ92sOX/17riIu24
         jHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699605872; x=1700210672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZxz8Q1MwjK17yNkir5MjtcocPNvWTNI4j/AEVOmQzs=;
        b=GXxs5XdFTsvnTB02/xbT8MG1ETzpkSP4edyD5Fvew4d+KEXsuCPXYO0zEcTEQwlGHU
         V6mkMNyvahQ5YlmZJBnjG3b3ILKXtSrXdRoVPdLZiNX2tJmqvWwx/h9GMF51PSoO8RMh
         tfE5hcThXqBBeUKgxMeGBsB6y+oSmKv8JWXMbrABOJFR/5xc8y7UxUn81mFEEpbA9PrZ
         +zOE0fxR1r9mlBAfqTfSyzulkI9dpDZgmDRmviraJLICUhY+5m0iD/0nrSfYiA/V7PPw
         enznrfDS0JtDzsH+DTr6uFRkzhfljNhGxXyYhcrBei7kGrUl4EDOgubgJt5Rn9FMJTgA
         SCJg==
X-Gm-Message-State: AOJu0YxPOle/jIh8u9ZPivK2zFxOL4jYlkrzudPOt3inoxgnYUCr2Q4n
	wAJ5PKdMsNfaB8IkfFS6wpUht5uAOBnRFAsnnbU=
X-Google-Smtp-Source: AGHT+IGbUlmAKtbfrIRe9AGdHqHzelhLvcLCz7JN4nOoIphaWWu/pZ/O/g1ZnV5Gpxhtrd2RAetPQjJA0mHTWuPevEE=
X-Received: by 2002:a67:e101:0:b0:45e:d31e:6e6c with SMTP id
 d1-20020a67e101000000b0045ed31e6e6cmr6557422vsl.29.1699605871911; Fri, 10 Nov
 2023 00:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com> <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org> <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
 <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com> <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
 <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com> <CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com>
 <17962EA21B11FB58.7380@lists.openembedded.org> <1d41118c-a5f9-45c0-8c77-236815e22f3f@gmail.com>
 <CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com>
 <dbe15c1d-bbcd-4808-927c-a5f9962de0ec@gmail.com> <CABXoSoXfbnnbKWizmfaRsN5-mOhdcRNxxJ+uzeuSb5qqps1cGQ@mail.gmail.com>
 <2939988d-b6f7-4cfc-a8e3-242e61289688@gmail.com>
In-Reply-To: <2939988d-b6f7-4cfc-a8e3-242e61289688@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 10 Nov 2023 10:44:20 +0200
Message-ID: <CABXoSoVqe-ccokcv2hqKSUudSR1RfgaMwo3F3A+UUaMTQ7m7Cg@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000040e9960609c854e5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 08:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106531

--00000000000040e9960609c854e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed that enabling compiler in target would be rarely used.

Having
SYSROOT_DIRS +=3D "${bindir}"
would, however, cover both builds without additional tweaks.
Since target build doesn't have any other binaries, this wouldn't do
anything extra with default PACKAGECONFIG.

On Fri, 10 Nov 2023 at 10:06, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> OK, but that seems to be similar issue, although a different one :)
> I recall I disabled compiler by default for target, because it's rare use
> case.
>
> So compiler can be enabled (if needed), but then perhaps another tweak
> with sysroot will be necessary in the recipe? I suggest to keep it as a
> comment in the recipe. What do you think?
>
> Slava
>
> On 10.11.2023 08:50, Samuli Piippo wrote:
>
>
> | CMake Error at
> /home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe=
-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake:116
> (message):
> |   The imported target "protobuf::protoc" references the file
> |
> |
>      "/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/=
recipe-sysroot/usr/bin/protoc-23.4.0"
> |
> |   but this file does not exist.  Possible reasons include:
>
> On Fri, 10 Nov 2023 at 09:38, Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> You sure? Because I remember the test in grpc to check for
>> CROSS_COMPILING in cmake to avoid that.
>>
>> Slava
>>
>> On 10.11.2023 08:12, Samuli Piippo wrote:
>>
>> This is not strictly a nativesdk issue.
>> If you enable PACKAGECONFIG =3D "compiler" for protobuf, it will then bu=
ild
>> protoc for the target.
>> This will then cause grpc target build to fail in the same way as
>> nativesdk build.
>>
>> On Fri, 10 Nov 2023 at 08:40, Vyacheslav Yurkov <uvv.mail@gmail.com>
>> wrote:
>>
>>> FTR, I suggested oe-core solution in the corresponding mailing list.
>>>
>>> Slava
>>>
>>> On 10.11.2023 07:19, Vyacheslav Yurkov via lists.openembedded.org wrote=
:
>>>
>>> On 10.11.2023 02:23, Cl=C3=A9ment P=C3=A9ron wrote:
>>>
>>> Hi Samuli,
>>>
>>> Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov <uvv.mail@gmail.com> a
>>> =C3=A9crit :
>>>
>>>> Thanks for the explanation, that was the missing piece for me to get a=
n
>>>> understanding of the problem :)
>>>>
>>>> I think it's not only me, but also others, were confused by the fact
>>>> that we are talking about native(sdk), but try to fix something with a
>>>> non-native variable.
>>>>
>>>> I've just gave it a try and have two suggestions how this can be
>>>> addressed.
>>>>
>>>> 1. Recipe based solution:
>>>> SYSROOT_DIRS:append:class-nativesdk =3D " $bindir}"
>>>>
>>>
>>> Is it not just missing something like
>>>
>>> DEPENDS:append:class-nativesdk =3D " protobuf-native "
>>>
>>>  Regards
>>>
>>> Clement
>>>
>>>
>>> This is already implicit by DEPENDS +=3D "protobuf". Take a look at my
>>> second suggestion. You can see that ${bindir} is staged for native reci=
pes,
>>> but not for nativesdk.
>>>
>>>
>>>> 2. oe-core based solution:
>>>> --- a/meta/classes-global/staging.bbclass
>>>> +++ b/meta/classes-global/staging.bbclass
>>>> @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D " \
>>>>      ${localstatedir} \
>>>>  "
>>>>  SYSROOT_DIRS:append:class-native =3D " ${SYSROOT_DIRS_NATIVE}"
>>>> +SYSROOT_DIRS:append:class-nativesdk =3D " ${SYSROOT_DIRS_NATIVE}"
>>>>  SYSROOT_DIRS:append:class-cross =3D " ${SYSROOT_DIRS_NATIVE}"
>>>>  SYSROOT_DIRS:append:class-crosssdk =3D " ${SYSROOT_DIRS_NATIVE}"
>>>>
>>>> The second one will invalidate nativesdk sstate, but might cover not
>>>> only grpc issue (I would assume gdbus-codegen or any other generator h=
as
>>>> the same issue when used for SDK build).
>>>>
>>>> What are your thoughs?
>>>>
>>>> Thanks,
>>>> Slava
>>>>
>>>> On 09.11.2023 14:35, Samuli Piippo wrote:
>>>>
>>>> DEPENDS +=3D "protobuf" is enough to have dependencies resolved.
>>>>
>>>> Problem is that bitbake's do_populate_sysroot does not take anything
>>>> from bindir.
>>>> This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to not ge=
t
>>>> the protoc binary into the recipe_sysroot as expected by CMake.
>>>>
>>>> This can be fixed with SYSROOT_DIRS.
>>>>
>>>> On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>> wrote:
>>>>
>>>>> Hi Cl=C3=A9ment,
>>>>> No, the issue is when you just build nativesdk recipe (we are not at
>>>>> the stage to use the SDK yet).
>>>>>
>>>>> And that was exactly my question how to propagate the dependency
>>>>> correctly for nativesdk build.
>>>>>
>>>>> Regards,
>>>>> Slava
>>>>>
>>>>
>>
>

--00000000000040e9960609c854e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Agreed that enabling compiler in target would be rare=
ly used.</div><div><br></div><div>Having</div><div>SYSROOT_DIRS +=3D &quot;=
${bindir}&quot;</div><div>would, however, cover both builds without additio=
nal tweaks.</div><div>Since target build doesn&#39;t have any other binarie=
s, this wouldn&#39;t do anything extra with default  PACKAGECONFIG.<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, 10 Nov 2023 at 10:06, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv=
.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>OK, but that seems to be similar issue,
      although a different one :)<br>
      I recall I disabled compiler by default for target, because it&#39;s
      rare use case.<br>
      <br>
      So compiler can be enabled (if needed), but then perhaps another
      tweak with sysroot will be necessary in the recipe? I suggest to
      keep it as a comment in the recipe. What do you think?<br>
      <br>
      Slava<br>
      <br>
      On 10.11.2023 08:50, Samuli Piippo wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div><span style=3D"font-family:monospace"><span style=3D"color:rgb=
(0,0,0);background-color:rgb(255,255,255)">|
              CMake Error at
/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-s=
ysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake:116
              (message):</span><br>
            | =C2=A0=C2=A0The imported target &quot;protobuf::protoc&quot; =
references the
            file<br>
            |<br>
            |
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;/home/sapiippo/qt6/build/tmp/work/corte=
xa57-poky-linux/grpc/1.59.2/recipe-sysroot/usr/bin/protoc-23.4.0&quot;<br>
            |<br>
            | =C2=A0=C2=A0but this file does not exist.=C2=A0 Possible reas=
ons include:<br>
          </span></div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Nov 2023 at 09:38,
          Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" targe=
t=3D"_blank">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>You sure? Because I remember the test in grpc to check
              for CROSS_COMPILING in cmake to avoid that.<br>
              <br>
              Slava<br>
              <br>
              On 10.11.2023 08:12, Samuli Piippo wrote:<br>
            </div>
            <blockquote type=3D"cite">
              <div dir=3D"ltr">
                <div>This is not strictly a nativesdk issue.</div>
                <div>If you enable PACKAGECONFIG =3D &quot;compiler&quot; f=
or
                  protobuf, it will then build protoc for the target.</div>
                <div>This will then cause grpc target build to fail in
                  the same way as nativesdk build.<br>
                </div>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Nov 2023 a=
t
                  08:40, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@g=
mail.com" target=3D"_blank">uvv.mail@gmail.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div>FTR, I suggested oe-core solution in the
                      corresponding mailing list.<br>
                      <br>
                      Slava<br>
                      <br>
                      On 10.11.2023 07:19, Vyacheslav Yurkov via <a href=3D=
"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a=
>
                      wrote:<br>
                    </div>
                    <blockquote type=3D"cite">
                      <div>On 10.11.2023 02:23, Cl=C3=A9ment P=C3=A9ron wro=
te:<br>
                      </div>
                      <blockquote type=3D"cite">
                        <div dir=3D"auto">
                          <div>Hi Samuli,<br>
                            <br>
                            <div class=3D"gmail_quote">
                              <div dir=3D"ltr" class=3D"gmail_attr">Le ven.
                                10 nov. 2023, 00:05, Vyacheslav Yurkov
                                &lt;<a href=3D"mailto:uvv.mail@gmail.com" t=
arget=3D"_blank">uvv.mail@gmail.com</a>&gt;
                                a =C3=A9crit=C2=A0:<br>
                              </div>
                              <blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
                                <div>
                                  <div>Thanks for the explanation, that
                                    was the missing piece for me to get
                                    an understanding of the problem :)<br>
                                    <br>
                                    I think it&#39;s not only me, but also
                                    others, were confused by the fact
                                    that we are talking about
                                    native(sdk), but try to fix
                                    something with a non-native
                                    variable.<br>
                                    <br>
                                    I&#39;ve just gave it a try and have tw=
o
                                    suggestions how this can be
                                    addressed.<br>
                                    <br>
                                    1. Recipe based solution:<br>
                                    SYSROOT_DIRS:append:class-nativesdk
                                    =3D &quot; $bindir}&quot;<br>
                                  </div>
                                </div>
                              </blockquote>
                            </div>
                          </div>
                          <div dir=3D"auto"><br>
                          </div>
                          <div dir=3D"auto">Is it not just missing
                            something like</div>
                          <div dir=3D"auto"><br>
                          </div>
                          <div dir=3D"auto">
                            <pre style=3D"padding:0px;margin-top:0px;margin=
-bottom:0px;font-size:13.3333px"><span style=3D"color:rgb(51,102,153);backg=
round-color:rgb(255,255,255)">DEPENDS:append:class</span><font color=3D"#00=
0000"><span style=3D"background-color:rgb(255,255,255)">-</span></font><spa=
n style=3D"color:rgb(51,102,153);background-color:rgb(255,255,255)">natives=
dk</span><font color=3D"#000000"><span style=3D"background-color:rgb(255,25=
5,255)"> =3D </span></font><span style=3D"color:rgb(221,34,0);background-co=
lor:rgb(255,240,240)">&quot; protobuf-native &quot;</span><font color=3D"#0=
00000"><span style=3D"background-color:rgb(255,255,255)"> </span></font></p=
re>
                            <pre style=3D"padding:0px;margin-top:0px;margin=
-bottom:0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"bac=
kground-color:rgb(255,255,255)">
</span></font></pre>
                            <pre style=3D"padding:0px;margin-top:0px;margin=
-bottom:0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"bac=
kground-color:rgb(255,255,255)">Regards</span></font></pre>
                            <pre style=3D"padding:0px;margin-top:0px;margin=
-bottom:0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"bac=
kground-color:rgb(255,255,255)">Clement </span></font></pre>
                            <pre style=3D"padding:0px;margin-top:0px;margin=
-bottom:0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"bac=
kground-color:rgb(255,255,255)">
</span></font></pre>
                          </div>
                        </div>
                      </blockquote>
                      <br>
                      This is already implicit by DEPENDS +=3D &quot;protob=
uf&quot;.
                      Take a look at my second suggestion. You can see
                      that ${bindir} is staged for native recipes, but
                      not for nativesdk.<br>
                      <br>
                      <blockquote type=3D"cite">
                        <div dir=3D"auto">
                          <div dir=3D"auto">
                            <pre style=3D"padding:0px;margin-top:0px;margin=
-bottom:0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"bac=
kground-color:rgb(255,255,255)">
</span></font></pre>
                          </div>
                          <div dir=3D"auto">
                            <div class=3D"gmail_quote">
                              <blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
                                <div>
                                  <div> <br>
                                    2. oe-core based solution:<br>
                                    ---
                                    a/meta/classes-global/staging.bbclass<b=
r>
                                    +++
                                    b/meta/classes-global/staging.bbclass<b=
r>
                                    @@ -26,6 +26,7 @@
                                    SYSROOT_DIRS_NATIVE =3D &quot; \<br>
                                    =C2=A0=C2=A0=C2=A0=C2=A0 ${localstatedi=
r} \<br>
                                    =C2=A0&quot;<br>
                                    =C2=A0SYSROOT_DIRS:append:class-native =
=3D
                                    &quot; ${SYSROOT_DIRS_NATIVE}&quot;<br>
                                    +SYSROOT_DIRS:append:class-nativesdk
                                    =3D &quot; ${SYSROOT_DIRS_NATIVE}&quot;=
<br>
                                    =C2=A0SYSROOT_DIRS:append:class-cross =
=3D &quot;
                                    ${SYSROOT_DIRS_NATIVE}&quot;<br>
                                    =C2=A0SYSROOT_DIRS:append:class-crosssd=
k
                                    =3D &quot; ${SYSROOT_DIRS_NATIVE}&quot;=
<br>
                                    <br>
                                    The second one will invalidate
                                    nativesdk sstate, but might cover
                                    not only grpc issue (I would assume
                                    gdbus-codegen or any other generator
                                    has the same issue when used for SDK
                                    build).<br>
                                    <br>
                                    What are your thoughs?<br>
                                    <br>
                                    Thanks,<br>
                                    Slava<br>
                                    <br>
                                    On 09.11.2023 14:35, Samuli Piippo
                                    wrote:<br>
                                  </div>
                                  <blockquote type=3D"cite">
                                    <div dir=3D"ltr">
                                      <div>DEPENDS +=3D &quot;protobuf&quot=
; is
                                        enough to have dependencies
                                        resolved.</div>
                                      <div><br>
                                      </div>
                                      <div>Problem is that bitbake&#39;s
                                        do_populate_sysroot does not
                                        take anything from bindir.</div>
                                      <div>This leads to
                                        nativesdk-(qt)grpc&#39;s
                                        do_prepare_recipe_sysroot to not
                                        get the protoc binary into the
                                        recipe_sysroot as expected by
                                        CMake.<br>
                                      </div>
                                      <div><br>
                                      </div>
                                      <div>This can be fixed with
                                        SYSROOT_DIRS.<br>
                                      </div>
                                    </div>
                                    <br>
                                    <div class=3D"gmail_quote">
                                      <div dir=3D"ltr" class=3D"gmail_attr"=
>On
                                        Thu, 9 Nov 2023 at 12:19,
                                        Vyacheslav Yurkov &lt;<a href=3D"ma=
ilto:uvv.mail@gmail.com" rel=3D"noreferrer" target=3D"_blank">uvv.mail@gmai=
l.com</a>&gt;
                                        wrote:<br>
                                      </div>
                                      <blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
                                        <div>
                                          <div>Hi <span>Cl=C3=A9ment,<br>
                                              No, the issue is when you
                                              just build nativesdk
                                              recipe (we are not at the
                                              stage to use the SDK yet).<br=
>
                                              <br>
                                              And that was exactly my
                                              question how to propagate
                                              the dependency correctly
                                              for nativesdk build.<br>
                                              <br>
                                              Regards,<br>
                                              Slava<br>
                                            </span></div>
                                        </div>
                                      </blockquote>
                                    </div>
                                  </blockquote>
                                </div>
                              </blockquote>
                            </div>
                          </div>
                        </div>
                      </blockquote>
                    </blockquote>
                  </div>
                </blockquote>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--00000000000040e9960609c854e5--

