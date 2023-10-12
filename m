Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E79CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:06:51 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.9459.1697112403727451015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cr7vhu2V;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1626537a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697112402; x=1697717202; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YfiMlbDGJTyktL1EjfPiAzNiadfczVL4Y2dQmOXbck=;
        b=Cr7vhu2V4MB7WENFDeYnvSnuG09XsDeopUjrgl/3b72v7iFU0OjqJcylIL12UsZzz1
         ITS4bVj9ds0BaS7QmYz1XfO4vd9O240zsYEIAx35kUS6VA+pBsbN0SOKts1uRkqjmXE1
         5eSGdgyPCi9PzllMITIOi/QunYr0MQwweyWhVhhHqIh1T1Kg6DUKE/Xs6H08XiZ1aWyo
         MzjrUtc8OqsbFyZEn+h6jVA21FB5/2GtJpuitJuzkJItbw4ok7xgIGp4VqYk1FvqOK3n
         ioycPIjWO3utyG98TCK/6dpSUTaUpiaOHxwa072e1zNydk4x3+bQifhJXid83XKbWnQP
         ZixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112402; x=1697717202;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5YfiMlbDGJTyktL1EjfPiAzNiadfczVL4Y2dQmOXbck=;
        b=FiuCYHo5YH7oO3E3vfMibZI6lLkhnsJKHhZNbus3wpWevDbuLntUeeVmsEHPqjoiQi
         aGk6eOHAOT7Fg6zv+wb41EgdveJnPlpIW/s5k0GLSuZhyHXiiwFQIk8IZYnF8uyPhu4u
         j96ZO33NXI9eVngMOcpd9U15G4pEK00qX0PwC8CPNXndXpv+cbSxat9yeyEboWYuxEn/
         CycSIKm/TVI9ZVIdxWp+YXNtB8tkD54RTuE+Qpc3fEWgquGKMIjzMU2RbWFV2WniDKZE
         ohq3cup1jvZkQBbwu5vC711mMkAhdUz7lV10gQkCbasrL8f2OvqU86m3zF5lMTJcZmA9
         HBNA==
X-Gm-Message-State: AOJu0YxoIzQqm62S5x4sDlFMtDEvZCLqtDB1PmP9dh2z0l0886861TbR
	rBQlv7EZ9RiKw6kVuWpujVw=
X-Google-Smtp-Source: AGHT+IHKdm0Z0pma6BCdnIYmTjB+IEA3zK+YVHu7ugFhEYXCCzVaDOvDd1S9to6y5ogO6qw73nCxpg==
X-Received: by 2002:a05:6402:2889:b0:53d:9a37:5bcf with SMTP id eg9-20020a056402288900b0053d9a375bcfmr5662662edb.31.1697112401745;
        Thu, 12 Oct 2023 05:06:41 -0700 (PDT)
Received: from [10.134.47.38] ([89.249.73.140])
        by smtp.gmail.com with ESMTPSA id er24-20020a056402449800b0052febc781bfsm2898258edb.36.2023.10.12.05.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:06:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7iJzAa6pa3hRzZB7GIN0JYKY"
Message-ID: <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
Date: Thu, 12 Oct 2023 14:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>,
 Samuli Piippo <samuli.piippo@gmail.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20230930173003.3210-1-peron.clem@gmail.com>
 <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <178A5713556C6E82.9230@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 12:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105450

This is a multi-part message in MIME format.
--------------7iJzAa6pa3hRzZB7GIN0JYKY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I'd like to follow-up on this and say that I see this issue now with 
nativesdk build, in particular nativesdk-grpc recipe fails in master 
with the same error. I hope that's partially related to the issue 
everybody is confused about, but I'd like understand how to properly fix it.

|   The imported target "protobuf::protoc" references the file
|
| 
"/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.

The protoc-23.4.0 file already exists in the recipe-sysroot-native.

And we do want protoc to be present in the SDK, but nativesdk build is a 
cross-compilation, because SDKMACHINE and HOST might be different.
In this particular grpc case there's an option to say where the actual 
protoc executable is ( 
-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc 
is passed to grpc).

So there shouldn't be any issues here, but nativesdk build still fails.

Looking into it further I see that protoc is actually packaged by 
protobuf-compiler package, but when I try to add a package dependency to 
grpc recipe I get this:

nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler

Moreover, if I go into devshell and forcefully install 
nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is happy 
and compiles!

So something wrong with the dependencies in protobuf recipe, but I can't 
figure out yet what exactly. Any ideas?

Regards,
Slava

On 02.10.2023 18:25, Vyacheslav Yurkov via lists.openembedded.org wrote:
> On 01.10.2023 20:22, Martin Jansa wrote:
>>
>> Issue with .cmake file from protobuf, right?
>
> No, it's the issue with the cmake of the project that uses protobuf. 
> But that depends on a user case, perhaps I didn't get it properly.
>
>>     If we can properly fix it at the recipe level, then why should we
>>     keep this workaround/hack?
>>
>>     Also if you really need it, you can have a .bbappend for
>>     protoc/grpc in the downstream layer. But I would be in favor to
>>     avoid this by default no?
>>
>>
>> I haven't seen any proper fix for this exact issue. Yes you can patch 
>> .cmake generation not to include bindir when building for target 
>> (while it needs it for native build), but then that change will break 
>> possible use of protobuf on target, so the SYSROOT_DIRS still seems 
>> like lesser evil here.
>>
>> Here are some examples from meta-ros:
>> https://github.com/ros/meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a62cc
>> https://github.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c
>> https://github.com/ros/meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c4104533
>> https://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf
>>
>> I don't care about protobuf, but the explanation from Samuli looks 
>> like the same issue as what I remember from above and I don't see how 
>> SYSROOT_DIRS causes mixing executables or any issues for installing 
>> them for target.
>
> I didn't look at the original issue of Samuli, but your issue is also 
> fixed by a workaround. IMHO, the proper fix would be not to make CMake 
> "happy" by providing a binary it can't use, but a proper export of 
> cross-compiled tools for 
> https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt 
> library. I'd say the workflow should be similar to protobuf/grpc 
> recipes, i.e. a native recipe builds the libraries only, and the 
> target recipe builds tools and libraries.
>
> Regards,
> Slava

