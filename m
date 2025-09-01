Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34766CA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 09:53:09 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.47623.1756720378416576206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 02:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKuOPjgb;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70df91bdc53so34514936d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756720377; x=1757325177; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofobfzjzJG9J1fdIY8NQbsTuZ8UDXgCKVT+jCg5LOik=;
        b=GKuOPjgbDZ+pPnHcDY5i4TnVX9XxxBuSRRQ9mzK2ICgXmtwXfdlrWSmnv31pAkIO1N
         CQc/hjVfugOqPmvannLXpV0qJYc6MQFJ+B/hICaSuIsKBRePnoBRMDSvjHrwupdZKL2T
         bzHMRlF3QuaQ2HbO12a7wNpodZjudHMGPtA94wm2SdqhTJQyAi9jrkA9iSFbIBUn7tfu
         rK2TqePCBEv3rrqAoO13uk4M5WFQQ9baj7fGuxCWZNbXmeJIG28Sku3vhLS998YLzBot
         gvUDTogS176DzOYs3bc90C7NNITNytFDw11ThKnxM0agRl9Qd9AIL3gYI5JbSJipfI+v
         PqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720377; x=1757325177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofobfzjzJG9J1fdIY8NQbsTuZ8UDXgCKVT+jCg5LOik=;
        b=hPg3GHEvkNXQB468lncgfuUCX00ipodYrFmGlIuur7igqGV1JGC8X7NtmfEmKVvA6b
         vqHBpF/uV9XR8uxiDA6O58fnUuHmHARHRtqPDCSAb1MNH7iDQK/0lajqv5C9Z9KfuK2W
         BTeHR2fA1jqU8/BmdwekrOgpkZ9m3U1HtmnQYusNjRYwz5xJnlcLdHK9GrF9WR6paW12
         TqR2/1RV+osnj0Adf7Zy21fJf0GZGVoYVn7zBMmz/s6PBFen3RhxwhNyHQczRuJqsG+C
         fVl92T9Uqx+TWfnbk2Ml9tM7Ad9Gn4FxLgt5XxGPwsNPcl95G5xVg9xoF8scRMNfI+8+
         OTUg==
X-Gm-Message-State: AOJu0Yyx/QPDqIFq58rrQ0maiyrPfFHa3L72bm/jQsEe+NpktzZLihYa
	3w16v/KPfWjiZh2HW9YrAmZLOvXB2h3J/Mc86cgIT+8R9PJcCgK8yDWZNqsi938oaWZECNbm01b
	071P96huHKgyfFlzD7xiVj/RgfDG/GuQ=
X-Gm-Gg: ASbGncs4cZo4yMPcn6OXujuo651JfUyrM9bk8r7fKKikny5lHQdAikUj9i8wSZV9iaY
	6xI0wZe85WwN9/rcHKqtufhGT6cmC+csSUieyUZ8wVAA4C8DhzDnAWuVjILf+tPzSDBkU2VA5yo
	JDDsS6XiXl6R3a0JtMFASkxqqsbthL0D4ubgUOrrKOkVZ5dIfLbQDEV8hp3zl0xxTcuNpq79dSb
	VIxySYdMONgoeO+y5r+ZwCEwq2u7KV+ilRa/zHSiJ0chkdDirUNzuYVIMgsiQHZa5tRZ9IPJxsQ
	Xef5ItGquwhiZzAO
X-Google-Smtp-Source: AGHT+IGmZzgsrlH9uWbApxVySZfOFdTPq612p4AIgDaW/VBNRrqjBnBihSYadMoiAFMSwONrYsjCd8JE2jeF33ygpEg=
X-Received: by 2002:a05:6214:238d:b0:70f:a67b:a622 with SMTP id
 6a1803df08f44-70fac895b6cmr77413036d6.32.1756720377128; Mon, 01 Sep 2025
 02:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAKv13CLMNx0H0TUmpqH-QOz28N2OV-QsRj2NdR21P+i6scaf4Q@mail.gmail.com>
In-Reply-To: <CAKv13CLMNx0H0TUmpqH-QOz28N2OV-QsRj2NdR21P+i6scaf4Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Sep 2025 11:52:44 +0200
X-Gm-Features: Ac12FXwsIKU86tVFoTqAnfiwOr85mbRcKjdbBSGem0-mfZmMctZQSk9Y5bEzTA0
Message-ID: <CANNYZj8+Vy2Bz5YjtrAR8F=xYvgBdcr0MG0dy5k-Q5-sXyZXEQ@mail.gmail.com>
Subject: Re: [oe] Introductions and questions around the world
To: josephjamesmills@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 09:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119154

Hello,

a recommendation: try to not be all over the place in your emails.
Send one email per issue, and keep it tight and focused. If you have
patches and aren't sure about them, push them to a branch somewhere
where we can take a pre-look, and someone will suggest further steps.

Alex

