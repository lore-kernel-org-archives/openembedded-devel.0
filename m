Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BD1C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 19:35:57 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.6881.1680118555367074769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 12:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jrP6wVgh;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id f17so12443361oiw.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680118554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+c5CMEUExxwrueUZzEHBe26mWWPbn/JVW9IcP8ug6w=;
        b=jrP6wVghgNTjSKh4UWADtP9zT6lNtKVMuvetH5xXzL/yYSSrgwgzG+UUmCpVGECNAb
         glOdZ8Sq9w84Ej/UF0yyaUOgqzf0Y74CSu3rUsoV+tIovYN+s0qgPaFQqQj4giM8TpfP
         Gs9OKGEWs17wQyK5IkArTrZpGJCASesD4vploK3EyQ/+zf6eFeqwOU+wWb8PSH/3A75o
         sbA827Jw25WwxMVWE4h8v22jHy+cRnz8ww6SxFhpZJ3jV9Nzi5IQdzb8A1ic0KsoegIH
         0dgs3qAukW2JC/IpfDEo0OHcjEf+kE+ROScrllbnsNputY/QZtp5t228F9HuFNhxk00g
         EaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680118554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+c5CMEUExxwrueUZzEHBe26mWWPbn/JVW9IcP8ug6w=;
        b=Q2w42lnkGb+bfx9ddjlwouhqjHE/D80aLLZFZ78JSOswpracXT+jHZA03/cveudM/M
         YzywuoxjNIcjRWnRLYnIC4Z6VNCtq6w2mvdDVefZHhe0fgPsKZ86eZIkxqNYJlbByIzq
         CsNWQNjAnIc1Xs+q0JSzuvuShlCRx3XbImeG9Upv3ji2rSApM4g+o3uZtwhTTXOrAeW+
         RiYZLIW41FXPPFUNIbPlE7nwjShL6Elyb48y/wv1gXPRExKaz0wY2bdQNS2dITzYQMcb
         3shIqQ4fAZK/ds+mPktPCodN7qqaAtSipfN1r+lYbI8gLxW4M8Q5Hpwzel1kxYUv7EYR
         rTxw==
X-Gm-Message-State: AO0yUKXLYm5587kFZxPA9/4UJUT9jqm+A2NzrqXmf3USE0aFXASbgsc0
	DUFQjoOUPM+/+d0rYTRxg5s6vKrzkfvG6jGS4EAA2p9y
X-Google-Smtp-Source: AK7set92uzy2yx5j1Qn0il29CzxpMi4oYw8LOhMKkVropVJ1+UEGBk/fnVF2jBVrgXuVDkH1RAI/AuuRMeFaGodmoG0=
X-Received: by 2002:aca:d7c1:0:b0:387:13ea:721a with SMTP id
 o184-20020acad7c1000000b0038713ea721amr5968884oig.4.1680118554445; Wed, 29
 Mar 2023 12:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230329123225.2048688-1-yashinde145@gmail.com>
In-Reply-To: <20230329123225.2048688-1-yashinde145@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2023 12:35:28 -0700
Message-ID: <CAMKF1soNfkuZguRXKtCzHS1AaJW-1KgqwCVLVh2CKy0juk67gw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] librelp: fix function inline errors in
 debug build
To: Yash Shinde <yashinde145@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 19:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101823

On Wed, Mar 29, 2023 at 6:12=E2=80=AFAM Yash Shinde <yashinde145@gmail.com>=
 wrote:
>
> With DEBUG_BUILD =3D "1", the following errors occur:
>
>    src/relpsess.c:95:1: error:
>       inlining failed in call to 'relpSessFreePermittedPeers': function n=
ot considered for inlining [-Werror=3Dinline]
>
>    src/tcp.c:146:1: error:
>       inlining failed in call to 'relpTcpFreePermittedPeers': function no=
t considered for inlining [-Werror=3Dinline]
>
>    src/tcp.c:158:1: error:
>       inlining failed in call to 'callOnAuthErr': function not considered=
 for inlining [-Werror=3Dinline]
>
> Compiler does not inline any functions when not optimizing unless you spe=
cify the =E2=80=98always_inline=E2=80=99 attribute for the function. Add ">
>
> Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/libr=
elp/issues/256
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  ...02-librelp-fix-function-inline-error.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp=
-fix-function-inline-error.patch
>

This patch is missing from SRC_URI, so it won't be applied unless done so.

> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-fu=
nction-inline-error.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-l=
ibrelp-fix-function-inline-error.patch
> new file mode 100644
> index 000000000..60cf1b632
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-=
inline-error.patch
> @@ -0,0 +1,59 @@
> +From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
> +From: Yash Shinde <Yash.Shinde@windriver.com>
> +Date: Tue, 28 Mar 2023 04:06:58 +0000
> +Subject: librelp: fix function inline errors in debug build
> +
> +With DEBUG_BUILD =3D "1", the following errors occur:
> +
> +   src/relpsess.c:95:1: error:
> +      inlining failed in call to 'relpSessFreePermittedPeers': function =
not considered for inlining [-Werror=3Dinline]
> +
> +   src/tcp.c:146:1: error:
> +      inlining failed in call to 'relpTcpFreePermittedPeers': function n=
ot considered for inlining [-Werror=3Dinline]
> +
> +   src/tcp.c:158:1: error:
> +      inlining failed in call to 'callOnAuthErr': function not considere=
d for inlining [-Werror=3Dinline]
> +
> +Compiler does not inline any functions when not optimizing unless you sp=
ecify the =E2=80=98always_inline=E2=80=99 attribute for the function. Add "=
__attribute__((always_inline))" to avoid these function inline errors.
> +
> +Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/lib=
relp/issues/256
> +
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +---
> +
> +diff --git a/src/relpsess.c b/src/relpsess.c
> +index ee7b595..aa52b71 100644
> +--- a/src/relpsess.c
> ++++ b/src/relpsess.c
> +@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis,
> +
> +
> + /* helper to free permittedPeer structure */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + relpSessFreePermittedPeers(relpSess_t *const pThis)
> + {
> +        int i;
> +diff --git a/src/tcp.c b/src/tcp.c
> +index 7a75cc4..f4088c0 100644
> +--- a/src/tcp.c
> ++++ b/src/tcp.c
> +@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pThis=
, void* cert);
> +
> +
> + /* helper to free permittedPeer structure */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + relpTcpFreePermittedPeers(relpTcp_t *const pThis)
> + {
> +        int i;
> +@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
> + }
> +
> + /* helper to call onAuthErr if set */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const char =
*emsg, relpRetVal ecode)
> + {
> +        pThis->pEngine->dbgprint((char*)"librelp: auth error: authdata:'=
%s', ecode %d, "
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101819): https://lists.openembedded.org/g/openembedde=
d-devel/message/101819
> Mute This Topic: https://lists.openembedded.org/mt/97927015/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

