Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26595C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 15:44:32 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.12393.1741707869631423047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 08:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbOAIC4x;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3fa0eb29cebso724416b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741707869; x=1742312669; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kf/A2g0O6VbKr3nZHSl7LUYE94qzh/+nMR4Z00jkSIg=;
        b=nbOAIC4xs5eTY3bvJYQcd80DKLmh6hPFtE5GotcrAaKq9lwA1id2Tbljw+/gxFpg+G
         /GfibQmfnRxkFlKACYPiLFmc+H/Awsad6dJnaRf+Vqy2QEonK7xV7rwlsSYtyfarNn35
         n35tOdeOesKKY/pN8NsQ2kIFjo7JQ6ryLLILFKs5Z53lkRzxXUUGHe2B9Uvd+X4rmq+9
         Be5RTEV/jSs0VJpGCD7OGisM7n3oZTHamCCOYG4zbOaG863Ecni8KoVdqr8wD0Sxd/tn
         yJ9xADS+EE6agnoOqysGS3ZfDTdUkDg+9U/LDKnvNe5SFTh1VBq1+xsqx60JzbNOcg2h
         dzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707869; x=1742312669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kf/A2g0O6VbKr3nZHSl7LUYE94qzh/+nMR4Z00jkSIg=;
        b=TCx9mu7Ul09sykLmOW36I4TdO4O7br9mVxk48TRh94CVZKSIaVHAKjSRNtd/SXauj+
         IeouwIlBkr/Km8SNtmERohw5vd76QHO9j8R1/J0cgSstF/ueI3yDvZrj0NC05kDRxbMO
         KXfK1X6XF93KPVB3YUMFJpcgilvE8rm/3NfM5YEfOw9iVwVsUNqV4lyn0whgeJ0ZmBzy
         PZ9oe7j+kQcKRYk7pXShUgH1CBxZwVnv1qFJbAwdqZBC0SGHhxkMRpYTyHtJ6RF6cNqC
         /1khPPA0oV4U3tqj7uYPuKQk3MiT8q8sduo0OAzHulS7lzkv3wBYzCPS1eLmDX5rEtz3
         rvUQ==
X-Gm-Message-State: AOJu0YxkbxfM0vQaafVvZ4D6DLTkkRycInCQvyyE7ezTSHxb6YLEi5MR
	CxKs+i5+//Ty5yGJW8MkBjvROQKsKGQVQIFhZgwADrFcut65w+6MFDFmnkXo/WFoNJlzA5i2rQJ
	xQiWBmeW9MEMYHy9O/40FV3YtVTQ=
X-Gm-Gg: ASbGncslgPlZu+hy0d5uN6jHDjM5mGkN1NqgrsFDYWg1dLA5rMYapqg4PP6x0vfvRVq
	ZR7SCvH1ATIlX+vQAr2Iu60K3K3mihTDLoGVEflkS2SmJGZIPC+xS5nq+ksYOwjBn1TY29WKPbC
	tAe5pO4Mx7c43Woehgga+BN08y
X-Google-Smtp-Source: AGHT+IHNnX71Fma5cdpMpw7YQ1ZlaVorF91280hqsaddWQLrb0+O7c+VJ5JB1lOjSevZxOYso/SclZOqVWq2BxS2nH4=
X-Received: by 2002:a05:6808:3083:b0:3f6:6be0:1f8a with SMTP id
 5614622812f47-3fa2b50426amr2427454b6e.8.1741707868699; Tue, 11 Mar 2025
 08:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250311085756.1136319-1-kai.kang@windriver.com>
In-Reply-To: <20250311085756.1136319-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Mar 2025 08:44:02 -0700
X-Gm-Features: AQ5f1Jr7Zg6yXQ6awUGSkSstA_j7bRu-IeydzcNO0HJSznXzSizll6TnRXfu9UY
Message-ID: <CAMKF1srN0CvRNrfA4bm=jMbLwTN5va3kb9Nt-8KqVv7oYDWAVA@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pykickstart: fix
 options parse error
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 15:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115893

This is needed on master as well. Please add [master] to the subject
line as well in future, else I might end up ignoring such patches
accidentally thinking they are backports to stable branches.

