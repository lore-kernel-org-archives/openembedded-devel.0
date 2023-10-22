Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09C6CDB474
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 18:46:05 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.104959.1698000357589519893
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Oct 2023 11:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGHIiiQJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso3855094a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Oct 2023 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698000356; x=1698605156; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImTLYvBg79sbjVvYCvboKOK2033uxZ2/HaTS/vXJIL8=;
        b=DGHIiiQJ7Ob4F9miBzk+Nu84A2BgbfoM0oHXCgmDpLFKw++qBPc5Hwz7E8l47ESj1b
         o9uppHfonW9MDup/QldbCLPdtbpRJm3iLtHd1FGgqO3s76RrUxluxR/FwabiKnat89Qg
         y3RFG/zIJbKkADiZILIDpoPfPo4tvHCC5Gz9l9HYto7NZRiojXIbY4GuArzRKHBPYSKU
         JrAh+ISz4mo0CllabDJVWmSzaPWle70WZYuDJNI4IYCaeBRmJ5ozPADb47f6Y4rTszFF
         fCfPfAja+FsstOKt/ansYVyxFnvDMW6WKBouF22fwrajzPZntO2x8uJegvE/dQVttYxL
         wDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698000356; x=1698605156;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImTLYvBg79sbjVvYCvboKOK2033uxZ2/HaTS/vXJIL8=;
        b=qEn1KtCEe0gbzCjSDyoZQcUOzTAQsNi002a+b6Yij8uuc7z96q83h8d94B/nQD/HOm
         bPCM+Y89y93R0Uv0xFE5ym/6ihVwkYYAvh783hNS/rE7ZpQCI8wviW2gvjuvynehjouj
         Ybz44JV8eCxe3DLil9fb05dee5Wb8LWTiWrwMwlhV4sftwxxxIC+tByppj+MUBwxEFIW
         c+eRn62BpjQPdF8qOpSeph1UGc0kM5TM1u7iaottTkeGNOMBaW0jTfORkfY3tLdyHWcd
         3qiwyZM6me7C/sPh7LvCy9bbHnlgfoPD3F0X5LtEy/l/+IemZ+r1FuxdRQS7+GU4DeiO
         LwVQ==
X-Gm-Message-State: AOJu0YxvWn38AG/1ECeR2r0ye7EpjgVYj59IyXGgfM5OpxbGB3eFaNfQ
	/BPyRwmX4lVWZ8xOgBTB+Lo=
X-Google-Smtp-Source: AGHT+IFM13ZUU3mCPvQl/T0t7W7LlI8cbbaS+XpZXeCTdVzKkB1wV1QX4WDAai1hEMU1UtvNAPMdbQ==
X-Received: by 2002:a17:907:6e91:b0:9be:fc31:8cd3 with SMTP id sh17-20020a1709076e9100b009befc318cd3mr6445688ejc.17.1698000355612;
        Sun, 22 Oct 2023 11:45:55 -0700 (PDT)
Received: from [10.134.48.187] ([89.249.73.141])
        by smtp.gmail.com with ESMTPSA id xa17-20020a170907b9d100b00982a92a849asm5424479ejc.91.2023.10.22.11.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 11:45:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------CRb0zyHjRhQ6JKHWhDQ7p0g7"
Message-ID: <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com>
Date: Sun, 22 Oct 2023 20:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
 Samuli Piippo <samuli.piippo@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com>
 <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Oct 2023 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105628

This is a multi-part message in MIME format.
--------------CRb0zyHjRhQ6JKHWhDQ7p0g7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I'm a bit confused here.

I just did 'find 
tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/ -name 
"protoc*"' and I see protoc binary only in recipe-sysroot-native. That 
tells me that protoc, which is a part of nativesdk-protobuf-compiler, is 
not installed to recipe-sysroot.

What am I missing here?

Slava

