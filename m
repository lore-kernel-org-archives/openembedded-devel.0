Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC92C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 09:00:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.23642.1699606816493012475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 01:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZS3xmHL/;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so2935648a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699606815; x=1700211615; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zUJKLOwNc4qguwlAMPumtL742bjWeYnawAwQCjE89Q=;
        b=ZS3xmHL/gE3hxJ3XcDTZ52Bgdb74hq6nVXAv04cAms4zCxIf2vjtuFMp1DGDS2QeYZ
         xA/4LjeAffyTMF9yhOeKNNQgdjliiZamJyCymQln9KXxFtcGJcL2MQ3n74r7rF17qBg3
         6oW9tZKQFqgEV/ttsIOkB2/JNGXysLGnumvTWZPYHXQlB1vbnZOtiMPIgKmK9ZVJF/fw
         mwTaMT0SSW/Jvyb9f6tJA2TyVhBLb7BM4ecJiuaGvf+A0QUdBb1AJqlbwNIDHtUEKLbp
         YRmZh1HUgej7Bu0WkFXyHIGsoX7mvcrFE+XhOO1kh807lzp3EBKMHIrSQmrsGBZq2vwe
         mxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699606815; x=1700211615;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0zUJKLOwNc4qguwlAMPumtL742bjWeYnawAwQCjE89Q=;
        b=dJ7K0FBPXiYLlTfXSIErUEvI6GmqAwnW791JvJ99pvreLUwYa8qhcVj+vjh3iO1hiE
         hh1EGkbajCadAk9VhTNq+B9Be9QwqgXNiea8tyk35JCykvVK1BsPBk5jPH6KM3mCXE+0
         W3WD/jV7173uPUO8W5bcAyT+aTazRCeroDq7COSdKb7w0fi0m1pVLRgCK2KlQsiQho0o
         q5aBUg6z1JXVbiYsReAYoYfaXVPhwvxrM6MAxGMkiwU7R1K9YXwH4aQ/F1Lu1mICjiu/
         hvNlZWsWT0+sgWjTH33Q2+MPswq6MvHUT3Xxy5zxrkU9qFM1Kf9waaOSdZugcOc7nOzu
         DZoQ==
X-Gm-Message-State: AOJu0Yzf2pQfnT/fOVzMJhU9BReLsiUZWCyvGuwx9VmY3K79TOZAdy61
	mXtOXqHhJFYdGbQ8st7+mh0=
X-Google-Smtp-Source: AGHT+IFLRTW0Cp1Jx2+esebQgBH3Jer2jUYlb9gwo+SegMLWYpdiijIIxSHqbjvsjzBsfnORJXCXug==
X-Received: by 2002:a17:907:3f17:b0:9b3:308:d045 with SMTP id hq23-20020a1709073f1700b009b30308d045mr7128196ejc.46.1699606814726;
        Fri, 10 Nov 2023 01:00:14 -0800 (PST)
Received: from [10.134.43.51] ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id y19-20020a17090668d300b00992f2befcbcsm3587778ejr.180.2023.11.10.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 01:00:14 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------FdmnuBz7tsp9Zg6VFXBgNvT3"
Message-ID: <920b4ed2-386e-49e9-9d8f-15dfa98cfa59@gmail.com>
Date: Fri, 10 Nov 2023 10:00:13 +0100
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
 <2939988d-b6f7-4cfc-a8e3-242e61289688@gmail.com>
 <CABXoSoVqe-ccokcv2hqKSUudSR1RfgaMwo3F3A+UUaMTQ7m7Cg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CABXoSoVqe-ccokcv2hqKSUudSR1RfgaMwo3F3A+UUaMTQ7m7Cg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 09:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106532

This is a multi-part message in MIME format.
--------------FdmnuBz7tsp9Zg6VFXBgNvT3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Shall we go for round 3 of the patch then? :)

I'd wait for Clément feedback and then all 3 of us can sign it off.

I would also like to have a short comment/explanation before the 
SYSROOT_DIRS as to why it's required in this particular recipe.

FTR, as expected Richard didn't like the other suggestion, because the 
size of sstate is affected by that.

Slava

On 10.11.2023 09:44, Samuli Piippo wrote:
> Agreed that enabling compiler in target would be rarely used.
>
> Having
> SYSROOT_DIRS += "${bindir}"
> would, however, cover both builds without additional tweaks.
> Since target build doesn't have any other binaries, this wouldn't do 
> anything extra with default PACKAGECONFIG.
>
> On Fri, 10 Nov 2023 at 10:06, Vyacheslav Yurkov <uvv.mail@gmail.com> 
> wrote:
>
>     OK, but that seems to be similar issue, although a different one :)
>     I recall I disabled compiler by default for target, because it's
>     rare use case.
>
>     So compiler can be enabled (if needed), but then perhaps another
>     tweak with sysroot will be necessary in the recipe? I suggest to
>     keep it as a comment in the recipe. What do you think?
>
>     Slava
>

--------------FdmnuBz7tsp9Zg6VFXBgNvT3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Shall we go for round 3 of the patch
      then? :)<br>
      <br>
      I'd wait for Clément feedback and then all 3 of us can sign it
      off.<br>
      <br>
      I would also like to have a short comment/explanation before the
      SYSROOT_DIRS as to why it's required in this particular recipe.<br>
      <br>
      FTR, as expected Richard didn't like the other suggestion, because
      the size of sstate is affected by that.<br>
      <br>
      Slava<br>
      <br>
      On 10.11.2023 09:44, Samuli Piippo wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoVqe-ccokcv2hqKSUudSR1RfgaMwo3F3A+UUaMTQ7m7Cg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Agreed that enabling compiler in target would be rarely
          used.</div>
        <div><br>
        </div>
        <div>Having</div>
        <div>SYSROOT_DIRS += "${bindir}"</div>
        <div>would, however, cover both builds without additional
          tweaks.</div>
        <div>Since target build doesn't have any other binaries, this
          wouldn't do anything extra with default PACKAGECONFIG.<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 10 Nov 2023 at 10:06,
          Vyacheslav Yurkov &lt;<a href="mailto:uvv.mail@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>OK, but that seems to be similar issue, although a
              different one :)<br>
              I recall I disabled compiler by default for target,
              because it's rare use case.<br>
              <br>
              So compiler can be enabled (if needed), but then perhaps
              another tweak with sysroot will be necessary in the
              recipe? I suggest to keep it as a comment in the recipe.
              What do you think?<br>
              <br>
              Slava<br>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------FdmnuBz7tsp9Zg6VFXBgNvT3--

