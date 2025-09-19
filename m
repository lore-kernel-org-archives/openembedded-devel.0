Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2508CAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 06:09:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.9548.1758262178512641206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 23:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nYCIMO5j;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: zboszor@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so1240508a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 23:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758262178; x=1758866978; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yllqJDtn2dGn4pPImXT6tDw3TJbonb7ynzUoWR3OYIk=;
        b=nYCIMO5jJ9raj7KxGg+K+TaiAilals/KtFiuorERFgF9+12teZW5hLwE/MefWyZAOO
         pIZZ9yA9wthbmGIdUL7ea9lVOuNmHySJJKMczKO3LaAf6guV8FcTtrq1IN/xtryuenSn
         Yb+votnb+04D9YSVpwWePI6fCnEj7X3SvKPoZ4KxhpqajfMsEpCS5SEP2Wvhiex+vABZ
         nIhbHvniv93wADA+48k3ruXc5H0sXwxm28fEYtBs/NtQlJvSuoi8tG9jyeX5IRpShB5w
         7c7YfJWqW4kwy/PGdxm6vZ1DODsTQtECG873LMuMd6eLkesO2qdKtHS+IJmKeRCsFHdW
         4/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758262178; x=1758866978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yllqJDtn2dGn4pPImXT6tDw3TJbonb7ynzUoWR3OYIk=;
        b=l9/dvSjvJYzCmHf0sD2YfaaHYg9sC1/jRHssxPB2DTFCJH5VuCy6R4OeHoITtmZkhA
         vyTYPbNl8KcnGjzgw4GBrW8seW/d3AemU9pFySvo6OGHXQ2MLeYYHQWdv2QXFByq1WXJ
         mUh9qGLWxXaCdzChcmeOFP1A5qpgmw0nTpRb5dwE4AUx8IL0Jc33QRRwJhzE7DGcnre/
         +WIp+MjGwXC5pC64KDBr04HTwUq+9lel5PlnqVG3kL+fk0AX6t6uEFScE8OP3D3tHstZ
         MRwL6TD3U6Ce32xONdJn1utYXz8SbaqvOxMsjtp1QrZWJrceqkEoIrkvMWc/OmaszYPL
         ExJg==
X-Gm-Message-State: AOJu0Yxq12H0c48jthtCc3RMoUFBcBz1Z26gc4FP7SZde2usoGvMAxQO
	Qb1tMpYy8r9rl89oN6d2vAe/xRwfNCPCL82xKVg8O+Ywf/EMvrhYpjdw
X-Gm-Gg: ASbGncud53B4mseQ833kOdf/M/JQorOt9Qb4LQuBU1QhhMoapa73Ds2ET2jVE1YAlkb
	+w+neM4Rk5QVgtJg9/wYQfx5PiTO6hH4XB8KGgruvYG1LzIUe2XPT3cTJ9WROle1QvijXcYW4j/
	aRK2pIC5gxo+i2/kYg0XitdySkR7jgeb8oW6oNAagfwrVCYaLYNY9iKjPjmagpNe370fhMUI3RM
	fuB8t5j9vFWE3VQ2l1W7lWZWMIRYfAg8tXUkQBG77opn00Hok8Z4VYYmBscdE0BKqs7tZurLuvH
	x8DPg4RVYBSXeiqQJhTWnqHU15NJ+di99vXDWwPH9+f+lEqbvMhZcjIXxxhuMSX5zOR323xIH8a
	QWnL8sHJtXF7PCDlHNlioWo77wc4+Z3qNc77L61NiitI9UVJkiETblDF/xDj3Hcwwfuo=
X-Google-Smtp-Source: AGHT+IHZjXcsXUki7pwG3BgxUERuhEpn3QHrI7+eyu/ZtJkNgVs/8K5d/0QRtGmRZwVzQEgBK8C49w==
X-Received: by 2002:a17:90b:3d8f:b0:330:72fb:ac13 with SMTP id 98e67ed59e1d1-33097fd56c8mr2458349a91.5.1758262177682;
        Thu, 18 Sep 2025 23:09:37 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2473d0sm4076701b3a.27.2025.09.18.23.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 23:09:37 -0700 (PDT)
Message-ID: <a72619e7-2fc5-404b-9d28-2b52caa90cc6@gmail.com>
Date: Fri, 19 Sep 2025 08:09:31 +0200
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
 <18669759DF68E69D.23626@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18669759DF68E69D.23626@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119590