On Tue, Mar 11, 2025 at 1:58=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport a patch for python3-pykickstart to fix option parse error:
>
>     File "/usr/lib64/python3.12/site-packages/pykickstart/options.py", li=
ne 185, in _parse_optional
>       option =3D action.option_strings[0]
>                ^^^^^^^^^^^^^^^^^^^^^
>   AttributeError: 'tuple' object has no attribute 'option_strings'
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...o-behavior-change-in-upstream-_parse.patch | 71 +++++++++++++++++++
>  .../python3-pykickstart_3.48.bb               |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta-python/recipes-extended/python-pykickstart/files=
/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
>
> diff --git a/meta-python/recipes-extended/python-pykickstart/files/0005-o=
ptions-adjust-to-behavior-change-in-upstream-_parse.patch b/meta-python/rec=
ipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-chan=
ge-in-upstream-_parse.patch
> new file mode 100644
> index 0000000000..e2b34ab937
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pykickstart/files/0005-options-=
adjust-to-behavior-change-in-upstream-_parse.patch
> @@ -0,0 +1,71 @@
> +From f753d4d6ad1f4846d14735beb3d1b157b9914b51 Mon Sep 17 00:00:00 2001
> +From: Adam Williamson <awilliam@redhat.com>
> +Date: Wed, 2 Oct 2024 09:48:39 -0700
> +Subject: [PATCH] options: adjust to behavior change in upstream
> + _parse_optional
> +
> +In Python 3.13 and 3.12.7, the behavior of _parse_optional has
> +changed. It used to raise an error on multiple matching actions
> +itself, and only ever return None or an option tuple. Now the
> +"raise error on multiple matching actions" code was moved out
> +into consume_optional, and _parse_optional returns either None
> +or a *list* of option tuples, which contains more than one if
> +multiple actions match. See:
> +
> +https://github.com/python/cpython/pull/124631
> +https://github.com/python/cpython/issues/58573
> +
> +This adapts to the change in a way that should work on both older
> +and newer Pythons.
> +
> +Signed-off-by: Adam Williamson <awilliam@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/pykickstart/pykickstart/co=
mmit/f753d4d]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + pykickstart/options.py | 20 +++++++++++++++++---
> + 1 file changed, 17 insertions(+), 3 deletions(-)
> +
> +diff --git a/pykickstart/options.py b/pykickstart/options.py
> +index 2e3a0721..ca0e18af 100644
> +--- a/pykickstart/options.py
> ++++ b/pykickstart/options.py
> +@@ -177,9 +177,23 @@ class KSOptionParser(ArgumentParser):
> +         self.lineno =3D None
> +
> +     def _parse_optional(self, arg_string):
> +-        option_tuple =3D ArgumentParser._parse_optional(self, arg_strin=
g)
> ++        # Before 3.13 and 3.12.7, this returned None or a single
> ++        # option tuple. From 3.13 / 3.12.7 onwards it returns None
> ++        # or a *list* of option tuples
> ++        option_tuple_or_tuples =3D ArgumentParser._parse_optional(self,=
 arg_string)
> ++        # all we want to do here is a custom warning if the action is
> ++        # deprecated. we can only safely do this if there's exactly
> ++        # one matching action
> ++        if isinstance(option_tuple_or_tuples, list):
> ++            if len(option_tuple_or_tuples) =3D=3D 1:
> ++                option_tuple =3D option_tuple_or_tuples[0]
> ++            else:
> ++                return option_tuple_or_tuples
> ++        else:
> ++            option_tuple =3D option_tuple_or_tuples
> ++
> +         if option_tuple is None or option_tuple[0] is None:
> +-            return option_tuple
> ++            return option_tuple_or_tuples
> +
> +         action =3D option_tuple[0]
> +         option =3D action.option_strings[0]
> +@@ -191,7 +205,7 @@ class KSOptionParser(ArgumentParser):
> +                             "kickstart. Please modify your kickstart fi=
le to remove this option.")
> +                           % {"lineno": self.lineno, "option": option}, =
KickstartDeprecationWarning)
> +
> +-        return option_tuple
> ++        return option_tuple_or_tuples
> +
> +     def add_argument(self, *args, **kwargs):
> +         if "introduced" in kwargs:
> +--
> +2.47.1
> +
> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pyki=
ckstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-p=
ykickstart_3.48.bb
> index 953068f7c3..657d0df539 100644
> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.48.bb
> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.48.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/rhinstaller/pykickstart.g=
it;protocol=3Dhttps;branch=3Dma
>             file://0002-pykickstart-parser.py-add-lock-for-readKickstart-=
and.patch \
>             file://0003-comment-out-sections-shutdown-and-environment-in-=
gen.patch \
>             file://0004-load.py-retry-to-invoke-request-with-timeout.patc=
h \
> +           file://0005-options-adjust-to-behavior-change-in-upstream-_pa=
rse.patch \
>             "
>  SRCREV =3D "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115888): https://lists.openembedded.org/g/openembedde=
d-devel/message/115888
> Mute This Topic: https://lists.openembedded.org/mt/111636553/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

