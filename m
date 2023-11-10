Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A85C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 07:51:03 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web10.23087.1699602661364642411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 23:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dcqGSMmC;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4a18f724d47so711292e0c.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 23:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699602660; x=1700207460; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4R0I5eU/p/w499KgYAFE+NGortP/l+n/L8ODb3Ndvs=;
        b=dcqGSMmC0Wew0dKDUIfgB6kWdQ/CxJW4WXaZSdfrtBiPEquvGZrTHOEQd1iaM6V1qD
         1VoRVoGgFF5LZL24n6KZkRNTOYsflCKKIVw8kimtQKMrzo0SbKb3iy43yiLAcd9SuTu1
         XBb8JTA5Y4ffr4YRfEv6LEugWT5Vu7vF6i6xgfSfgIILJYYZxZVNjonLlApib0KFksFd
         KINtYbi342iGMgAzrn508ctrT5VNwwixkVnOskYi4QNlMktBTS4Jwt6MDbxZPuzVQmhy
         qNlol9WUa9+yQEnuJbG/0cZ86TBdLd1KZonBpK1P9AgKsIXNVod8awOW4z60hTH7gDIx
         FSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699602660; x=1700207460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4R0I5eU/p/w499KgYAFE+NGortP/l+n/L8ODb3Ndvs=;
        b=MQHEdxUcANIU+A3B1dMB7MSj6eltmZS/3d321u4VLQwilLg+HZX3xyEqYPk9TcmtDS
         Y15VlMt9poKeUPAvfe4fvwJvM0QfDSkCrpUScSOxuE9V9BCAUaSJj5CTKXZqOHquVa8Q
         5DZMc0rkQpkza9jbbMMRwB9nwHQJBDrZRJiUwY2g6rEDH0FsJpGYbCgQ+oXUz48igZC2
         ypZt2QPlR9PdgxrVh59J4Havey44Ii8RfeR/gdst4Z2ZybQ/wnJJtSdsiyhm+jnNvi7E
         MKMSB5YLrCcZL5rVpcsyUH5BbkXzvnAOAaWzct1AVg20ONkEZ6dczMHY9S5kCIiNkpsP
         /nGg==
X-Gm-Message-State: AOJu0YzbPfoKciXAHqEKC3yjmZ8nV3G82n6XDpTqwmvn6R2l/o8YwIYD
	oDk0ElC0OrioQkYVjM5hXe7vqaHfpNuRgtnvQks=
X-Google-Smtp-Source: AGHT+IHpVBmWn/lFR6F3mY4C+PdFNs83e36+CNU5khItA3Kbc8TfiGk/h0PTuVsoiDgHAOD4t+CkATarifej7i47i9Q=
X-Received: by 2002:a05:6122:4e28:b0:4ac:5d9:e655 with SMTP id
 ge40-20020a0561224e2800b004ac05d9e655mr3800856vkb.0.1699602660223; Thu, 09
 Nov 2023 23:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
 <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com> <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org> <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
 <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com> <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
 <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com> <CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com>
 <17962EA21B11FB58.7380@lists.openembedded.org> <1d41118c-a5f9-45c0-8c77-236815e22f3f@gmail.com>
 <CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com> <dbe15c1d-bbcd-4808-927c-a5f9962de0ec@gmail.com>
In-Reply-To: <dbe15c1d-bbcd-4808-927c-a5f9962de0ec@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 10 Nov 2023 09:50:49 +0200
Message-ID: <CABXoSoXfbnnbKWizmfaRsN5-mOhdcRNxxJ+uzeuSb5qqps1cGQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d26dc50609c79444"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 07:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106529

--000000000000d26dc50609c79444
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

| CMake Error at
/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-s=
ysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake:116
(message):
|   The imported target "protobuf::protoc" references the file
|
|
     "/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/re=
cipe-sysroot/usr/bin/protoc-23.4.0"
|
|   but this file does not exist.  Possible reasons include:

