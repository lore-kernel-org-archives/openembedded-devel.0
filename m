Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FB3C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 21:15:01 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.1442.1714770892206801984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 14:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GQprlLTE;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-23e94f0788aso35591fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 14:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714770891; x=1715375691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AM3ohYjyyHcGNJ4mu/NbUtKm+qnUqMYDRa9jizKtAU=;
        b=GQprlLTEo+B67EcAMJsy5CS5VELdiU/n0K0bbcDx1noVZYGgoX3lqKetQRj2FG/2Gp
         rNbN3MJM8gTZwzo3tkqZExUnbKF38n9uwHRU726StbV8dNCnzUMmvCVIP+81tlqFbOcV
         Dpsd0gveAg5MrIgnY+QDUR/VzWQkF+4YBtVFs+q5bUDwI9u9uoVRgdkdlxaxPfY5tqPW
         MDWmQ0cPcLX+NU4wkM4azY7Gtp4DqWH5kFDUPhDZHxxjTgM30Fp76DAYUEIJygRGbZnt
         m0GCAgxtomw5YCRBFWlGB+Y6wt2We0DvFP3OOGGWeTIcqfvVP+FrrTA8E+lYoewkiwyJ
         w5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714770891; x=1715375691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AM3ohYjyyHcGNJ4mu/NbUtKm+qnUqMYDRa9jizKtAU=;
        b=fY4aTJQJ+zxPTC3F7fYToU6J6eRKMINdT/rZ+C7+abXQ0AvhuTyGUlbsFEQaW4SepO
         AB91mU7npvYVMmmIPttjDcPceQHLw/OKs9OGRcPq9Xd6gkfFR3WjBc5w3acOpgFY4BZX
         AA9JIA09s71rvT1iE6uNX7/77IyRo5rsNpaAHUzWJQDRboE9Z0d8e6Dh/2H7MyRkh3Ou
         JGUaCcIb3Lm9S4vPTh2xu36rfLlVFHRyACac0Lj2k8jzsvrLDnJ+7aqx2Q2KhmPeJtYs
         Ub0vPufC1sQYKFFi2K6tG/QPrB5L4THoZfbVyJ9Smv2CU/G6JSGihJYdjMYMVOC84EWw
         bsBg==
X-Forwarded-Encrypted: i=1; AJvYcCVanq6jpG4BHQbcxr69G4ykYrSRM4pB739nZYVAJHcRQPawsWA6YpVWZXXuXVk5zY1BVCZtBhjg0t3pyJsHn/IQurOdzgyf0vPMeCB3Q/kKuaOsh3BkLz07Xg==
X-Gm-Message-State: AOJu0YwkJbCUYt8nbJssSQ6Xb/HWrGmMNw/ACQKYHhRJ59Eu6LnbZ3lX
	Ptod2zFthOgsjcUdqDMNXRcyNNvzCe6QUv4PQiqXhljFqUKkZVox/11GuxIilKtWRu74MJebyc5
	FosTiTeH9vdhgG0un3n7uTPg7zU0=
X-Google-Smtp-Source: AGHT+IF/uiLIEATxytookL8MleYpvMyehJkV1ESjM4XkK4dEFaJjDfhdusTW8UjxeNdaTh0ey/o5jmFXC7rDxOtu5Bs=
X-Received: by 2002:a05:6871:5b16:b0:23e:65ab:a3df with SMTP id
 op22-20020a0568715b1600b0023e65aba3dfmr3322566oac.13.1714770891320; Fri, 03
 May 2024 14:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5At5T2kyhSLQCGyQPq9xQ986CEOr=TZaqgQ-RwBP2QH0A@mail.gmail.com>
In-Reply-To: <CAOMZO5At5T2kyhSLQCGyQPq9xQ986CEOr=TZaqgQ-RwBP2QH0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 May 2024 14:14:25 -0700
Message-ID: <CAMKF1sqNZ9xOR+EwW6Hy7Osn522zj0=RmSi_BwiwssWE9uay_g@mail.gmail.com>
Subject: Re: libeigen: Backport license fix to kirkstone
To: Fabio Estevam <festevam@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: "akash.hadke27@gmail.com" <akash.hadke27@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 21:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110251

On Fri, May 3, 2024 at 11:03=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Khem,
>
> Can dff417630f26 ("libeigen: Update GPL-3.0-only to GPL-2.0-only") be
> backported to kirkstone?
>
> Akash sent a kirkstone backport sometime ago:
> https://lists.openembedded.org/g/openembedded-devel/message/105451

seems Armin missed it in his list.

>
> Thanks,
>
> Fabio Estevam

