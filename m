Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B625CC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 06:19:52 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.22668.1699597182755315163
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 22:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzHEQF/H;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so2837855a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 22:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699597181; x=1700201981; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug07JPnxJvF6vMiuHZFXeL4zoN2IUodLc8NoCtFtvCQ=;
        b=GzHEQF/HechB+y0vxGnrBfhDYLSrsLiQDnPDe5EP3K+OKTg95v8XHdG497kogIxoQ4
         ckMvdjEiBzyFrLHhrVwyBKfKeOmeTIaLtA5LFfwLcCtrWpjDc7XTIBXDOOPeshCynaqS
         EN8q8P7JalSBG2mX6pehmlXb3Ve9vbEG6+k3exKEh8g1Edt3MD9+2NbjfDa3ogJHGflb
         dBCfO5FH5Jw9T1HRr+U6JpHekYqeeSotre0rIDX5F4LfiKIq/Bhp2by2I4LlfnIL7Vbi
         Fq81CnnwrVFgQtVKWDe9xJLY+/iZVoJzd5sBrqSqSUZUgV6G0EyuzLWRoNCJXTHdd9iV
         Al3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699597181; x=1700201981;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ug07JPnxJvF6vMiuHZFXeL4zoN2IUodLc8NoCtFtvCQ=;
        b=fnSttmMmg6hcIML76hJp3KBzQWG8zxIg6FvGXx2ow17g+8z9mWaL06DeerH0yZtYSa
         VPY1UjhuOXveAniFP1MSq7Q2jxQkGzP6rLZcEoGU52p+YLvfXzdpJu7eBWRV/SRkw57L
         BorXLBGY1Nmu7niS8W5vfMJ/mGKASVVvtqgtfGhf5gKJVJRegVZxgoRHITSmN1N1Hb2j
         Xn7r4dSvebNDZljE/kNJa09JDPawYabt8zhL3jAvajfUJJo0j6qK2pgARCyMsHUM3mQG
         ByS7jU/tiCJ1Gb1tLylxlAOOyb7app7ytPTdA0XVdm4INJXcMURv/RSu3whYdAjfhWdO
         av7A==
X-Gm-Message-State: AOJu0YyNbY7evJHH/AzCbnpitGBEd42+n3V+3qrjOSgKs+Yp4UXHLYFV
	O7CoA8/+tsQ+/DLnusxxCGc=
X-Google-Smtp-Source: AGHT+IHwWaaVlF9J/49GJ6TTd2vz6nw3C3ymVqCwJGR53r3T8PchXvLSW2IMaruVXlFz6O2CqBEwuA==
X-Received: by 2002:a50:baaf:0:b0:53e:3b8f:8ce1 with SMTP id x44-20020a50baaf000000b0053e3b8f8ce1mr6036922ede.23.1699597180692;
        Thu, 09 Nov 2023 22:19:40 -0800 (PST)
Received: from [10.134.50.201] ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id o21-20020aa7dd55000000b00543525d9fddsm695420edw.21.2023.11.09.22.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 22:19:40 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------plDw4b1utAAK1HoE5OW0j8BO"
Message-ID: <c4423a33-d4fa-41a9-a471-71acee763d93@gmail.com>
Date: Fri, 10 Nov 2023 07:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20230930173003.3210-1-peron.clem@gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org>
 <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
 <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com>
 <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org>
 <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
 <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com>
 <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
 <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com>
 <CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 06:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106524

This is a multi-part message in MIME format.
--------------plDw4b1utAAK1HoE5OW0j8BO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.11.2023 02:23, Clément Péron wrote:
> Hi Samuli,
>
> Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov <uvv.mail@gmail.com> a 
> écrit :
>
>     Thanks for the explanation, that was the missing piece for me to
>     get an understanding of the problem :)
>
>     I think it's not only me, but also others, were confused by the
>     fact that we are talking about native(sdk), but try to fix
>     something with a non-native variable.
>
>     I've just gave it a try and have two suggestions how this can be
>     addressed.
>
>     1. Recipe based solution:
>     SYSROOT_DIRS:append:class-nativesdk = " $bindir}"
>
>
> Is it not just missing something like
>
> DEPENDS:append:class-nativesdk= " protobuf-native "
> Regards
> Clement

This is already implicit by DEPENDS += "protobuf". Take a look at my 
second suggestion. You can see that ${bindir} is staged for native 
recipes, but not for nativesdk.

