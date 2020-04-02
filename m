Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7713.1585836799690906497
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2020 07:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dse/8wVy;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id g2so1387855plo.3
        for <Openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2020 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=YyUoN4CRIY7LUgiQKxegF710/guSzx3gpJLtMzHoKqk=;
        b=dse/8wVydbizUNmq8AKtrlD0sWhyfsEVfLg8wJnJbQfRjgfWr2iPIMBIAUKK6yx5jN
         cXvRYipfHR9iWOse93ZaajSqpCx/Y1U+bDGeuKaJbtE1rbiEIBC1Suq2B0QC27GT6k6O
         jg0c+egfkx7V+aWShIyGAzNq7sF/0Cubo5UUcb4nMQOPULYjmlgx8KUjZNktm2H2N357
         Zj3DzRDLE3LpnkA4EbAe0tF82ZVIzrNOyClCTDvEEBEpKZ/DqATph1azx0Zew7b+IWeb
         KFBhwHA1mnpsCQ8WBVwni5oEBvwWsCT5cRXGqGswnlQtDG/5gO5ZG2c+uXqIVRl8oED5
         heKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=YyUoN4CRIY7LUgiQKxegF710/guSzx3gpJLtMzHoKqk=;
        b=dEz0Y53wDpK7NABl9p69zdnaZV6A0NDidsMQToj2kruMFgJVYo1c/+8++1JoEYS1xe
         8tMCw5eWL4/J5ee2xvPSGAGfk99nFt6545nb8YqcBAbYi7L597jknx+Y9xktuxNFR/1x
         8fDHEVt4r2I4xGqxfkINUWwPezkBYI2ptYgoJcU05Ddw++Zjy97TX/ggcZKC/9BnIgId
         TxD8MuZQl1wgZVpBQX2MjoBTVyx6s/J2GkhSOtwJkp26s1RzN/zCNpET/FpskoEH9zH8
         xUbAWL+cc9TtYVakTG0sODAE09BD8MVEg/HSuHn4a7c7riCABQbVld8VDPoOCT2ghopM
         RH9g==
X-Gm-Message-State: AGi0PubA5Xmrau2fFpDzoyaJWFFaTq61q4XJJKM7QheN2hWU5PTgrfle
	tS7Zg3SFGPJYLhE97OT4Yzj69opKQ9k=
X-Google-Smtp-Source: APiQypL/kIXB7uRexfGt0KriB5AUZZbRyJEkjbUZat6jfkMoGiiLDCjv03T6gSV2VW776uGU4uRw1Q==
X-Received: by 2002:a17:902:9a93:: with SMTP id w19mr3107559plp.277.1585836798905;
        Thu, 02 Apr 2020 07:13:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:31b6:f353:d938:e1a9? ([2601:202:4180:a5c0:31b6:f353:d938:e1a9])
        by smtp.gmail.com with ESMTPSA id z30sm3820525pfq.84.2020.04.02.07.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 07:13:18 -0700 (PDT)
Subject: Re: [oe] [meta-python] Call to arms, help wanted
To: Tim Orling <ticotimo@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
References: <CANx9H-AEEPHqpeNXZhkn_154xsysdsFq+wbjc71nCkWAz0=Jww@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <73e98851-d637-5071-c960-ec11fbdb59dd@gmail.com>
Date: Thu, 2 Apr 2020 07:13:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-AEEPHqpeNXZhkn_154xsysdsFq+wbjc71nCkWAz0=Jww@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------5DD35681A6CDC27A77ABA157"
Content-Language: en-US

--------------5DD35681A6CDC27A77ABA157
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


Why did you refer to me in your subject ; )

- Arm

On 4/1/20 9:25 PM, Tim Orling wrote:
> Now that python2 support has been dropped, we have no need to maintain
> the .inc and .bb files. And in fact, this makes upgrades with devtool
> more difficult than it need be.
>
> Please help the layer prepare for the dunfell Yocto Project 3.1
> release by sending patches to merge the .inc and .bb files.
>
> If you are upgrading a recipe in meta-python, please use that
> opportunity to also get rid of the .inc files.
>
> We have a limited window before stable release branching will occur,
> at which point we will all have to live with the state of things as
> they are.
>
> Regards,
>
> --Tim
>
> 


--------------5DD35681A6CDC27A77ABA157
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    Why did you refer to me in your subject ; )<br>
    <br>
    - Arm<br>
    <br>
    <div class="moz-cite-prefix">On 4/1/20 9:25 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-AEEPHqpeNXZhkn_154xsysdsFq+wbjc71nCkWAz0=Jww@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Now that python2 support has been dropped, we have
        no need to maintain the .inc and .bb files. And in fact, this
        makes upgrades with devtool more difficult than it need be.
        <div><br>
        </div>
        <div>Please help the layer prepare for the dunfell Yocto Project
          3.1 release by sending patches to merge the .inc and
          .bb files.</div>
        <div><br>
        </div>
        <div>If you are upgrading a recipe in meta-python, please use
          that opportunity to also get rid of the .inc files.</div>
        <div><br>
        </div>
        <div>We have a limited window before stable release branching
          will occur, at which point we will all have to live with the
          state of things as they are.</div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div><br>
        </div>
        <div>--Tim</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5DD35681A6CDC27A77ABA157--
