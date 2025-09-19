Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AC4CAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 05:18:44 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.8984.1758259116664486257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 22:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FRSUXNHo;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1730652b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 22:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758259116; x=1758863916; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9g6N0mgRVsp7WsBceFxaUahysI5bpGhKnQGdjEVCe4=;
        b=FRSUXNHox40s3yB4cZ1KYeoJt0Pm7dFbJkspEYxVY/h6Ifjx3flMkVyDEvNH2H0Ntr
         r3wdDoanQVAdzJSNz2faeGN8bz+DCIA4fNR01Wa9Hz8VBXKVi1k81DIwBLWZWg/AqYzT
         uk36d7v/ArdmdFoIt6cp9w+hHvjzCsqQp7a8flqKenfihnttu0CYmNGuTSbkTOy3ym/g
         dPzmXUpXOUFwVQ+MX9Jzr8dU15r74aVrhM8AHG265RxWDy9s/9y7XV2PA7sHegnHp1Ud
         nG54AfCKstTCLxnC0v6LLlWXlNzZnVYO5o0EPMN+q7ftKnMd2+nynzj/1C1xD9D4+lTd
         f76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758259116; x=1758863916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9g6N0mgRVsp7WsBceFxaUahysI5bpGhKnQGdjEVCe4=;
        b=iCqvSQPRd2bfh5qe646N6odu8/0Du8aq21/PpsyYAk77e0K3ndd0K9izdlM/GK1gLL
         62vyXT0hEn/HV/0y/c2QwcYdozC+PWOk1g7jQo+2AAtOVZ2nIgWOJQ98j1rEx7KtcAJj
         NerPHze27/0pQGfRxiSrOPDEhLqkSN+l5/6cPBafW3+7PvtQrKhSisPMHhZ5fXyu8ocF
         pIg4b6qOFbSdHdSWrn+PERTaFp7kKi6zObXzCCmIbDemuUao8G3hrzNrqm6x9jDXFQ2a
         P0jKgFukN+hXg2TNThETPemz4UW99GGG+8TOFcVCmJBQi3k8WD8rmNT3U3eCUoWtD9GI
         y90g==
X-Gm-Message-State: AOJu0YwOKJHv/ItsBATB6Y4erjr2NfSejEfUg88wWp99E6uMYxuAUxgk
	gtYxReUf6mkrBZNsKbDvT2jWp5LVz4CHDaxcm5ALuR3/18gGaiUhnVRW
X-Gm-Gg: ASbGncuo4pjtR5IJeV2Av0WjWCvXa3h1P6ib4oEpE8XoG7Ya2IODT2vHvn2gbqx7AZo
	QrMCVvp/Uvj0mXMWgEyOTiYRgNQ0FM25zEohi24W/MHoy6OZiAs9HiuXuCNtlC/pl+EcVyuabcQ
	LyWjD9SFjgoJ/Hlb6bQbGvgJmyb00pNdbI5i3fUIJKgrvB5VJ9BVPm6t3UyrsDhIFeevZl96nWY
	rN0LUlkaWPnNl8lspWP4i7yVhdEvM+mwt2SpOlot9vHus9FjN2kffUVAQlDEiKHebmOzV6ekwM9
	QxktZsLCfDb8xEQBbvdVunver5yh2sKfliZXmpOAm1U9+KJbK6hm5nP3DwMtq+6TF900+cuVRdi
	Wbf6drrjdEOTZXUTZYTbNttS9m7P3vxuzR9rfF7IcmQmtN58w6URySVm2
X-Google-Smtp-Source: AGHT+IE/2BYWg+SliabwFcu126cbI3lTw5SuXJGu3HB6ajBtGnRXPRTyIKX3IoBQiHEtkFP3dza61w==
X-Received: by 2002:a05:6a20:7491:b0:24f:5ac4:664a with SMTP id adf61e73a8af0-292705030ddmr3290193637.46.1758259115960;
        Thu, 18 Sep 2025 22:18:35 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33060619253sm4219261a91.4.2025.09.18.22.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 22:18:35 -0700 (PDT)
Message-ID: <8527dd9f-37d9-4938-89dc-142bea4654ae@gmail.com>
Date: Fri, 19 Sep 2025 07:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20250918102642.487522-1-zboszor@gmail.com>
 <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
 <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com>
 <f7ce8c19-fb1e-4a4f-80eb-c41c79aef706@gmail.com>
 <CAMSfU+5b8ARRgzOtbzP+-VpL2U1eHtngOJVUDnU+Oxq-_AvzOA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMSfU+5b8ARRgzOtbzP+-VpL2U1eHtngOJVUDnU+Oxq-_AvzOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 05:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119589

