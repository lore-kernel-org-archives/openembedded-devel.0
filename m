Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C92D10387
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 07:16:43 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8281.1764141399126579386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 23:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C3uEjpLM;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b76b5afdf04so387010466b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 23:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764141397; x=1764746197; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CSjcXMt0yJyh4wj3W46SJLpWxumEyDcuyUVlgnpu4c=;
        b=C3uEjpLMwSg+D0pJbl0H9fOXCwNsp7TTgPtMRCUqvh/MPlevv/9apg5Qdr/HMhwuNy
         u0eLfBgeBEpV296Bp8TpHhp1MMLUQNv5+jqEC2BKprBmYxWfpW6DFrFcDSPMgSUPUU5T
         F+yOocUbUZTZCL4k8dSO3hjJxLTUppE8+SJZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764141397; x=1764746197;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CSjcXMt0yJyh4wj3W46SJLpWxumEyDcuyUVlgnpu4c=;
        b=Z5pHuaoZjOzL2cdVUZcgZi5szOqK/+4svtEXDNfU0FX8Cio5gcCsDz0zKhz2hKAswN
         5pN0pn3eVAVZxLAxrTqILl0RwPMG82njjHBmbjrPKnDYMbjCjpxiWf/eBCW7ArHfxnsI
         vqNrA3gWY6aa92mbgmytDfpZeHioHKzb/zW8lT0WCoh9xgNe/d5UWeiG34dVwhiqpC4M
         EeTmUSTbzPpX3kQWpp4/S+2nz4cjOlur79M9h/2lHfF2TIb7clo+9yyoZRmBYbOe6n7p
         j3G8eIgul/7aNN4wdOxWnOYRNF3C4rNb1Y1jDsGFuXmafJ25wbFNZqmSAJ+skRraRMue
         n2hQ==
X-Gm-Message-State: AOJu0YzoKurQQWgvkDIi2W+7sAYwFgy3jW/XRqnUVdV5Fz38xd3Y0Z5j
	Ulu0D67LTO3W4YSBhGHqacI3iXAredjemqM6e4Qkt/v+3yH2j28xSNyb1+Y+nkLq/fg=
X-Gm-Gg: ASbGncsb1ZeApMxJ7x3tD2MoHmZ3/mBdg8o+MwX2zmOfkbHep3cXT6KRfcrYMz1CMJY
	TpuT0iV87v9e3alfyjUMQ6eYpFgA9kJ3YF7nd2oe8TyCxK8ggmr3hp+RbZjMLttpVHMBSlD/ozD
	fwc9NLRPCzZmziTWSPWt+DK9nDdxsB7rchkmQ+G85U42PC0tIdDcVVr+dcI5yJUCArlAgXQpahz
	VCQLlyg+aM0EBL77GxgJZYDpplsn5e5Fl6svZz3sTZPgKMNFKMd7J70H79qCoFcMtMIReaqkCiw
	6qBwVtZALqne59dOesmbe8LLyqfAIRDks5JPZhBNgF5R5itFRnUJ/GNkXbP6FlexlIPBIMlAu5o
	kJOHBE8G3X0I2Ne/oVbemcOvKH2v8ue51Perx7R2PWtjTYYWJJ3/TvZKXeKNVSXZxzGwpCfBrZI
	/h5t66wiyvnFj5Dr40FQ==
X-Google-Smtp-Source: AGHT+IHn4U7OJ4AuUkV1mpfF8I0po8l12DQsZQazDOqAUyZro9u1nVR6xmLZLiobtCksT7NDFJWO7A==
X-Received: by 2002:a17:907:94c3:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b76718cfdf2mr2015004266b.49.1764141397216;
        Tue, 25 Nov 2025 23:16:37 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d50328sm1828683366b.20.2025.11.25.23.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 23:16:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------79dvIwnn1p71SIpZy3KHKPu8"
