Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CD7C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:02:33 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.5017.1676494948234476099
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h9WEGUdL;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-16debd2786aso267014fac.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 13:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w4U3Hft0tjUhxZ5jzVrCtfy3sq7Dmu1Yz5bJAEVGOP8=;
        b=h9WEGUdLiggv5zk8MoZfynqYUQP/+244FxLzjH4x217C6cBS1NKJM29bLrIIQwMDO5
         VuM9YpYZrxtEbCgJTU5/BZdwl8U5T5SXPRNWvJYeYFeUlx8/XpGT0PqIeQC5W0CkZ8H9
         qfn8R0jyPWkaPF/QqfeqyUzzVxx5JZksihBAna6nbE4MlyJ5u7uy3rutm84l/d9RT5bn
         uioY5iDvvNsEIKaPoCn6GwwMB1wZ05fVDyEIOD36b5i3p4AYWWk8ZFhlBZ98TD1EDC0k
         gGL4WNGiA6rLPAHCxJJS+wv7FxRmDnzro4ItQ0I4Rphu/xPpII1mz066xV/ZrmvJu54m
         QqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4U3Hft0tjUhxZ5jzVrCtfy3sq7Dmu1Yz5bJAEVGOP8=;
        b=v2dzgvOOO0+G3CpUSY3n55lHY/1wUHsQlyQEOIIcqDFbDNjV7LC427WlxVxivsIeg4
         BTtqyge56E987rufxnAT+pw8yEDbHigK5M3cz+F3Dc+QWYWlTlTr0F5M/7HVdZJKmqxB
         7oF++aV9UW6V8lgonPUuD8/r4oksI7wB7RueHbZrPxqQpfHYiJ9VJY6NdBr4oAM0IPqk
         Rj2laXoB4afHB6W6PyobdvrOPC7Q0cvNT8p4fsHT2ydWdrCv2YxvWljpMaAsPxTTCFdO
         7hQAyj44aApts8bMXoiMaMh7Smo24QVLUJXYBTMk/LThzcACcw1YKuZvgKL+ma6l/Ucg
         gMuA==
X-Gm-Message-State: AO0yUKVI8z0+faD+smJ4tTND6aTd/I172FUZ3OB3JebgcTKy0vjtVOeL
	LTydoKFnPYhcz9w/QVasjoWb9DR5Jzz5x7q1eY0=
X-Google-Smtp-Source: AK7set9eNbJ1sVGqZuWKrzlg9T8RUksB8Un2UKEfQ9fTSHh2ok/OXP6j1MZb0woFha8f9yv/2L5MrcVQn2ZGsu07KIg=
X-Received: by 2002:a05:6870:e754:b0:163:b85e:f1ca with SMTP id
 t20-20020a056870e75400b00163b85ef1camr452753oak.262.1676494947373; Wed, 15
 Feb 2023 13:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20230208131157.2564692-1-archana.polampalli@windriver.com> <CA+chaQcOOhCszggnTyR2fhsuwTGODcb1yZUFfcTyyur2C7Ze8w@mail.gmail.com>
In-Reply-To: <CA+chaQcOOhCszggnTyR2fhsuwTGODcb1yZUFfcTyyur2C7Ze8w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Feb 2023 13:02:01 -0800
Message-ID: <CAMKF1spYRt037CeiCfoc5ubAtCJnJbnMhYdOW71wN=ALO6aptQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] Nodejs: fix buildpaths warning
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>, 
	openembedded-devel@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 21:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101086

On Wed, Feb 15, 2023 at 12:27 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> This breaks the do_install when "shared" PACKAGECONFIG is enabled, see:
>
> http://errors.yoctoproject.org/Errors/Details/689959/
>

I wonder if --libdir assumption is right about having absolute paths.
We might want to fix that and add a staging install prefix if set
>
> On Wed, Feb 8, 2023 at 2:12 PM Polampalli, Archana <archana.polampalli@windriver.com> wrote:
>>
>> Correct libdir used at configure time to avoid packaging warnings
>> WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:
>> File /usr/bin/node in package nodejs contains reference to TMPDIR [buildpaths]
>> File /usr/bin/.debug/node in package nodejs-dbg contains reference to TMPDIR
>> File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains reference to TMPDIR [buildpaths]
>> File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains reference to TMPDIR [buildpaths]
>> File /usr/include/node/config.gypi in package nodejs-dev contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
>> ---
>>  meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> index e96913e56..04a80a6b8 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> @@ -145,7 +145,7 @@ do_configure () {
>>                 --without-etw \
>>                 --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
>>                 --dest-os=linux \
>> -               --libdir=${D}${libdir} \
>> +               --libdir=${libdir} \
>>                 ${ARCHFLAGS} \
>>                 ${PACKAGECONFIG_CONFARGS}
>>  }
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101084): https://lists.openembedded.org/g/openembedded-devel/message/101084
> Mute This Topic: https://lists.openembedded.org/mt/96829436/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

