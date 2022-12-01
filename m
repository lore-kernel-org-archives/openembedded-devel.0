Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08488C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 21:33:47 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.58238.1669930418802324747
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 13:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LIT/JZ78;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id l127so3436202oia.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/K2aneQjoG9H+u5dBhaeLpcQkGTAn95KEN6GCWoebU=;
        b=LIT/JZ78SHG6mdJq84+/yLaZHNBJLi+RQC0b0YUW6e64ijPZZBmTMfFpIW4YqhnHUA
         iqTl5YTPOuQ5kET/O9iynMmxvURgrTYsWAJ8CJCOA+r58Ek/IvTR4jMiqmIBe30ChSZy
         YgVuBn3rLhNROmxVdN1ZRAuAleBVBBspbFrSZC/y3+Wqr4by0vcybeGo4Kd6K0yKiVr6
         j8yryW/ONTIdHK7lZyGN/IOQWGD+qxtbbqssakVETXxs3dJaKrqsgPknt0WahdRy4p5L
         PxweWmxocFOteNsX6g85W/cMqvdTPEK5zXhrHxF+RwR3BpKMy7K/odj3CeGDoIFJ2U1r
         B/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/K2aneQjoG9H+u5dBhaeLpcQkGTAn95KEN6GCWoebU=;
        b=65lRtfuLFSj/4Dib3y69+9VpYitVv5s56m83dA8lCi2++LyyO8/Y3igKee3NnMqb6J
         s+4z3TJf9qNEgMWOZf4J5pZFfupTmEPHAh2GiHviwiG0J0xGOzYHcxVcetToAlWest8A
         E5+CmJExWdecbbntsJhEUjc5kh5V9DqDf+vqJH2C8NjtjjaqyJO/XMgNxEIWK+CwrsQs
         pSmSejG+4+/nxlKFZyJj3PwJADedMJPn3k4+fJYAgThX1CHw2gzINup8Et746PPFOYbb
         dNGhQLS/xgvyDEfYLmEnTXwB1F2394jGqwrvtxxI3n3ZVx62NXGjtxokrBx8I38WiCUp
         z//w==
X-Gm-Message-State: ANoB5pnlrPsJeNknVnOm1f1CrYbjjftQQEqH0RxUxen9lwQ6OCcUCNLU
	auEy88n4x0gliNkYSEVmOiXNdiKjdud3CwM6LRk=
X-Google-Smtp-Source: AA0mqf6Pk0hKHQGzWKLBlbBEUvlW/FmGCLxp3LgOYYWBfCfHt+0s73WlI96Tb8K92hHAoqBfQmkeGw6sKNyrrpvNXNQ=
X-Received: by 2002:a05:6808:1c1:b0:34f:d32d:cad5 with SMTP id
 x1-20020a05680801c100b0034fd32dcad5mr34615779oic.262.1669930417950; Thu, 01
 Dec 2022 13:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20221201134148.116754-1-alex.stewart@ni.com> <4aadbe36-b9a4-32ab-e2df-a31ec1ac341c@ni.com>
In-Reply-To: <4aadbe36-b9a4-32ab-e2df-a31ec1ac341c@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 13:33:11 -0800
Message-ID: <CAMKF1srn3pCH85VdtFpjhX-+9z=3uvWy7p-vOFF+AXyw_5edjQ@mail.gmail.com>
Subject: Re: [oe][meta-gnome][PATCH 0/3] gvfs: use native ssh client
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-devel@lists.openembedded.org, schnitzeltony@gmail.com, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 21:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99906

On Thu, Dec 1, 2022 at 12:48 PM Alex Stewart <alex.stewart@ni.com> wrote:
>
> I'm revoking this PR for the moment, in favor of pursuing an upstream
> solution.
>
>
> While doing some more investigation based on the commentary that Mikko
> and I were having in the thread, I discovered more detail about how gvfs
> is using the ssh binary.
>
> As this open gvfs issue [1] points out, meson is configured to find the
> `ssh` binary in the build host's PATH and to then write that path-string
> directly into the `args[0]` for the sftp backend. And that's *all* that
> the ssh binary is used for at build time.
>
> That's obviously dangerous - as the issue points out - for the
> cross-compile case, where you cannot assume that the ssh binary path is
> the same between the build host and the target distro. But it also means
> that using a sysroot-native ssh binary is equally as insane, since its
> path is also different from the final target image. So neither the
> existing implementation, nor this PR, would provide you with a working
> gvfs-sftp implementation.
>
>
> The proper solution is probably to change the gvfs-sftp backend upstream
> to use PATH resolution at runtime to find the ssh binary. Though I don't
> actually use gvfs-sftp in my use-case, I'll attempt to try and upstream
> a fix.
>
> The other alternative I see is to disable the gvfs-sftp subpackages from
> building in OE entirely - which seems undesirable for those users who
> are depending on it.
>
>
> [1] https://gitlab.gnome.org/GNOME/gvfs/-/issues/465
>
> On 12/1/22 07:41, Alex Stewart wrote:
> > While rebasing the NI LinuxRT distro to kirkstone, I noticed that my
> > pyrex container fails gvfs:do_configure with a meson error about not
> > finding an `ssh` client.
> >
> > | Program ssh found: NO
> > |
> > | ../gvfs-1.50.0/meson.build:462:2: ERROR: Assert failed: SFTP backend requested but a ssh client is required
> >
> >
> > After some investigation, it seems that gvfs is configured to use the
> > `ssh` client implementation in the build machine's PATH. If no native
> > implementation is provided in the native sysroot, it will default to
> > using the host machine's implementation.
> >
> > My new kirkstone pyrex container happened to not install an ssh client,
> > and so would fail. Since ssh isn't a requirement to run BB or OE, I
> > don't think it's appropriate to use the host's ssh.
> >
> >
> > This patchset adds the native bbclass to openssh, when the user includes
> > meta-oe in his layerstack, and then provides the openssh-native content
> > to gvfs through its DEPENDS. This is sufficient to resolve the error on
> > my kirkstone pyrex container.
> >
> >
> > NOTE: It's a little odd to me that the OE-core openssh recipe doesn't
> > already inherit native.bbclass - when it *does* inherit
> > nativesdk.bbclass. I would be open to moving the openssh changes in this
> > PR to OE-core directly, if someone can ACK that it would be more
> > appropriate to do so.
> >
> > Alex Stewart (3):
> >    openssh: add native BBCLASSEXTEND
> >    gvfs: stylize DEPENDS

I kept this one patch since it was formatting only.

> >    gvfs: use native ssh client
> >
> >   .../recipes-connectivity/openssh/openssh_%.bbappend  |  2 ++
> >   meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb         | 12 ++++++++++--
> >   2 files changed, 12 insertions(+), 2 deletions(-)
> >   create mode 100644 meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99905): https://lists.openembedded.org/g/openembedded-devel/message/99905
> Mute This Topic: https://lists.openembedded.org/mt/95382223/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