On 20.10.2023 09:35, Martin Jansa wrote:
> do_prepare_recipe_sysroot doesn't install any packages to RSS. Only 
> package manager on target or in do_rootfs uses packages.
>
> It installs the files from dependency populate_sysroot task.
>
> On Fri, Oct 20, 2023 at 9:11 AM Samuli Piippo 
> <samuli.piippo@gmail.com> wrote:
>
>     Dependency to the recipe name will always install all packages to RSS.
>     You can verify this by checking that the libprotoc.so from the
>     nativesdk-protobuf-compile package is in the sysroot.
>     The problem you are facing is the fact that binaries are not
>     installed into the sysroot (for nativesdk builds), so you are only
>     missing the bin/protoc-23.4.0 file.
>     The proposed and twice reverted fix for this is the aforementioned
>     SYSROOT_DIRS.
>
>     -samuli
>
>     On Fri, 20 Oct 2023 at 09:17, Vyacheslav Yurkov
>     <uvv.mail@gmail.com> wrote:
>
>         I think the problem goes down to how dependencies are
>         populated in the sysroot. I raised this question in oe-core
>         mailing list
>         https://lists.openembedded.org/g/openembedded-core/message/189324
>         , but didn't get an answer yet.
>
>         DEPENDS += "protobuf" will only install the main package of
>         protobuf to the sysroot, because it assumes that
>         nativesdk-protobuf-compiler is also part of the main package
>         (which is not). I guess the part of the system populating
>         sysroot deals with recipes only, and not with packages. I'm
>         still trying to understand how that should be addressed properly.
>         My understanding is that either all packages should be
>         installed to sysroot (which recipe claims it provides), or we
>         need a way to indicate a package level dependency (i.e.
>         nativesdk-protobuf-compiler in this case)
>
>         Any ideas?
>
>         Slava
>
>         On 18.10.2023 14:28, Samuli Piippo wrote:
>>         Following simple test recipe will fail now when trying to use
>>         Protobuf with CMake.
>>
>>         inherit cmake
>>         DEPENDS += "protobuf"
>>
>>         do_configure:prepend() {
>>             echo "find_package(Protobuf CONFIG)" > ${S}/CMakeLists.txt
>>         }
>>
>>         BBCLASSEXTEND = "nativesdk"
>>
>>         ---
>>         CMake Error at
>>         tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake:107
>>         (message):
>>           The imported target "protobuf::protoc" references the file
>>
>>          "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>>
>>           but this file does not exist.
>>         ---
>>
>>         I don't quite see why every project/recipe should fix this
>>         independently when the simple workaround for this
>>         yocto-specific issue is available (namely the use
>>         of SYSROOT_DIRS).
>>
>>         -samuli
>>
>>         ps. qtgrpc recipe and other Qt6 recipes are now visible in
>>         the layerindex
>>         https://layers.openembedded.org/layerindex/recipe/348210/
>>
>>
>>         On Thu, 12 Oct 2023 at 15:06, Vyacheslav Yurkov
>>         <uvv.mail@gmail.com> wrote:
>>
>>             I'd like to follow-up on this and say that I see this
>>             issue now with nativesdk build, in particular
>>             nativesdk-grpc recipe fails in master with the same
>>             error. I hope that's partially related to the issue
>>             everybody is confused about, but I'd like understand how
>>             to properly fix it.
>>
>>             |   The imported target "protobuf::protoc" references the
>>             file
>>             |
>>             |
>>             "/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
>>             |
>>             |   but this file does not exist.  Possible reasons include:
>>             |
>>             |   * The file was deleted, renamed, or moved to another
>>             location.
>>
>>             The protoc-23.4.0 file already exists in the
>>             recipe-sysroot-native.
>>
>>             And we do want protoc to be present in the SDK, but
>>             nativesdk build is a cross-compilation, because
>>             SDKMACHINE and HOST might be different.
>>             In this particular grpc case there's an option to say
>>             where the actual protoc executable is (
>>             -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
>>             is passed to grpc).
>>
>>             So there shouldn't be any issues here, but nativesdk
>>             build still fails.
>>
>>             Looking into it further I see that protoc is actually
>>             packaged by protobuf-compiler package, but when I try to
>>             add a package dependency to grpc recipe I get this:
>>
>>             nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler
>>
>>             Moreover, if I go into devshell and forcefully install
>>             nativesdk-libprotobuf-compiler, then `bitbake
>>             nativesdk-grpc` is happy and compiles!
>>
>>             So something wrong with the dependencies in protobuf
>>             recipe, but I can't figure out yet what exactly. Any ideas?
>>
>>             Regards,
>>             Slava
>>


--------------CRb0zyHjRhQ6JKHWhDQ7p0g7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">I'm a bit confused here.<br>
      <br>
      I just did 'find
      tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/
      -name "protoc*"' and I see protoc binary only in
      recipe-sysroot-native. That tells me that protoc, which is a part
      of nativesdk-protobuf-compiler, is not installed to
      recipe-sysroot.<br>
      <br>
      What am I missing here?<br>
      <br>
      Slava<br>
      <br>
      On 20.10.2023 09:35, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">do_prepare_recipe_sysroot doesn't install any
        packages to RSS. Only package manager on target or in do_rootfs
        uses packages.
        <div><br>
        </div>
        <div>It installs the files from dependency populate_sysroot
          task.</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Oct 20, 2023 at
          9:11 AM Samuli Piippo &lt;<a
            href="mailto:samuli.piippo@gmail.com" moz-do-not-send="true"
            class="moz-txt-link-freetext">samuli.piippo@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir="ltr">
            <div>Dependency to the recipe name will always install all
              packages to RSS.</div>
            <div>You can verify this by checking that the libprotoc.so
              from the nativesdk-protobuf-compile package is in the
              sysroot.</div>
            <div>The problem you are facing is the fact that binaries
              are not installed into the sysroot (for nativesdk builds),
              so you are only missing the bin/protoc-23.4.0 file.<br>
            </div>
            <div>The proposed and twice reverted fix for this is the
              aforementioned SYSROOT_DIRS.</div>
            <div><br>
            </div>
            <div>-samuli<br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Fri, 20 Oct 2023 at
              09:17, Vyacheslav Yurkov &lt;<a
                href="mailto:uvv.mail@gmail.com" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div>
                <div>I think the problem goes down to how dependencies
                  are populated in the sysroot. I raised this question
                  in oe-core mailing list <a