2025. 09. 18. 20:41 keltezéssel, Yoann Congal írta:
>
>
> Le jeu. 18 sept. 2025 à 20:22, Böszörményi Zoltán <zboszor@gmail.com> a écrit :
>
>     2025. 09. 18. 19:42 keltezéssel, Yoann Congal írta:
>     >
>     >
>     > Le jeu. 18 sept. 2025 à 16:16, Yoann Congal <yoann.congal@smile.fr> a écrit :
>     >
>     >     Hello,
>     >
>     >     Le jeu. 18 sept. 2025 à 12:26, Zoltan Boszormenyi via lists.openembedded.org
>     <http://lists.openembedded.org>
>     >     <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org> a
>     écrit :
>     >
>     >         This fixes an installation error:
>     >
>     >         | make[5]: Entering directory
>     >  '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
>     >         | chmod 700
>     >
>      .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
>     >         | chmod: cannot access
>     >
>      '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint':
>     >         No such file or directory
>     >
>     >
>     >     What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
>     >
>
>     I got the error with 5.3.4 and it has gone away with 5.3.5.
>     I admit that I only tried the build once. I will retry tomorrow.
>
>
> This error is a rare intermittent failure. You will most likely not see it but that does 
> not mean it's fixed (sadly).

You are right. After "repo sync", I can't reproduce the
build problem anymore, with neither 5.3.4 nor 5.3.5.
I haven't noted the layers' commits before, so I can't go back.

I tried this sequence a couple of times for both versions
this morning and neither version failed:

bitbake -c clean gutenprint-native gutenprint && \
bitbake -c cleansstate gutenprint-native gutenprint && \
bitbake -c install gutenprint

FWIW, the CPU has 16 cores, 32 threads and a HDD stores the build.

> Did the 5.3.4 version on which you saw the problem had my patch?

Yes.

>     >     The above error is the one I fixed with the patch
>     >  "0001-cups-fix-a-build-race-condition-around-empty-directo.patch" and this patch has
>     >     not been merged upstream nor the code I touched changed. I did not see anything
>     >     related by quickly reading the NEWS.
>     >     I'd be happy to see this fixed upstream but I'd rather have upstream confirmation
>     >     that they saw/fixed it (a commit, a changelog, ...).
>     >     If that is fixed upstream, then we can drop my patch.
>     >
>     >
>     > To be clear, I'm not against upgrading. I just don't think the commit message is
>     correct
>     > (but could be convinced otherwise).
>     >
>     >     Thanks!
>     >
>     >         Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>     >         ---
>     >          .../gutenprint/{gutenprint_5.3.4.bb <http://gutenprint_5.3.4.bb>
>     <http://gutenprint_5.3.4.bb> =>
>     > gutenprint_5.3.5.bb <http://gutenprint_5.3.5.bb> <http://gutenprint_5.3.5.bb>}  
>      | 2 +-
>     >          1 file changed, 1 insertion(+), 1 deletion(-)
>     >          rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb
>     <http://gutenprint_5.3.4.bb>
>     >         <http://gutenprint_5.3.4.bb> => gutenprint_5.3.5.bb
>     <http://gutenprint_5.3.5.bb>
>     >         <http://gutenprint_5.3.5.bb>} (96%)
>     >
>     >         diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>     <http://gutenprint_5.3.4.bb>
>     >         <http://gutenprint_5.3.4.bb>
>     >         b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>     <http://gutenprint_5.3.5.bb>
>     >         <http://gutenprint_5.3.5.bb>
>     >         similarity index 96%
>     >         rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>     <http://gutenprint_5.3.4.bb>
>     >         <http://gutenprint_5.3.4.bb>
>     >         rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>     <http://gutenprint_5.3.5.bb>
>     >         <http://gutenprint_5.3.5.bb>
>     >         index f90a123293..82953b798c 100644
>     >         --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>     <http://gutenprint_5.3.4.bb>
>     >         <http://gutenprint_5.3.4.bb>
>     >         +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>     <http://gutenprint_5.3.5.bb>
>     >         <http://gutenprint_5.3.5.bb>
>     >         @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =
>     >  "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>     >          SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz
>     <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz>
>     >         <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz> \
>     >  file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
>     >                     "
>     >         -SRC_URI[sha256sum] =
>     >  "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
>     >         +SRC_URI[sha256sum] =
>     >  "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
>     >
>     >          inherit autotools gettext pkgconfig
>     >
>     >         --
>     >         2.51.0
>     >
>     >
>     >         -=-=-=-=-=-=-=-=-=-=-=-
>     >         Links: You receive all messages sent to this group.
>     >         View/Reply Online (#119552):
>     > https://lists.openembedded.org/g/openembedded-devel/message/119552
>     >         Mute This Topic: https://lists.openembedded.org/mt/115307539/4316185
>     >         Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     >         <mailto:openembedded-devel%2Bowner@lists.openembedded.org
>     <mailto:openembedded-devel%252Bowner@lists.openembedded.org>>
>     >         Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>     >         [yoann.congal@smile.fr]
>     >         -=-=-=-=-=-=-=-=-=-=-=-
>     >
>     >
>     >
>     >     --
>     >     Yoann Congal
>     >     Smile ECS
>     >
>     >
>     >
>     > --
>     > Yoann Congal
>     > Smile ECS
>
>
>
> -- 
> Yoann Congal
> Smile ECS


