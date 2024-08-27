Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF065C52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:14:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.70791.1724735649616443119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Zk845Q+7;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-202376301e6so38014815ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 22:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724735649; x=1725340449; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yct0VQY38LX/ZfUfo3z3SE6CFjMLXi0giDBTIAJ7W2I=;
        b=Zk845Q+7BZNZ7UHuMjTlD62r2E6buXh0xgIIIKhKQgyzO33szE7mefuuLlhtyUIdqT
         G1puJ+XoyY9LRnTTnF8qcxhwqyEW8kIaAnHvoeP2dC3LuRhiW5GUwlcx4DNp5M+FFcUw
         tR7eE9H9U8SAKCzXIssGi0PGYebjXpnESEyyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724735649; x=1725340449;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yct0VQY38LX/ZfUfo3z3SE6CFjMLXi0giDBTIAJ7W2I=;
        b=NSm+KCiCLApNoHg5n2VI+vRymlA/n+dtTZJvQmq+LK4RLlN4+S6/gRlfVLrXGrBfFV
         JpGHpavBV39iw3kAeLSesFIZB2imBq0WvI4xzeh07Z9S3zia8QB6fp6TkIXT4XNo2prC
         npdNSGindilGC75MZkAvfPqD/lDjotkfqZNSRCG6XShcXdBf6qdeKONjb1X/wpp1RtqB
         noxWpMtF2TN+kaqnDJjM56e9APPWhYzvbOXR9lNrTBn8QfjfFmUIohVl3EtPTglVI34T
         aQkvzlPmgP8Zf1rOY+PrfZjFzANr+CvHYuWqgirHJYmxGQKed/4Yn45//D3+IlUV343H
         HYdg==
X-Gm-Message-State: AOJu0Yy6nTq7qiTKV1VY2avJWRcSng3ne8sQUEoe2KYuv80PbEXUM1AG
	drYNL6rUSJQ+a5sEq7OvaMCtzPXjGK5wkGjIJPhJOhPk7fsUyhu5i6IPnOdvmZ7l3HWFMm1UcE7
	O
X-Google-Smtp-Source: AGHT+IF2XY40S+ss/hPXgG/IUtHjoUOhLSvAmpDI8bMUPxMBGIq321z2E90CbIpjV1KlWOrtF27ZFA==
X-Received: by 2002:a17:902:e748:b0:1fd:7fac:a539 with SMTP id d9443c01a7336-2039e47a376mr131839865ad.16.1724735648688;
        Mon, 26 Aug 2024 22:14:08 -0700 (PDT)
Received: from [192.168.1.100] ([43.249.234.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385be08f5sm75252695ad.275.2024.08.26.22.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 22:14:08 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ed4XHB0emJU6bmQGwh6memSp"
Message-ID: <08a05526-b8cc-49e9-b199-1ab8b72d2fda@mvista.com>
Date: Tue, 27 Aug 2024 10:43:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] krb5: fix CVE-2024-26458 and
 CVE-2024-26461
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <20240814051620.5726-1-hprajapati@mvista.com>
 <15670.1724241043068774600@lists.openembedded.org>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <15670.1724241043068774600@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 05:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111970

This is a multi-part message in MIME format.
--------------ed4XHB0emJU6bmQGwh6memSp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi team,

any update on this ?

Regards,

Hitendra

On 21/08/24 5:20 pm, Hitendra Prajapati via lists.openembedded.org wrote:
> Hi Team,
> any update on this ?
> Regards,
> Hitendra
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111883):https://lists.openembedded.org/g/openembedded-devel/message/111883
> Mute This Topic:https://lists.openembedded.org/mt/107890092/6955432
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [hprajapati@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------ed4XHB0emJU6bmQGwh6memSp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="2">Hi team,</font></p>
    <p>any update on this ?</p>
    <p>Regards,</p>
    <p>Hitendra <br>
    </p>
    <div class="moz-cite-prefix">On 21/08/24 5:20 pm, Hitendra Prajapati
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15670.1724241043068774600@lists.openembedded.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>Hi Team,</div>
      <div>any update on this ?</div>
      <div> </div>
      <div>Regards,</div>
      <div>Hitendra</div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111883): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/111883">https://lists.openembedded.org/g/openembedded-devel/message/111883</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107890092/6955432">https://lists.openembedded.org/mt/107890092/6955432</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:hprajapati@mvista.com">hprajapati@mvista.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------ed4XHB0emJU6bmQGwh6memSp--

