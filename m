Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0389FC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44628.1790541918029348316
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 13:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mNQHh3lN;
 spf=pass (domain: gmail.com, ip: 74.125.231.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd5fso600974eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 13:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790541917; cv=none;
        d=google.com; s=arc-20260327;
        b=aqW5aJ1yhAZGC+KvGy3aD983wQi4f/2UhfiIva9rROk5VtFfZk48WA0rWiB1xjooLh
         w7iNXG34QiZ3AE2cB94vFZXhbwxFDGUItQkTcpEIrGK3gCbE4KxznPKe/h2s8/VwMaTB
         TSl2Ud6dcdD28lz7TKntyl+tP4l+QeqLRPolKGg3/MCIjFwLrFfuulOLl7hveSOWLMca
         3/9l1X1HnaAcjEa+CAryp0XibBAnd9rgwYaHhgzCAaky3lYEX0HBsf7YUbJgPPtUQKJC
         4gYSE2v5qiQ29hVenCAZs9qIPWfQ/O9o9lvEZuq0oCGV2bFQ0LcRuke4GtS9peTPvHSv
         5mcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NkMh9fU/9Ow5/j6NYTxS0s28JfzXfF4Hj00iD4MMeFs=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=Oxi9YhC53ED4/TkqEZRExQfdqLhrXqdfD5QJb15RRR2u6eWhLO7FxLxycUNMytVIi1
         m8l6YBWCRVoImU8E0nPosebiXcEcks0CMvsGBjhzrnV6uqy6foUUF2G+6PDNcF5U6tAc
         uPbz2skvlrSBDCGaKqZVYa3GbIyeOY/aVkfBtxcbLyKHuKA/r2xfFWZcpAdd+Jb7pUWO
         yV+SsuTuIoh08apQofKmMnh6DBNazt/FKYAdicqO8m9OgIUo1vde4T+ZGNtCoCWLED3h
         kRnRdrLRjxDeKu4UumEEUOSyIMqf4p2tY+SE0cGkrSzYyA+yGD0oRIKR5mZXgRB8PCac
         Djkw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541917; x=1791146717; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NkMh9fU/9Ow5/j6NYTxS0s28JfzXfF4Hj00iD4MMeFs=;
        b=mNQHh3lNMzP2pwATPdMzmmdTkcBBYmROlQIGD1IUPN505RfOW2zSwosuanEZQLIC3Q
         /tIu6CB9oaLIY7Rw9pXoOBGfrBSHme9AAE54vBYrhnJCkDSfY2QEiQXy2K9kiDDvc50w
         UoTPCb/pT8r/PiEo9SZ0WxFvzKRxqqzsxOSESu6oUfugUg8OyEX2X9aVMzcvMsnVohUD
         TLYdfOrcTxOEwYM5Brdtp3/qtx4c1V/CBqrw1kLbAGKgKS+puixMbhLwqeoQDunBScTo
         jvE1SqO37gGRU0H+I8+4cd7Mjbpl1kdxHvhCtuFnrAK6Ag0g/VvmXS0qkkrMprkMg1Yr
         r6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541917; x=1791146717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkMh9fU/9Ow5/j6NYTxS0s28JfzXfF4Hj00iD4MMeFs=;
        b=oHgMXjt8A5CcukRxtMzdOgxXrgTPWj+4WXw+nY/c/zuKX95+jlgifU4gDEq0dzUUZ3
         C7+Ixuf0Dp748immzakzUPnl6g5FtjuhIthJOI0FJrnLoPyZw2Z61qaWP+k8tbAZee2t
         M8p3aPwgjmgdc7qRK7ONdOqxBeFDHhJszzEHPH/oRwZL2eMp9y4Qqn+YS0RStIjtS6Ia
         knSJWir4T26FC3uYoMGawNkn84BPXGKZizT2X9onRXNpkreJruqkbF3PPpVSAxaT2nYw
         LLPE5eA0NzOPj0aNWCMwujJOQDbi8LNjHUjNa8QVoluQ5bE/L89R9NzmJTytdheY19GU
         uY9A==
X-Gm-Message-State: AFuF++nysiMcimPYY2T6jCInQPZe2jMLCyJZSn8uvCYWRGC7lE9/ki1M
	XCtSHF3fPzcTaHag7wzOMsdBFY1AdYGM19tp6PLylKQx/v+df5oKOXKD8OQQ0GOEdihEiM+lhlC
	4hVMaUyAQ/t+e2ctSarUJ4igIMDvFC60=
X-Gm-Gg: AYBFou2z5yDnZJgJbf/MxLBOXyQH9h0TIKoajkMBMerUxSOKEjg8oPYh4TzNAWxk5ix
	VCyFT4AERTQUhekfTgU2tVwIFEb4DB50G75wIu4S5YXLKfP4NMP6cgJCxccX3iQi4I+cCls1akc
	U3E8WPIOH0ALP6GEkewIeSsDMe26lpUFg575mhH5XFxnnl5uAJC38c4cx7Y3EhmtDsKpc47WFTg
	4l4bwum5TrL4v7TszSs+di6UBM4f5CbdA7tUyNolgI2o3hVB1e/Wz+HKF1D4bBMot8pEtASjbl2
	5oCgg4/ZyDK+6AnRz73NgrrkzPLS6u47CAaCra24NjlXn+7AYRLpwfiWYLpvYQeHQ42e1FpyugJ
	lqIrC
X-Received: by 2002:a05:6820:821:b0:6b3:1864:18ac with SMTP id
 006d021491bc7-6d43f7a708cmr12326853eaf.25.1790541917194; Sun, 27 Sep 2026
 13:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
 <20260927105002.1832451-27-ankur.tyagi85@gmail.com> <CAMKF1spx5aSzcn3+CGTQuqO-xRhB9QYemo_v_o5+i9xy_2GhUA@mail.gmail.com>
In-Reply-To: <CAMKF1spx5aSzcn3+CGTQuqO-xRhB9QYemo_v_o5+i9xy_2GhUA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 28 Sep 2026 09:45:05 +1300
X-Gm-Features: AclHuK-XLs4bla2-aR_5VxkbAScblOu1sd5JfYcEkodVvtLBCYhvSFUdpVcroVs
Message-ID: <CADySD0EepB0Fy7+dt234maqiy9tBdcddC9_Ma9cfiN26QZVyjg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 27/35] pocketpy: upgrade 2.1.8 -> 2.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130380

