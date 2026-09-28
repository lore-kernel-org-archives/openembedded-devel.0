Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF48BC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:04 +0000 (UTC)
Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47650.1790553783960375240
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hGHxsTbe;
 spf=pass (domain: gmail.com, ip: 74.125.231.98, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-494ab4d6128so364020fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790553783; cv=none;
        d=google.com; s=arc-20260327;
        b=E9V853skrtvJMyc+eIGwjBUMJaR84iXKVy2BNbIgrkgWKtWKKzzeVFNC9Tv7MylFNq
         RdYQGIaf+rXd0xnmSkW1GhEZqd8njRc8CbP5ewSeE2bg3MAGkj71AyrCKDp+AKIvHlZh
         f1q+WYFaiSwgspmohCImDnqhKv4vAfRbn3hek0mi+PK/bU2xHJ37WhcxKeHofDkPTw5Y
         FYjH1W6ouva1PhyfuwOUu+oPpQMUjE/DueXpnUeTYBUwx3r5BfY8Ejz3Mu7X/JFBGLhm
         w67iIsca+8PNTUYjG1b3he5j1Z70W4A2sbTSR7HvT1w1YcryGpf9f9NiU0OZeBnJvmYq
         bedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQJym1kfkIDjAaNBz5Bk/raRcOV9RRFdDEmCD/3g+go=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=HCU8jbwXvWUeCf+dCHsDUcdKDdMaljl4RtivSqhmtGYUzNCyDO7PkmGHSbtkdIqgEZ
         LcCaSX/2dLQ4yoCT1Cmcy9QlF925+VoCEMvqae8ZcRTTiA4dzXm+6kvo2p2dpfPawk+W
         lpipdqKwr3gX31BN/oimkvCEoOFersEWLt/QkiB4EIJMZQ/9JFd7onBifpWb6X7Dtuy/
         cM2ZuMfhZcM6zwbMtkV1O2d0vZujYlMoHA72I8i934QoqRkZuQQnJUWuObsDbuO8UjAJ
         G3GKUTkADxWaIolplz/rzNfGzgjNjmlz6cZTeVp+L4M9ZwYJrYoMZzMsS4+bHDz2O0x5
         bVjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553783; x=1791158583; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oQJym1kfkIDjAaNBz5Bk/raRcOV9RRFdDEmCD/3g+go=;
        b=hGHxsTbesnnoFZycdHLy0S/0eoMXxRZBOX6gC100mONb9/+m44EIGpxSWXxPiUf+1S
         2bPSr5qZB1vma6YrigW3E5WI1kwLhnE2sfTDAXvaIXslMkqkKV5LKk5nevQCfBigGlxe
         3ghwNG3PSvM4AdF1fCYNZuVYNPNWzb27b7iJxKP3pMhcwLuBvRmxis9kMpGKS9qwVfhX
         NT7f3J48/5xWDXpb47AaBgGLo0WiLqzP51um9tyjykRjMfp02E+xslZs7AcP7gIBxnlu
         4oxRjs9PXf0xvilo7H+/vsNBSp9RNr5hPZA2pnbUQd+k5GqraV8Gc6CnZd3Aj9Eqk/AB
         S5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553783; x=1791158583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQJym1kfkIDjAaNBz5Bk/raRcOV9RRFdDEmCD/3g+go=;
        b=aeXyF3r12K/QzRZffoOVrMcDj9c7AJV2PkyTNqV02rXZrFCYQmaoxLMq7Wi+jYJpGT
         fC0i1GyEG5Ql5qlQ9qATcEnmf+BhMomycY3+NWYr5BqEU2iOED2tDGfwl/cV5A81RK6U
         0te7Ldec0Vd0qnV/G0YZ2u9PEVFYMcqBoJVn+pL6eAT7PX9HcQvE5xPZcfwOFVtnJVHw
         GfMcg7aSvkrE0lKtDCAYjU1lC6GUDjNppGM+YjOCg2kVISATAp0wxQH5ZxmyDGos/USs
         nzshkWhaY0nqGyVt7sa2utAsSIeHnyRI+55SB+xL+oSelfGStCoIH6rZP+wBl4AQY+29
         aRuA==
X-Gm-Message-State: AFuF++mloDBkeKp+u19akGkFSq5KeAI8Et9Q5rJ/xK3ilzGFpfABRu5t
	KEWmEXNz7yJWV5zViHRcL1W/3/LxmUXm6pBiSr03pDcseW+PxN9WYNRxuxfBqLvPBn4ZMCCy5dQ
	TpEyFHqCY44QNiuZrgWM99zsqwyLiJpU=
X-Gm-Gg: AYBFou1P5jTGshbCJNp+KawgIPVeQZrIc76mG4EZ1iKJ7AunfTLLiVtu99Jt05DWBaP
	9FjGAp89StCNN/W7HWIYbSD3pPxVZnLmFzgSHSmRa69C4mX1kPoOvIIXVXJPMPdKPf1mtFfmfNG
	5NOfdRh8ZdM71acStmAGie0iurjJAXEfMYvFqMoVy+8dO5aqn8kgbBn1/og6u9/5PbhbP9bdHT9
	NWW1THI6DwwRRGMv+zTkcEHTqQXxcxO4Pne/4FMzn77FQwwD1KPNU1RyLtBGaV2xdr9lIXolLj+
	aTWg6uAqkc1OxIRaxP3XJGxG7523LkF7k4AtQV9rQZKM9BHUcULsmdBlME7lu2fmnG4DsQ==
X-Received: by 2002:a05:687c:4594:10b0:493:3299:f1fb with SMTP id
 586e51a60fabf-4933299feacmr5214735fac.58.1790553783097; Sun, 27 Sep 2026
 17:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
 <20260927105002.1832451-27-ankur.tyagi85@gmail.com> <CAMKF1spx5aSzcn3+CGTQuqO-xRhB9QYemo_v_o5+i9xy_2GhUA@mail.gmail.com>
 <CADySD0EepB0Fy7+dt234maqiy9tBdcddC9_Ma9cfiN26QZVyjg@mail.gmail.com> <CAMKF1sq+MVmfgWOsLedrDKF2YJ068gQ8=bCECWdJLE1ghZKC5g@mail.gmail.com>
In-Reply-To: <CAMKF1sq+MVmfgWOsLedrDKF2YJ068gQ8=bCECWdJLE1ghZKC5g@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 28 Sep 2026 13:02:51 +1300
X-Gm-Features: AclHuK8k6mqQb_2SQK14PKX8Bfuaq1gFnKQuTI7CSppFc0qqS2PtdA30g-cWcOI
Message-ID: <CADySD0Fx-0PW6bDa8D3g_rRjhXSBV5QB9NAq=cYeFMW0zMTeVw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 27/35] pocketpy: upgrade 2.1.8 -> 2.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130387

