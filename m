Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A36C4829A
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 18:53:19 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.6315.1707331994005039645
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 10:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cyhP0Hjj;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6dc8b280155so571291a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 10:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707331993; x=1707936793; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCFxVQOukCXyVHIPzumiI3g1N0DXxGxZ9p3DtPDtJB0=;
        b=cyhP0HjjFLUeNVL7B09EVCuqANz75i8T71wNFcTZxkHo8JJETIUUAdk2tHmVyfQ6z+
         it/urDLmHOK7F6khc8RK7r7hWNqIitIV2pbTlXvigDYvYgKoZwL7yLKfacSu/R35zP8R
         1fPkuek58MbrS2o7IUL7Ngkq8RBa39Kf743x+S4ngNX1uwm86Pm/Y6l30rFyTaLF0DjQ
         j+wF7Hn4Pio3e2urM/EGBONzlW+ZTlz0fYbwV1DUEhK0YY3ro0xbB8fHUQStt4s/j+co
         Th8Z3jNirYzBxdmO/UG+kPAJP10FmWW7GK3DLIj2qGM+Me0Q1NQi+yuJGTV0+SgrNftv
         kxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707331993; x=1707936793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCFxVQOukCXyVHIPzumiI3g1N0DXxGxZ9p3DtPDtJB0=;
        b=EN9BWubG2hQyjDYY3FM4qj3HBEGSdVCVFRBeLdfaYcWJB2ViLhTGSlAOXjMioTF50g
         bH7aTUNkoOyyR9U0qQxPcHKKsKL02MCIWEePmPyD24Cg/37gGXNvu2Oq9+ngBSFq6s3A
         M+xjPhThSiX5AaJbmLMuyNDZdgG0Z+jKV9uiqSFTxszT1XTjSkWnH4V6RMrSVvztmkPd
         aOurbu0/+/MUTAgwmZptHg6HeYsy4R4wa/nLOXPAT/rwB8UjAhpfBZkw2etVncSv2d+9
         NX7rb2HjJq06fXiiynEvjPhZg0xdmZ/L1dzFt3L+YhetkPjrWLW51b7+mekCren3MLVc
         Swnw==
X-Gm-Message-State: AOJu0YzjwnDJANzeBDFmjIscJcXM+3h06adSctT1qKz9z70CNn9Jgi5S
	A4o5O5rUGk0IvlzpAqvMSGP7Yzq8Al7XHxulYwK//TpFMEiM36Rzf5gzDcNXBa7O/3KGedwuaqb
	vZmLQkFJbkcpxBwct3+7RQdvAaCKDNK+4zWC+Ug==
X-Google-Smtp-Source: AGHT+IGSZoWHxzaT1nTRg+DJNk5JKUXc7UhM72MKjgMNXmeFcYViK6NDDj8afYGLvneumAJp8EkhtkkoNAe/08Kv12M=
X-Received: by 2002:a05:6870:6590:b0:219:7746:d886 with SMTP id
 fp16-20020a056870659000b002197746d886mr7414599oab.36.1707331993150; Wed, 07
 Feb 2024 10:53:13 -0800 (PST)
MIME-Version: 1.0
References: <1707209256-6015-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1707209256-6015-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Feb 2024 10:52:47 -0800
Message-ID: <CAMKF1spwhAnY3Hyw-Zs=uHNu+F6okQvP+yGOeDP4wv8j_w_cvw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.3 -> 2.6.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 18:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108653

this fails ptests on qemux86-64

Failed ptests:
{'python3-pydantic': 'START: ptest-runner\n'
                     '2024-02-07T18:01\n'

'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
                     'Testsuite summary\n'
                     '# TOTAL: 0\n'
                     '# PASS: 0\n'
                     '# SKIP: 0\n'
                     '# XFAIL: 0\n'
                     '# FAIL: 0\n'
                     '# XPASS: 0\n'

              '# ERROR: 0\n'
                     '\n'

              'ERROR: Exit status is 2\n'
                     'DURATION: 7\n'}

ptests which had no test results:
['python3-pydantic']

On Tue, Feb 6, 2024 at 12:48=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Drop Python3.7 support
> -Drop Python 3.7, and PyPy 3.7 and 3.8
> -Use positional-only self in BaseModel constructor, so no field name can =
ever
>  conflict with it
> -Make @validate_call return a function instead of a custom descriptor - f=
ixes
>  binding issue with inheritance and adds self/cls argument to validation =
errors
> -Exclude BaseModel docstring from JSON schema description
> -Introducing classproperty decorator for model_computed_fields
> -Explicitly raise an error if field names clashes with types
> -Use stricter serializer for unions of simple types
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-pydantic_2.5.3.bb =3D> python3-pydantic_2.6.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.3.bb =
=3D> python3-pydantic_2.6.0.bb} (94%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.b=
b b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> index 21341d26c..af465f423 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D09280955509d=
1c4ca14bae02f21d49a6"
>
>  inherit pypi python_hatchling
>
> -SRC_URI[sha256sum] =3D "b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99=
e8a68f747f393f7a"
> +SRC_URI[sha256sum] =3D "ae887bd94eb404b09d86e4d12f93893bdca79d766e738528=
c6fa1c849f3c6bcf"
>
>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108619): https://lists.openembedded.org/g/openembedde=
d-devel/message/108619
> Mute This Topic: https://lists.openembedded.org/mt/104194508/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

