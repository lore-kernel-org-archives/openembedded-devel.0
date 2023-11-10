Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593F2C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 08:06:13 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.23202.1699603563354928105
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 00:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUMEhC8n;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so2797354a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 00:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699603561; x=1700208361; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A9Gp0vTkV104aNnF+VSpZl6I8rJxc0JxK6EXU2+RDc=;
        b=WUMEhC8ny1er8PtKCcgKExdUnZEpKpXlZYIdt1KZvV1z9xWRm9p5b+gW7D3Pp2HMuq
         3mMuyOi62HBYP63R0IZWtIBm32H6Kuqk7DAWqED3DXlTaIMOvyD4DATxeM/5Bm5RqHs9
         CrhJfwUqrUBmFI8w4GdITs1zJsgMEmwLsuIDTGgJrhGPxJEcKPe7tOXcLmuJ4HE5xwPc
         mGGEcKXEe6BtpnSWRgMjq1MigQwxfCBSLuHyuJYB2S9ycVmfnngwDrsfTezFheHSa1ti
         FMP74HdYVNLN4C8t27v+nvB5sOit7yKcfMg5kR66nIrPOxfxgl5/7FobRzbWLpiF+16c
         7yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699603561; x=1700208361;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5A9Gp0vTkV104aNnF+VSpZl6I8rJxc0JxK6EXU2+RDc=;
        b=r7/Zviho6SjJ3J5cMdES66AtvWzEfy25XdY+tTflzhlSFUyhPnqhUJWClDdVJp1UXt
         cUuXoHRu6sKIFPj2819X55Rmht1gOShPnKvCXd3SWsJG2hhKQTtkNQ/t64wjodARRUSo
         5tdoqHG4y/+cfOpwJOMO91NSv7PSuzGZn6uAq6EN5enNjQAEnSYqLbDfd1P3REE6ywP5
         goZGFWjwJtHYc0PrXQl4GC61gHo6uECmP5Nbn9Q5tdwZKe2Q6AWHIHNgzeWlsHnN1RMD
         QIXFmaIl9O23HCTKb2GIXlfBn3w+U4TJykZuJoI0+xFgdGfLJqaMJxeGFMBfabr+KVTb
         4GNA==
X-Gm-Message-State: AOJu0YwDTn0TJKA3AF1rTsUIjmWpxrwY/xgvGcPokS0Lc8uE5+Hk+yvF
	5dJx7ztBvTIw/c7YRSP7SlE=
X-Google-Smtp-Source: AGHT+IHdMIS5GSAqbVtmtyGCy/ayiBEvMLxmpU6YJqgoH2tKBd+kMvGqv45ENBQ4gHL053+/UViCgQ==
X-Received: by 2002:a17:907:7247:b0:9b2:b152:b0f2 with SMTP id ds7-20020a170907724700b009b2b152b0f2mr5870992ejc.10.1699603561314;
        Fri, 10 Nov 2023 00:06:01 -0800 (PST)
Received: from [10.134.43.51] ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id kk15-20020a170907766f00b0098921e1b064sm3586037ejc.181.2023.11.10.00.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 00:06:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------uGwANyYO0uPFPr9NtkoROuvl"
Message-ID: <2939988d-b6f7-4cfc-a8e3-242e61289688@gmail.com>
Date: Fri, 10 Nov 2023 09:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Content-Language: en-US
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20230930173003.3210-1-peron.clem@gmail.com>
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
 <17962EA21B11FB58.7380@lists.openembedded.org>
 <1d41118c-a5f9-45c0-8c77-236815e22f3f@gmail.com>
 <CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com>
 <dbe15c1d-bbcd-4808-927c-a5f9962de0ec@gmail.com>
 <CABXoSoXfbnnbKWizmfaRsN5-mOhdcRNxxJ+uzeuSb5qqps1cGQ@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CABXoSoXfbnnbKWizmfaRsN5-mOhdcRNxxJ+uzeuSb5qqps1cGQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 08:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106530

This is a multi-part message in MIME format.
--------------uGwANyYO0uPFPr9NtkoROuvl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

OK, but that seems to be similar issue, although a different one :)
I recall I disabled compiler by default for target, because it's rare 
use case.

So compiler can be enabled (if needed), but then perhaps another tweak 
with sysroot will be necessary in the recipe? I suggest to keep it as a 
comment in the recipe. What do you think?

Slava