On Mon, Sep 28, 2026 at 12:20=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>
>
> On Sun, Sep 27, 2026 at 1:45=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.=
com> wrote:
>>
>> Hello Khem,
>>
>> I can only repro this error after applying following commit from master-=
next:
>> https://github.com/openembedded/meta-openembedded/commit/201f3c95cca9022=
07c5f6ad25ca057e803921542
>>
>> Without the above commit, build succeeds without any QA warnings.
>>
>> Not sure if that commit is relevant anymore.
>
>
> This was needed for build to avoid buildpaths and tmpdir in output artifa=
cts.

Ok, I'll investigate it later. For now, please drop the patch
>
>>
>> cheers
>> Ankur
>>
>> On Mon, Sep 28, 2026 at 8:52=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>> >
>> > This fails to build on AB
>> >
>> > | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-p=
oky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c: In func=
tion 'time_sleep':
>> > | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-p=
oky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:112:9: e=
rror: implicit declaration of function 'c11_thrd__yield' [-Wimplicit-functi=
on-declaration]
>> > |   112 |         c11_thrd__yield();
>> > |       |         ^~~~~~~~~~~~~~~
>> >
>> >
>> > For details see - https://autobuilder.yoctoproject.org/valkyrie/#/buil=
ders/81/builds/1822/steps/17/logs/stdio
>> >
>> > On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembe=
dded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>> >>
>> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >>
>> >> Changelog:
>> >> https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0
>> >>
>> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >> ---
>> >>  .../pocketpy/{pocketpy_2.1.8.bb =3D> pocketpy_2.2.0.bb}           | =
2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb =3D> poc=
ketpy_2.2.0.bb} (95%)
>> >>
>> >> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb b/me=
ta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
>> >> similarity index 95%
>> >> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
>> >> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
>> >> index 910deba386..e4aca45ae8 100644
>> >> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
>> >> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
>> >> @@ -14,7 +14,7 @@ LICENSE =3D "MIT"
>> >>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D224889df377610675315e194a=
c59276c"
>> >>
>> >>  SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps=
;branch=3Dmain;tag=3Dv${PV}"
>> >> -SRCREV =3D "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
>> >> +SRCREV =3D "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
>> >>
>> >>
>> >>  inherit cmake
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#130361): https://lists.openembedded.org/g/openemb=
edded-devel/message/130361
>> >> Mute This Topic: https://lists.openembedded.org/mt/121453680/1997914
>> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>

