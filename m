Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E70C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 12:58:20 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.16266.1714049898332721581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 05:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aD2ijZZs;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61804067da0so8846247b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714049897; x=1714654697; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMkfm9cg3/p5uEGDkGMJ9DIvGxQ5l55AJT20mzBWJRg=;
        b=aD2ijZZsVztG3OsBX55dpOYmYoevXQdpGFUan2bNN95Z/yyM4mof7sCsooMO7QsCKC
         +pBylQE8p985fZj0uAlJO6S4zdR0jE8bINiOkN/BTiLsCNOK5zH8qp+lbCxGlQDCXSQN
         iS9IXEr1FTdykp71HDGV3QqnhiSpA7r7GEwRvQWVNtegjMCrOHhpWCDY15QituRPOJ6u
         Bd62oxX22OLamul5NwNJM0OHZ5aFDkuJ7qhiS4VnS0TdD8pzoWF5BFwVaRuOYur435hv
         QqO/zZfMwLbK6vG22q0yPkywqgMhMyM5VVYRQaANlEGWpXVIaBYI+fXTtv2xlE9NZkZ6
         GWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714049897; x=1714654697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMkfm9cg3/p5uEGDkGMJ9DIvGxQ5l55AJT20mzBWJRg=;
        b=M4kcxxDodP1rYcXeroSvLIDufdPJP987Xnmzlie0Sd4MfV9sLujWc+HwZ3i6HrH2+V
         39fXECpsWAnxCG2+UAx1KdDJaxJP0Y36dIh9b1YaJCj3FKUdxxN4OTTR5sdwu8sM4iRD
         i9KGqDei8JaMGRUuPJxMuKDNtEYaFkIav07b1f0gbqIr+PXTv1s7fRQb7355/dthjAaU
         +1516JUhbdhp5q7Oq1nomcoyamVj0K2Jng5ZnqEjzpJJdcy+NMDcn0i+qkmUtIvluwig
         pKdXMDxOv3ZS28p/bugUvFVonNcv0xhfrSNQApGdTc3yyMkmQurDYxE5Wqbsz6WoOoK6
         3Qnw==
X-Gm-Message-State: AOJu0YzpgR7Cr28sbAMUdbuLbxuex8/lbQPLPxx3d/UVWJZpSLFOIk+Z
	eFB5Ft1Rhf89fp2GI6yQVpbJkRT6GmrHk09D9k3U0cI+wsydTU0B
X-Google-Smtp-Source: AGHT+IEf7X5vmJbUvql8X6At6Z/ZF4ju8KWl7jYk9FKwV9tlXax3bW53iUrnOzj3njnbKeaQ45grew==
X-Received: by 2002:a05:690c:338e:b0:61a:c976:a485 with SMTP id fl14-20020a05690c338e00b0061ac976a485mr6606090ywb.26.1714049897444;
        Thu, 25 Apr 2024 05:58:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:9865:f36b:a613:88e9? ([2600:1700:45dd:7000:9865:f36b:a613:88e9])
        by smtp.gmail.com with ESMTPSA id l64-20020a819443000000b00614f87bd41asm3557290ywg.56.2024.04.25.05.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 05:58:17 -0700 (PDT)
Message-ID: <bcd560e9-1be0-4106-8846-94c729af6601@gmail.com>
Date: Thu, 25 Apr 2024 08:58:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade 1.25.2
 -> 1.25.3
To: meenali.gupta@windriver.com, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20231214103812.512113-1-meenali.gupta@windriver.com>
 <CAMKF1spE4bd8H3ATZOKcxYP01Cstp2hvBXZ9Qc9DeC8pQtoVWw@mail.gmail.com>
 <BY1PR11MB800512F6778B619835B895CDE53B2@BY1PR11MB8005.namprd11.prod.outlook.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <BY1PR11MB800512F6778B619835B895CDE53B2@BY1PR11MB8005.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 12:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110153



On 3/28/24 12:16 AM, Meenali Gupta via lists.openembedded.org wrote:
> Reminder!

Kirkstone has three versions of nginx: 1.20.1, 1.21.0 and 1.24.0. This 
is a package upgrade and I don't want a fourth version.

- armin
> ------------------------------------------------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* 14 December 2023 22:16
> *To:* Gupta, Meenali <Meenali.Gupta@windriver.com>
> *Cc:* openembedded-devel@lists.openembedded.org 
> <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: 
> upgrade 1.25.2 -> 1.25.3
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> we need this on master as well. Its good to mention the branches a
> patch is needed in subject. Its fine to mention more than one if it
> applied directly to all of the requested branches.
> I almost ignored it as it said kirkstone alone.
>
> On Thu, Dec 14, 2023 at 2:38 AM Meenali Gupta via
> lists.openembedded.org
> <meenali.gupta=windriver.com@lists.openembedded.org> wrote:
> >
> > From: Meenali Gupta <meenali.gupta@windriver.com>
> >
> > Changelog:
> > ===========
> > https://nginx.org/en/CHANGES
> >
> > *) Change: improved detection of misbehaving clients when using HTTP/2.
> >
> > *) Feature: startup speedup when using a large number of locations.
> >        Thanks to Yusuke Nojima.
> >
> > *) Bugfix: a segmentation fault might occur in a worker process when
> >        using HTTP/2 without SSL; the bug had appeared in 1.25.1.
> >
> > *) Bugfix: the "Status" backend response header line with an empty
> >        reason phrase was handled incorrectly.
> >
> > *) Bugfix: memory leak during reconfiguration when using the PCRE2
> >        library.
> >        Thanks to ZhenZhong Wu.
> >
> > *) Bugfixes and improvements in HTTP/3.
> >
> > Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> > ---
> >  .../recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb}    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb => 
> nginx_1.25.3.bb} (51%)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb 
> b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
> > similarity index 51%
> > rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
> > rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
> > index 66eef23895..8aa9fa0267 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
> > @@ -2,5 +2,5 @@ require nginx.inc
> >
> >  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d 
> <file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d>"
> >
> > -SRC_URI[sha256sum] = 
> "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711"
> > +SRC_URI[sha256sum] = 
> "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
> >
> > --
> > 2.40.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109650): https://lists.openembedded.org/g/openembedded-devel/message/109650
> Mute This Topic: https://lists.openembedded.org/mt/103167529/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