On 10.11.2023 08:50, Samuli Piippo wrote:
>
> | CMake Error at 
> /home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake:116 
> (message):
> |   The imported target "protobuf::protoc" references the file
> |
> | 
>      "/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-sysroot/usr/bin/protoc-23.4.0"
> |
> |   but this file does not exist.  Possible reasons include:
>
> On Fri, 10 Nov 2023 at 09:38, Vyacheslav Yurkov <uvv.mail@gmail.com> 
> wrote:
>
>     You sure? Because I remember the test in grpc to check for
>     CROSS_COMPILING in cmake to avoid that.
>
>     Slava
>
>     On 10.11.2023 08:12, Samuli Piippo wrote:
>>     This is not strictly a nativesdk issue.
>>     If you enable PACKAGECONFIG = "compiler" for protobuf, it will
>>     then build protoc for the target.
>>     This will then cause grpc target build to fail in the same way as
>>     nativesdk build.
>>
>>     On Fri, 10 Nov 2023 at 08:40, Vyacheslav Yurkov
>>     <uvv.mail@gmail.com> wrote:
>>
>>         FTR, I suggested oe-core solution in the corresponding
>>         mailing list.
>>
>>         Slava
>>
>>         On 10.11.2023 07:19, Vyacheslav Yurkov via
>>         lists.openembedded.org <http://lists.openembedded.org> wrote:
>>>         On 10.11.2023 02:23, Clément Péron wrote:
>>>>         Hi Samuli,
>>>>
>>>>         Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov
>>>>         <uvv.mail@gmail.com> a écrit :
>>>>
>>>>             Thanks for the explanation, that was the missing piece
>>>>             for me to get an understanding of the problem :)
>>>>
>>>>             I think it's not only me, but also others, were
>>>>             confused by the fact that we are talking about
>>>>             native(sdk), but try to fix something with a non-native
>>>>             variable.
>>>>
>>>>             I've just gave it a try and have two suggestions how
>>>>             this can be addressed.
>>>>
>>>>             1. Recipe based solution:
>>>>             SYSROOT_DIRS:append:class-nativesdk = " $bindir}"
>>>>
>>>>
>>>>         Is it not just missing something like
>>>>
>>>>         DEPENDS:append:class-nativesdk= " protobuf-native "
>>>>         Regards
>>>>         Clement
>>>
>>>         This is already implicit by DEPENDS += "protobuf". Take a
>>>         look at my second suggestion. You can see that ${bindir} is
>>>         staged for native recipes, but not for nativesdk.
>>>
>>>>
>>>>             2. oe-core based solution:
>>>>             --- a/meta/classes-global/staging.bbclass
>>>>             +++ b/meta/classes-global/staging.bbclass
>>>>             @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \
>>>>                  ${localstatedir} \
>>>>              "
>>>>              SYSROOT_DIRS:append:class-native = "
>>>>             ${SYSROOT_DIRS_NATIVE}"
>>>>             +SYSROOT_DIRS:append:class-nativesdk = "
>>>>             ${SYSROOT_DIRS_NATIVE}"
>>>>              SYSROOT_DIRS:append:class-cross = "
>>>>             ${SYSROOT_DIRS_NATIVE}"
>>>>              SYSROOT_DIRS:append:class-crosssdk = "
>>>>             ${SYSROOT_DIRS_NATIVE}"
>>>>
>>>>             The second one will invalidate nativesdk sstate, but
>>>>             might cover not only grpc issue (I would assume
>>>>             gdbus-codegen or any other generator has the same issue
>>>>             when used for SDK build).
>>>>
>>>>             What are your thoughs?
>>>>
>>>>             Thanks,
>>>>             Slava
>>>>
>>>>             On 09.11.2023 14:35, Samuli Piippo wrote:
>>>>>             DEPENDS += "protobuf" is enough to have dependencies
>>>>>             resolved.
>>>>>
>>>>>             Problem is that bitbake's do_populate_sysroot does not
>>>>>             take anything from bindir.
>>>>>             This leads to nativesdk-(qt)grpc's
>>>>>             do_prepare_recipe_sysroot to not get the protoc binary
>>>>>             into the recipe_sysroot as expected by CMake.
>>>>>
>>>>>             This can be fixed with SYSROOT_DIRS.
>>>>>
>>>>>             On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov
>>>>>             <uvv.mail@gmail.com> wrote:
>>>>>
>>>>>                 Hi Clément,
>>>>>                 No, the issue is when you just build nativesdk
>>>>>                 recipe (we are not at the stage to use the SDK yet).
>>>>>
>>>>>                 And that was exactly my question how to propagate
>>>>>                 the dependency correctly for nativesdk build.
>>>>>
>>>>>                 Regards,
>>>>>                 Slava
>>>>>
>

--------------uGwANyYO0uPFPr9NtkoROuvl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">OK, but that seems to be similar issue,
      although a different one :)<br>
      I recall I disabled compiler by default for target, because it's
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
    <blockquote type="cite"
cite="mid:CABXoSoXfbnnbKWizmfaRsN5-mOhdcRNxxJ+uzeuSb5qqps1cGQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div><br>
        </div>
        <div><span style="font-family:monospace"><span
              style="color:rgb(0,0,0);background-color:rgb(255,255,255)">|
              CMake Error at
