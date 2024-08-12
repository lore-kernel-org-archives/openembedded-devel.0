Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BC7C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 18:31:37 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.53772.1723487493005664416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 11:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+Ng1KEJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5c661e75ff6so3085527eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723487492; x=1724092292; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xitrcsmCWbZbGKoctHR0L3hN8o+vLHrMlvbImtyJFC0=;
        b=V+Ng1KEJ1wS+WuUWORaxi7M7QR+yK13JOXthVxniq8iQB1Cb7+C4f6LYOqnyLtmRj/
         BqE5mFGPJqtuj47LGME0ab2ZZfYKF9DGGwTt6TsQqirjlYkmnJng0k3MCicElly6zTpj
         aM0Z/9LcaiH1LUSOJVJzorJz876RX9AXPp+yXz8n69Tcw3SwM8ZMBStTzHU4FHq8qPNV
         Bqn6zAEzapGikZEmgrUYz/scgNNBBWxOlO0tbJ6Rw94g2TaRKjTyQ6zwkkzlb+Rrg+OP
         1yc1HT+Y7l3Cdibdl8lGiTXZEQLXOlqgKMF6kwHvA5S8n9x9qgt9sCBfl+MlBNkz/okg
         MlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723487492; x=1724092292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xitrcsmCWbZbGKoctHR0L3hN8o+vLHrMlvbImtyJFC0=;
        b=LtGSih15B7rUWT8CBfRpRqFZNOXu5VDsptCiuJjCTlfETMOmoH9oybpD+NrRILnz6l
         WUwkkBglSPn3XtosPBbdCZXlFMpATYwQIhIawpwY+oCjiL6OR1HWJVc//i+ekqnwSdzf
         OQtnTxY1cleB1OGIkXeR7SBQuNpNXrEk5/5t7n//Pf/9d72sRcR5MsUaQDs9dcpPFCf1
         fUTa0HXI+wtBGV4BaIa4QCYQedowPVv/2qnJaZZhF/eGsyFCDy+RlSqJwb4RNzur0ypj
         wblOSARkwEDIx/m/1kg7C9nW/aqyuCQR7/93uVC65wKp8JpfmsVGwxgFhkGNqshfquAy
         vuqQ==
X-Gm-Message-State: AOJu0YxeErpl0wO7zfEwXulFeDni5LNDqJx5JqQMafJ5+vgWVAo/rSmZ
	1Zyh1tLWhHwljEhJSM0Xx2wBU4Tg6pSI06a3pupbvmobGYe2xgx/14mggt1pSyVW4IiZ77e58Ru
	RDD2+HTfrQ4WuEGMoXdrzqxTyVBODww==
X-Google-Smtp-Source: AGHT+IGmOK0B22nzr4JXFCO2AIEvOcX0zvaVzbMQYFlioaFnSQhK/6hVVG3WiQfRDax745lRXMxD57CWjlxfTWgWlGQ=
X-Received: by 2002:a05:6820:60f:b0:5c4:27f0:ae with SMTP id
 006d021491bc7-5da685a8726mr1490281eaf.1.1723487488330; Mon, 12 Aug 2024
 11:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240812103537.2561681-1-divya.chellam@windriver.com>
In-Reply-To: <20240812103537.2561681-1-divya.chellam@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2024 11:31:02 -0700
Message-ID: <CAMKF1sqf3WiRCtYFACFg_7Wv4_HFmaT3wE8Jj7mtUFnu-MbvPA@mail.gmail.com>
Subject: Re: [oe] [PATCH] cjson : fix CVE-2024-31755
To: Divya.Chellam@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 18:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111774

we are on 1.7.18 already on master branch, so this patch is not needed
on master.

On Mon, Aug 12, 2024 at 3:36=E2=80=AFAM dchellam via lists.openembedded.org
<Divya.Chellam=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Divya Chellam <divya.chellam@windriver.com>
>
> cJSON v1.7.17 was discovered to contain a segmentation violation,
> which can trigger through the second parameter of function
> cJSON_SetValuestring at cJSON.c.
>
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2024-31755
>
> Upstream-patch:
> https://github.com/DaveGamble/cJSON/commit/7e4d5dabe7a9b754c601f214e65b54=
4e67ba9f59
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  .../cjson/cjson/CVE-2024-31755.patch          | 33 +++++++++++++++++++
>  .../recipes-devtools/cjson/cjson_1.7.17.bb    |  4 ++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.p=
atch
>
> diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch b/=
meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch
> new file mode 100644
> index 0000000000..41d8520217
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch
> @@ -0,0 +1,33 @@
> +From 7e4d5dabe7a9b754c601f214e65b544e67ba9f59 Mon Sep 17 00:00:00 2001
> +From: Up-wind <lj.upwind@gmail.com>
> +Date: Mon, 25 Mar 2024 20:07:11 +0800
> +Subject: [PATCH] Add NULL check to cJSON_SetValuestring() If the valuest=
ring
> + passed to cJSON_SetValuestring is NULL, a null pointer dereference will
> + happen.
> +
> +This commit adds the NULL check of valuestring before it is dereferenced=
.
> +
> +CVE: CVE-2024-31755
> +
> +Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/7e=
4d5dabe7a9b754c601f214e65b544e67ba9f59]
> +
> +Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> +---
> + cJSON.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cJSON.c b/cJSON.c
> +index 4e4979e..8903e4c 100644
> +--- a/cJSON.c
> ++++ b/cJSON.c
> +@@ -406,7 +406,7 @@ CJSON_PUBLIC(char*) cJSON_SetValuestring(cJSON *obje=
ct, const char *valuestring)
> +         return NULL;
> +     }
> +     /* return NULL if the object is corrupted */
> +-    if (object->valuestring =3D=3D NULL)
> ++    if (object->valuestring =3D=3D NULL || valuestring =3D=3D NULL)
> +     {
> +         return NULL;
> +     }
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.17.bb
> index c9c38a9fe3..3c67a89cd6 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
> @@ -5,7 +5,9 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D218947f77e8cb8e2fa02918dc41c5=
0d0"
>
> -SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=3Dmaster;proto=
col=3Dhttps"
> +SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=3Dmaster;proto=
col=3Dhttps \
> +          file://CVE-2024-31755.patch \
> +         "
>  SRCREV =3D "87d8f0961a01bf09bef98ff89bae9fdec42181ee"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111769): https://lists.openembedded.org/g/openembedde=
d-devel/message/111769
> Mute This Topic: https://lists.openembedded.org/mt/107853994/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

