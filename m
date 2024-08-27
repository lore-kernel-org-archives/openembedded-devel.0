Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE8BC52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:15:08 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.70803.1724735706807856401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YU1o1Q3N;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-201fbd0d7c2so41171995ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 22:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724735706; x=1725340506; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOQwb4w48II9AlXRTXYuhFkT2Ul9ejXzwaCdH/6F7t8=;
        b=YU1o1Q3NFjZyJrRv+pSSt+0+mfucjsm3ty2VyBCnKOz+S7NRgC4TDs6+EjvdzI/S/m
         SKjwUiYv0JCymLhwZKyQZAO/cZrCj7d7rfY6ze9utUlf5xjFKi62S01ggQ6P7JR95bXn
         XjYMpKh2WYIaslG7FxKaMDzxEayhZksDzFAXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724735706; x=1725340506;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xOQwb4w48II9AlXRTXYuhFkT2Ul9ejXzwaCdH/6F7t8=;
        b=JkYHt4ti4kVF/4XDA/U05V41CfkTLIaGufmulqasHYDUPqTvL00AWpZMcRwP9teLPY
         MaIYVqf+sFDNbeMU/VUhBtndIuuGVP+cdkr+TVLNbByGkk/ILNmthdzibn+Yep8pK5kO
         NaKO64I6FYiXvzKvfKB7P3C31Bbxg+rPHcHC2xZtDA+Z8YGcZ+BJaEUrEORGeLbfKmIA
         wyVQwpEj+0Poy2ZYOMuqK7Fm+njXCFJ1y/veanLfL92ap54R8CVm5O30F+6pkvqV7iF4
         7Ds7zmTzYs+j9Q+Vlp2B0BVdD+lU727RBCqokUk/EHvR12iQX4j9xH7G6KeTBfxznfVd
         uejw==
X-Gm-Message-State: AOJu0Yz5cTBKTDesbVHHP4hKZo0D/UfpdeAg7PQg0zPc3SajaxUtvaXe
	SPenSOuWBOZU4cPrXqTHxwnDQKbQKQXHXgtfe6z4OiAPHSp3fIrGiKgA/S8rAAGDiiDRUYpSN/V
	V
X-Google-Smtp-Source: AGHT+IEdAnRDOC9gPR+cZ1d5yon51AYAovaXlAU7m2h4Ev/TZiHjDxaB58CR8lx1gPFPnG9pFH3UpQ==
X-Received: by 2002:a17:903:189:b0:202:ad1:8c84 with SMTP id d9443c01a7336-204df4fb9c6mr15619505ad.52.1724735705764;
        Mon, 26 Aug 2024 22:15:05 -0700 (PDT)
Received: from [192.168.1.100] ([43.249.234.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855e2075sm75751895ad.120.2024.08.26.22.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 22:15:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------AuWCpeiPnVK9O0s0bLIoUkm9"
Message-ID: <5a9dc862-64a8-490b-8bb1-1e51b0778156@mvista.com>
Date: Tue, 27 Aug 2024 10:45:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libssh: upgrade 0.8.9 -> 0.9.8
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <20240813123308.84239-1-hprajapati@mvista.com>
 <4615.1724241112772938099@lists.openembedded.org>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <4615.1724241112772938099@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 05:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111971

This is a multi-part message in MIME format.
--------------AuWCpeiPnVK9O0s0bLIoUkm9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Team,

any update on this ?
Regards,
Hitendra

On 21/08/24 5:21 pm, Hitendra Prajapati via lists.openembedded.org wrote:
> Hi Team,
> any update on this ?
> Regards,
> Hitendra
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111884):https://lists.openembedded.org/g/openembedded-devel/message/111884
> Mute This Topic:https://lists.openembedded.org/mt/107875014/6955432
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [hprajapati@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------AuWCpeiPnVK9O0s0bLIoUkm9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Team,</p>
    <div>any update on this ?</div>
    <div> </div>
    <div>Regards,</div>
    <div>Hitendra</div>
    <p></p>
    <div class="moz-cite-prefix">On 21/08/24 5:21 pm, Hitendra Prajapati
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4615.1724241112772938099@lists.openembedded.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>
        <div>Hi Team,</div>
        <div>any update on this ?</div>
        <div> </div>
        <div>Regards,</div>
        <div>Hitendra</div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111884): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/111884">https://lists.openembedded.org/g/openembedded-devel/message/111884</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107875014/6955432">https://lists.openembedded.org/mt/107875014/6955432</a>
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

--------------AuWCpeiPnVK9O0s0bLIoUkm9--

