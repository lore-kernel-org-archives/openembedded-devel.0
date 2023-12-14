Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7341FC4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:41:20 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.29199.1702575678889545341
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G+4R3y4/;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-203019328a6so1853868fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575678; x=1703180478; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1HP9YqWLF4LI5WKvY28Lb5MFRZfFB3bLBoWgvI39WM=;
        b=G+4R3y4/IwalzOBAqmy/Yh9Pl8gk8lC1so+ikIbHaGNLLInKH/5omV5SFwuA4r8Bbf
         G20kHQP6MYVucqq9130mJFz0Qw9ETFKjm7QiEzmsGxCUL5u3mG9CaxkJvYH1MduKpEUH
         a2bJ96vXFT7vCFU1HfPSWfuX/192Mak1Pjk7kTteSviUEZSCWN+pJX7jLp7YFSunaq19
         97xsAaxWz9RFOqHekmI5VmpucZJn8C25l4NoGu8ce077uL+FUQ3ZvLEECn+wc7Syo4iC
         0IC7zcnP5HH0gPmaZYBupIbx4CmnSK6O+xZmA65jWN0AWUfMArGs79UGHX3EVwM87Sym
         kMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575678; x=1703180478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1HP9YqWLF4LI5WKvY28Lb5MFRZfFB3bLBoWgvI39WM=;
        b=rJdGvD+D7/Qr98qVnwM4VjOlQITQmG2l6O68eG6MNunMNyzcPtxQ6qJsqfRjHYC7Es
         JAw/4ntJgg9dBie+wMPMgTQqbxFkEDYB0tKv4jRDEGBm4gcCRDgX/kve0rncaQDCtW3d
         ZhhSVFZcyHLhFvJX2w41sNVOjNrQ1RlawozxfcqouWl9E3uYQoCO5c74lEBhr5U3je99
         H5HHVhTWJ00uQvFhSUBELCKArZajaU6tIMQeUFmzs16Nc9i9/TLWWHbDAPxACRKIrACA
         VE16wNQFhHJF4J/sEnKZXArXLM9YhcNSBN6DKkr2544HLLn8Vp7sPG+NzMtTR0nA0cqD
         /S5Q==
X-Gm-Message-State: AOJu0YwD0DbmsZWls+PwdwTWYKcTKYcKS7qxpcggd3XLkJUvugY5bNaO
	GnnLBFJZzNy26ERsy0WNmfS91i4F9GEh+uwrHf0=
X-Google-Smtp-Source: AGHT+IEPwBV51YnP+GiUiO1a9hqjovDXJgC3fqpUk8npeJsz8MD7gVAgAbjbQXbUhfioxvpBMk0GtpXbkgHKW4GXpkU=
X-Received: by 2002:a05:6870:d88c:b0:203:3721:bdbf with SMTP id
 oe12-20020a056870d88c00b002033721bdbfmr2265911oac.46.1702575678049; Thu, 14
 Dec 2023 09:41:18 -0800 (PST)
MIME-Version: 1.0
References: <1702544474-28298-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702544474-28298-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:40:52 -0800
Message-ID: <CAMKF1srMKd2zQgX4_o5FzA58a+bcHg2LaEWBSxKME+YQPQFG_A@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-portion: upgrade 2.4.1 -> 2.4.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107457

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
2330.1209724-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 1:03=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>   Import error when using create_api in Python 3.10+
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-portion_2.4.1.bb =3D> python3-portion_2.4.2.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-portion_2.4.1.bb =3D=
> python3-portion_2.4.2.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb=
 b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
> index a340ba7fc..b4bbfc6c6 100644
> --- a/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D05f1e16a8e=
59ce3e9a979e881816c2ab"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] =3D "9dcbf1808898f440aed304a5e9f0742a2859eca3b0ac7f1f=
58e50502852a8ef9"
> +SRC_URI[sha256sum] =3D "5289b40d98959b16b3f6927781678935d3df1b7c14947f5d=
7778e5e04dd9a065"
>
>  RDEPENDS:${PN} =3D "\
>      ${PYTHON_PN}-sortedcontainers \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107444): https://lists.openembedded.org/g/openembedde=
d-devel/message/107444
> Mute This Topic: https://lists.openembedded.org/mt/103166882/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

