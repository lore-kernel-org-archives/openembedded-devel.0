Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC901C98318
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 02:41:26 +0000 (UTC)
Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.237.1790304078149188455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 19:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ui1uujc6;
 spf=pass (domain: gmail.com, ip: 74.125.231.99, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-49386210e98so65818fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 19:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790304077; cv=none;
        d=google.com; s=arc-20260327;
        b=EQTARkgZWj24zB8h4pplIq3zZiQEbqzthRNmXFVPTFRqG0f/ALrG8nBzVcjqCGccVM
         SLUkKXFREe8vi6z8favVly34n53V1UjCoklIyRATCXeYVTM90qili6+OHUnvcITAqUBb
         DrazP0YhvfsJP9rMzPpolnO78f/daAHNKe+8aO+J3EoMWfg08OgAdGut5z/71R5VBnUu
         +aWe//xTTKAO6o/6ihDxr0TAgMnZBPylTytVBSGL50DBgkrbpQBjnBmeIGR8TEfdEnzO
         WB9Bfut7LzAeZ+9T6beVAufQ/kyy7py9rroc0B8QujY0GKxU1bn0lIZ5N2RsSsW2TSsn
         ncPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KCVZ2e0IVRreIe9U7SA2PEk32Y9ZJG5DsMEvpFDT1I=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=IkXLvsaMsZaF2HSyqnagBDSmZeUxku6xd/nDSAnddiAwPUaOoOfwQrwWMEsDKkWtuy
         VANKvFOIwiTu8/1gU/bWYELVIPVjloOWmy7tGc9qovVLBAznPhSclhDlIsDxH2pwGp69
         ta55H42oNtXPisRjTXlic2Eu9r8IXDtPyhM6ymnjVCpksXvtISAZjGgEZmfQriY+ITw0
         ASq5aQiYW7QZEI0gL7GTXzWHreP7t0u8UfIekjDxuf+6LEmCdLuwCaZqydivvn9hEs0v
         TA1Fuip6AkAnZ15HVF5xGPrCd3mohpwyXG0w9gKvDYYXCgsT16HyvS2+ZfDJvUYQqV3m
         n+iQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790304077; x=1790908877; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KCVZ2e0IVRreIe9U7SA2PEk32Y9ZJG5DsMEvpFDT1I=;
        b=Ui1uujc6C18Ml0uM/7WJrz99GJs/UO+TXl/wRJCa36pTROY/yTMLzCGNwhBlg9bIHT
         3IW7P7VWLXVihOLV6tG5V43DgVOn/nWsKVJ80CwPDKRk8bwR1XF9l70+PhLfqW9sZ2dk
         UP/cngQ0ZXiIgu2YCqyiWRN4bK14Ur+gJyMusps54N8TvwLcQV7crWMB0bkOPiuQ4MiH
         SKjt/Sx749Z5MT7PZLdib5EFoDAYGsLbOdV2p+jintXVqr7zcGzYWxZl0rdEn1TuuYRT
         w1uxFKqb+3dvWT9TUz4R6hC3rilm4tJXYeTo6a1Icf56Ds45yX5Ygtfo2iG1KCtRz4XZ
         TUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790304077; x=1790908877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KCVZ2e0IVRreIe9U7SA2PEk32Y9ZJG5DsMEvpFDT1I=;
        b=LXEl/YgFROaBHWqD80LQLyfGktgxFSUK8kYOmnnk6ncq1PpqH7z33strnZilwIENR7
         2hFFplQhssKreGMdnD4gZxVyHrrQfHfGVFmMpIAAKWNtP2HaUzvy4CLSzDyNjhpcHbq/
         W9tIOgV8uJOfZbbHhpc7FCbs813GUS+4NB0PRTvv/IJ8yuqkSzfQjesTz8QOgUegTb3S
         CthMAbUxnD7ZbMnPCCcyEoLB4Olnu4lXePGPGfLOQL9xHrCkWzXwS6hZGEgvi5jHlhWO
         RYS2T3Hj4NGpTosdKnLJbdgcoHb1wOo1IqSdaD2/UOyNx00/uCfmTjZi9TA5/HO+Mmi6
         6SDw==
X-Gm-Message-State: AFuF++kRvHU+7s5C9AzF200FpXcqHy6+TavkLtEj+zF8rR1yXzS8cFSZ
	0WEFdCny2T0E16XbkL1wKLlJrfL8iMZew2JYCyQEcelbN7uP2bdc9fNDaffVQSnjPQWpfFp8xUn
	jhlLaU3D3Xqz/pSdrdlmO24nEIRknVRu7uw==
X-Gm-Gg: AYBFou2zFWioeqFVH6yOaKlw+PP0v3qn0ZC4ZU2ktKv2j9wGU26iElNjUD2WGsRi+vV
	6+gz8LjPQlRjQierf1RgAELXFptrH+vVNQwxDtmAYfpWu/yEoLs7LjihFcYq8RpXxpmFmHimoB9
	+/5DfD6hRQPX//gtdBbhUUtwWaTqAWVdfuFOwo34zEONH7Qjzj+/Y9HT++1pJz7J88iqHA7kg3s
	FC/Zr68tovvGZp3eDjWN7KpdthIlTrkt4ObypsMn+sCopRFNmqdihHtEistfDaa1yFBSLIhRWSZ
	pXhP3G0mJiw7vlxEwUOFh0gl5Cf2KbPMKuEUn+cOyL4x+wtwITKABTe5aZFpCAxpqpXz+buFMI2
	OgcgF
X-Received: by 2002:a05:6871:5225:b0:48f:e0e5:a1e9 with SMTP id
 586e51a60fabf-491eb86a6e8mr4171438fac.46.1790304077174; Thu, 24 Sep 2026
 19:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260924125848.526537-1-leon.anavi@konsulko.com> <20260924125848.526537-2-leon.anavi@konsulko.com>
In-Reply-To: <20260924125848.526537-2-leon.anavi@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 25 Sep 2026 14:41:06 +1200
X-Gm-Features: AclHuK9L3x4G6yTjN7_VYEgLsOvGnLuYR6PkYDF46bscqPsDJl9csAno4fjn2kY
Message-ID: <CADySD0HVsCvbEJQs8K3i9hVCDMsMEkacWSQVezF5EKVxV1=zxw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pydantic: Upgrade 2.13.4 -> 2.13.5
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 02:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130287

On Fri, Sep 25, 2026 at 12:58=E2=80=AFAM Leon Anavi via lists.openembedded.=
org
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 2.13.5:
>
> - Allow reuse of validators when plugins are set
> - Fix missing GC traversal on some pydantic-core struct fields
> - Fix missing GC traversal in pydantic-core for
>   GeneralFieldsSerializer
> - Count validated model fields once in smart unions
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-pydantic_2.13.4.bb =3D> python3-pydantic_2.13.5.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pydantic_2.13.4.bb =
=3D> python3-pydantic_2.13.5.bb} (98%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.=
bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> similarity index 98%
> rename from meta-python/recipes-devtools/python/python3-pydantic_2.13.4.b=
b
> rename to meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> index 17a6941d14..7c5dcdcb26 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D09280955509d=
1c4ca14bae02f21d49a6"
>
>  inherit python_hatchling ptest-python-pytest
>
> -SRCREV =3D "cf67d4b3193c3fe43ede18612ed62785eee11382"
> +SRCREV =3D "001dea020e0809844e5b17666432c9135a976f46"
>  PV .=3D "+git"
no need to set PV

>  SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branch=
=3Dv2.13-fixes"
can please include tag=3Dv${PV} in the SRC_URI

>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130285): https://lists.openembedded.org/g/openembedde=
d-devel/message/130285
> Mute This Topic: https://lists.openembedded.org/mt/121408815/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

