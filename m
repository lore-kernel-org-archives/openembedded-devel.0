Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866DCE748F7
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 16:25:55 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.86720.1696263949835911781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 09:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2QOik2n;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9a9cd066db5so2438668366b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696263948; x=1696868748; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntyR/v60/xNXG+Mj1lfABhywe4Kyj4ScYU0HMlnaRy8=;
        b=d2QOik2nf1OSlVb8MIDJEbwk8MDAvz5O6vAO5ncagpnVe1vhtnRmNjLz2UoxNHV6vq
         Wnc3VdfluH6ihkxvm8IyTD/Gx3xaM9TV03Kbn0Tu8nhSj/ynpB/OUOnZXnlQ4n6G3o4O
         ZMcPAJ2Ukitm2i6QAkBYdTzr6U3W+Kqsx9Q7wRUlOOJWi4c1hdo4aRKKyHF4eDCN29XV
         DZExcyE2ZQxzSJ7IW10X8bCeNxfjvf7kHIoqG5qhtdzqgvlwccYeFI8MZAYSBkw75Jqa
         qwIY1hnAzBTQMVmrWqMBI+yIeoGnNgcGN+2F3m7DcaqPuUpph1Q2xfeDldPjUkicK+bE
         Ct4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696263948; x=1696868748;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ntyR/v60/xNXG+Mj1lfABhywe4Kyj4ScYU0HMlnaRy8=;
        b=jN7VHFMtzExgBhdA+g5uIn9L9wwzVfDMv67nay0iLZv0I4ZLKQE7TAdSnGTiEIy80z
         o7HmBSX7VBNpYcsZt+mTt85TIpbronwqL8TiBRf+oayncoZJpqbtuoPEw9hbGQuXpbC3
         aacT8eiYH/dQ2ykPLsgdRHPEX0SEq5zPdeBIobzSJwKQF6EGQ9rgzEL3OxMTtbb41KQC
         UzTNpWMDJxQdkQtwc/MyaI7Nt0cGmjk1M4MBWG27y85egj8TR7pu4GG7kBPaPwR2v/3Z
         Kmp0yiB8X4BexQJHwHPLBWaGPg9uULeWErO9tAKzVURTWdUHOHtHMreQ4BGB0Cj18hx+
         47BQ==
X-Gm-Message-State: AOJu0Yyp5qUHu2cGGOarvgIUS/WM7DHgCf+HkSeCFdIrl2ZP54OmjIva
	JP6Jadd9jSaIWWcazZgIuB8=
X-Google-Smtp-Source: AGHT+IF0E+lrIYUSLhGjH4pUUIKFjl0xT+3qS0Xckj2xwyhflx8hQJuVUcKh2SMRZplR16zb9ouJHg==
X-Received: by 2002:a17:906:10d1:b0:9b2:955a:e375 with SMTP id v17-20020a17090610d100b009b2955ae375mr9658821ejv.23.1696263947775;
        Mon, 02 Oct 2023 09:25:47 -0700 (PDT)
Received: from [192.168.67.29] (ip-109-43-241-91.web.vodafone.de. [109.43.241.91])
        by smtp.gmail.com with ESMTPSA id jt24-20020a170906ca1800b009929d998abcsm17183688ejb.209.2023.10.02.09.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:25:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------GZXWnDJGcdnnEW0W1vUgEqqL"
Message-ID: <266d7cf2-a300-4770-9c91-a39f0bc84946@gmail.com>
Date: Mon, 2 Oct 2023 18:25:35 +0200
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
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 16:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105307

This is a multi-part message in MIME format.
--------------GZXWnDJGcdnnEW0W1vUgEqqL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.10.2023 20:22, Martin Jansa wrote:
>
> Issue with .cmake file from protobuf, right?

No, it's the issue with the cmake of the project that uses protobuf. But 
that depends on a user case, perhaps I didn't get it properly.

>     If we can properly fix it at the recipe level, then why should we
>     keep this workaround/hack?
>
>     Also if you really need it, you can have a .bbappend for
>     protoc/grpc in the downstream layer. But I would be in favor to
>     avoid this by default no?
>
>
> I haven't seen any proper fix for this exact issue. Yes you can patch 
> .cmake generation not to include bindir when building for target 
> (while it needs it for native build), but then that change will break 
> possible use of protobuf on target, so the SYSROOT_DIRS still seems 
> like lesser evil here.
>
> Here are some examples from meta-ros:
> https://github.com/ros/meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a62cc
> https://github.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c
> https://github.com/ros/meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c4104533
> https://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf
>
> I don't care about protobuf, but the explanation from Samuli looks 
> like the same issue as what I remember from above and I don't see how 
> SYSROOT_DIRS causes mixing executables or any issues for installing 
> them for target.

I didn't look at the original issue of Samuli, but your issue is also 
fixed by a workaround. IMHO, the proper fix would be not to make CMake 
"happy" by providing a binary it can't use, but a proper export of 
cross-compiled tools for 
https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt 
library. I'd say the workflow should be similar to protobuf/grpc 
recipes, i.e. a native recipe builds the libraries only, and the target 
recipe builds tools and libraries.

Regards,
Slava
--------------GZXWnDJGcdnnEW0W1vUgEqqL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
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
    No, it's the issue with the cmake of the project that uses protobuf.
    But that depends on a user case, perhaps I didn't get it properly.<br>
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
            but then that change will break possible use of protobuf on
            target, so the SYSROOT_DIRS still seems like lesser evil
            here.</div>
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
    make CMake "happy" by providing a binary it can't use, but a proper
    export of cross-compiled tools for
    <a class="moz-txt-link-freetext" href="https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt">https://github.com/geographiclib/geographiclib/blob/main/CMakeLists.txt</a>
    library. I'd say the workflow should be similar to protobuf/grpc
    recipes, i.e. a native recipe builds the libraries only, and the
    target recipe builds tools and libraries.<br>
    <br>
    Regards,<br>
    Slava<br>
  </body>
</html>

--------------GZXWnDJGcdnnEW0W1vUgEqqL--

