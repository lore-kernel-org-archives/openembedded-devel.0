Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F304BC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:22:51 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.24906.1680182564413948662
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fo/tOaG5;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id f14so566558oiw.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680182563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70OQLnSP/8ba/ErEwrVpibtysR3uRjnrj5d7068Oo1A=;
        b=fo/tOaG53HXFQKd3/eEcEXhTTEdMHc34Uij+7lyk7RDbyTfIN8dH0GiAT1lx5XcFKn
         XRV9assdfno3DT7NHv8CXEzJejMOt/tMNIP0zn8CdTisfz8YKO3LZSou26Oo0l+WMTpz
         UlSg1Ig21HNMn/IxQ2/oSORJ7GpooKc3M+oR54H5jnUd5/1zYjVSX2uaw7Mew/zgvIm9
         la7+EjdIGZ/oXCY+hETr5piP/KBy2Yd19F1n0jj5/fqqWojzsUNX0DTMLZP8aXCPwzib
         NpqPVduyTMtkJKgQJGoGZaP+ZjzWvF6KA0I62PVjIM1iOSizkirCH//CP+o5JBNEJC4T
         O4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70OQLnSP/8ba/ErEwrVpibtysR3uRjnrj5d7068Oo1A=;
        b=iVDhWG1WUHFyat8dD77ZFGyrMJGhpu5UVD0/aNZTUNKDQIHR/jrc/zL3s2vSsaB3aW
         nWk/qOs6cqxpXrs6AznJjiA+4ySTciEn7ej9oN4A2giFbP5Si/+jyYyXGTRgJF0fUaZs
         lzvKQ14Sy8lzPvvwHTJqjWx7/m8EG4PZoQQsJwIugsFe0Gk6ByaZ8XrZviC6AHvIfn2G
         mhGIpIe6Hx2fGJ9jQZjPPEEIdWsTP8/z1+kc79dVWz2139xAUoZva/5BeZlvwAAkhqCe
         rHdlNCnOUYXnYAqD8i+QAlrK/18TJQaF3ASyklfEtDLS/Iif1MyJDNWYSN5uM40kAgrz
         3H2Q==
X-Gm-Message-State: AO0yUKXerClVjXFvaTvEf+QDted3xQQGKcPv5TVayMTwHI9toG2EvqZf
	GLrwwhT9S80i1rHvLwzooIQpNOzs4pynsvoiwE4=
X-Google-Smtp-Source: AK7set8KAi/PUW/B1Kqk8xV38tNP+QoXe1BRC8J21JUJuMNEFF+3wjMbqNLHCUp8OVPXi7pv4GsFCLM7Oie9RwUAbGg=
X-Received: by 2002:aca:916:0:b0:386:d8a5:d80b with SMTP id
 22-20020aca0916000000b00386d8a5d80bmr6046213oij.4.1680182563521; Thu, 30 Mar
 2023 06:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230330054414.15931-1-yashinde145@gmail.com> <45e8c265-6907-df73-70a1-a21052f2fe80@windriver.com>
In-Reply-To: <45e8c265-6907-df73-70a1-a21052f2fe80@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Mar 2023 06:22:17 -0700
Message-ID: <CAMKF1sq7XT3ZP9WgRyn3eBAeuCi=39seQnH8Xye79Rmk0PUo4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] librelp: fix function inline errors in
 debug build
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yash Shinde <yashinde145@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 13:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101834

also patch does not apply cleanly

   27772 Applying patch 0001-librelp-fix-function-inline-error.patch
   27773 patching file src/relpsess.c
   27774 Hunk #1 succeeded at 91 with fuzz 1.
   27775 patching file src/tcp.c
   27776 Hunk #1 succeeded at 142 with fuzz 1.
   27777 Hunk #2 succeeded at 154 with fuzz 1.

On Thu, Mar 30, 2023 at 4:29=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2023-03-30 01:44, Yash Shinde wrote:
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
cify the =E2=80=98always_inline=E2=80=99 attribute for the function.
> Add "__attribute__((always_inline))" to avoid these function inline error=
s.
>
> Also revert the work-around made earlier in librelp_1.11.0.bb.
>
> Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/libr=
elp/issues/256
>
> This is a less instrusive work-around.
>
> Please create a gcc bug to track the compiler regression and reply here
> with the ID. As well, note the gcc bug id in the librelp issue. Once the
> compiler is fixed, we can close the librelp bug.
>
>
> ../Randy
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  ...01-librelp-fix-function-inline-error.patch | 58 +++++++++++++++++++
>  .../rsyslog/librelp_1.11.0.bb                 |  2 +-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-librelp=
-fix-function-inline-error.patch
>
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-fu=
nction-inline-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-l=
ibrelp-fix-function-inline-error.patch
> new file mode 100644
> index 000000000..523a8991f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-function-=
inline-error.patch
> @@ -0,0 +1,58 @@
> +From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
> +From: Yash Shinde <Yash.Shinde@...>
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
> +Signed-off-by: Yash Shinde <Yash.Shinde@...>
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
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
> index e7b79ad03..a41b05a35 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1fb9c10ed9fd68=
26757615455ca893a9"
>  DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
>
>  SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;branc=
h=3Dstable \
> +           file://0001-librelp-fix-function-inline-error.patch \
>  "
>
>  SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
> @@ -15,6 +16,5 @@ S =3D "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> -DEBUG_OPTIMIZATION:append =3D " -Wno-error=3Dinline"
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101831): https://lists.openembedded.org/g/openembedde=
d-devel/message/101831
> Mute This Topic: https://lists.openembedded.org/mt/97944957/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

