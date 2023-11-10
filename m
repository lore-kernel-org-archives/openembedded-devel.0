Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58832C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 07:39:03 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.23261.1699601939522023749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 23:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKRMG+L2;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso278598666b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 23:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699601938; x=1700206738; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXXfEvq4xziszuZGNrsD6n+yGDM4j3jdDJ3tkhuJZcc=;
        b=hKRMG+L2oIv1ex7+vWPX5d+iim1IKm73dL+ph7QSdaLFg2QW7/I+Tsk1kIJGo0bmPV
         ne9QVPRz2wRA5W03oktWwoZPMYEtpEUAK10vShnZJEK/ftTb0wvfLM4oIJVfOI0TIrUY
         Rh7oyvxj7+SWAQVCUVwR2KEzrnVZc6yq010l8dnfJruky0RtFrxjyiHhbPSRUe14xRpQ
         y1Xyxt0k/gLxXA3la1CrizaYTLXP/IN51++30Huje9gnYVfBYPXTn/UlCi3DWb+Uai5m
         xOtqKtdkeVJTOuswZjeObPzy+S1vhd8T22YKvo7r1l0uXleG5c/2ixdNwdatksXb9BXe
         2ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699601938; x=1700206738;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXXfEvq4xziszuZGNrsD6n+yGDM4j3jdDJ3tkhuJZcc=;
        b=Qu7EcGrejzh6+rYk3C0/FVehLWJUNtMnoEsiJ2XTeJoxNy9f9o/AblLE8N6lEFSy4Y
         IAZGplJHEvU7PqGBSGyYC8U/qNHtk3mfESZuCjM0ljPmIlP55+1e7U9KdOyL6HJQlV6P
         1cwfS3VNalhXXnkleLEWTGEdK6N1SKF5rK3Cz26BCHi2T/aci3+V3Y7XRgRpn8xWiy5b
         YYWClhopekblFSAzmmKCZsdZapDrJv0UQUJE2LTIz2jDa3QggXb3cNtNFjotnoAxCJc9
         7qc6e4vn2TpRMMtPnhc6lWipPDWWcFyeJnZ1PIccEdlgBTm16FupHrL+dn8wuG6Btzl8
         JCxQ==
X-Gm-Message-State: AOJu0Yy+UY1x2PZRwa6NgyLiFfrQNsyJ0WCEnuj6cew2aQczC6tPEgbs
	5ahEQH3ZE7qO9UJacL0YCJE=
X-Google-Smtp-Source: AGHT+IFx7O/h8D4uIigQ28v6LOWOsFNHLL/C1AQWkjO+8xv7jY+jvhNRw/2MRpCNp/eFiG7o0J6+Gg==
X-Received: by 2002:a17:907:97cd:b0:9be:562:a44a with SMTP id js13-20020a17090797cd00b009be0562a44amr5663667ejc.23.1699601937510;
        Thu, 09 Nov 2023 23:38:57 -0800 (PST)
Received: from [10.134.43.51] ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id vo16-20020a170907a81000b009e656ce2930sm295833ejc.60.2023.11.09.23.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 23:38:57 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------wz0UmxyLbiJl624E0o0U0iIX"
Message-ID: <dbe15c1d-bbcd-4808-927c-a5f9962de0ec@gmail.com>
Date: Fri, 10 Nov 2023 08:38:55 +0100
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
 <17962EA21B11FB58.7380@lists.openembedded.org>
 <1d41118c-a5f9-45c0-8c77-236815e22f3f@gmail.com>
 <CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 07:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106528

This is a multi-part message in MIME format.
--------------wz0UmxyLbiJl624E0o0U0iIX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

You sure? Because I remember the test in grpc to check for 
CROSS_COMPILING in cmake to avoid that.

Slava

