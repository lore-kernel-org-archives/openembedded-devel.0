Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B48C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 07:13:22 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.22806.1699600392764845427
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 23:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ElhMCKAx;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4ac0719457bso1826368e0c.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699600392; x=1700205192; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m1xsJXJpKHUajP3h/fJy30c/LCfYAeQujlY7gY5Q+bE=;
        b=ElhMCKAxdWBk7eAbZSM/cE5ZZbRuMApyKyL8at2+LprYzqAwBVq9o1SGFN+Hd2E4tp
         fKrJkKMjoQbDYLxRhB1rYk/XRtJGIaKf4bCL3tIgYx83oGMDGzWbg7AIM6Jvvw3JCzMw
         +PaGQdDhy87I7OO7go9YlsKcH8H5tR2AXPxehqMJbUWgv5eSI2oB5g9FcXHoDFsiqfD9
         TnhuqgNQbjL2jMvCBh4VjMsWSsFKXwJUA5B0uvBcCXKtkzg/6YQ8rEIkX630HxzHKKxv
         UnBEsBH12aAhRwN89Vh5J462UakyzdPrd3ziGoplSoaSF5RVK4hGSbgeOYhu5lLohQnS
         Zc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699600392; x=1700205192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1xsJXJpKHUajP3h/fJy30c/LCfYAeQujlY7gY5Q+bE=;
        b=sgmupabaaQIlIFtOhfTOJ6xpvNcfVOrIGs5SICtccrK1tALpS/9PcHn3I5harypu3l
         LreS65gUcrkj6E/JGOnC4wv4rYqmjz/TsnVF+DJ1USL5ZmMH0gt/DVe1xeormkEeT5do
         115LGVULMqVwWLJrR20GyN0zuOYNcp4Y/rr161OGzeSKjS400X9OH8Oq4cwr3jSJbSlu
         Y2NSeytNe0oSqNjAiPiVrlws8pCSdSYGDCIE/nh/slFe7KpsWYXoDaKRqSl24YVyFNHr
         mYqNIcA3Jq9qgI9pg9tKf25jrruHFP5fh85unwBWCOA1zXVmpuBtQ3M5DEJhp4IjM4dy
         Psww==
X-Gm-Message-State: AOJu0YzZwkYLbVysD9L6m0TFA4OExzM8aKNhtcjZMHGmWUY+yxTlSTuz
	J2J9oxmGKy9vSoEtM5w8zTGM9HoGzdKpnHC2pu0=
X-Google-Smtp-Source: AGHT+IFRrQiptuaIIJXzPQ+yeZWUh8kVIRjO42w2sW4LVLFfUIdV3HTDaiR35xkkwA+9gmW67u2mgEYriJ3yralDTT0=
X-Received: by 2002:a1f:2416:0:b0:48d:5be:2868 with SMTP id
 k22-20020a1f2416000000b0048d05be2868mr690691vkk.0.1699600390900; Thu, 09 Nov
 2023 23:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <178A5713556C6E82.9230@lists.openembedded.org>
 <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com> <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com> <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com> <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org> <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
 <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com> <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
 <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com> <CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com>
 <17962EA21B11FB58.7380@lists.openembedded.org> <1d41118c-a5f9-45c0-8c77-236815e22f3f@gmail.com>
In-Reply-To: <1d41118c-a5f9-45c0-8c77-236815e22f3f@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 10 Nov 2023 09:12:59 +0200
Message-ID: <CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008f50dc0609c70da7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 07:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106527

--0000000000008f50dc0609c70da7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is not strictly a nativesdk issue.
If you enable PACKAGECONFIG =3D "compiler" for protobuf, it will then build
protoc for the target.
This will then cause grpc target build to fail in the same way as nativesdk
build.

