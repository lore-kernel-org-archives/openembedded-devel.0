Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3908CCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 06:17:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.48749.1697782659463635026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 23:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cW/nT79K;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so587452a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 23:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697782657; x=1698387457; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn6J3YDzdaMGbmwu1LcgaEb5XlEqdIqagU8jnHVYo7A=;
        b=cW/nT79KakVLHGUhFDtmedanE/Tv1RI8yOg3Wg/mHSuisnE+KpBqczrfu7zxw0t+yS
         Zt5kPd7WSgy9SW9vibckvYhao/oOfdKfLKwMFSPcrerBkrStbd4iNpYuPL8+SUDHYRZu
         hqz8PSVrH2QKO8CrsoXjnlIslALaPgY0LGqiFYXzkOs/ahOgmouFGTFvUYhyEWm3QEhr
         BLGppP0Q32QO17yg979iTPRyPnsXj2NzLhxBI9miN7dO0/E23Nqc++tyleWH9dKyo4ki
         E4VsuaE2dxcUhl9EXpV/zSFvtgf5IRhhI1XZAxBLxc/90n9+v0aDqi3HQZ+2SK297Pre
         FUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697782657; x=1698387457;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fn6J3YDzdaMGbmwu1LcgaEb5XlEqdIqagU8jnHVYo7A=;
        b=taO/LLayUY327BjrGY1vXLwznU7sWeqFXEKtC0QzkLZVOpufirCFfYomQ36JXCmXh2
         wXFAWRuGbB1sOmPkTS+bxeTmd7Re18vMJSsSqfhWw6V2TYV8Q4RI+5tnyMFT1k0k6Ptw
         ybDInA8UIAJmMXPQFkdn8RDwDEcqDjEZU75kFUULXanr1DNoG1whItoXgSVrg9bszZ3d
         X0NLw4JSYfmveiUsPU9zYAxp8Dziq69+stdYqSSXgavccuvZ/ec1WIfKb3ZDh9E7zS9z
         KgvyZ2Jcs8ho3XiPeSQFlOw0dWpFXYO/B/TxNhRU/kmr6O1XBT9uWW7zJvi/Rms2Kh9d
         ubtA==
X-Gm-Message-State: AOJu0YyZQQw3apxc8Iedt1L8zoaC07i3DF3f1WE3V+wxXzsinxjcFEnk
	xJKt8gGezySjiinHvDpT6ik=
X-Google-Smtp-Source: AGHT+IFGxpWKIr2gCLyUVUriTNdFVVQirGoJw3nAn1hyMZXO1+DNReb8JElzNVmOSg026YWSS7yp5g==
X-Received: by 2002:a17:907:a03:b0:9c7:5b43:a8ee with SMTP id bb3-20020a1709070a0300b009c75b43a8eemr577613ejc.74.1697782657032;
        Thu, 19 Oct 2023 23:17:37 -0700 (PDT)
Received: from [10.134.44.77] ([89.249.73.139])
        by smtp.gmail.com with ESMTPSA id j14-20020a1709064b4e00b009ad778a68c5sm832571ejv.60.2023.10.19.23.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 23:17:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------U6ZZHeWaXYt60oe7cA78kOyL"
Message-ID: <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
Date: Fri, 20 Oct 2023 08:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Content-Language: en-US
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20230930173003.3210-1-peron.clem@gmail.com>
 <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org>
 <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 06:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105610

This is a multi-part message in MIME format.
--------------U6ZZHeWaXYt60oe7cA78kOyL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I think the problem goes down to how dependencies are populated in the 
sysroot. I raised this question in oe-core mailing list 
https://lists.openembedded.org/g/openembedded-core/message/189324 , but 
didn't get an answer yet.

DEPENDS += "protobuf" will only install the main package of protobuf to 
the sysroot, because it assumes that nativesdk-protobuf-compiler is also 
part of the main package (which is not). I guess the part of the system 
populating sysroot deals with recipes only, and not with packages. I'm 
still trying to understand how that should be addressed properly.
My understanding is that either all packages should be installed to 
sysroot (which recipe claims it provides), or we need a way to indicate 
a package level dependency (i.e. nativesdk-protobuf-compiler in this case)

Any ideas?

Slava