On 10.11.2023 08:12, Samuli Piippo wrote:
> This is not strictly a nativesdk issue.
> If you enable PACKAGECONFIG = "compiler" for protobuf, it will then 
> build protoc for the target.
> This will then cause grpc target build to fail in the same way as 
> nativesdk build.
>
> On Fri, 10 Nov 2023 at 08:40, Vyacheslav Yurkov <uvv.mail@gmail.com> 
> wrote:
>
>     FTR, I suggested oe-core solution in the corresponding mailing list.
>
>     Slava
>
>     On 10.11.2023 07:19, Vyacheslav Yurkov via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>>     On 10.11.2023 02:23, Clément Péron wrote:
>>>     Hi Samuli,
>>>
>>>     Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov
>>>     <uvv.mail@gmail.com> a écrit :
>>>
>>>         Thanks for the explanation, that was the missing piece for
>>>         me to get an understanding of the problem :)
>>>
>>>         I think it's not only me, but also others, were confused by
>>>         the fact that we are talking about native(sdk), but try to
>>>         fix something with a non-native variable.
>>>
>>>         I've just gave it a try and have two suggestions how this
>>>         can be addressed.
>>>
>>>         1. Recipe based solution:
>>>         SYSROOT_DIRS:append:class-nativesdk = " $bindir}"
>>>
>>>
>>>     Is it not just missing something like
>>>
>>>     DEPENDS:append:class-nativesdk= " protobuf-native "
>>>     Regards
>>>     Clement
>>
>>     This is already implicit by DEPENDS += "protobuf". Take a look at
>>     my second suggestion. You can see that ${bindir} is staged for
>>     native recipes, but not for nativesdk.
>>
>>>
>>>         2. oe-core based solution:
>>>         --- a/meta/classes-global/staging.bbclass
>>>         +++ b/meta/classes-global/staging.bbclass
>>>         @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \
>>>              ${localstatedir} \
>>>          "
>>>          SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
>>>         +SYSROOT_DIRS:append:class-nativesdk = " ${SYSROOT_DIRS_NATIVE}"
>>>          SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
>>>          SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
>>>
>>>         The second one will invalidate nativesdk sstate, but might
>>>         cover not only grpc issue (I would assume gdbus-codegen or
>>>         any other generator has the same issue when used for SDK build).
>>>
>>>         What are your thoughs?
>>>
>>>         Thanks,
>>>         Slava
>>>
>>>         On 09.11.2023 14:35, Samuli Piippo wrote:
>>>>         DEPENDS += "protobuf" is enough to have dependencies resolved.
>>>>
>>>>         Problem is that bitbake's do_populate_sysroot does not take
>>>>         anything from bindir.
>>>>         This leads to nativesdk-(qt)grpc's
>>>>         do_prepare_recipe_sysroot to not get the protoc binary into
>>>>         the recipe_sysroot as expected by CMake.
>>>>
>>>>         This can be fixed with SYSROOT_DIRS.
>>>>
>>>>         On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov
>>>>         <uvv.mail@gmail.com> wrote:
>>>>
>>>>             Hi Clément,
>>>>             No, the issue is when you just build nativesdk recipe
>>>>             (we are not at the stage to use the SDK yet).
>>>>
>>>>             And that was exactly my question how to propagate the
>>>>             dependency correctly for nativesdk build.
>>>>
>>>>             Regards,
>>>>             Slava
>>>>

--------------wz0UmxyLbiJl624E0o0U0iIX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">You sure? Because I remember the test
      in grpc to check for CROSS_COMPILING in cmake to avoid that.<br>
      <br>
      Slava<br>
      <br>
      On 10.11.2023 08:12, Samuli Piippo wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoW0iSURvM2f9xe_d-r0Vu3LZHsksiep0ZmSMRYt_i+hXg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>This is not strictly a nativesdk issue.</div>
        <div>If you enable PACKAGECONFIG = "compiler" for protobuf, it
          will then build protoc for the target.</div>
        <div>This will then cause grpc target build to fail in the same
          way as nativesdk build.<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 10 Nov 2023 at 08:40,
          Vyacheslav Yurkov &lt;<a href="mailto:uvv.mail@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>FTR, I suggested oe-core solution in the corresponding
              mailing list.<br>
              <br>
              Slava<br>
              <br>
              On 10.11.2023 07:19, Vyacheslav Yurkov via <a
                href="http://lists.openembedded.org" target="_blank"
                moz-do-not-send="true">lists.openembedded.org</a> wrote:<br>
            </div>
            <blockquote type="cite">
              <div>On 10.11.2023 02:23, Clément Péron wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="auto">
                  <div>Hi Samuli,<br>
                    <br>
                    <div class="gmail_quote">
                      <div dir="ltr" class="gmail_attr">Le ven. 10 nov.
                        2023, 00:05, Vyacheslav Yurkov &lt;<a
                          href="mailto:uvv.mail@gmail.com"
                          target="_blank" moz-do-not-send="true"
                          class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                        a écrit :<br>
                      </div>
                      <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                        <div>
                          <div>Thanks for the explanation, that was the
                            missing piece for me to get an understanding
                            of the problem :)<br>
                            <br>
                            I think it's not only me, but also others,
                            were confused by the fact that we are
                            talking about native(sdk), but try to fix
                            something with a non-native variable.<br>
                            <br>
                            I've just gave it a try and have two
                            suggestions how this can be addressed.<br>
                            <br>
                            1. Recipe based solution:<br>
                            SYSROOT_DIRS:append:class-nativesdk = "
                            $bindir}"<br>
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
              This is already implicit by DEPENDS += "protobuf". Take a
              look at my second suggestion. You can see that ${bindir}
              is staged for native recipes, but not for nativesdk.<br>
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
                          <blockquote type="cite">
                            <div dir="ltr">
                              <div>DEPENDS += "protobuf" is enough to
                                have dependencies resolved.</div>
                              <div><br>
                              </div>
                              <div>Problem is that bitbake's
                                do_populate_sysroot does not take
                                anything from bindir.</div>
                              <div>This leads to nativesdk-(qt)grpc's
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
                            <div class="gmail_quote">
                              <div dir="ltr" class="gmail_attr">On Thu,
                                9 Nov 2023 at 12:19, Vyacheslav Yurkov
                                &lt;<a href="mailto:uvv.mail@gmail.com"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true"
                                  class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                                wrote:<br>
                              </div>
                              <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                                <div>
                                  <div>Hi <span>Clément,<br>
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
  </body>
</html>

--------------wz0UmxyLbiJl624E0o0U0iIX--