On Fri, 10 Nov 2023 at 08:40, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> FTR, I suggested oe-core solution in the corresponding mailing list.
>
> Slava
>
> On 10.11.2023 07:19, Vyacheslav Yurkov via lists.openembedded.org wrote:
>
> On 10.11.2023 02:23, Cl=C3=A9ment P=C3=A9ron wrote:
>
> Hi Samuli,
>
> Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov <uvv.mail@gmail.com> a
> =C3=A9crit :
>
>> Thanks for the explanation, that was the missing piece for me to get an
>> understanding of the problem :)
>>
>> I think it's not only me, but also others, were confused by the fact tha=
t
>> we are talking about native(sdk), but try to fix something with a
>> non-native variable.
>>
>> I've just gave it a try and have two suggestions how this can be
>> addressed.
>>
>> 1. Recipe based solution:
>> SYSROOT_DIRS:append:class-nativesdk =3D " $bindir}"
>>
>
> Is it not just missing something like
>
> DEPENDS:append:class-nativesdk =3D " protobuf-native "
>
>  Regards
>
> Clement
>
>
> This is already implicit by DEPENDS +=3D "protobuf". Take a look at my
> second suggestion. You can see that ${bindir} is staged for native recipe=
s,
> but not for nativesdk.
>
>
>> 2. oe-core based solution:
>> --- a/meta/classes-global/staging.bbclass
>> +++ b/meta/classes-global/staging.bbclass
>> @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D " \
>>      ${localstatedir} \
>>  "
>>  SYSROOT_DIRS:append:class-native =3D " ${SYSROOT_DIRS_NATIVE}"
>> +SYSROOT_DIRS:append:class-nativesdk =3D " ${SYSROOT_DIRS_NATIVE}"
>>  SYSROOT_DIRS:append:class-cross =3D " ${SYSROOT_DIRS_NATIVE}"
>>  SYSROOT_DIRS:append:class-crosssdk =3D " ${SYSROOT_DIRS_NATIVE}"
>>
>> The second one will invalidate nativesdk sstate, but might cover not onl=
y
>> grpc issue (I would assume gdbus-codegen or any other generator has the
>> same issue when used for SDK build).
>>
>> What are your thoughs?
>>
>> Thanks,
>> Slava
>>
>> On 09.11.2023 14:35, Samuli Piippo wrote:
>>
>> DEPENDS +=3D "protobuf" is enough to have dependencies resolved.
>>
>> Problem is that bitbake's do_populate_sysroot does not take anything fro=
m
>> bindir.
>> This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to not get
>> the protoc binary into the recipe_sysroot as expected by CMake.
>>
>> This can be fixed with SYSROOT_DIRS.
>>
>> On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov <uvv.mail@gmail.com>
>> wrote:
>>
>>> Hi Cl=C3=A9ment,
>>> No, the issue is when you just build nativesdk recipe (we are not at th=
e
>>> stage to use the SDK yet).
>>>
>>> And that was exactly my question how to propagate the dependency
>>> correctly for nativesdk build.
>>>
>>> Regards,
>>> Slava
>>>
>>
>>
>

--0000000000008f50dc0609c70da7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is not strictly a nativesdk issue.</div><div>If =
you enable PACKAGECONFIG =3D &quot;compiler&quot; for protobuf, it will the=
n build protoc for the target.</div><div>This will then cause grpc target b=
uild to fail in the same way as nativesdk build.<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Nov 20=
23 at 08:40, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uv=
v.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>FTR, I suggested oe-core solution in
      the corresponding mailing list.<br>
      <br>
      Slava<br>
      <br>
      On 10.11.2023 07:19, Vyacheslav Yurkov via <a href=3D"http://lists.op=
enembedded.org" target=3D"_blank">lists.openembedded.org</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>On 10.11.2023 02:23, Cl=C3=A9ment P=C3=A9ron
        wrote:<br>
      </div>
      <blockquote type=3D"cite">
       =20
        <div dir=3D"auto">
          <div>Hi Samuli,<br>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">Le ven. 10 nov. 2023,
                00:05, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gma=
il.com" target=3D"_blank">uvv.mail@gmail.com</a>&gt;
                a =C3=A9crit=C2=A0:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                <div>
                  <div>Thanks for the explanation, that was the missing
                    piece for me to get an understanding of the problem
                    :)<br>
                    <br>
                    I think it&#39;s not only me, but also others, were
                    confused by the fact that we are talking about
                    native(sdk), but try to fix something with a
                    non-native variable.<br>
                    <br>
                    I&#39;ve just gave it a try and have two suggestions ho=
w
                    this can be addressed.<br>
                    <br>
                    1. Recipe based solution:<br>
                    SYSROOT_DIRS:append:class-nativesdk =3D &quot; $bindir}=
&quot;<br>
                  </div>
                </div>
              </blockquote>
            </div>
          </div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Is it not just missing something like</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">
            <pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font=
-size:13.3333px"><span style=3D"color:rgb(51,102,153);background-color:rgb(=
255,255,255)">DEPENDS:append:class</span><font color=3D"#000000"><span styl=
e=3D"background-color:rgb(255,255,255)">-</span></font><span style=3D"color=
:rgb(51,102,153);background-color:rgb(255,255,255)">nativesdk</span><font c=
olor=3D"#000000"><span style=3D"background-color:rgb(255,255,255)"> =3D </s=
pan></font><span style=3D"color:rgb(221,34,0);background-color:rgb(255,240,=
240)">&quot; protobuf-native &quot;</span><font color=3D"#000000"><span sty=
le=3D"background-color:rgb(255,255,255)"> </span></font></pre>
            <pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font=