2025. 09. 19. 7:18 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 09. 18. 20:41 keltezéssel, Yoann Congal írta:
>>
>>
>> Le jeu. 18 sept. 2025 à 20:22, Böszörményi Zoltán <zboszor@gmail.com> a écrit :
>>
>>     2025. 09. 18. 19:42 keltezéssel, Yoann Congal írta:
>>     >
>>     >
>>     > Le jeu. 18 sept. 2025 à 16:16, Yoann Congal <yoann.congal@smile.fr> a écrit :
>>     >
>>     >     Hello,
>>     >
>>     >     Le jeu. 18 sept. 2025 à 12:26, Zoltan Boszormenyi via lists.openembedded.org
>>     <http://lists.openembedded.org>
>>     >     <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org> a
>>     écrit :
>>     >
>>     >         This fixes an installation error:
>>     >
>>     >         | make[5]: Entering directory
>>     >  '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
>>     >         | chmod 700
>>     >
>>  .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
>>     >         | chmod: cannot access
>>     >
>>  '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint':
>>     >         No such file or directory
>>     >
>>     >
>>     >     What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
>>     >
>>
>>     I got the error with 5.3.4 and it has gone away with 5.3.5.
>>     I admit that I only tried the build once. I will retry tomorrow.
>>
>>
>> This error is a rare intermittent failure. You will most likely not see it but that 
>> does not mean it's fixed (sadly).

How about adding PARALLEL_MAKEINST = "" to disable parallelism during do_install?

> You are right. After "repo sync", I can't reproduce the
> build problem anymore, with neither 5.3.4 nor 5.3.5.
> I haven't noted the layers' commits before, so I can't go back.
>
> I tried this sequence a couple of times for both versions
> this morning and neither version failed:
>
> bitbake -c clean gutenprint-native gutenprint && \
> bitbake -c cleansstate gutenprint-native gutenprint && \
> bitbake -c install gutenprint
>
> FWIW, the CPU has 16 cores, 32 threads and a HDD stores the build.
>
>> Did the 5.3.4 version on which you saw the problem had my patch?
>
> Yes.
>
>>     >     The above error is the one I fixed with the patch
>>     >  "0001-cups-fix-a-build-race-condition-around-empty-directo.patch" and this patch 
>> has
>>     >     not been merged upstream nor the code I touched changed. I did not see anything
>>     >     related by quickly reading the NEWS.
>>     >     I'd be happy to see this fixed upstream but I'd rather have upstream 
>> confirmation
>>     >     that they saw/fixed it (a commit, a changelog, ...).
>>     >     If that is fixed upstream, then we can drop my patch.
>>     >
>>     >
>>     > To be clear, I'm not against upgrading. I just don't think the commit message is
>>     correct
>>     > (but could be convinced otherwise).
>>     >
>>     >     Thanks!
>>     >
>>     >         Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>     >         ---
>>     >          .../gutenprint/{gutenprint_5.3.4.bb <http://gutenprint_5.3.4.bb>
>>     <http://gutenprint_5.3.4.bb> =>
>>     > gutenprint_5.3.5.bb <http://gutenprint_5.3.5.bb> <http://gutenprint_5.3.5.bb>}
>>      | 2 +-
>>     >          1 file changed, 1 insertion(+), 1 deletion(-)
>>     >          rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb
>>     <http://gutenprint_5.3.4.bb>
>>     >         <http://gutenprint_5.3.4.bb> => gutenprint_5.3.5.bb
>>     <http://gutenprint_5.3.5.bb>
>>     >         <http://gutenprint_5.3.5.bb>} (96%)
>>     >
>>     >         diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>>     <http://gutenprint_5.3.4.bb>
>>     >         <http://gutenprint_5.3.4.bb>
>>     >  b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>>     <http://gutenprint_5.3.5.bb>
>>     >         <http://gutenprint_5.3.5.bb>
>>     >         similarity index 96%
>>     >         rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>>     <http://gutenprint_5.3.4.bb>
>>     >         <http://gutenprint_5.3.4.bb>
>>     >         rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>>     <http://gutenprint_5.3.5.bb>
>>     >         <http://gutenprint_5.3.5.bb>
>>     >         index f90a123293..82953b798c 100644
>>     >         --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>>     <http://gutenprint_5.3.4.bb>
>>     >         <http://gutenprint_5.3.4.bb>
>>     >         +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>>     <http://gutenprint_5.3.5.bb>
>>     >         <http://gutenprint_5.3.5.bb>
>>     >         @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =
>>     >  "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>>     >          SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz
>> <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz>
>>     >  <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz> \
>>     >  file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
>>     >                     "
>>     >         -SRC_URI[sha256sum] =
>>     >  "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
>>     >         +SRC_URI[sha256sum] =
>>     >  "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
>>     >
>>     >          inherit autotools gettext pkgconfig
>>     >
>>     >         --
>>     >         2.51.0
>>     >
>>     >
>>     >
>>     >
>>     >
>>     >
>>     >     --
>>     >     Yoann Congal
>>     >     Smile ECS
>>     >
>>     >
>>     >
>>     > --
>>     > Yoann Congal
>>     > Smile ECS
>>
>>
>>
>> -- 
>> Yoann Congal
>> Smile ECS
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119589): https://lists.openembedded.org/g/openembedded-devel/message/119589
> Mute This Topic: https://lists.openembedded.org/mt/115307539/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