>
>     2. oe-core based solution:
>     --- a/meta/classes-global/staging.bbclass
>     +++ b/meta/classes-global/staging.bbclass
>     @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \
>          ${localstatedir} \
>      "
>      SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
>     +SYSROOT_DIRS:append:class-nativesdk = " ${SYSROOT_DIRS_NATIVE}"
>      SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
>      SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
>
>     The second one will invalidate nativesdk sstate, but might cover
>     not only grpc issue (I would assume gdbus-codegen or any other
>     generator has the same issue when used for SDK build).
>
>     What are your thoughs?
>
>     Thanks,
>     Slava
>
>     On 09.11.2023 14:35, Samuli Piippo wrote:
>>     DEPENDS += "protobuf" is enough to have dependencies resolved.
>>
>>     Problem is that bitbake's do_populate_sysroot does not take
>>     anything from bindir.
>>     This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to
>>     not get the protoc binary into the recipe_sysroot as expected by
>>     CMake.
>>
>>     This can be fixed with SYSROOT_DIRS.
>>
>>     On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov
>>     <uvv.mail@gmail.com> wrote:
>>
>>         Hi Clément,
>>         No, the issue is when you just build nativesdk recipe (we are
>>         not at the stage to use the SDK yet).
>>
>>         And that was exactly my question how to propagate the
>>         dependency correctly for nativesdk build.
>>
>>         Regards,
>>         Slava
>>
>


--------------plDw4b1utAAK1HoE5OW0j8BO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10.11.2023 02:23, Clément Péron
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>Hi Samuli,<br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Le ven. 10 nov. 2023,
              00:05, Vyacheslav Yurkov &lt;<a
                href="mailto:uvv.mail@gmail.com" moz-do-not-send="true"
                class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
              a écrit :<br>
            </div>
            <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>
                <div>Thanks for the explanation, that was the missing
                  piece for me to get an understanding of the problem :)<br>
                  <br>
                  I think it's not only me, but also others, were
                  confused by the fact that we are talking about
                  native(sdk), but try to fix something with a
                  non-native variable.<br>
                  <br>
                  I've just gave it a try and have two suggestions how
                  this can be addressed.<br>
                  <br>
                  1. Recipe based solution:<br>
                  SYSROOT_DIRS:append:class-nativesdk = " $bindir}"<br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Is it not just missing something like</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <pre
style="padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><span
style="color:rgb(51,102,153);background-color:rgb(255,255,255)">DEPENDS:append:class</span><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)">-</span></font><span
style="color:rgb(51,102,153);background-color:rgb(255,255,255)">nativesdk</span><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)"> = </span></font><span
          style="color:rgb(221,34,0);background-color:rgb(255,240,240)">" protobuf-native "</span><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)"> </span></font></pre>
          <pre
style="padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)">
</span></font></pre>
          <pre
style="padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)">Regards</span></font></pre>
          <pre
style="padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)">Clement </span></font></pre>
          <pre
style="padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)">
</span></font></pre>
        </div>
      </div>
    </blockquote>
    <br>
    This is already implicit by DEPENDS += "protobuf". Take a look at my
    second suggestion. You can see that ${bindir} is staged for native
    recipes, but not for nativesdk.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com">
      <div dir="auto">
        <div dir="auto">
          <pre
style="padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><font
          color="#000000"><span
          style="background-color:rgb(255,255,255)">
</span></font></pre>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>
                <div> <br>
                  2. oe-core based solution:<br>
                  --- a/meta/classes-global/staging.bbclass<br>
                  +++ b/meta/classes-global/staging.bbclass<br>
                  @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \<br>
                       ${localstatedir} \<br>
                   "<br>
                   SYSROOT_DIRS:append:class-native = "
                  ${SYSROOT_DIRS_NATIVE}"<br>
                  +SYSROOT_DIRS:append:class-nativesdk = "
                  ${SYSROOT_DIRS_NATIVE}"<br>
                   SYSROOT_DIRS:append:class-cross = "
                  ${SYSROOT_DIRS_NATIVE}"<br>
                   SYSROOT_DIRS:append:class-crosssdk = "
                  ${SYSROOT_DIRS_NATIVE}"<br>
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
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>DEPENDS += "protobuf" is enough to have
                      dependencies resolved.</div>
                    <div><br>
                    </div>
                    <div>Problem is that bitbake's do_populate_sysroot
                      does not take anything from bindir.</div>
                    <div>This leads to nativesdk-(qt)grpc's
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
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Thu, 9 Nov 2023
                      at 12:19, Vyacheslav Yurkov &lt;<a
                        href="mailto:uvv.mail@gmail.com" target="_blank"
                        rel="noreferrer" moz-do-not-send="true"
                        class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <div>Hi <span>Clément,<br>
                            No, the issue is when you just build
                            nativesdk recipe (we are not at the stage to
                            use the SDK yet).<br>
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
    <br>
    <br>
  </body>
</html>

--------------plDw4b1utAAK1HoE5OW0j8BO--

