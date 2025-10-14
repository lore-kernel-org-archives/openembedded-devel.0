Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F10DCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 04:12:46 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.web10.7347.1760415157806611123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 21:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+DHw9SL;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63b710f276fso5018100d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 21:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760415157; x=1761019957; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsV89pOxo0Az90uCncTBp+q57rbHmEni4VvlrUFgpe4=;
        b=D+DHw9SLc9tryBHozu+ZjlcbRHNh8zLVY5mj8RJ4ujqDajFxgGdmbLOH4MLtvh+upf
         v0P/FqFnqM+Qe+AYSZmxNRQRin8Ji9KKNcezKGsPWhLxsl2iZVU0vYQkbCHd+yYE6iA/
         rn100FxsB7h2+oPORLPJc0KymF9JXpnWjFdEwruInp3Xf+dpG1Trw4kFgwxV5b6RLVnp
         8CeH4K1i5Wg/1BSi3DbiR4ZJqMLekItGKuAOOwbG0XX2/jXGzl4Y/JhGSvFM3Y/tvWZm
         NfZ9WQpZLTXTnIcq/AdePb09ckVDwbIepVWN+YHgbHtySyu0gMZl6oqM3gBmBZmH/3Dl
         8m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760415157; x=1761019957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsV89pOxo0Az90uCncTBp+q57rbHmEni4VvlrUFgpe4=;
        b=iJfpTHshDTLKGkwoYs93LY7Tp33ltvENonAGcyXu+zX6dMvhi+8DEgoB4hK+aPALu1
         CahG3VWiwJf8QWLvow0sqxPUdeuZ42KXjHpfczR4+ZKjCebyXaCROSZWtobXuouIINuW
         PpUHOyB4dizIMVkoJ/Y1ugGtVMa6YgYdxPgyo5Hwul5ZMnfLO8TYqygV22SxOelBPCNe
         5kfqJRkNnGWoF3k3FrMx87c9RqYgZj2B+809lCcX6gwK9g7BHLkXSA2wjVRw5GB0zkjF
         XUZLXsDS9V6/+zmYUTFbi8QxrD8CuPBdZfwwmid5tNrYomOyUBmu3fyVB7G+JP0itKTT
         tUhg==
X-Gm-Message-State: AOJu0Yx0NKYOe1lpBTd1nrw/A5NbhEkYkVN1MIBSMoD5dVQjGk8BlO0M
	Og6Aj165FO9Oh+SeH1/BOlc7sI/7Ya4mCDdZdyifsSBW7yi230WaZr/T7K4v/ZATvMchZUpU7pt
	uoKSr9G69nlE6KbiLbeSgADYJNO8oh6g=
X-Gm-Gg: ASbGncuMVsdRAejMFaRAIBik3+iTTu3L34ui1wlZcF+e2eDkz4a5m60rZhN2ifCbIUl
	im2o2LGCDlw5jjtb1moSNTrAxP2gUhRxUZs5RqJfZS/TvYWpxkwAV1vVzzEoafq07+ndMv/Fie6
	B9tSGivwmEqLk1/0G5qzeKd/IPs0jPmlHStBGNlfv5rOTVRz3mNy61B2k7cZCglw1o13tCRLDfH
	CXh5We3XSsYtAx2f09Q4Ru8TMMHA53T7Xzy+5kOpWAE7YJiISBDDVkVmKs=
X-Google-Smtp-Source: AGHT+IFFBEniUrd+jALG97EtV1V/m28c3KejljEoDgwCKamRA8tGyIvlKeQUv7V0j9SbsYjEAHDEtLeUe3SvzqtXgqo=
X-Received: by 2002:a53:ba4c:0:b0:63a:183:ffda with SMTP id
 956f58d0204a3-63ccb8e1958mr15900914d50.26.1760415156900; Mon, 13 Oct 2025
 21:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251013131725.2583786-1-leon.anavi@konsulko.com> <20251013131725.2583786-4-leon.anavi@konsulko.com>
In-Reply-To: <20251013131725.2583786-4-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Oct 2025 21:12:10 -0700
X-Gm-Features: AS18NWDg0BkN5l06DOQtUeFrjNiI_h_93d1NC4Mo8E8Q_lZ5pZXpN4Fz41_Cnzk
Message-ID: <CAMKF1sqG+hC0F5tiH8drCVocT3V4O54UrhV6=x_b9DD4qvy+Og@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] pydantic: Upgrade 2.11.7 -> 2.12.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 04:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120552

On Mon, Oct 13, 2025 at 6:17=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 2.12.0:
>
> - Update V1 copy to v1.10.24
> - Add extra parameter to the validate functions
> - Add exclude_computed_fields serialization option
> - Add preverse_empty_path URL options
> - Add union_format parameter to JSON Schema generation
> - Add __qualname__ parameter for create_model
> - Do not try to infer name from lambda definitions in pipelines API
> - Use proper namespace for functions in TypeAdapter
> - Use Any for context type annotation in TypeAdapter
> - Expose FieldInfo in pydantic.fields.__all__
> - Respect validation_alias in @validate_call
> - Use Any as context annotation in plugin API
> - Use proper stacklevel in warnings when possible
>

We need to fix python3-lief recipe as to reflect this dependency as
well. It currently has a patch that only handles 2.11
there is upgrade for lief module available too, please address that
recipe along with this change set as well.

> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-pydantic_2.11.7.bb =3D> python3-pydantic_2.12.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.7.bb =
=3D> python3-pydantic_2.12.0.bb} (97%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.=
bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
> similarity index 97%
> rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.7.b=
b
> rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
> index e603e7dccd..8016b55dfe 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D09280955509d=
1c4ca14bae02f21d49a6"
>
>  inherit python_hatchling ptest-python-pytest
>
> -SRCREV =3D "9b52422377d974ffc3de4e8b0bf7faab1acf2ec4"
> +SRCREV =3D "a7928e692e5a7841c4379d1af1fd37966941dade"
>  PV .=3D "+git"
>  SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branch=
=3Dmain"
>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120531): https://lists.openembedded.org/g/openembedde=
d-devel/message/120531
> Mute This Topic: https://lists.openembedded.org/mt/115733948/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

