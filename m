Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D660BC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 02:24:26 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.4717.1685586257617357962
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 19:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=R7NB5nZ/;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-397f3aec11aso308670b6e.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 19:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685586257; x=1688178257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knLvZ4OGfodRHMbO0uSaoqd7iVv2jfTddTWGRc3IjQ0=;
        b=R7NB5nZ/zwzaeo6ILKgdpoGAxxv+yUQPWmnqQ//ys+0rsQqChKXN81h5/ytO69Xs6q
         oWf5fNOej/DF8VAaHSkVhJZ3qqq4VC9Ecnu4jN6vIGz0I3NsasG5j+KzrLVp7vDavjiZ
         phgFo358B/A4hpt6D6BHTexEdu+CeXQGq6O3wwUaZT7VpoOwKptPowWIet0STp6hBtcl
         J/it3giVNRve9dgJLC7WhuCe7w9qffGGUZen+v5BYrHq3bpjWlm0bfEI8W63YtKgrcxV
         KFUwkiUWIOtTYZYhA3uAMh8CZfBgT1eh6BuHlUzmvQf/EP3iHbxDD2bejtYgh0w0AcSO
         GoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685586257; x=1688178257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knLvZ4OGfodRHMbO0uSaoqd7iVv2jfTddTWGRc3IjQ0=;
        b=B97cd0YmGAsbRtbrKAz5ZFk64eWy4OLZquHj4CvITG78/IcQjxRu0uxKrRNkGE8oMN
         F3nzQ8MA3csL55FIY06cCFcXBnKMJa8+48668mL1MeDVtc9WyIYazTQOzdZ5Z3NFZvPl
         8lPHHnE6goQZ4pV8uHXo58070T2Zl1RUm1LWtsVAgliEJtp5is3m7KxK3l0McPsOoB1w
         wt9+Z816pEJ5Unjso7uZItVeFbKQjs2K94uoz48G1gpRl/I2C7tPLVUezPdqAwMMxJRW
         Mqbc3erMP0+6af9znXiKx5svXKKZn1WICwewGDGrWsP2oEcHSyqlaJeUWOmCbYV/00F2
         MqzA==
X-Gm-Message-State: AC+VfDy2qwRtMZ7WwGDRRVsxllhhrlHL1Q9860m2bRe3aMJYMhNicSmd
	WL4CE/rDpyIqI1HiA/bi+cVcXiCDnmNLnYjr3R7tZ6+J
X-Google-Smtp-Source: ACHHUZ4BoUKgpYrT7TIAtAktnjgA44y/ALIxE7wOOhaaxrWz2QoW2+BiRMOa2jklTAX7BdgHFcRQ5bjghnL9rMInhZE=
X-Received: by 2002:aca:a995:0:b0:39a:5047:f8a7 with SMTP id
 s143-20020acaa995000000b0039a5047f8a7mr242960oie.16.1685586256660; Wed, 31
 May 2023 19:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230531223435.2927651-1-nat.bailey@windriver.com>
In-Reply-To: <20230531223435.2927651-1-nat.bailey@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 May 2023 19:23:50 -0700
Message-ID: <CAMKF1spStGBCvL0ZRTUZWHnKm9M4dt8CvsyypxFuAi5aJEXqRQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libyang: backport a fix for CVE-2023-26916
To: nat.bailey@windriver.com
Cc: Openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 02:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103076

it does not look like its for master branch. Please prefix subject
line with correct release infor to help route it better.

On Wed, May 31, 2023 at 3:41=E2=80=AFPM Nat Bailey via lists.openembedded.o=
rg
<nat.bailey=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Natasha Bailey <nat.bailey@windriver.com>
>
> This patch fixes a bug in libyang which could cause a null
> pointer dereference from a call to strcmp.
>
> Since this recipe includes ptests, the tests were run twice
> (once before the patch and once after) with the same results:
> all tests passing except utest_types, which is skipped.
>
> Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../libyang/libyang/CVE-2023-26916.patch      | 57 +++++++++++++++++++
>  .../libyang/libyang_2.0.164.bb                |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-269=
16.patch
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patc=
h b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
> new file mode 100644
> index 000000000..f3af3dbff
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
> @@ -0,0 +1,57 @@
> +From dc668d296f9f05aeab6315d44cff3208641e3096 Mon Sep 17 00:00:00 2001
> +From: Michal Vasko <mvasko@cesnet.cz>
> +Date: Mon, 13 Feb 2023 10:23:13 +0100
> +Subject: [PATCH] schema compile UPDATE do not implement 2 same modules
> +
> +CVE: CVE-2023-26916
> +Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/dc66=
8d296f9f05aeab6315d44cff3208641e3096]
> +
> +Refs #1979
> +---
> + src/schema_compile.c | 20 +++++++-------------
> + 1 file changed, 7 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/schema_compile.c b/src/schema_compile.c
> +index ed768ba0..68c0d681 100644
> +--- a/src/schema_compile.c
> ++++ b/src/schema_compile.c
> +@@ -1748,7 +1748,7 @@ lys_has_compiled_import_r(struct lys_module *mod)
> + LY_ERR
> + lys_implement(struct lys_module *mod, const char **features, struct lys=
_glob_unres *unres)
> + {
> +-    LY_ERR ret;
> ++    LY_ERR r;
> +     struct lys_module *m;
> +
> +     assert(!mod->implemented);
> +@@ -1757,21 +1757,15 @@ lys_implement(struct lys_module *mod, const char=
 **features, struct lys_glob_unr
> +     m =3D ly_ctx_get_module_implemented(mod->ctx, mod->name);
> +     if (m) {
> +         assert(m !=3D mod);
> +-        if (!strcmp(mod->name, "yang") && (strcmp(m->revision, mod->rev=
ision) > 0)) {
> +-            /* special case for newer internal module, continue */
> +-            LOGVRB("Internal module \"%s@%s\" is already implemented in=
 revision \"%s\", using it instead.",
> +-                    mod->name, mod->revision ? mod->revision : "<none>"=
, m->revision ? m->revision : "<none>");
> +-        } else {
> +-            LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already i=
mplemented in revision \"%s\".",
> +-                    mod->name, mod->revision ? mod->revision : "<none>"=
, m->revision ? m->revision : "<none>");
> +-            return LY_EDENIED;
> +-        }
> ++        LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already imple=
mented in revision \"%s\".",
> ++                mod->name, mod->revision ? mod->revision : "<none>", m-=
>revision ? m->revision : "<none>");
> ++        return LY_EDENIED;
> +     }
> +
> +     /* set features */
> +-    ret =3D lys_set_features(mod->parsed, features);
> +-    if (ret && (ret !=3D LY_EEXIST)) {
> +-        return ret;
> ++    r =3D lys_set_features(mod->parsed, features);
> ++    if (r && (r !=3D LY_EEXIST)) {
> ++        return r;
> +     }
> +
> +     /*
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-o=
e/recipes-extended/libyang/libyang_2.0.164.bb
> index 2817be7c8..7875c1ef7 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> @@ -11,6 +11,7 @@ SRCREV =3D "a0cc89516ab5eca84d01c85309f320a94752a64c"
>  SRC_URI =3D "git://github.com/CESNET/libyang.git;branch=3Dmaster;protoco=
l=3Dhttps \
>             file://libyang-add-stdint-h.patch \
>             file://run-ptest \
> +           file://CVE-2023-26916.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103075): https://lists.openembedded.org/g/openembedde=
d-devel/message/103075
> Mute This Topic: https://lists.openembedded.org/mt/99253028/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