--------------7iJzAa6pa3hRzZB7GIN0JYKY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">I'd like to follow-up on this and say
      that I see this issue now with nativesdk build, in particular
      nativesdk-grpc recipe fails in master with the same error. I hope
      that's partially related to the issue everybody is confused about,
      but I'd like understand how to properly fix it.<br>
      <br>
      |   The imported target "protobuf::protoc" references the file<br>
      | <br>
      |     
"/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-23.4.0"<br>
      | <br>
      |   but this file does not exist.  Possible reasons include:<br>
      | <br>
      |   * The file was deleted, renamed, or moved to another location.<br>
      <br>
      The protoc-23.4.0 file already exists in the
      recipe-sysroot-native.<br>
      <br>
      And we do want protoc to be present in the SDK, but nativesdk
      build is a cross-compilation, because SDKMACHINE and HOST might be
      different.<br>
      In this particular grpc case there's an option to say where the
      actual protoc executable is (
-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=/home/uvv/projects/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc
      is passed to grpc). <br>
      <br>
      So there shouldn't be any issues here, but nativesdk build still
      fails.<br>
      <br>
      Looking into it further I see that protoc is actually packaged by
      protobuf-compiler package, but when I try to add a package
      dependency to grpc recipe I get this:<br>
      <br>
      nativesdk-protobuf RPROVIDES nativesdk-protobuf-compiler<br>
      <br>
      Moreover, if I go into devshell and forcefully install
      nativesdk-libprotobuf-compiler, then `bitbake nativesdk-grpc` is
      happy and compiles!<br>
      <br>
      So something wrong with the dependencies in protobuf recipe, but I
      can't figure out yet what exactly. Any ideas?<br>
      <br>
      Regards,<br>
      Slava<br>
      <br>
      On 02.10.2023 18:25, Vyacheslav Yurkov via lists.openembedded.org
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:178A5713556C6E82.9230@lists.openembedded.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 01.10.2023 20:22, Martin Jansa
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com">
        <br>
        <div dir="ltr">
          <div class="gmail_quote">
            <div>Issue with .cmake file from protobuf, right?</div>
          </div>
        </div>
      </blockquote>
      <br>
      No, it's the issue with the cmake of the project that uses
      protobuf. But that depends on a user case, perhaps I didn't get it
      properly.<br>
      <br>
      <blockquote type="cite"
cite="mid:CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com">
        <div dir="ltr">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div dir="ltr">
                <div><span class="gmail_default"
                    style="font-family:monospace">If w</span><span
                    class="gmail_default">e can properly fix it at the
                    recipe level, then why should we keep this
                    workaround/hack?</span></div>
                <div><span class="gmail_default"><br>
                  </span></div>
                <div><span class="gmail_default">Also if you really need
                    it, you can have a .bbappend for protoc/grpc in the
                    downstream layer. But I would be in favor to avoid
                    this by default no?</span></div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I haven't seen any proper fix for this exact issue. Yes
              you can patch .cmake generation not to include bindir when
              building for target (while it needs it for native build),
              but then that change will break possible use of protobuf
              on target, so the SYSROOT_DIRS still seems like lesser
              evil here.</div>
            <div><br>
            </div>
            <div>Here are some examples from meta-ros:</div>
            <div><a
href="https://github.com/ros/meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a62cc"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/ros/meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a62cc</a><br>
            </div>
            <div><a
href="https://github.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c</a><br>
            </div>
            <div><a
href="https://github.com/ros/meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c4104533"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/ros/meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c4104533</a><br>
            </div>
            <div><a
href="https://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf</a><br>
            </div>
            <div><br>
            </div>
            <div>I don't care about protobuf, but the explanation from
              Samuli looks like the same issue as what I remember from
              above and I don't see how SYSROOT_DIRS causes mixing
              executables or any issues for installing them for target.</div>
          </div>
        </div>
      </blockquote>
      <br>
      I didn't look at the original issue of Samuli, but your issue is
      also fixed by a workaround. IMHO, the proper fix would be not to
      make CMake "happy" by providing a binary it can't use, but a
      proper export of cross-compiled tools for <a
        class="moz-txt-link-freetext"
href="https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt"
        moz-do-not-send="true">https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt</a>
      library. I'd say the workflow should be similar to protobuf/grpc
      recipes, i.e. a native recipe builds the libraries only, and the
      target recipe builds tools and libraries.<br>
      <br>
      Regards,<br>
      Slava</blockquote>
    <br>
  </body>
</html>

--------------7iJzAa6pa3hRzZB7GIN0JYKY--

