Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B44C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 06:23:11 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.42546.1705818188872555354
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 22:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJ4HneWS;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5989d8decbfso1469884eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 22:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705818188; x=1706422988; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf4YdpRfv87HAk3eshIUni8FpdA8PiQAsUGsREf4e1Q=;
        b=JJ4HneWShf1aMmAJTlgU+tC0fa0x1GaRaM+l43JSo8kycWxX+/xF5KCwtWmBMUlTXO
         8QTj3wdATQFJDskYurYygo1cSie4wCeD1ry67TsH6//QMqL5WIG351fXlpLX0eAvr9wQ
         H9UjHfvMLOH+r1wYc6Yzbcz9QoCbpMcJ0dXgJGJ/w5vVdnoD/UsQudd8dRoJrvM3WkPs
         HS+aFgHmxt9R6TZH1PAHd3D+UQcOYtbplVQLM10TSy74JjYG36Vk1Z/CAOhU18du/9oI
         m8ghAVT1i9OGzkG1ewDC6tyTPm8Buo990AzGpDZ66wTA1I7bH3yo2ivCiaqs+2ZSfONJ
         nCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705818188; x=1706422988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf4YdpRfv87HAk3eshIUni8FpdA8PiQAsUGsREf4e1Q=;
        b=A5L5e/AmbwRJpbdMN2wk7kAtFGuXEymk5tn4hXwHZso2PiMRIRAOZHUXeyh1W7Kqad
         PAdkxIuBhPKlmLbYvxEIf6TUtM3Vt2GN2Tw0vHWxvrnr2PcIXy1s35ngwrrbCnC8XUM9
         lv4Fl7aIJlxpewL9YtG9coFGYx+hSJZhK9ew/paHg/skLiDwCOTOTN8a//usnrKCv9DQ
         t2mJ9LuQfyDkcy1o5kj4zxf2wRHsEGuy6bispkEOZGnbqM1druzGdDwlZa3oF4TeiWEO
         8dP5Z43qOSzfrx/ADkCmZmbGDj8/Oae8/U7a0WAQ1cSdd+ds5yPF8XPHnbmjXHtsPKuW
         8GJg==
X-Gm-Message-State: AOJu0YzxLs7ilTj+btholvsp5kGhSoaWZiyglceHwuDUaeYQ5M0vKJv4
	LTSHWZuPhYwgRsdjOdMq7q4d4J3u7qkKU7hnwopwHcCgL3INhVmi7P/h49OvE128dYC1iKFT7Jg
	7vpRTeufVCERrQvKFoMWDgeHNXVrPe7SyDXSa2A==
X-Google-Smtp-Source: AGHT+IHrFvWeaR6piUGGPBrSNjPgw8eFXONZVmbgnnZoQnM2hNq+riwi0uEy3zG/U6/BMNZXI/5XRsqy1WUs4ZJf1FQ=
X-Received: by 2002:a05:6870:a2cc:b0:210:cac2:441c with SMTP id
 w12-20020a056870a2cc00b00210cac2441cmr2715054oak.11.1705818188025; Sat, 20
 Jan 2024 22:23:08 -0800 (PST)
MIME-Version: 1.0
References: <20240119102009.18867-1-paul.leguendekerneizon@savoirfairelinux.com>
 <CAMKF1srn6ie3a8N7tYZQi2i-oYsi7kyaa=3QraViX5hNXO2ESQ@mail.gmail.com>
In-Reply-To: <CAMKF1srn6ie3a8N7tYZQi2i-oYsi7kyaa=3QraViX5hNXO2ESQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Jan 2024 22:22:41 -0800
Message-ID: <CAMKF1spjpGu8uXu2vA1iMVparZ_ziYaW2BA8xA6tfZ+xog2DCg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v2 0/2] add support of cockpit-machines
To: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jan 2024 06:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108368

some more messages

Parsing of 3111 .bb files complete (0 cached, 3111 parsed). 4992
targets, 119 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'virt-install' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-web=
server/recipes-webadmin/cockpit-machines/cockpit-machines_304.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'virt-install' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virt-install']
NOTE: Runtime target 'cockpit-machines' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['cockpit-machines',
'virt-install']
ERROR: Nothing RPROVIDES 'libvirt-dbus' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-web=
server/recipes-webadmin/cockpit-machines/cockpit-machines_304.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'libvirt-dbus' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libvirt-dbus']
ERROR: Nothing RPROVIDES 'cockpit-machines-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-web=
server/recipes-webadmin/cockpit-machines/cockpit-machines_304.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'cockpit-machines-dev'
NOTE: Runtime target 'cockpit-machines-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['cockpit-machines-dev']

On Sat, Jan 20, 2024 at 10:14=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> I am seeing some more missing deps
>
> ERROR: Nothing RPROVIDES 'virt-install' (but
> /mnt/b/yoe/master/sources/meta-openembedded/meta-webserver/recipes-webadm=
in/cockpit-machines/cockpit-machines_304.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'virt-install' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virt-install']
> ERROR: Required build target 'cockpit-machines' has no buildable provider=
s.
> Missing or unbuildable dependency chain was: ['cockpit-machines',
> 'virt-install']
>
> On Fri, Jan 19, 2024 at 3:40=E2=80=AFAM Paul Le Guen de Kerneizon
> <paul.leguendekerneizon@savoirfairelinux.com> wrote:
> >
> > Hello community,
> >
> > Since version 242 of Cockpit package, plugin `cockpit-machines` has bee=
n moved
> > to a dedicated repository. This cockpit plugin is used to manage in web=
 UI
> > virtual machines. There is currently no support of the new cockpit-mach=
ines
> > package in any Yocto meta and the following patches bring it:
> >   - Patch 1 adds the recipe of cockpit-machines
> >   - Patch 2 remove all the old occurences of cockpit-machines package i=
nside
> >     cockpit recipe.
> >
> > Waiting for your review, feel free to ask any questions or remarks.
> > Regards,
> > Paul Le Guen de Kerneizon, Savoir-faire Linux
> >
> > V2 changelog:
> > - add needed distro features to match cockpit recipe constraints
> > - add needed compatible host to match cockpit recipe constraints
> >
> > V1 patch: https://lists.openembedded.org/g/openembedded-devel/message/1=
08327
> > Paul Le Guen de Kerneizon (2):
> >   cockpit-machines: add recipe
> >   cockpit: remove occurences of machines package
> >
> >  .../cockpit-machines/cockpit-machines_304.bb  | 28 +++++++++++++++++++
> >  .../recipes-webadmin/cockpit/cockpit_304.bb   |  5 ----
> >  2 files changed, 28 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-webserver/recipes-webadmin/cockpit-machines/co=
ckpit-machines_304.bb
> >
> > --
> > 2.34.1
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108358): https://lists.openembedded.org/g/openembed=
ded-devel/message/108358
> > Mute This Topic: https://lists.openembedded.org/mt/103828014/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