On Fri, 10 Nov 2023 at 09:38, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> You sure? Because I remember the test in grpc to check for CROSS_COMPILIN=
G
> in cmake to avoid that.
>
> Slava
>
> On 10.11.2023 08:12, Samuli Piippo wrote:
>
> This is not strictly a nativesdk issue.
> If you enable PACKAGECONFIG =3D "compiler" for protobuf, it will then bui=
ld
> protoc for the target.
> This will then cause grpc target build to fail in the same way as
> nativesdk build.
>
> On Fri, 10 Nov 2023 at 08:40, Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> FTR, I suggested oe-core solution in the corresponding mailing list.
>>
>> Slava
>>
>> On 10.11.2023 07:19, Vyacheslav Yurkov via lists.openembedded.org wrote:
>>
>> On 10.11.2023 02:23, Cl=C3=A9ment P=C3=A9ron wrote:
>>
>> Hi Samuli,
>>
>> Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov <uvv.mail@gmail.com> a
>> =C3=A9crit :
>>
>>> Thanks for the explanation, that was the missing piece for me to get an
>>> understanding of the problem :)
>>>
>>> I think it's not only me, but also others, were confused by the fact
>>> that we are talking about native(sdk), but try to fix something with a
>>> non-native variable.
>>>
>>> I've just gave it a try and have two suggestions how this can be
>>> addressed.
>>>
>>> 1. Recipe based solution:
>>> SYSROOT_DIRS:append:class-nativesdk =3D " $bindir}"
>>>
>>
>> Is it not just missing something like
>>
>> DEPENDS:append:class-nativesdk =3D " protobuf-native "
>>
>>  Regards
>>
>> Clement
>>
>>
>> This is already implicit by DEPENDS +=3D "protobuf". Take a look at my
>> second suggestion. You can see that ${bindir} is staged for native recip=
es,
>> but not for nativesdk.
>>
>>
>>> 2. oe-core based solution:
>>> --- a/meta/classes-global/staging.bbclass
>>> +++ b/meta/classes-global/staging.bbclass
>>> @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D " \
>>>      ${localstatedir} \
>>>  "
>>>  SYSROOT_DIRS:append:class-native =3D " ${SYSROOT_DIRS_NATIVE}"
>>> +SYSROOT_DIRS:append:class-nativesdk =3D " ${SYSROOT_DIRS_NATIVE}"
>>>  SYSROOT_DIRS:append:class-cross =3D " ${SYSROOT_DIRS_NATIVE}"
>>>  SYSROOT_DIRS:append:class-crosssdk =3D " ${SYSROOT_DIRS_NATIVE}"
>>>
>>> The second one will invalidate nativesdk sstate, but might cover not
>>> only grpc issue (I would assume gdbus-codegen or any other generator ha=
s
>>> the same issue when used for SDK build).
>>>
>>> What are your thoughs?
>>>
>>> Thanks,
>>> Slava
>>>
>>> On 09.11.2023 14:35, Samuli Piippo wrote:
>>>
>>> DEPENDS +=3D "protobuf" is enough to have dependencies resolved.
>>>
>>> Problem is that bitbake's do_populate_sysroot does not take anything
>>> from bindir.
>>> This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to not get
>>> the protoc binary into the recipe_sysroot as expected by CMake.
>>>
>>> This can be fixed with SYSROOT_DIRS.
>>>
>>> On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> wrote:
>>>
>>>> Hi Cl=C3=A9ment,
>>>> No, the issue is when you just build nativesdk recipe (we are not at
>>>> the stage to use the SDK yet).
>>>>
>>>> And that was exactly my question how to propagate the dependency
>>>> correctly for nativesdk build.
>>>>
>>>> Regards,
>>>> Slava
>>>>
>>>
>

--000000000000d26dc50609c79444
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><span style=3D"font-family:monospace">=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">| CMake =
Error at /home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2=
/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake:116 (message)=
:</span><br>| =C2=A0=C2=A0The imported target &quot;protobuf::protoc&quot; =
references the file<br>|<br>| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;/home/sap=
iippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-sysroot/us=
r/bin/protoc-23.4.0&quot;<br>|<br>| =C2=A0=C2=A0but this file does not exis=
t.=C2=A0 Possible reasons include:<br></span></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Nov 2023 at 0=
9:38, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>You sure? Because I remember the test
      in grpc to check for CROSS_COMPILING in cmake to avoid that.<br>
      <br>
      Slava<br>
      <br>
      On 10.11.2023 08:12, Samuli Piippo wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>This is not strictly a nativesdk issue.</div>
        <div>If you enable PACKAGECONFIG =3D &quot;compiler&quot; for proto=
buf, it
          will then build protoc for the target.</div>
        <div>This will then cause grpc target build to fail in the same
          way as nativesdk build.<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 Nov 2023 at 08:40,
          Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" targe=
t=3D"_blank">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>FTR, I suggested oe-core solution in the corresponding
              mailing list.<br>
              <br>
              Slava<br>
              <br>
              On 10.11.2023 07:19, Vyacheslav Yurkov via <a href=3D"http://=
lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
            </div>
            <blockquote type=3D"cite">
              <div>On 10.11.2023 02:23, Cl=C3=A9ment P=C3=A9ron wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"auto">
                  <div>Hi Samuli,<br>
                    <br>
                    <div class=3D"gmail_quote">
                      <div dir=3D"ltr" class=3D"gmail_attr">Le ven. 10 nov.
                        2023, 00:05, Vyacheslav Yurkov &lt;<a href=3D"mailt=
o:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a>&gt;
                        a =C3=A9crit=C2=A0:<br>
                      </div>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div>
                          <div>Thanks for the explanation, that was the
                            missing piece for me to get an understanding
                            of the problem :)<br>
                            <br>
                            I think it&#39;s not only me, but also others,
                            were confused by the fact that we are
                            talking about native(sdk), but try to fix
                            something with a non-native variable.<br>
                            <br>
                            I&#39;ve just gave it a try and have two
                            suggestions how this can be addressed.<br>
                            <br>
                            1. Recipe based solution:<br>
                            SYSROOT_DIRS:append:class-nativesdk =3D &quot;
                            $bindir}&quot;<br>
                          </div>
                        </div>
                      </blockquote>
                    </div>
                  </div>
                  <div dir=3D"auto"><br>
                  </div>
                  <div dir=3D"auto">Is it not just missing something like</=