href="https://lists.openembedded.org/g/openembedded-core/message/189324"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/message/189324</a>
                  , but didn't get an answer yet.<br>
                  <br>
                  DEPENDS += "protobuf" will only install the main
                  package of protobuf to the sysroot, because it assumes
                  that nativesdk-protobuf-compiler is also part of the
                  main package (which is not). I guess the part of the
                  system populating sysroot deals with recipes only, and
                  not with packages. I'm still trying to understand how
                  that should be addressed properly.<br>
                  My understanding is that either all packages should be
                  installed to sysroot (which recipe claims it
                  provides), or we need a way to indicate a package
                  level dependency (i.e. nativesdk-protobuf-compiler in
                  this case)<br>
                  <br>
                  Any ideas?<br>
                  <br>
                  Slava<br>
                  <br>
                  On 18.10.2023 14:28, Samuli Piippo wrote:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>Following simple test recipe will fail now when
                      trying to use Protobuf with CMake. </div>
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
                        The imported target "protobuf::protoc"
                      references the file<br>
                      <br>
                         
 "tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-test/1.0/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"<br>
                      <br>
                        but this file does not exist.</div>
                    <div>---<br>
                    </div>
                    <div><br>
                    </div>
                    <div>I don't quite see why every project/recipe
                      should fix this independently when the simple
                      workaround for this yocto-specific issue is
                      available (namely the use of SYSROOT_DIRS).</div>
                    <div><br>
                    </div>
                    <div>-samuli</div>
                    <div><br>
                    </div>
                    <div>ps. qtgrpc recipe and other Qt6 recipes are now
                      visible in the layerindex <a
href="https://layers.openembedded.org/layerindex/recipe/348210/"
                        target="_blank" moz-do-not-send="true"
                        class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/recipe/348210/</a></div>
                    <div><br>
                    </div>
                  </div>
                  <br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Thu, 12 Oct
                      2023 at 15:06, Vyacheslav Yurkov &lt;<a
                        href="mailto:uvv.mail@gmail.com" target="_blank"
                        moz-do-not-send="true"
                        class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <div>I'd like to follow-up on this and say that
                          I see this issue now with nativesdk build, in
                          particular nativesdk-grpc recipe fails in
                          master with the same error. I hope that's
                          partially related to the issue everybody is
                          confused about, but I'd like understand how to
                          properly fix it.<br>
                          <br>
                          |   The imported target "protobuf::protoc"
                          references the file<br>
                          | <br>
                          |     
"/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"<br>
                          | <br>
                          |   but this file does not exist.  Possible
                          reasons include:<br>
                          | <br>
                          |   * The file was deleted, renamed, or moved
                          to another location.<br>
                          <br>
                          The protoc-23.4.0 file already exists in the
                          recipe-sysroot-native.<br>
                          <br>
                          And we do want protoc to be present in the
                          SDK, but nativesdk build is a
                          cross-compilation, because SDKMACHINE and HOST
                          might be different.<br>
                          In this particular grpc case there's an option
                          to say where the actual protoc executable is (
-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
                          is passed to grpc). <br>
                          <br>
                          So there shouldn't be any issues here, but
                          nativesdk build still fails.<br>
                          <br>
                          Looking into it further I see that protoc is
                          actually packaged by protobuf-compiler
                          package, but when I try to add a package
                          dependency to grpc recipe I get this:<br>
                          <br>
                          nativesdk-protobuf RPROVIDES
                          nativesdk-protobuf-compiler<br>
                          <br>
                          Moreover, if I go into devshell and forcefully
                          install nativesdk-libprotobuf-compiler, then
                          `bitbake nativesdk-grpc` is happy and
                          compiles!<br>
                          <br>
                          So something wrong with the dependencies in
                          protobuf recipe, but I can't figure out yet
                          what exactly. Any ideas?<br>
                          <br>
                          Regards,<br>
                          Slava<br>
                          <br>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </blockquote>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
    <br>
  </body>
</html>

--------------CRb0zyHjRhQ6JKHWhDQ7p0g7--

