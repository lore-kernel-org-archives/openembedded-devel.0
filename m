Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.4138.1592431881678349434
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 15:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uxoa0pFO;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id d12so1858054qvn.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2020 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wg1bODb0hauc/fJOVwwj+y6aOwaBU0LITcu9CbZFJ0=;
        b=uxoa0pFO3iRqLIa/5lVCJoQ2uWi9VsoWy17jXv9O/KdrsdmSCzQv220Y7MTunayOBR
         WBxYIgjNhhb0+hNJDuijgCY8RBWB7o79PiKrzQF1LkNXqX/0m4IDtZM2o1mWv5v5/RXe
         UdZiP+l8Rj9aEQpHq2AMy2LF0GAK53eFFkHxsfYKbPcA9vZzNPpTIeSL8F/DMfI1D3ox
         sANIrS7KVTrXCa+vNlIECzIncd9HHONNtqrBSV7C8gDcdkpIuWFV7N2yGiFPHnFmTvsX
         n1peS5olww2gV3Dt3+HC897mvcxMqIVKK1I0syBXhXttMWc8TFMY9BoTnQAk7U1rDpN1
         75JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wg1bODb0hauc/fJOVwwj+y6aOwaBU0LITcu9CbZFJ0=;
        b=XRXyGyeD9Vlmo7aApM1oKB4YRgJ7DOeP2RX/879io+Jz5nddVsbqB1996tLqUBgK8D
         zpWJ6U4L18SnidXco8is2y4NN/C0N5pXCLhm2UJZMqkmx4jcDNzhJ8lktKAJbiXF2W61
         e65k4MKKNPonMbW3CcMmZ2WB+J4jiBAw53g8Kpb7wRnL934u1r9Ocj26gVea7a0iFGXJ
         VrrQtLHWyAzVJwfFuVH3+xEieT4yw1vu/2oCntd+L+QG2Jiws2pSPoGSp5clNg9OTB7V
         NonDbv7JMxw/OnBRjTkWq0OJCBv5D5ZPAw1wFGiqN3ndWowImVMPX6/9AjJfOV9Fv7Bq
         msjQ==
X-Gm-Message-State: AOAM53245zaAAYNQBN347xWqQN398864IXqzk/77tJHBBvVNaWGHj50O
	PC7bSgwRA5FeW34haoSJ8Lu+vDIDhcxUfmpgoKM=
X-Google-Smtp-Source: ABdhPJwNA8HBLmBtvICuaLaabJ7+0hi/kY4rqWeVp+Cak+LQL09db0nY+9eVPTVyqN6g8DSMybyBpZTyYjedNMh90JA=
X-Received: by 2002:ad4:5511:: with SMTP id az17mr829254qvb.146.1592431880724;
 Wed, 17 Jun 2020 15:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <1592401134880.81332@cn.fujitsu.com>
In-Reply-To: <1592401134880.81332@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Jun 2020 15:10:54 -0700
Message-ID: <CAMKF1sobCp-j1kraYU7kNHa4AAmE_AB3taQPB+Z+j3SazRUkHQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-wtforms: upgrade 2.2.1 -> 2.3.1
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 17, 2020 at 6:39 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{python3-wtforms_2.2.1.bb => python3-wtforms_2.3.1.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-wtforms_2.2.1.bb => python3-wtforms_2.3.1.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> index 2b7af6267..9f081b68c 100644
> --- a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A flexible forms validation and rendering library for python web
>  HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
>  SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=208ce1c159f911ecf389806650582021"
>
what changed here ? please document it in commit msg. Additionally
this patch is not applicable to master branch
please rebase and resend.

> -SRC_URI[md5sum] = "41c0008dbe7bd98892c58f7457a46a4a"
> -SRC_URI[sha256sum] = "0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61"
> +SRC_URI[md5sum] = "bff06943e59671581af07f80d14bda5f"
> +SRC_URI[sha256sum] = "861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972"
>
>  PYPI_PACKAGE = "WTForms"
>
> --
> 2.17.1
>
>
> 
