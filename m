Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F89EC4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 10:19:24 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.118229.1699525162354859482
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 02:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GfoAiDkK;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-545ed16b137so285446a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 02:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699525161; x=1700129961; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxd5+QIE61dFOKL5L2zCg9aMbdpK5G0LB/gjwTx2NwU=;
        b=GfoAiDkKxntMtF1GS7B9yn+CDS8Lcop3jAFpL8rMLoQ9cn77A4v5e704kmP4F63ZDi
         71TFTh3diW2htau9c2qxiGyF89mEEvbo5R2gaSiI014S+TLwEqrIxjDRokG1fl8H6bgD
         Q62g+8x9xiuq9+CZwFTFZwSY7XXSk1dOnzOmzU2iqsI7Y9NFzGBAc3IyT1TL9SbP5ct8
         vlklEC6lj3UPh0JQ8kA6vpud/p/CwTrTD8QmmleRBhOmAwN/lcYVJhMjaIxdJISWUtWc
         eTUd3iYeAG/BaEE027npv99gpNy05dgQ3WJmMehVaFAF8abgzuoYenVkToTAWZNV5xQn
         AQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699525161; x=1700129961;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yxd5+QIE61dFOKL5L2zCg9aMbdpK5G0LB/gjwTx2NwU=;
        b=R/jPygLu4gnSHlTeH+ffC3+oAvyEyAbau2mkUTdK2v7TpRiz8QuwUDynfQZ1tiYBtU
         VawnFFxP0lqBi7KxQ+oIlVKqfSnnkw6mB3n9U8dgDlGqwt7hwfiHnxdddeLbzRzEprUX
         OK94wrlIX7//fEGUdgVE09DGl3h/xeq/5e7a6TWS7GEVcQESG13T0ohHyCLF8fXgLaw9
         zwbxe/PpzlOXryp97iPVOiu08Qtds7LKHRwQg92Y9aYpLCm0pTZu9AYHxXEAD7uY8csG
         neHW4st8m+WGySc4M739lNlpEfo6k/7Vz8uP8hMgPGEEYeoLRnl2NjAk+Dnwe0We2wQP
         mhCA==
X-Gm-Message-State: AOJu0YxI+XFGzUlfM2l+HdnY//6djHRycCaHLenBi73izo+lXAjM+C/z
	gsGrDfCBEkNyvuppUqLwiMg=
X-Google-Smtp-Source: AGHT+IG4fS3LxJPAaZY4M9UHA/zsZnOHGOZZgodcIO7eD9xodZh9Ghd+5i18m5uEOlWz0RAHeA9lmg==
X-Received: by 2002:a50:d65c:0:b0:53d:eca8:8775 with SMTP id c28-20020a50d65c000000b0053deca88775mr3980532edj.26.1699525160068;
        Thu, 09 Nov 2023 02:19:20 -0800 (PST)
Received: from [10.134.46.210] ([89.249.73.140])
        by smtp.gmail.com with ESMTPSA id eg38-20020a05640228a600b0053ff311f388sm7852443edb.23.2023.11.09.02.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:19:19 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------1HOlMj2TyHZ7x6TAYobSnuTK"
Message-ID: <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com>
Date: Thu, 9 Nov 2023 11:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Samuli Piippo <samuli.piippo@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20230930173003.3210-1-peron.clem@gmail.com>
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
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com>
 <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org>
 <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 10:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106515

This is a multi-part message in MIME format.
--------------1HOlMj2TyHZ7x6TAYobSnuTK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Clément,
No, the issue is when you just build nativesdk recipe (we are not at the 
stage to use the SDK yet).

And that was exactly my question how to propagate the dependency 
correctly for nativesdk build.

Regards,
Slava

On 09.11.2023 01:13, Clément Péron wrote:
> Hi Samuli,
>
> Le mer. 8 nov. 2023, 22:30, Samuli Piippo <samuli.piippo@gmail.com> a 
> écrit :
>
>     Hi Clément,
>
>     Were you able to reproduce the issue?
>
>
> Sorry I'm on vacation without access to a laptop at the moment.
>
> But if I understand the issue is not related to a target or native 
> recipes issue, right?
>
> It's only when building the SDK and then try to build an application 
> with it right?
>
> Maybe there is a missing dependency when building the SDK.
>
> Regards,
> Clement
>

--------------1HOlMj2TyHZ7x6TAYobSnuTK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi <span>Clément,<br>
        No, the issue is when you just build nativesdk recipe (we are
        not at the stage to use the SDK yet).<br>
        <br>
        And that was exactly my question how to propagate the dependency
        correctly for nativesdk build.<br>
        <br>
        Regards,<br>
        Slava<br>
      </span><br>
      On 09.11.2023 01:13, Clément Péron wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>Hi Samuli,<br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Le mer. 8 nov. 2023,
              22:30, Samuli Piippo &lt;<a
                href="mailto:samuli.piippo@gmail.com" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">samuli.piippo@gmail.com</a>&gt;
              a écrit :<br>
            </div>
            <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div>Hi <span>Clément</span>,</div>
                <div><br>
                </div>
                <div>Were you able to reproduce the issue?<br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Sorry I'm on vacation without access to a laptop
          at the moment.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">But if I understand the issue is not related to
          a target or native recipes issue, right?</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">It's only when building the SDK and then try to
          build an application with it right?</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Maybe there is a missing dependency when
          building the SDK.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Regards,</div>
        <div dir="auto">Clement </div>
        <div dir="auto"><br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------1HOlMj2TyHZ7x6TAYobSnuTK--