Message-ID: <5bc930f8-8671-4d00-a342-a2dcf436955e@konsulko.com>
Date: Wed, 26 Nov 2025 09:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] valkey: Upgrade 8.1.4 -> 9.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251124092909.3234487-1-leon.anavi@konsulko.com>
 <CAMKF1sqOhnb6t9O1HPnYAFpt5JWQ-XbkKzMgGfGX65_LZ+zHoQ@mail.gmail.com>
 <9e1752f6-85af-4c4f-a215-57b75a3c9449@konsulko.com>
 <CAMKF1sqwitQj1H_CNMLFwENmpR4Q22Ly2kULaRSoVTzsuL9Vyg@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sqwitQj1H_CNMLFwENmpR4Q22Ly2kULaRSoVTzsuL9Vyg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122072

This is a multi-part message in MIME format.
--------------79dvIwnn1p71SIpZy3KHKPu8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 11/25/25 18:44, Khem Raj wrote:
>
>
> On Tue, Nov 25, 2025 at 1:30 AM Leon Anavi <leon.anavi@konsulko.com> 
> wrote:
>
>     Hi Khem,
>
>     On 11/25/25 07:59, Khem Raj wrote:
>     > Fails on qemuarm -
>     https://errors.yoctoproject.org/Errors/Details/889836/
>
>     Thank you for informing me.  I was able to reproduce the issue
>     locally,
>     submitted an updated version of the patch and opened a GitHub pull
>     request with the fix for valkey's upstream:
>     https://github.com/valkey-io/valkey/pull/2873
>
>
> Thanks for looking into this, the patch limits it to armv8 but there 
> are armv7 with neon in ABI
> as well, I think it will need to take that into account.

Which 32-bit ARMv7 machine with NEON do you recommend for testing?

May be the Rockchip RK3288 SoC on ASUS Tinker Board and ASUS Tinker 
Board S is a good fit. I think I bought a Tinker Board for hobby 
projects many years ago and never really found spare time to play with 
it. I have to double check and find it.

The maintainers of valkey have already merged my GitHub pull request. I 
guess I can follow-up with a fix and a test for ARMv7 with NEON in ABI 
using ASUS Tinker Board and Rockchip RK3288 SoC.

Best regards, Leon
--------------79dvIwnn1p71SIpZy3KHKPu8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,</p>
    <div class="moz-cite-prefix">On 11/25/25 18:44, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqwitQj1H_CNMLFwENmpR4Q22Ly2kULaRSoVTzsuL9Vyg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Tue, Nov 25, 2025 at
            1:30 AM Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
            Khem,<br>
            <br>
            On 11/25/25 07:59, Khem Raj wrote:<br>
            &gt; Fails on qemuarm - <a
href="https://errors.yoctoproject.org/Errors/Details/889836/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://errors.yoctoproject.org/Errors/Details/889836/</a><br>
            <br>
            Thank you for informing me.  I was able to reproduce the
            issue locally, <br>
            submitted an updated version of the patch and opened a
            GitHub pull <br>
            request with the fix for valkey's upstream:<br>
            <a href="https://github.com/valkey-io/valkey/pull/2873"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://github.com/valkey-io/valkey/pull/2873</a><br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Thanks for looking into this, the patch limits it to
            armv8 but there are armv7 with neon in ABI</div>
          <div>as well, I think it will need to take that into account.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Which 32-bit ARMv7 machine with NEON do you recommend for testing?<br>
    <br>
    May be the Rockchip RK3288 SoC on ASUS Tinker Board and ASUS Tinker
    Board S is a good fit. I think I bought a Tinker Board for hobby
    projects many years ago and never really found spare time to play
    with it. I have to double check and find it.<br>
    <br>
    The maintainers of valkey have already merged my GitHub pull
    request. I guess I can follow-up with a fix and a test for ARMv7
    with NEON in ABI using ASUS Tinker Board and Rockchip RK3288 SoC.<br>
    <br>
    Best regards, Leon
  </body>
</html>

--------------79dvIwnn1p71SIpZy3KHKPu8--

