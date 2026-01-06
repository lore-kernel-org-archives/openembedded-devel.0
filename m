Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52954C47BD0
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:17:07 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86384.1767691024834819561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmKCRJvT;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3f584ab62c6so344585fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767691024; x=1768295824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY2qn13oQDOxICD52KP9RTcZ1WCO6SK8VO72LcrA/h0=;
        b=AmKCRJvTTyvIZQqw6giCNLHH0dpT2ZFSn1KZIHtgDXFWeNqZlCkvaIq1oNnvfBDyiI
         UoCw1T42UiKPrjQ0krsmf5YxCWZw+d8mecauw1svLqWFOKB7i0dX9gY9FdmmrEpfDmxX
         se0qysZ5d9dD+s6hGpqLo4floG7JBpHAZRzutAJwfkBTNXKgU5VwageImfbnTXbUhUhD
         N+W0W1/32njz094Fhka86+5QIxyiSYmEbdTtCfBshhHGU6asQhVo5Z15N0fAjOq5bX74
         fbQRpvdwp3jQU3W4hd9dWcnwa0PedwU5+N2I/lv3yWupjywf+M8joenHWc8scpdpblF7
         nXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691024; x=1768295824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY2qn13oQDOxICD52KP9RTcZ1WCO6SK8VO72LcrA/h0=;
        b=MV29nuFsOBpE/17zz+ttdO6lHehqVRXea/gq01ez9O4CNiE3/yQTaamVZ0RQpMdVU6
         rfas5hAHxeghPktj8ELT0680vXyIZ1vIhF50HUPksnY2XYqqHbR9E+qEcMym1s369AFX
         NrzMDA8dC342Riw81YUp7P1w4l3Cy1mv+7T1qo7a9RUZXpFCp1E0HHlswIijmkmjh3yx
         X9UrO1vUCHZphWRTb+dKfFAB7KTrXaeKdMks1nzelLSavWc/9d2TOApjMmtx7D8Une5P
         mz9ouDahneYMnz3OU74kHC/ZRZ4fK0k+6UwakaMHjdzjQ6RGQR/qNKzpWl9Mio0ahHT3
         Sdnw==
X-Gm-Message-State: AOJu0YzjbRv3ht2ajUngH5l0PKRP9n2jY51M8KV172ip2BGl9pONNPzl
	kUCLfxvmBXDReQh1QsnTaAJmkQHQkG6i/tQD0dEmeDO+Eli8vCSa1brrEWtoqPiRfi56mtc3NLY
	HnTEScaxBKLaEzQks9QkssblOYBrUuPo=
X-Gm-Gg: AY/fxX60+fwoDIaSA8gzbQBLoFCrhHYSMGCXjNKc6mlmsYZh7Vo944dTI7odh4lYyP+
	A1r3nBHUvWBxC1ZyeCr2j71qMdQoAe6dBbvKTBLPyvoqB0sMs9v3CZ1UhgZev3ohvqgPIWtHIvB
	OvOEHu8HVCaygUIccZR2AAS6uc0suzjmUz0WVjP8V7tKlinXwWnCkWtuoXNrRy9SrdLX4I38JBO
	yesvQ3zbWXm6ZEIzv6PYeVKOq1hv5sz84DA8CNHtaexXI3c4oFEgop8E7D+5DqHd3Rvr4Fe
X-Google-Smtp-Source: AGHT+IGgBxLyht99tSrodKN1/+JX4AT1VxJm8rPglm6yzIIPgDWhXvtgDqgy+gVC1tbWze+gDoNlqSez7zU5f8rYBNc=
X-Received: by 2002:a05:6870:970c:b0:3e7:f3f0:a98 with SMTP id
 586e51a60fabf-3ffa095bedcmr1468386fac.5.1767691023918; Tue, 06 Jan 2026
 01:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20251229145152.489068-1-skandigraun@gmail.com>
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 6 Jan 2026 14:46:51 +0530
X-Gm-Features: AQt7F2qmWuaL83USOLcBRBtnQwqO7ACv8NEt1e1COevPPsRFRJc9888Hbk7jsE0
Message-ID: <CADySD0FHk9w=KRdxJVA+UffgshycAGvyxTW5H9pDKEwjva1Jbg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH 01/11] accountservice: ignore CVE-2023-3297
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123170

typo in commit message, accountservice -> accountsservice

On Tue, Dec 30, 2025 at 3:51=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
>
> The vulnerability is triggered by a patch added by Ubuntu, and the vulner=
able patch is
> not present in the recipe.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 071a45c9d76c9a222c8fbaa50089a8af44f44e74)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../recipes-support/accountsservice/accountsservice_23.13.9.bb  | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_2=
3.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.1=
3.9.bb
> index e3dfcfffff..c024ae3f92 100644
> --- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.=
bb
> +++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.=
bb
> @@ -41,3 +41,5 @@ FILES:${PN} +=3D " \
>      ${datadir}/dbus-1 \
>      ${datadir}/polkit-1 \
>  "
> +
> +CVE_STATUS[CVE-2023-3297] =3D "not-applicable-platform: The vulnerabilit=
y is Ubuntu specific"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122980): https://lists.openembedded.org/g/openembedde=
d-devel/message/122980
> Mute This Topic: https://lists.openembedded.org/mt/116984421/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

