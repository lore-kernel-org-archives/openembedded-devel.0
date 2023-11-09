Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D9DC4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 15:05:26 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.123927.1699542318677859539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 07:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lW33CGX3;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so1573380a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 07:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699542317; x=1700147117; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH4fWJaGJLuepmnRZTcS87sHbNsGU1tyloS8kHfa/9o=;
        b=lW33CGX3bkTGWCj5cqzK7tPTk8XkJV3hg6PiSh0cO3jv3VNWctzlZUylGeDtv/QQjK
         YFTD0mmOmWoaEHqrUSiNipylEqpl3gpfVjhncUOUY2iyYEoPar6ISUoHFfQw0kZwq2CH
         /JoKSkSNYEnBvWgPXTBi54+VLo6qzC/Ei1p1xlv8zz76JEY9XzhXv6fiKWZElgF719AJ
         jlr3n2trwJ86d7EJm8xnq9O6Cy7j9AQfQzefOIS9iUqtTKqTnxcO/sF/08sl1G5GEjMR
         I2mNZiGCoNvHmsJERB8Dd9OjIRAIQUbr78IqrPNQ/Dcghsp1m7xdpA7yYGT8+THTnZ7c
         6HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699542317; x=1700147117;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OH4fWJaGJLuepmnRZTcS87sHbNsGU1tyloS8kHfa/9o=;
        b=dj7deOt9WrbPVD7fDTdm5nobPjXz13IeyeoR1mSERRdMl4YMT5hPV2Z7qc9Cp75SVr
         AMcBz0f7d2VqdgkDGs33OeiKIcwOaHwV6JfNpARV+sntIACmUfygh0vtNEcwpO3lCj0H
         lMu4UUhPOODBRzTwGnYorf+hLklzx5x8rRBi1N+IJ9MAw+f7OOqIisv0DtvVOc1qjLNW
         CsdqXC0ZWAPELB8dsq/HuKZMxbPD3RNYLb9+fYkK8nSvv5c062Y3fSVYv/KQUL8T3/Ni
         jz1byNvZI6xvvBBQ9KMxiJ2+I3wNB4/txkYCukJUk7H/eBHYrQOHc1wR/wn+tUO1jGjM
         GQLQ==
X-Gm-Message-State: AOJu0YzJUCddMrdriGqnjr/DRem2C1YnIUwgPlIwmlztKEka5lKpjmRG
	vHMyU46v4VF0HVNq4k2CC4c=
X-Google-Smtp-Source: AGHT+IFVMv5XqUTzEYCZiVqVc++H3nN5zP7u+jommxv3VstyJRESRC5Rp32Au+xzRXC++3sAMHmwsQ==
X-Received: by 2002:a17:906:fe41:b0:9d5:ecf9:e6b5 with SMTP id wz1-20020a170906fe4100b009d5ecf9e6b5mr3930241ejb.59.1699542316693;
        Thu, 09 Nov 2023 07:05:16 -0800 (PST)
Received: from [10.134.43.36] ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id kj3-20020a170907764300b009bf7a4d591csm2704204ejc.11.2023.11.09.07.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 07:05:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------w6iRibVyWvPmb3dn04HPNG07"
Message-ID: <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com>
Date: Thu, 9 Nov 2023 16:05:15 +0100
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
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
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
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 15:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106519

This is a multi-part message in MIME format.
--------------w6iRibVyWvPmb3dn04HPNG07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the explanation, that was the missing piece for me to get an 
understanding of the problem :)

I think it's not only me, but also others, were confused by the fact 
that we are talking about native(sdk), but try to fix something with a 
non-native variable.

I've just gave it a try and have two suggestions how this can be addressed.

1. Recipe based solution:
SYSROOT_DIRS:append:class-nativesdk = " $bindir}"

2. oe-core based solution:
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \
      ${localstatedir} \
  "
  SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
+SYSROOT_DIRS:append:class-nativesdk = " ${SYSROOT_DIRS_NATIVE}"
  SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
  SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"

The second one will invalidate nativesdk sstate, but might cover not 
only grpc issue (I would assume gdbus-codegen or any other generator has 
the same issue when used for SDK build).

What are your thoughs?

Thanks,
Slava

On 09.11.2023 14:35, Samuli Piippo wrote:
> DEPENDS += "protobuf" is enough to have dependencies resolved.
>
> Problem is that bitbake's do_populate_sysroot does not take anything 
> from bindir.
> This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to not 
> get the protoc binary into the recipe_sysroot as expected by CMake.
>
> This can be fixed with SYSROOT_DIRS.
>
> On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
>     Hi Clément,
>     No, the issue is when you just build nativesdk recipe (we are not
>     at the stage to use the SDK yet).
>
>     And that was exactly my question how to propagate the dependency
>     correctly for nativesdk build.
>
>     Regards,
>     Slava
>

--------------w6iRibVyWvPmb3dn04HPNG07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Thanks for the explanation, that was
      the missing piece for me to get an understanding of the problem :)<br>
      <br>
      I think it's not only me, but also others, were confused by the
      fact that we are talking about native(sdk), but try to fix
      something with a non-native variable.<br>
      <br>
      I've just gave it a try and have two suggestions how this can be
      addressed.<br>
      <br>
      1. Recipe based solution:<br>
      SYSROOT_DIRS:append:class-nativesdk = " $bindir}"<br>
      <br>
      2. oe-core based solution:<br>
      --- a/meta/classes-global/staging.bbclass<br>
      +++ b/meta/classes-global/staging.bbclass<br>
      @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \<br>
           ${localstatedir} \<br>
       "<br>
       SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"<br>
      +SYSROOT_DIRS:append:class-nativesdk = " ${SYSROOT_DIRS_NATIVE}"<br>
       SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"<br>
       SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"<br>
      <br>
      The second one will invalidate nativesdk sstate, but might cover
      not only grpc issue (I would assume gdbus-codegen or any other
      generator has the same issue when used for SDK build).<br>
      <br>
      What are your thoughs?<br>
      <br>
      Thanks,<br>
      Slava<br>
      <br>
      On 09.11.2023 14:35, Samuli Piippo wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>DEPENDS += "protobuf" is enough to have dependencies
          resolved.</div>
        <div><br>
        </div>
        <div>Problem is that bitbake's do_populate_sysroot does not take
          anything from bindir.</div>
        <div>This leads to nativesdk-(qt)grpc's
          do_prepare_recipe_sysroot to not get the protoc binary into
          the recipe_sysroot as expected by CMake.<br>
        </div>
        <div><br>
        </div>
        <div>This can be fixed with SYSROOT_DIRS.<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, 9 Nov 2023 at 12:19,
          Vyacheslav Yurkov &lt;<a href="mailto:uvv.mail@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>Hi <span>Clément,<br>
                No, the issue is when you just build nativesdk recipe
                (we are not at the stage to use the SDK yet).<br>
                <br>
                And that was exactly my question how to propagate the
                dependency correctly for nativesdk build.<br>
                <br>
                Regards,<br>
                Slava<br>
              </span></div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------w6iRibVyWvPmb3dn04HPNG07--

