Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.8463.1613661603762393353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 07:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PI9Nxxyr;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id fy5so1524249pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 07:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sFBC5FcFzMG+bHAg2VeRj0MeBdymhPq9lSsHdF8nIR8=;
        b=PI9NxxyrBdCRhInsr8aMnFe+yVOK6omGdg8F5vUJHkn0rnoTupHlXCPauRZNKOqO+L
         0YFSle2/1JwuZAS3XFLCrLyKrlGQeIQZH0w+7Gay3MXFHt232yUOjQ+2fykMfz8lYxNU
         smHXHIbzYmFRs7GHCK6YUVmA0QAb75/ltjL70Mx17nlbAxAag/mk/mT31MyWdeuMX9Sc
         ZZD5jG2lT4LjTlr/BQm7rbLheTqPB6t7xz0YtnL91v3qN18YI75e+iB3yTQUzTupOinz
         togm5VVqyB6j5ylJjfYz1fMO133jjQ57AxGIVIv9xNcmDHIKA1vN2ntG5TnsIj6bRjmn
         q+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=sFBC5FcFzMG+bHAg2VeRj0MeBdymhPq9lSsHdF8nIR8=;
        b=PQG+J4oGfpZGR3TaZEfCku81PDJwkxqki2ZEKUGQ1JnrUCxeALYrmfCaud77FvQInT
         lcppQx3bfpLXYMb0gaqw56bvUCRRPatnuyemL7pvBdjB2wj2RZg+4eP0SbK3CIFkQFdy
         MeqEU4wxuas8EGFRR37mCn+T1XAbgZOP29gQYMQrgsyYtUCSqSg6SEu9403PN1bcD5t0
         UFOiV0vPo0WGKgdQPHGatyxFTb060um+7/3rpILGVmU6t8nW/cptzfLVQIHraIjzhog/
         EJetRv9ZzcYSSz5mqfoBLUyBsgldfMBHsarH0ajH0JmVwvl8BQzqg2iKDZScpKYU8Syc
         NdjA==
X-Gm-Message-State: AOAM533Bi4jPrn65ptwzJQYSxRMiHl5JAhljUIRO/A5swVGFuCAQ1glM
	Qp0FRxseopRO8ZWuTEoIEeU=
X-Google-Smtp-Source: ABdhPJxiP8JrILwYI4e1djM0fJlAhRV4tenXNGqgBFxE3lWs8yAiOs2Y4Gmy8ww9zOIyADLHQl1wfA==
X-Received: by 2002:a17:90a:2c9:: with SMTP id d9mr4458949pjd.67.1613661603278;
        Thu, 18 Feb 2021 07:20:03 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7db1:8052:decd:2a75? ([2601:202:4180:a5c0:7db1:8052:decd:2a75])
        by smtp.gmail.com with ESMTPSA id g17sm4575973pfh.14.2021.02.18.07.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 07:20:02 -0800 (PST)
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: Rahul Taya <Rahul.Taya@kpit.com>,
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, harpritkaur.bhandari@kpit.com
References: <20210216152349.30824-1-Rahul.Taya@kpit.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <fe08c709-7927-b56c-2461-630a18921e8e@gmail.com>
Date: Thu, 18 Feb 2021 07:19:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216152349.30824-1-Rahul.Taya@kpit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 2/16/21 7:23 AM, Rahul Taya wrote:
> For python and python-native added patch to fix
> CVE-2019-9674
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>

Please add your signoff in the applying patches. see below for example.

Does this affect master or Gatesgarth?=C2=A0 What may avoid such questions=
 is
by=C2=A0 adding=C2=A0 something like "Affects: < {version}" will convey th=
at info.

Thanks for the patch.

-armin
> ---
>  recipes-devtools/python/python.inc            |  1 +
>  .../python/python/CVE-2019-9674.patch         | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch
>
> diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/pytho=
n/python.inc
> index a4ba0c5..787f23e 100644
> --- a/recipes-devtools/python/python.inc
> +++ b/recipes-devtools/python/python.inc
> @@ -8,6 +8,7 @@ INC_PR =3D "r1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e75=
9642"
>
>  SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz=
 \
> +           file://CVE-2019-9674.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d38=
08ed4594812edef43"
> diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch b/recipe=
s-devtools/python/python/CVE-2019-9674.patch
> new file mode 100644
> index 0000000..647d9da
> --- /dev/null
> +++ b/recipes-devtools/python/python/CVE-2019-9674.patch
> @@ -0,0 +1,83 @@
> +From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001
> +From: JunWei Song <sungboss2004@gmail.com>
> +Date: Wed, 11 Sep 2019 23:04:12 +0800
> +Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentatio=
n
> + (#13378)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* bpo-36260: Add pitfalls to zipfile module documentation
> +
> +We saw vulnerability warning description (including zip bomb) in Doc/li=
brary/xml.rst file.
> +This gave us the idea of documentation improvement.
> +
> +So, we moved a little bit forward :P
> +And the doc patch can be found (pr).
> +
> +* fix trailing whitespace
> +
> +* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.
> +
> +* Reformat text for consistency.
> +
> +Upstream-Status: Backport[http://archive.ubuntu.com/ubuntu/pool/main/p/=
python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz]
> +CVE: CVE-2019-9674
> +Link: http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_=
3.5.2-2ubuntu0~16.04.12.debian.tar.xz
> +Comment: From the original patch skipped changes for file
> +Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst
> +as this file is not present in our source code.

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>  <<<<----- somewhere in th=
is area

I tend to do mine just after "cve:"

- armin

> +---
> + Doc/library/zipfile.rst                       | 41 +++++++++++++++++++
> + 1 files changed, 41 insertions(+)
> +
> +diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst
> +index b421ea5..2e0a91d 100644
> +--- a/Doc/library/zipfile.rst
> ++++ b/Doc/library/zipfile.rst
> +@@ -574,4 +574,45 @@ Instances have the following attributes:
> +
> +    Size of the uncompressed file.
> +
> ++Decompression pitfalls
> ++----------------------
> ++
> ++The extraction in zipfile module might fail due to some pitfalls liste=
d below.
> ++
> ++From file itself
> ++~~~~~~~~~~~~~~~~
> ++
> ++Decompression may fail due to incorrect password / CRC checksum / ZIP =
format or
> ++unsupported compression method / decryption.
> ++
> ++File System limitations
> ++~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Exceeding limitations on different file systems can cause decompressio=
n failed.
> ++Such as allowable characters in the directory entries, length of the f=
ile name,
> ++length of the pathname, size of a single file, and number of files, et=
c.
> ++
> ++Resources limitations
> ++~~~~~~~~~~~~~~~~~~~~~
> ++
> ++The lack of memory or disk volume would lead to decompression
> ++failed. For example, decompression bombs (aka `ZIP bomb`_)
> ++apply to zipfile library that can cause disk volume exhaustion.
> ++
> ++Interruption
> ++~~~~~~~~~~~~
> ++
> ++Interruption during the decompression, such as pressing control-C or k=
illing the
> ++decompression process may result in incomplete decompression of the ar=
chive.
> ++
> ++Default behaviors of extraction
> ++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Not knowing the default extraction behaviors
> ++can cause unexpected decompression results.
> ++For example, when extracting the same archive twice,
> ++it overwrites files without asking.
> ++
> ++
> ++.. _ZIP bomb: https://en.wikipedia.org/wiki/Zip_bomb
> + .. _PKZIP Application Note: https://pkware.cachefly.net/webdocs/casest=
udies/APPNOTE.TXT
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>