Hello Khem,

I can only repro this error after applying following commit from master-nex=
t:
https://github.com/openembedded/meta-openembedded/commit/201f3c95cca902207c=
5f6ad25ca057e803921542

Without the above commit, build succeeds without any QA warnings.

Not sure if that commit is relevant anymore.

cheers
Ankur

On Mon, Sep 28, 2026 at 8:52=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This fails to build on AB
>
> | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky=
-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c: In functio=
n 'time_sleep':
> | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky=
-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:112:9: erro=
r: implicit declaration of function 'c11_thrd__yield' [-Wimplicit-function-=
declaration]
> |   112 |         c11_thrd__yield();
> |       |         ^~~~~~~~~~~~~~~
>
>
> For details see - https://autobuilder.yoctoproject.org/valkyrie/#/builder=
s/81/builds/1822/steps/17/logs/stdio
>
> On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Changelog:
>> https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../pocketpy/{pocketpy_2.1.8.bb =3D> pocketpy_2.2.0.bb}           | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb =3D> pocket=
py_2.2.0.bb} (95%)
>>
>> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb b/meta-=
oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
>> similarity index 95%
>> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
>> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
>> index 910deba386..e4aca45ae8 100644
>> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
>> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
>> @@ -14,7 +14,7 @@ LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D224889df377610675315e194ac59=
276c"
>>
>>  SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3Dv${PV}"
>> -SRCREV =3D "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
>> +SRCREV =3D "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
>>
>>
>>  inherit cmake
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#130361): https://lists.openembedded.org/g/openembedd=
ed-devel/message/130361
>> Mute This Topic: https://lists.openembedded.org/mt/121453680/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

