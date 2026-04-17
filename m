Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F8BF436BE
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 16:53:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49834.1776444808349523744
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 09:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oAToitnJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso8874305e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776444807; x=1777049607; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVJ1Oei06mnZfPUJAeC912EVNiN1xqpYHZfGKsjJRm4=;
        b=oAToitnJ/bGu1+jP2Q31Ohzg/ZMgWPst4GxyCE07xkxEcpIKihR0gMTD7ivIx+YaUB
         y914H25G7N+UCL9++4jCx2Br1cCyec7B0oylQ3N52mixPLnq38ta4q60DJc/YNaovQ7K
         DQ4cO6PNiSqk0PbL9xY8avNVafAgKt/b6rkGvJbj/LHPIDoEmv0IOiThtLTukzxoh+pX
         po939GKpNRlTqxtHuzodB5j3XLnzVGIoyHwUkWfrRgoEvv+UNMYlhf8QPMROpkxEwcdx
         8LTYQET2JqrYE6NY+EkTRvDCeEOXTCuGr+Ww+x88L9VZ2wnbl64kyvZQ0TttxTOE1TDm
         zhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776444807; x=1777049607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVJ1Oei06mnZfPUJAeC912EVNiN1xqpYHZfGKsjJRm4=;
        b=mFaIUWJbgSM2n1lCLm+vk6KcFtNnH2c9A4xvEIwLmCeju+P5rdgL/jwZOzi6Mo/4U0
         gDdI5bgnVA66xe6ZfuwwbSmc8/oQOszj6jMbNkAkOoDzRvY4g9gQ1wydR4B9xOZNCokF
         h9ughVejqlZD9MlaAnWumSMJDmdaPg86d4Lobx1IYaH+slyvtMl1xCxs/Ac3e3kCgjt1
         LlCz6+GVxnVPJQmd9gxvnmKhQPeaRBKBBCARAmz372awlRtkeqIRelglqHL6zpB1vZXN
         UL7l4rwXbTwMcl3vVm1/Zq+QAH6lL+xP2/Xj8mor5+g0V8FaZE4KRJSohECg6KTdKPV5
         WVUw==
X-Forwarded-Encrypted: i=1; AFNElJ9hKT/piLsdyvmJZKBSLcNVD6cfMN8/HDKEIjoltV6BufJyDMJiJ9rYlUkZd6lBNzVo4e+UgfghVjlbkxyRhuyD+1A=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxI+P929MMIuXlL6tQiu16GTa5hhttPZx16f1QtAa+BoW9ImyJN
	gh17tQsmVa/C1acCdVPSrgUlAtw+/iXBIdLe63cw67iFpF3IKoSQCpfv
X-Gm-Gg: AeBDievmh/ZUlEoRVRmGe5yXo6eixe5HbivRW1V6ot5WwxZHxDyVzNo40gLe7Lxa2/A
	encIJomnrxcRZ9NFUnqQf+KbyGTsdb1eYCh5WcYH1vyUmwjfbc5MW6BzYE3A1qR7CbRVx0ETaCB
	vSBx+a6zGa+p0Wa75j2apHw4MfjnZeivJIEUNav+NtUuJ3rX/l7QCXV60Y30TFNJHCIQ1LHjm3s
	3zmvGI+CuAiNGLwI9tau7qjrhBt+VU4r1qTI3qlnUm4q+pxjcArseaENJJ5o1r2HQy+aX/bblp1
	GB5MM49Dm4aCraepQZ+Fw1jmoQdE7gORYBdHnF8JUWFIsOSxZqkebcJWktU3MNf2ZDuJHmiMiiJ
	lMAR3IDfPbcsOuS/01t+xITyQgJxqSBJN5Jt2fu6hN+QUzNp4rHvC/FMarf0KqsFuA3WnCTdi37
	6Y/Y2eK5sNiZYRAzTI4zALnPhyqAl5ix3a00SH4R+2u7G4kWDiZK15
X-Received: by 2002:a05:600d:8449:b0:485:445a:87d1 with SMTP id 5b1f17b1804b1-488fb74a66cmr45550715e9.8.1776444806498;
        Fri, 17 Apr 2026 09:53:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb6dfa33sm33587905e9.0.2026.04.17.09.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 09:53:24 -0700 (PDT)
Message-ID: <4223e8ac-359d-475d-bd64-cf291d5d2761@gmail.com>
Date: Fri, 17 Apr 2026 18:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
To: mail@michael-fitzmayer.de, openembedded-devel@lists.openembedded.org
References: <CAMKF1sqWpfSsFVSiBkiQCQkv0pjTSh1i9HJuX06E_EkBd4jmyQ@mail.gmail.com>
 <3323E3B7-6461-427C-9A02-0C108D4A139B@michael-fitzmayer.de>
 <6c6a6f90-f25c-4b85-9c00-665f0f4e21b4@gmail.com>
 <002301dcce88$8757bae0$960730a0$@michael-fitzmayer.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <002301dcce88$8757bae0$960730a0$@michael-fitzmayer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 16:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126448

On 4/17/26 18:37, Michael Fitzmayer via lists.openembedded.org wrote:
> -----Original Message-----
> From: Gyorgy Sarvari <skandigraun@gmail.com> 
> Sent: 16 April 2026 09:19
> To: mail@michael-fitzmayer.de; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
> 
> < As I can see these patches basically move the recipe to the tip of the main branch. In the future, if there would be such cases, where there are extra commits after a tag that need to be included in the recipe, you can just set the SRCREV to the correct revision, if there are no commits that need to be skipped. You can just add `PV .= "+git"` to the recipe to indicate that there are some extra goodies included also after the tag (and maybe add a quick note in the commit message about it).
> That avoids messing with patches and makes the intent also clearer.
> 
> < I wouldn't send a new version because of this, but it might be useful for the next time.
> 
> Understood! I will add `PV .= "+git"` in case I have a similar scenario in the future. Is it fine for the time being?
> 

For me it is fine... but Khem disagrees :) [1]
On the master branch he has the last word - I'm afraid you will need to
update the patch.

[1]: https://lists.openembedded.org/g/openembedded-devel/message/126445

> Thanks!
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126447): https://lists.openembedded.org/g/openembedded-devel/message/126447
> Mute This Topic: https://lists.openembedded.org/mt/118838261/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


