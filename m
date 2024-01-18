Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1A8C47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 21:56:52 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.6221.1705615003461800176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 13:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hgA/mVfA;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-210875afb64so587884fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 13:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705615003; x=1706219803; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDPzpn5HkDEp8QVhp3u4QX5+7uX6QufXcq+r513An2c=;
        b=hgA/mVfAnPlbBLm4v4gJdSR5FhCBjgeTv2EhO0W016FxHM4uzZ7lQjvLRK7aW9dtb5
         sD1Kt6QXiMFxiJSQWBgyEYV1bP8fMI8eQwnGLKRo/1sjt1dy5PVHSiKODdnNSrq5jbmQ
         q1dAeW4724IKGV2IdzWLRK9x5aR4dtwc3k9HMuMRJWjFmJ9LjW2D9glGGLJwvYvAYdxO
         OcvCoEejJ7H7OOJtTdJyAsz5924drMeSk+XJGXx0jAKxYddHgbJOhL/mp02hciLmP6ph
         l+uCpPM5ckTCeWLWxBoyyHaZTO96KpVfLSUF2519rTFATj1FfqS60GoE8+qw0SsAyPrn
         FSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705615003; x=1706219803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDPzpn5HkDEp8QVhp3u4QX5+7uX6QufXcq+r513An2c=;
        b=lMdujLEvtu7CG0VKWPf2LF41/3DS4AWlT46VASZ4t4T2j0RCdVmZ3XAyLncudvEgPV
         4x34InVZnqZDBVLk2j0JTgfVGdKvWwMwzv2xPoVcx8NLP568CW7EInpPr6zGMkvyXEcv
         4u9i6gckjnsdYzHNz1tZunRMMD0je5+70VaIwdiuWANIHGfdDnT1i1yMwc7uixp1tIhm
         oAlGG9tg3UD8oPNeZRLLwZq/nTadvXKXQa2ODlU7Rj+ghFf0Ru7Z2C4SXtrEhwdfcZ6a
         KlrvPo+Q2h+rmxUXEMu4HWpSEu2hH6rc0ubaf64NLgH88BFzSlTUD8GCc0sZQsRSEtqv
         KtfA==
X-Gm-Message-State: AOJu0YwFCxD8nH57pEDHex7a9S6wHAim0GEECDucJOwxZG7wzOixL9nn
	1WqdGSSxQ0fIeDGwRC86reJroHLt4bKPGkd+VWQLxB9Vfe+lD7cELlMSY42j9ZnKLtzVCa2ff9X
	1GV9Gv8ocSc9dkG7ibkrzENSEK+E=
X-Google-Smtp-Source: AGHT+IGBmUGBEFOODynhDFXZgQBDRZAblqdIUCohpUXVAvwa7xGh9oQ0imvx0HpxywecBrjc4X+GMxS656DygS8vjvk=
X-Received: by 2002:a05:6870:ab87:b0:1fa:f432:22d with SMTP id
 gs7-20020a056870ab8700b001faf432022dmr753362oab.17.1705615002636; Thu, 18 Jan
 2024 13:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20240118203712.3016674-1-ross.burton@arm.com>
In-Reply-To: <20240118203712.3016674-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jan 2024 13:56:16 -0800
Message-ID: <CAMKF1spYvTe_QWOGTDv-pKwtyH_NfGo4wRSdDCVoS_DGEDDtzw@mail.gmail.com>
Subject: Re: [oe] [PATCH] mozjs-115: fix the build on ARMv5
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 21:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108353

can you rebase it on master-next for me please.

On Thu, Jan 18, 2024 at 12:37=E2=80=AFPM Ross Burton <ross.burton@arm.com> =
wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> The JIT uses the ISB instruction, but being a multi-core barrier
> instruction this doesn't exist on the single-core ARMv5 ISA. Check the
> ISA level before using ISB.
>
> Also set [cleandirs] for ${B} to ensure clean builds are done when
> reconfiguring.
>
> [ YOCTO #14572 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../mozjs/mozjs-115/armv5.patch               | 19 +++++++++++++++++++
>  .../mozjs/mozjs-115_115.2.0.bb                |  2 ++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-115/armv5.patch
> new file mode 100644
> index 0000000000..4c45955bca
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch
> @@ -0,0 +1,19 @@
> +The ISB instruction isn't available in ARMv5 or v6, so
> +guard it's use to fix the build on qemuarmv5.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/js/src/jit/arm/Architecture-arm.cpp b/js/src/jit/arm/Archit=
ecture-arm.cpp
> +--- a/js/src/jit/arm/Architecture-arm.cpp      2024-01-18 17:31:32.07871=
8197 +0000
> ++++ b/js/src/jit/arm/Architecture-arm.cpp      2024-01-18 18:00:16.73892=
1445 +0000
> +@@ -529,7 +529,9 @@
> + void FlushExecutionContext() {
> + #ifndef JS_SIMULATOR_ARM
> ++#if __ARM_ARCH >=3D 7
> +   // Ensure that any instructions already in the pipeline are discarded=
 and
> +   // reloaded from the icache.
> +   asm volatile("isb\n" : : : "memory");
> ++#endif
> + #else
> +   // We assume the icache flushing routines on other platforms take car=
e of this
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.2.0.bb
> index e1a547c339..84db3cd3c2 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
>             file://musl-disable-stackwalk.patch \
>             file://0001-add-arm-to-list-of-mozinline.patch \
>             file://py3.12.patch \
> +           file://armv5.patch \
>             "
>  SRC_URI[sha256sum] =3D "51534dd2a158d955a2cb67cc1308f100f6c9def0788713ed=
8b4d743f3ad72457"
>
> @@ -75,6 +76,7 @@ do_configure() {
>          ${JIT} \
>          ${ICU}
>  }
> +do_configure[cleandirs] +=3D "${B}"
>
>  do_install() {
>      oe_runmake 'DESTDIR=3D${D}' install
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108352): https://lists.openembedded.org/g/openembedde=
d-devel/message/108352
> Mute This Topic: https://lists.openembedded.org/mt/103816972/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

