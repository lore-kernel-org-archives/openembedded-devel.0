Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB0FC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:49:36 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.1523.1680104972293008297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F0f+fAdO;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso8417230otj.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680104971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4If8ZvN7TnOSFz+SJiqA1KkAvtgHzJKTzGQ0Scs6LyI=;
        b=F0f+fAdOwk2yIyacehFOc2/dZPcnkS8hQtIz5qee0fwutSAp1b3tIRtMIU6a5tDCWJ
         88BvlZFjFR1GFEyuMTIIMlLkKN254SLC4w65via62mgUHlNqxb5VDIRGOLogjIZ2I8gi
         8aMghTYea7M8SO08F77VpvmgwBOwjwqoL7QokgDclsfr8moRyuyb9otyUPhEUiOi54aE
         6Aeu50gYTnQfs1WG++a/Hrffc7Wgg0P7qcVS7EDrtBH/pBWWn+ENTuyQUsK5LMsustk5
         xw7Z+H8lMK7bbg3XgKmWZ59twPAz99slL7kkL2bmDuNaBqE10qTsSLJwkZu+nJ8OKlAC
         S5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4If8ZvN7TnOSFz+SJiqA1KkAvtgHzJKTzGQ0Scs6LyI=;
        b=pHNVSvx+waFOJIWQE+XvJDk0Zfho55c7uv5B+pfWBa6OfCYSYXsVUpBxjTThTZAQ8c
         cCC97/1A2xnhNkQf+8FE3+Mn8NV051Ift9mKMzkaUNhIsaFOUur409PANSITktD76QlY
         qPGG3S9XFSFcRce2nKoXbKMLY0enA13f9tTGhEJjgRlEVgVmJbfQ3RCaC5fqihE8+pa/
         c99mi4EGPhVa3Pom0ipjUmy+OgrPaWS+YEzomKwf3CFR+ymHlwkSqsWnLjokUcHRJQlA
         PTRNQeAy5f8PKaPS6H+stM6KULv3/LZCXfAeS8bqnTDyWXX3F1/7f5zkpVRYObhuUnYj
         bKJg==
X-Gm-Message-State: AO0yUKV+Uqk/51UVC3l9Y4flOF7jRQiiqVFQPYwdGpuEzkVRuFCi2Sdl
	3Q+IXWtKcWgBBQT0wtXa5nRvYgPfbMuu0n5C0UE=
X-Google-Smtp-Source: AK7set/XQcIRmwj6Tnsawf6Ikmj033NYkulI2bqRsaAhynxpIiUF5ThnOWPxTZinsPQZrP+mpNMH0H3V7uObpXsx2vE=
X-Received: by 2002:a9d:67d8:0:b0:69f:229:ce72 with SMTP id
 c24-20020a9d67d8000000b0069f0229ce72mr6581802otn.2.1680104971396; Wed, 29 Mar
 2023 08:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230329075827.437650-1-yashinde145@gmail.com> <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
In-Reply-To: <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2023 08:49:05 -0700
Message-ID: <CAMKF1srqFnJmAf6Gwx4hgjY+FiHvnsOym5T-5kvUz=8DWbPX0A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] librelp: fix function inline errors in
 debug build
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yash Shinde <yashinde145@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 15:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101822

On Wed, Mar 29, 2023 at 6:36=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2023-03-29 03:58, Yash Shinde wrote:
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
cify the =E2=80=98always_inline=E2=80=99 attribute for the function. Add "_=
_attribute__((always_inline))" to avoid these function inline errors.
>
> Hi Yash,
>
>
> First, if we're going to take this approach, you should revert my work-ar=
ound as part of this commit:
>
> commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6
> Author:     Randy MacLeod <Randy.MacLeod@windriver.com>
> Date: Wed Mar 1 19:24:27 2023
>
>     librelp: make inline errors be warnings in debug build
>         ...
>
>
> BUT...
>
> The problem isn't so much that the code doesn't get in-lined when doing a=
 debug build but
> that it fails to compile.  I think this is a compiler regressions since
> I was not able to reproduce the error when compiling natively using Ubunt=
u-22.04 (gcc-11.3) but
> was able to reproduce it using Fedora-37, gcc --version : gcc (GCC) 12.2.=
1 20221121 (Red Hat 12.2.1-4)
>
>
> Does the change you made actually build with the two compiler versions ab=
ove?
> Is there documentation that states that
>
> static inline void
>
> is not as portable as:
>
> __attribute__((always_inline)) static inline void
>

they both are portable and in fact 'inline' is in ISO C99 and
always_inline is a an compiler-specific hint which communicates more
to compiler of user's intention and compiler may choose to inline it
in more situations if compiler optimizer chooses it to inline, the
behavior
also depends on which compiler is in use.  'inline' is a hint
which compiler could use if the optimizer chose inlining and weightage
assigned to this function makes the cutoff.

> I suspect there is not but I'm not a compiler geek!
>
> ../Randy
>
>
>
>
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
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101820): https://lists.openembedded.org/g/openembedde=
d-devel/message/101820
> Mute This Topic: https://lists.openembedded.org/mt/97927015/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