div>
                  <div dir=3D"auto"><br>
                  </div>
                  <div dir=3D"auto">
                    <pre style=3D"padding:0px;margin-top:0px;margin-bottom:=
0px;font-size:13.3333px"><span style=3D"color:rgb(51,102,153);background-co=
lor:rgb(255,255,255)">DEPENDS:append:class</span><font color=3D"#000000"><s=
pan style=3D"background-color:rgb(255,255,255)">-</span></font><span style=
=3D"color:rgb(51,102,153);background-color:rgb(255,255,255)">nativesdk</spa=
n><font color=3D"#000000"><span style=3D"background-color:rgb(255,255,255)"=
> =3D </span></font><span style=3D"color:rgb(221,34,0);background-color:rgb=
(255,240,240)">&quot; protobuf-native &quot;</span><font color=3D"#000000">=
<span style=3D"background-color:rgb(255,255,255)"> </span></font></pre>
                    <pre style=3D"padding:0px;margin-top:0px;margin-bottom:=
0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"background-=
color:rgb(255,255,255)">
</span></font></pre>
                    <pre style=3D"padding:0px;margin-top:0px;margin-bottom:=
0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"background-=
color:rgb(255,255,255)">Regards</span></font></pre>
                    <pre style=3D"padding:0px;margin-top:0px;margin-bottom:=
0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"background-=
color:rgb(255,255,255)">Clement </span></font></pre>
                    <pre style=3D"padding:0px;margin-top:0px;margin-bottom:=
0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"background-=
color:rgb(255,255,255)">
</span></font></pre>
                  </div>
                </div>
              </blockquote>
              <br>
              This is already implicit by DEPENDS +=3D &quot;protobuf&quot;=
. Take a
              look at my second suggestion. You can see that ${bindir}
              is staged for native recipes, but not for nativesdk.<br>
              <br>
              <blockquote type=3D"cite">
                <div dir=3D"auto">
                  <div dir=3D"auto">
                    <pre style=3D"padding:0px;margin-top:0px;margin-bottom:=
0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"background-=
color:rgb(255,255,255)">
</span></font></pre>
                  </div>
                  <div dir=3D"auto">
                    <div class=3D"gmail_quote">
                      <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div>
                          <div> <br>
                            2. oe-core based solution:<br>
                            --- a/meta/classes-global/staging.bbclass<br>
                            +++ b/meta/classes-global/staging.bbclass<br>
                            @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D &quot=
; \<br>
                            =C2=A0=C2=A0=C2=A0=C2=A0 ${localstatedir} \<br>
                            =C2=A0&quot;<br>
                            =C2=A0SYSROOT_DIRS:append:class-native =3D &quo=
t;
                            ${SYSROOT_DIRS_NATIVE}&quot;<br>
                            +SYSROOT_DIRS:append:class-nativesdk =3D &quot;
                            ${SYSROOT_DIRS_NATIVE}&quot;<br>
                            =C2=A0SYSROOT_DIRS:append:class-cross =3D &quot=
;
                            ${SYSROOT_DIRS_NATIVE}&quot;<br>
                            =C2=A0SYSROOT_DIRS:append:class-crosssdk =3D &q=
uot;
                            ${SYSROOT_DIRS_NATIVE}&quot;<br>
                            <br>
                            The second one will invalidate nativesdk
                            sstate, but might cover not only grpc issue
                            (I would assume gdbus-codegen or any other
                            generator has the same issue when used for
                            SDK build).<br>
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
                              <div>DEPENDS +=3D &quot;protobuf&quot; is eno=
ugh to
                                have dependencies resolved.</div>
                              <div><br>
                              </div>
                              <div>Problem is that bitbake&#39;s
                                do_populate_sysroot does not take
                                anything from bindir.</div>
                              <div>This leads to nativesdk-(qt)grpc&#39;s
                                do_prepare_recipe_sysroot to not get the
                                protoc binary into the recipe_sysroot as
                                expected by CMake.<br>
                              </div>
                              <div><br>
                              </div>
                              <div>This can be fixed with SYSROOT_DIRS.<br>
                              </div>
                            </div>
                            <br>
                            <div class=3D"gmail_quote">
                              <div dir=3D"ltr" class=3D"gmail_attr">On Thu,
                                9 Nov 2023 at 12:19, Vyacheslav Yurkov
                                &lt;<a href=3D"mailto:uvv.mail@gmail.com" r=
el=3D"noreferrer" target=3D"_blank">uvv.mail@gmail.com</a>&gt;
                                wrote:<br>
                              </div>
                              <blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
                                <div>
                                  <div>Hi <span>Cl=C3=A9ment,<br>
                                      No, the issue is when you just
                                      build nativesdk recipe (we are not
                                      at the stage to use the SDK yet).<br>
                                      <br>
                                      And that was exactly my question
                                      how to propagate the dependency
                                      correctly for nativesdk build.<br>
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

</blockquote></div>

--000000000000d26dc50609c79444--