On 18.10.2023 14:28, Samuli Piippo wrote:
> Following simple test recipe will fail now when trying to use Protobuf 
> with CMake.
>
> inherit cmake
> DEPENDS += "protobuf"
>
> do_configure:prepend() {
>     echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
> }
>
> BBCLASSEXTEND = "nativesdk"
>
> ---
> CMake Error at 
> tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107 
> (message):
>   The imported target "protobuf::protoc" references the file
>
>  "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>
>   but this file does not exist.
> ---
>
> I don't quite see why every project/recipe should fix this 
> independently when the simple workaround for this yocto-specific issue 
> is available (namely the use of SYSROOT_DIRS).
>
> -samuli
>
> ps. qtgrpc recipe and other Qt6 recipes are now visible in the 
> layerindex https://layers.openembedded.org/layerindex/recipe/348210/
>
>
> On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov <uvv.mail@gmail.com> 
> wrote:
>
>     I'd like to follow-up on this and say that I see this issue now
>     with nativesdk build, in particular nativesdk-grpc recipe fails in
>     master with the same error. I hope that's partially related to the
>     issue everybody is confused about, but I'd like understand how to
>     properly fix it.
>
>     |   The imported target "protobuf::protoc" references the file
>     |
>     |
>     "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>     |
>     |   but this file does not exist.  Possible reasons include:
>     |
>     |   * The file was deleted, renamed, or moved to another location.
>
>     The protoc-23.4.0 file already exists in the recipe-sysroot-native.
>
>     And we do want protoc to be present in the SDK, but nativesdk
>     build is a cross-compilation, because SDKMACHINE and HOST might be
>     different.
>     In this particular grpc case there's an option to say where the
>     actual protoc executable is (
>     -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
>     is passed to grpc).
>
>     So there shouldn't be any issues here, but nativesdk build still
>     fails.
>
>     Looking into it further I see that protoc is actually packaged by
>     protobuf-compiler package, but when I try to add a package
>     dependency to grpc recipe I get this:
>
>     nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler
>
>     Moreover, if I go into devshell and forcefully install
>     nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is
>     happy and compiles!
>
>     So something wrong with the dependencies in protobuf recipe, but I
>     can't figure out yet what exactly. Any ideas?
>
>     Regards,
>     Slava
>
--------------U6ZZHeWaXYt60oe7cA78kOyL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">I think the problem goes down to how
      dependencies are populated in the sysroot. I raised this question
      in oe-core mailing list
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/189324">https://lists.openembedded.org/g/openembedded-core/message/189324</a>
      , but didn't get an answer yet.<br>
      <br>
      DEPENDS += "protobuf" will only install the main package of
      protobuf to the sysroot, because it assumes that
      nativesdk-protobuf-compiler is also part of the main package
      (which is not). I guess the part of the system populating sysroot
      deals with recipes only, and not with packages. I'm still trying
      to understand how that should be addressed properly.<br>
      My understanding is that either all packages should be installed
      to sysroot (which recipe claims it provides), or we need a way to
      indicate a package level dependency (i.e.
      nativesdk-protobuf-compiler in this case)<br>
      <br>
      Any ideas?<br>
      <br>
      Slava<br>
      <br>
      On 18.10.2023 14:28, Samuli Piippo wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Following simple test recipe will fail now when trying to
          use Protobuf with CMake. </div>
        <div><br>
        </div>
        <div>inherit cmake<br>
          DEPENDS += "protobuf"<br>
          <br>
          do_configure:prepend() {<br>
              echo "find_package(Protobuf CONFIG)" &gt;
          ${S}/CMakeLists.txt<br>
          }<br>
          <br>
          BBCLASSEXTEND = "nativesdk"</div>
        <div><br>
        </div>
        <div>---</div>
        <div>CMake Error at
tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107
          (message):<br>
            The imported target "protobuf::protoc" references the file<br>
          <br>
             
 "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"<br>
          <br>
            but this file does not exist.</div>
        <div>---<br>
        </div>
        <div><br>
        </div>
        <div>I don't quite see why every project/recipe should fix this
          independently when the simple workaround for this
          yocto-specific issue is available (namely the use
          of SYSROOT_DIRS).</div>
        <div><br>
        </div>
        <div>-samuli</div>
        <div><br>
        </div>
        <div>ps. qtgrpc recipe and other Qt6 recipes are now visible in
          the layerindex <a
href="https://layers.openembedded.org/layerindex/recipe/348210/"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/recipe/348210/</a></div>
        <div><br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, 12 Oct 2023 at 15:06,
          Vyacheslav Yurkov &lt;<a href="mailto:uvv.mail@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>I'd like to follow-up on this and say that I see this
              issue now with nativesdk build, in particular
              nativesdk-grpc recipe fails in master with the same error.
              I hope that's partially related to the issue everybody is
              confused about, but I'd like understand how to properly
              fix it.<br>
              <br>
              |   The imported target "protobuf::protoc" references the
              file<br>
              | <br>
              |     
"/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"<br>
              | <br>
              |   but this file does not exist.  Possible reasons
              include:<br>
              | <br>
              |   * The file was deleted, renamed, or moved to another
              location.<br>
              <br>
              The protoc-23.4.0 file already exists in the
              recipe-sysroot-native.<br>
              <br>
              And we do want protoc to be present in the SDK, but
              nativesdk build is a cross-compilation, because SDKMACHINE
              and HOST might be different.<br>
              In this particular grpc case there's an option to say
              where the actual protoc executable is (
-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
              is passed to grpc). <br>
              <br>
              So there shouldn't be any issues here, but nativesdk build
              still fails.<br>
              <br>
              Looking into it further I see that protoc is actually
              packaged by protobuf-compiler package, but when I try to
              add a package dependency to grpc recipe I get this:<br>
              <br>
              nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler<br>
              <br>
              Moreover, if I go into devshell and forcefully install
              nativesdk-libprotobuf-compiler, then `bitbake
              nativesdk-grpc` is happy and compiles!<br>
              <br>
              So something wrong with the dependencies in protobuf
              recipe, but I can't figure out yet what exactly. Any
              ideas?<br>
              <br>
              Regards,<br>
              Slava<br>
              <br>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">
</pre>
  </body>
</html>

--------------U6ZZHeWaXYt60oe7cA78kOyL--