-size:13.3333px"><font color=3D"#000000"><span style=3D"background-color:rg=
b(255,255,255)">
</span></font></pre>
            <pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font=
-size:13.3333px"><font color=3D"#000000"><span style=3D"background-color:rg=
b(255,255,255)">Regards</span></font></pre>
            <pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font=
-size:13.3333px"><font color=3D"#000000"><span style=3D"background-color:rg=
b(255,255,255)">Clement </span></font></pre>
            <pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font=
-size:13.3333px"><font color=3D"#000000"><span style=3D"background-color:rg=
b(255,255,255)">
</span></font></pre>
          </div>
        </div>
      </blockquote>
      <br>
      This is already implicit by DEPENDS +=3D &quot;protobuf&quot;. Take a=
 look at
      my second suggestion. You can see that ${bindir} is staged for
      native recipes, but not for nativesdk.<br>
      <br>
      <blockquote type=3D"cite">
        <div dir=3D"auto">
          <div dir=3D"auto">
            <pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font=
-size:13.3333px"><font color=3D"#000000"><span style=3D"background-color:rg=
b(255,255,255)">
</span></font></pre>
          </div>
          <div dir=3D"auto">
            <div class=3D"gmail_quote">
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                <div>
                  <div> <br>
                    2. oe-core based solution:<br>
                    --- a/meta/classes-global/staging.bbclass<br>
                    +++ b/meta/classes-global/staging.bbclass<br>
                    @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D &quot; \<br>
                    =C2=A0=C2=A0=C2=A0=C2=A0 ${localstatedir} \<br>
                    =C2=A0&quot;<br>
                    =C2=A0SYSROOT_DIRS:append:class-native =3D &quot;
                    ${SYSROOT_DIRS_NATIVE}&quot;<br>
                    +SYSROOT_DIRS:append:class-nativesdk =3D &quot;
                    ${SYSROOT_DIRS_NATIVE}&quot;<br>
                    =C2=A0SYSROOT_DIRS:append:class-cross =3D &quot;
                    ${SYSROOT_DIRS_NATIVE}&quot;<br>
                    =C2=A0SYSROOT_DIRS:append:class-crosssdk =3D &quot;
                    ${SYSROOT_DIRS_NATIVE}&quot;<br>
                    <br>
                    The second one will invalidate nativesdk sstate, but
                    might cover not only grpc issue (I would assume
                    gdbus-codegen or any other generator has the same
                    issue when used for SDK build).<br>
                    <br>
                    What are your thoughs?<br>
                    <br>
                    Thanks,<br>
                    Slava<br>
                    <br>
                    On 09.11.2023 14:35, Samuli Piippo wrote:<br>
                  </div>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">
                      <div>DEPENDS +=3D &quot;protobuf&quot; is enough to h=
ave
                        dependencies resolved.</div>
                      <div><br>
                      </div>
                      <div>Problem is that bitbake&#39;s do_populate_sysroo=
t
                        does not take anything from bindir.</div>
                      <div>This leads to nativesdk-(qt)grpc&#39;s
                        do_prepare_recipe_sysroot to not get the protoc
                        binary into the recipe_sysroot as expected by
                        CMake.<br>
                      </div>
                      <div><br>
                      </div>
                      <div>This can be fixed with SYSROOT_DIRS.<br>
                      </div>
                    </div>
                    <br>
                    <div class=3D"gmail_quote">
                      <div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Nov
                        2023 at 12:19, Vyacheslav Yurkov &lt;<a href=3D"mai=
lto:uvv.mail@gmail.com" rel=3D"noreferrer" target=3D"_blank">uvv.mail@gmail=
.com</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div>
                          <div>Hi <span>Cl=C3=A9ment,<br>
                              No, the issue is when you just build
                              nativesdk recipe (we are not at the stage
                              to use the SDK yet).<br>
                              <br>
                              And that was exactly my question how to
                              propagate the dependency correctly for
                              nativesdk build.<br>
                              <br>
                              Regards,<br>
                              Slava<br>
                            </span></div>
                        </div>
                      </blockquote>
                    </div>
                  </blockquote>
                  <br>
                </div>
              </blockquote>
            </div>
          </div>
        </div>
      </blockquote>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--0000000000008f50dc0609c70da7--