On Fri, 29 Aug 2025 at 19:33, Joseph Mills via lists.openembedded.org
<josephjamesmills=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hello all,
> I=E2=80=99m Joseph, I=E2=80=99m an independent consultant.  I just inheri=
ted an internal distro that historically never built a =E2=80=9Cfull distro=
,=E2=80=9D and I=E2=80=99m porting it from dunfel & kirkstone to scarthgap.=
 The client only needs a BSP subset, but in my spare time I=E2=80=99m tryin=
g to push general fixes back upstream. I have created a package group that =
doesn't install anything but does build everything in OE.
>
> I have found some things when building the clients multilib inteli7 machi=
ne's. A number of packages are not installed to the correct libdir(/usr/lib=
 vs /usr/lib64). I have noticed that this mainly affects python modules tha=
t are going to sites dir(PYTHON_SITEPACKAGES_DIR). see https://github.com/o=
penembedded/meta-openembedded/pull/990/files
>
> Scope / testing
> SoC families:
> * Intel: core2, corei7 (multi variants), (about 70K steps)
> * Atmel: ipac9x25, som9x25, soma5d35, soma5d36(multi variants) (about 45K=
 steps)
> * TI: som5728m, som3354  (about 60K steps)
> * Renesas: somrzg2l (multi variants) (about 70K steps)
> * Nuvoton: som35d1f(multi variants),  (about 70K steps)
> * NXP: somimx6(multi variants), somimx8(multi variants) (about 60K steps)
> * Nvidia: somagx (about 70K steps)
>
> Each of the som's have multiple carriers. Lots of device trees :) fun stu=
ff.
>
> Goals: I have 3 massive build servers. One is my own and the other two ar=
e the clients.
> serverA: no sstate to dl builds everything from scratch.
> serverB: shares with other servers and developers.
>   CACHE_PATH =3D "/srv/yocto/${DISTRO_CODENAME}-${DISTRO_VERSION}/${RELEA=
SE_TYPE}"
>   ARCHIVE_PATH ?=3D "${DISTRO_CODENAME}-${DISTRO_VERSION}/${RELEASE_TYPE}=
/${MACHINE}"
>   DL_DIR =3D "/srv/yocto/${DISTRO_CODENAME}-${DISTRO_VERSION}/downloads"
>   SSTATE_DIR =3D "${CACHE_PATH}/sstate-cache"
>   BUILDHISTORY_DIR =3D "${CACHE_PATH}/buildhistory"
>   PERSISTENT_DIR =3D "${CACHE_PATH}/cache"
>   BB_CACHEDIR =3D "${CACHE_PATH}/parser-cache"
>   CACHE =3D "${CACHE_PATH}/startup-cache"
> serverC: same as serverB helps with the matrix of the builds.
>
> The build system is kas and does(now) have full CI/CD (build, deploy-imag=
e, deploy-sdk, deploy-ota)
> Handling of Distro features are handled via the machine's file's and kas.
>
> devkit(som+carrier or SBC) code is open source (MIT). I can share KAS man=
ifests/build logs if helpful.
>
> Submission shape
> Do you prefer I send these as small series by subsystem (e.g., meta-gnome=
 first, then meta-python, then meta-oe), or one change at a time?
>
> Path policy =E2=80=94 For multilib cleanups, is moving empty /usr/lib par=
ents in do_install:append acceptable when ${libdir} is lib64, or is there a=
 stronger class-level approach you=E2=80=99d like?
>
> I=E2=80=99m new to posting here, so suggestions on etiquette, scope, and =
preferred structure are welcome.
>
> Another thing I am confused about is devshell. My current workflow(advice=
 appreciated)
> 1) something does not build. I clean the package/recipe.
> 2) drop to devshell.
> 3) if there is no git repo, run.
>   3.a git init; git add -A; git commit -s -m "Upstream import: ${PN} ${PV=
} (${SRCREV})"; git tag oe-base
>   3.b hack hack
>   3.c git add -p
>   3.d git commit -s -m "<META_PART> DESC"
>   3.e git format-patch oe-base --cover-letter --suffix=3D.patch -o ../pat=
ches
>   3.f cp ../000..... -> meta-layer/rec..../patch_dir
> 4) build and see if it passes. if not repeat :(
>
> before 3.f is there any way to build in the devshell without having to ex=
port a bunch of stuff ? In my past in devshell I have only built u-boot and=
 linux. (ARCH, CROSS_COMPILE etc). It would be nice not to drop in and out =
of the devshell until the build is fixed. Any advice on internal commands t=
hat I may be missing would be great.
>
> Some more things about the build. I have my own world recipe (it's really=
 a package group with a lot of rrecomends) I build this but do not ship to =
any images.
>
> I am willing to share any code or whatever that is opensource and does no=
t harm IP.
>
> Thanks for maintaining OE and I look forward to your advice,
> jmills
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119140): https://lists.openembedded.org/g/openembedde=
d-devel/message/119140
> Mute This Topic: https://lists.openembedded.org/mt/114964946/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

