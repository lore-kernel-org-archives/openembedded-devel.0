Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4B0C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 19:30:10 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.118677.1683574203950762662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 12:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OaUEJYCB;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-54cb8d72c0bso2619755eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683574203; x=1686166203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUGROVbTrm6IBZOLr4RdaBM+04lq7058CKRWIwBm1oU=;
        b=OaUEJYCBjNvRKbxuEi5P8dahKSKo2+Kh5PM9ZNTwN56wCFbP+7yCEq3rXVfmDYxAff
         47leXQwR1RLSsMHDKyDrG1o/iM33m8l8DiDtYgWQANKVh8f88ethBdyFt0+HP+JSjdBs
         oKh8GPK44yOiUlCiTNpVCS5B+SCCZTBu9Ftq78aTSqcy57nr33QE3/AIoRdngjtvtiju
         lWL0OK3vsw/AwW25Or1AjH5iQr+OT0IzzEfZV0ijLBKn4iGtJHtBVn5S7pxC7cHieYaf
         lLIgFquMFHonyrEG07730Y31Z+u0bcu7aGM3g6Ln45XBLG3ve/axUVKCwcM170gdpBIh
         TKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574203; x=1686166203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUGROVbTrm6IBZOLr4RdaBM+04lq7058CKRWIwBm1oU=;
        b=HqV4k1swhBilJBLM8prxRWsln/LF8Bqh+ifwvhfurfRoAUQu3goEYcjjon9qfxJSm8
         fL2OJuWf8iGrThqRwE55MicRdx92fHOSCXBGEi8WwHOzuVX/ars6+m1BnxNIYh3tmxwo
         6NEmDfHTUU9pwAXC2rxZt42+EENoKhNBD5mLysb4vKYVtLS/L/Qf3IZWf2i54IQib8gb
         WwMc03FS+mh16Y+2GOCBREEDpAzxmvOl0yxGiEHEzi05ve44sAYQK9uYdf4kt0E6Vmeh
         G294UmiPigjuNiVxX4DPpMLA3oZ36HfPm0oiA8/5udjWKXFNxOeF7Mo83Q46KIML47wS
         7M1g==
X-Gm-Message-State: AC+VfDyQDhfkpsASFTbSVrsoyhTnc/taxd8WDDJbmLjnPtG+LKWDASOA
	rkyWhsdlmL+ZbCVnhXFAHjXjRks5QzH0MRvG2MCb79a0+Lc=
X-Google-Smtp-Source: ACHHUZ6uV2q58TEnbZ+Iyfm00QvogZNF0QpkckcA/gKjcffljE+frogPNxhXneZJ6pE/MfRICCCRVIICfn+laAuucwc=
X-Received: by 2002:a05:6808:2a0c:b0:38e:4a8e:d7e0 with SMTP id
 ez12-20020a0568082a0c00b0038e4a8ed7e0mr109218oib.21.1683574203036; Mon, 08
 May 2023 12:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com> <1683540471-25268-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1683540471-25268-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 12:29:37 -0700
Message-ID: <CAMKF1spJvznKphYqOtcBiACZCxMUbECkRi43w_-1-FFmfecxwQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libssh: upgrade 0.10.4 -> 0.10.5
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 19:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102445

This is failing ptests on musl.

{'libssh': ['torture_config']}

To run ptests in your env try building meta-oe-ptest-image-libssh

On Mon, May 8, 2023 at 3:08=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>  * Fix CVE-2023-1667: a NULL dereference during rekeying with algorithm g=
uessing
>  * Fix CVE-2023-2283: a possible authorization bypass in
>    pki_verify_data_signature under low-memory conditions.
>  * Fix several memory leaks in GSSAPI handling code
>  * Escape braces in ProxyCommand created from ProxyJump options for zsh
>    compatibility.
>  * Fix pkg-config path relocation for MinGW
>  * Improve doxygen documentation
>  * Fix build with cygwin due to the glob support
>  * Do not enqueue outgoing packets after sending SSH2_MSG_NEWKEYS
>  * Add support for SSH_SUPPRESS_DEPRECATED
>  * Avoid functions declarations without prototype to build with clang 15
>  * Fix spelling issues
>  * Avoid expanding KnownHosts, ProxyCommands and IdentityFiles repetitive=
ly
>  * Add support sk-* keys through configuration
>  * Improve checking for Argp library
>  * Log information about received extensions
>  * Correctly handle rekey with delayed compression
>  * Move the EC keys handling to OpenSSL 3.0 API
>  * Record peer disconnect message
>  * Avoid deadlock when write buffering occurs and we call poll recursivel=
y to
>    flush the output buffer
>  * Disable preauthentication compression by default
>  * Add CentOS 8 Stream / OpenSSL 1.1.1 to CI
>  * Add accidentally removed default compile flags
>  * Solve incorrect parsing of ProxyCommand option
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libssh/{libssh_0.10.4.bb =3D> libssh_0.10.5.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb =3D> libssh_0.10=
.5.bb} (96%)
>
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.10.5.bb
> similarity index 96%
> rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
> index 4b2ced5e50..4995e9cfe4 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://git.libssh.org/projects/libssh.git;p=
rotocol=3Dhttps;branch=3Dstable
>             file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_de=
cry.patch \
>             file://run-ptest \
>            "
> -SRCREV =3D "e8322817a9e5aaef0698d779ddd467a209a85d85"
> +SRCREV =3D "479eca13aaaa46b43e68c52186e3783f06ae6f34"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102398): https://lists.openembedded.org/g/openembedde=
d-devel/message/102398
> Mute This Topic: https://lists.openembedded.org/mt/98757858/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

