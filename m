Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182F6D13589
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 21:40:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.38368.1730065206160885587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 14:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SbEfMO+d;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e690479cso3485013e87.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730065204; x=1730670004; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vfa5Jukyao3FmN/FTA76f16FJeYywe+JYzKk2nKqJfU=;
        b=SbEfMO+dMNYUt683q2yhoe6JetZDt0KT3IjOQRLiQOMzCkkJWh1NBwJ8Qr9GH8Dg4i
         Q82zOUL7SDfvWM3x7E5dcA0IbgE4KC6yknoLO+t46FOSGtGFvV+Iu90X0u4YRTsx/s/W
         +CEQrLoyK287usNE+P7UkXzL71V4eW21oVz+YvTCR54fF6Xp6sLfxngM7e7frPbsO3Sb
         Fi0EkDOWIKv0FlBs/X4uiHNR0Xr7pNv/My/7aHAnxHLLjTV/7NHpX71PiAChTmxSg47a
         yQZ/knq9ywpmSpYq/SkWzOB67n0eR79Kyf+QqBcJseWkm4LFkaYKPGwLJZz6Gl9VW+Ea
         zA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730065204; x=1730670004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vfa5Jukyao3FmN/FTA76f16FJeYywe+JYzKk2nKqJfU=;
        b=wlzQiN9HP/btV4/yzifb6RP+UgNiJEAUFfl8eF22KxS4II8U3JeiJpFoauI+pIaW5e
         SwlBVwe7iitbtW69CWJEjDE9XNjzTvEnFz5dTgqaESkFrFPNbS/F4UGtkdjoX5dpItLG
         SFWkUS9viRZuWcQmC5W6eLDvAYEmbBXtvt6wXnXVpdQT/9Em4IlFKdTCV+o4C+xH0ILz
         TF7pCD+gqgeyCWabltd85I6y4ytr1QZCrVu8OybmRhiOebR4vnFr955meS15rpQ0uH25
         16BcXtXtJ3tCkTwcCdU9B5am7ImvmrvDmbOhSqBbEzhYntwuIfQW5aaq2YZSR2hip0Rc
         kOaQ==
X-Gm-Message-State: AOJu0YzEyc+YFiNPDXioMKbLdF9WZBzqWt/g85RohSpQAYsku11MY9Fz
	9NJq4LjxJunUPl/hmYvmvt97277GOGBzXRa2PuH8c4dn+xlaMHiGLhl4fB3SulHauIgZtY/ragl
	i04z+itHHQwZ1Tv0ScA8p1FslukI=
X-Google-Smtp-Source: AGHT+IGrQMnqC75PYIyRcdVdHyNK0QF6eQXBcsGx3krOYQtD76imydPvDSfEeBWQYLHgH/FzmfgInNuwNFZukNGEzGA=
X-Received: by 2002:a05:6512:3d8b:b0:539:d0ef:b3f9 with SMTP id
 2adb3069b0e04-53b3491dfc0mr2540784e87.40.1730065203929; Sun, 27 Oct 2024
 14:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241017061710.1108077-1-raj.khem@gmail.com>
In-Reply-To: <20241017061710.1108077-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 27 Oct 2024 22:39:51 +0100
Message-ID: <CA+chaQc0_H7SRUaErOXjWDcZ3srk_8n9kw+f7aQM6eQDYECvQw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] xmlrpc-c: Fix race condition triggered during
 symlink creation
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 21:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113253

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks Khem!

On Thu, Oct 17, 2024 at 8:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This should fix race condition sometime seen in highly parallell builds
>
>    | rm -f libxmlrpc_util.so.4
>    | rm -f libxmlrpc_util.so.4
>    | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
>    | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
>    | rm -f libxmlrpc_util.so
>    | ln: failed to create symbolic link 'libxmlrpc_util.so.4': File exist=
s
>    | make[2]: *** [/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/xml=
rpc-c/1.60.03/git/stable/unix-common.mk:72: libxmlrpc_util.so.4] Error 1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...nsuring-Sequential-Execution-of-rm-a.patch | 46 +++++++++++++++++++
>  .../xmlrpc-c/xmlrpc-c_1.60.03.bb              |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-=
common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.=
mk-Ensuring-Sequential-Execution-of-rm-a.patch b/meta-oe/recipes-devtools/x=
mlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.=
patch
> new file mode 100644
> index 0000000000..02b5244f3a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensu=
ring-Sequential-Execution-of-rm-a.patch
> @@ -0,0 +1,46 @@
> +From c9bd05e8f0ad805b81625cfa717d06071cfd9b48 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 16 Oct 2024 22:52:38 -0700
> +Subject: [PATCH] unix-common.mk: Ensuring Sequential Execution of rm and=
 ln commands
> +
> +With high parallel execution, it results in race condition where
> +its trying to create symlink while the original symlink while rm is
> +not done deleting the existing file yet.
> +
> +force sequential execution by adding dependencies between the steps
> +or combining them into a single shell command
> +
> +Here, && ensures that the ln -s command only runs after rm -f target
> +successfully completes.
> +
> +Similar error reported here [1]
> +
> +[1] https://bugs.gentoo.org/932835
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + unix-common.mk | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/unix-common.mk b/unix-common.mk
> +index 6954faf5..983c48cd 100644
> +--- a/unix-common.mk
> ++++ b/unix-common.mk
> +@@ -62,14 +62,12 @@ SHLIB_CMD =3D $(CCLD) $(LADD) $(LDFLAGS_SHLIB) -o $@=
 $^
> + SHLIB_LE_TARGETS =3D $(call shliblefn, $(SHARED_LIBS_TO_BUILD))
> +
> + $(SHLIB_LE_TARGETS):%:%.$(MAJ)
> +-      rm -f $@
> +-      $(LN_S) $< $@
> ++      rm -f $@ && $(LN_S) $< $@
> +
> + SONAME_TARGETS =3D $(SHLIB_LE_TARGETS:%=3D%.$(MAJ))
> +
> + $(SONAME_TARGETS):%:%.$(MIN)
> +-      rm -f $@
> +-      $(LN_S) $< $@
> ++      rm -f $@ && $(LN_S) $< $@
> +
> + .PHONY: $(SHLIB_INSTALL_TARGETS)
> + .PHONY: install-shared-libraries
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb b/meta=
-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> index a34256c275..f5ee920cad 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf81ba0=
750f02176b6f86752ea951"
>
>  SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;protoc=
ol=3Dhttps \
>             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.p=
atch \
> +           file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-r=
m-a.patch \
>             "
>  # one more commit after Release 1.60.03 in the Stable series
>  SRCREV =3D "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"

