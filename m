Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E176C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 01:25:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1962.1785288345494394207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 18:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gr1TNYXS;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-448b69cfc6dso328650fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 18:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785288344; cv=none;
        d=google.com; s=arc-20260327;
        b=iI8geD+lSbhpA/4uZNEFeWRtidtxMoYODsafVUNhvv1o2lFoVedTM57JfrhCX/egjE
         D833EwDSRWTV7jxVpYm8mYUZJ+nwhqHaf0Q/TiqGbsdpa1CQ4yFqPKFHmxMgNO5QWZ+6
         x40jEve1IRUJcO/iO1k/bjcW8e2unOB9epP3VGOzMa1G5NH06dKwKCH9Y/ymRgBJv/n1
         7dP437y6dr508cZ4nQfWtt4z73d8+V5OWs6uJb2QfMRIrspDbsS3Xdu4ptlex8QZHmdY
         sZd2EuOvU1xyGnExWyyj+9oMuAwys5T7cfWqTGS5ZbJPMdcEFCBy4VEmdNZ3Cou77IWC
         flxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e0MVHPX7ElxgaZlnMUHgPUgNiOrajMMPyRbocPj7FdU=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=rLil9gbcv+ShWM6kCyvKeOixyEEm3XSfV1kFIMyEIIkIWTuN6J4hH9HG3yRBeIJgiH
         mOH1gqvu3Nh5wx3EQzDVwO43eIuKY7jJ60vxDll6RsodK+F7+FnuE/WeTDLu4ayt15US
         dJCPYGKSLxMKaptIcKj0py7483CWKXgNDAF99CM4HXYDmFvzHUvarGfzHI6NgZ1jGaAn
         Rv4tTcWjO2akhmQmKtbQBNLzvzHfOM24HnMG9rJPb1tJTruXiWkZwPnvVEfX0lTuIkf2
         qPtGpjkS58Xnc8O7gQOH1S1rhqJRnAUmHnYTspd6LjemiaZkYLt4h71SAK2DCzziwBa7
         2TxQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288344; x=1785893144; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0MVHPX7ElxgaZlnMUHgPUgNiOrajMMPyRbocPj7FdU=;
        b=Gr1TNYXS0aXmZrQccCaZc2d8Z5IXPPrPmU85sYLiS+eP+fAQGtoVaFwhApiwC7uJFO
         BknV/ZZvCU/2SXcAj2DwlIEbA0Ym1B/ZuKpvTn+5sWw0xXCyBH1gViAL6ILzBKU3heoB
         YntugAqUi5cwzHg9veXZa1l3Az9aYCvM+yQ2ipkUoTAPxiyWzIIrRIZ7sj+epcXghtBP
         mJQiYamiSqA7hQc/pDQvbhD3Yhd780AwxUXQGMIvCNe0cD7lpq1HjDQ4rbwsv5W2cxFV
         uNUVtZD9JdC//O5UtruZ9QO8d3IVs/oXBbYGhZPPeAWpK5yAYrLycCGwILFoCOounQKo
         ALwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288344; x=1785893144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0MVHPX7ElxgaZlnMUHgPUgNiOrajMMPyRbocPj7FdU=;
        b=W1bm3xUHVgr4zSjNZkiEK4tnxRrqOTM030MzB/uZxVRLSrwTqN5Lcu8+Yelm1fkjra
         ITM20smeUgRab7TEyENTHGodlPdKZKRpzforuDJIuD9LyoR1LuX33r5gAbbPiHvAHV0n
         rXYqDNoH/FdEmtPwfzvjcCzE/INsJTCjLSflTFRKI8RWeSiR2ClZGn6JB++GSHLm5gu9
         2ePd6Fdv5YSgfOu2R3MPz7ZWgoocONslW53qzJYnUhEruloksjakKFQ2HMSxLDYxoD77
         xvV2xW8dgvMbJWpRys60Hfeza0G7zZ5HqTpdZYbyOLeJ8EJaoDsDJIKPOIur6jXj38nT
         m02g==
X-Gm-Message-State: AOJu0Yy3VqX0U6zE4d2cBUy2HWvnF2M5DfNRhtRMcmv0j7pEdUKVm6nC
	LQWdol74KT4SVXWPzPRGULC07Fij32aztwfdQpY+kAX8CZlv/lyHC3qsHEjWVujhyh7WOQE5JpB
	tKaOFDV4gH8ubSYNkN9yWUQ1cCq4aHbM=
X-Gm-Gg: AR+sD10cXjOJwFfLuyR1XUO9t93kOEAmP9jpAr+gE5jLf5nEA9njbUe0xKw+JYEn7CG
	7i8aGqcJ41SZt9xtbIz8DtR+uVipJq9Z8+uajQaMRnCw6cdjDGsB7ISBlMbczmwOOZVDVbw3GCA
	c/TvmywcFH5TYZxyYpg0baPeDjHfQBcrlbDS9f4InHb850mDtcWDPq0ZeP6ixe/HFLtrv5zt2pF
	dxR86nFOR5ehFH6kHFm+mShmJeJ/QIKGfw4m2VEefR+cnd+wsGN8Fwxz1oElBRH0CrCDz9/1SvB
	owTUi5Z4LSFi/hkq0WmcNs9SZw+Fe1wTfVGUaoqtaARWbig=
X-Received: by 2002:a05:6871:3842:b0:457:ed1a:9da3 with SMTP id
 586e51a60fabf-4586c98565emr2898442fac.17.1785288344471; Tue, 28 Jul 2026
 18:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260728060645.819-1-wangmy@fujitsu.com>
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 29 Jul 2026 13:25:33 +1200
X-Gm-Features: AUfX_mwtqm0ge7luRmDP1uhu-RC9Lbxy3M-dOW84mNMXoJtkPgFFu9gTRdRohUw
Message-ID: <CADySD0GR3qULm1PTj_f+aSTeNeJVMU0K9qbBmJN=LvD1AiRS4A@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] bats: upgrade 1.13.0 -> 1.14.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 01:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128515

On Tue, Jul 28, 2026 at 6:06=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-test/bats/{bats_1.13.0.bb =3D> bats_1.14.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-test/bats/{bats_1.13.0.bb =3D> bats_1.14.0.bb} (9=
4%)
>
> diff --git a/meta-oe/recipes-test/bats/bats_1.13.0.bb b/meta-oe/recipes-t=
est/bats/bats_1.14.0.bb
> similarity index 94%
> rename from meta-oe/recipes-test/bats/bats_1.13.0.bb
> rename to meta-oe/recipes-test/bats/bats_1.14.0.bb
> index 3545295a3c..bece4177c3 100644
> --- a/meta-oe/recipes-test/bats/bats_1.13.0.bb
> +++ b/meta-oe/recipes-test/bats/bats_1.14.0.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>    "
>
>  # v1.13.0

I suggest to remove above comment

> -SRCREV =3D "3bca150ec86275d6d9d5a4fd7d48ab8b6c6f3d87"
> +SRCREV =3D "eb7f42f8d608ac693d7a4b67474f6714ea68cfc5"
>
>
>  # Numerous scripts assume ${baselib} =3D=3D lib, which is not true.
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128470): https://lists.openembedded.org/g/openembedde=
d-devel/message/128470
> Mute This Topic: https://lists.openembedded.org/mt/120480218/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