/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake:116
              (message):</span><br>
            |   The imported target "protobuf::protoc" references the
            file<br>
            |<br>
            |
     "/home/sapiippo/qt6/build/tmp/work/cortexa57-poky-linux/grpc/1.59.2/recipe-sysroot/usr/bin/protoc-23.4.0"<br>
            |<br>
            |   but this file does not exist.  Possible reasons include:<br>
          </span></div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 10 Nov 2023 at 09:38,
          Vyacheslav Yurkov &lt;<a href="mailto:uvv.mail@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>You sure? Because I remember the test in grpc to check
              for CROSS_COMPILING in cmake to avoid that.<br>
              <br>
              Slava<br>
              <br>
              On 10.11.2023 08:12, Samuli Piippo wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">
                <div>This is not strictly a nativesdk issue.</div>
                <div>If you enable PACKAGECONFIG = "compiler" for
                  protobuf, it will then build protoc for the target.</div>
                <div>This will then cause grpc target build to fail in
                  the same way as nativesdk build.<br>
                </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Fri, 10 Nov 2023 at
                  08:40, Vyacheslav Yurkov &lt;<a
                    href="mailto:uvv.mail@gmail.com" target="_blank"
                    moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div>FTR, I suggested oe-core solution in the
                      corresponding mailing list.<br>
                      <br>
                      Slava<br>
                      <br>
                      On 10.11.2023 07:19, Vyacheslav Yurkov via <a
                        href="http://lists.openembedded.org"
                        target="_blank" moz-do-not-send="true">lists.openembedded.org</a>
                      wrote:<br>
                    </div>
                    <blockquote type="cite">
                      <div>On 10.11.2023 02:23, Clément Péron wrote:<br>
                      </div>
                      <blockquote type="cite">
                        <div dir="auto">
                          <div>Hi Samuli,<br>
                            <br>
                            <div class="gmail_quote">
                              <div dir="ltr" class="gmail_attr">Le ven.
                                10 nov. 2023, 00:05, Vyacheslav Yurkov
                                &lt;<a href="mailto:uvv.mail@gmail.com"
                                  target="_blank" moz-do-not-send="true"
                                  class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                                a écrit :<br>
                              </div>
                              <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                                <div>
                                  <div>Thanks for the explanation, that
                                    was the missing piece for me to get
                                    an understanding of the problem :)<br>
                                    <br>
                                    I think it's not only me, but also
                                    others, were confused by the fact
                                    that we are talking about
                                    native(sdk), but try to fix
                                    something with a non-native
                                    variable.<br>
                                    <br>
                                    I've just gave it a try and have two
                                    suggestions how this can be
                                    addressed.<br>
                                    <br>
                                    1. Recipe based solution:<br>
                                    SYSROOT_DIRS:append:class-nativesdk
                                    = " $bindir}"<br>
                                  </div>
                                </div>
                              </blockquote>
                            </div>
                          </div>
                          <div dir="auto"><br>
                          </div>
                          <div dir="auto">Is it not just missing
                            something like</div>
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
                      This is already implicit by DEPENDS += "protobuf".
                      Take a look at my second suggestion. You can see
                      that ${bindir} is staged for native recipes, but
                      not for nativesdk.<br>
                      <br>
                      <blockquote type="cite">
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
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                                <div>
                                  <div> <br>
                                    2. oe-core based solution:<br>
                                    ---
                                    a/meta/classes-global/staging.bbclass<br>
                                    +++
                                    b/meta/classes-global/staging.bbclass<br>
                                    @@ -26,6 +26,7 @@
                                    SYSROOT_DIRS_NATIVE = " \<br>
                                         ${localstatedir} \<br>
                                     "<br>
                                     SYSROOT_DIRS:append:class-native =
                                    " ${SYSROOT_DIRS_NATIVE}"<br>
                                    +SYSROOT_DIRS:append:class-nativesdk
                                    = " ${SYSROOT_DIRS_NATIVE}"<br>
                                     SYSROOT_DIRS:append:class-cross = "
                                    ${SYSROOT_DIRS_NATIVE}"<br>
                                     SYSROOT_DIRS:append:class-crosssdk
                                    = " ${SYSROOT_DIRS_NATIVE}"<br>
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
                                  <blockquote type="cite">
                                    <div dir="ltr">
                                      <div>DEPENDS += "protobuf" is
                                        enough to have dependencies
                                        resolved.</div>
                                      <div><br>
                                      </div>
                                      <div>Problem is that bitbake's
                                        do_populate_sysroot does not
                                        take anything from bindir.</div>
                                      <div>This leads to
                                        nativesdk-(qt)grpc's
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
                                    <div class="gmail_quote">
                                      <div dir="ltr" class="gmail_attr">On
                                        Thu, 9 Nov 2023 at 12:19,
                                        Vyacheslav Yurkov &lt;<a
href="mailto:uvv.mail@gmail.com" rel="noreferrer" target="_blank"
                                          moz-do-not-send="true"
                                          class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                                        wrote:<br>
                                      </div>
                                      <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                                        <div>
                                          <div>Hi <span>Clément,<br>
                                              No, the issue is when you
                                              just build nativesdk
                                              recipe (we are not at the
                                              stage to use the SDK yet).<br>
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
  </body>
</html>

--------------uGwANyYO0uPFPr9NtkoROuvl--

