Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C760AC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 19:48:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.771.1647546530383997268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=lXnP98D5;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id t11so8821238wrm.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rRstFkcCencL8xnKFfV6fmlW19DB1TWyiWb246san6I=;
        b=lXnP98D5FAb5gtxTmqL6yzlAU7jmKBvvipmTbPzaAfq96Peug7mnxZdmVsBXvmfOjp
         61UMsWXwGEgt+5OTB7VrNgpA/XbjhdPfFwwmdiRxBkKSgpa3aKE6NYcEFJ+1uoV3PtUG
         eXSxGU8DUw3tdy9ccMEznQhanOS0aGm9riNvQLxmwPrz/g5/iEMrA+P86/WREOnk55R/
         C1fivfZAHP/RhteqtU0kbR8vNZeo4oc/15vtSFvUTtv2I21MyIvtbWSGMAGQTOrcHxaS
         HemcNHucCdNzGcCP5CKtpsLK1NhykxCK1a++PiXuM7Vzp6lc5U9/ecUOcJVQarccuftO
         LUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rRstFkcCencL8xnKFfV6fmlW19DB1TWyiWb246san6I=;
        b=a+FDKvq4TMNCL/NXVTMU4ZqIFbPI2WFAvrMnKq4slQe5msIcJQl4RDE7dzSMzFsBIQ
         EnWLzYNuQ+8eFPG7E/b7sMl32SCIuMCn/CM5BY0mQEMlBSHJDxSxfL7cKJU8GoN9RA0P
         uMFdxPvqMeTUl4NxOaDro6f1eloihk+dHWi4q6IGTuWIYPDc05YAwdvoP5BiP/5eK0Dz
         YfMJ5iGqU42gc+At7fVMeksX80r7eqeih/JELZgq2CjbgnSFqyH5/x15P0wPAk7Y96xS
         FPrIvTMuXKycyvWk8KTRzo0OV/mGqFyqMmWeLz65dmp4GsZtnngqCrCwceqygiHK/vLE
         7cmg==
X-Gm-Message-State: AOAM530EinuTijYBGos5p+lZ9Buj7C3PkcxyrqT+flzNbowD3CctsRda
	zJ0saJMPd0wyr12Ymbx2rUoYtbMGCHAi7Dvj5ictoA==
X-Google-Smtp-Source: 
 ABdhPJzEEoDsaQ9lcns7suQOx/FYjL0AXzdO6AZ+wz/wLX2RYxfOvvmRMJ3Yi/W9vf3fyixWCNKLF0ooaY1YccXN3sc=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr5352691wrs.620.1647546528744; Thu, 17
 Mar 2022 12:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220317165929.527418-1-f_l_k@t-online.de>
In-Reply-To: <20220317165929.527418-1-f_l_k@t-online.de>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 17 Mar 2022 19:48:37 +0000
Message-ID: 
 <CAAnfSTvFTEDAnHETjQX99vPNRq6fxcZdyB_93kcdpjbEeXzZhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: initial add commit
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 19:48:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96045

In libperfetto:

> +From f70ed62ce4a42525c9738455966bec2ed9647568 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 17 Mar 2022 15:44:23 +0100
> +Subject: [PATCH] meson.build: add pc file; build shared

No Upstream-Status or Signed-off-by.

> +PV = "24.2"

This can be removed.
> +do_install:append() {
> +       install -d ${D}${includedir}
> +       install -m 0664 ${S}/sdk/perfetto.h ${D}${includedir}
> +}

As you're editing the meson why not just get it to install these too?

> +FILES:${PN} = "${includedir} ${libdir}"
> +FILES:${PN}-dev = ""

No.  Always split into the usual packaging.

In perfetto:

> +DEPENDS = "gn-native ninja-native git-native curl-native"

I guess we get to grumble at google for git/curl here.  You *really*
want to find out how to avoid this though: can you not pre-loaded
sources to the right location in SRC_URI?

> +PV = "24.2"

Remove, redundant.

> +OUTPUT_DIR = "out/Release"
> +B = "${S}/${OUTPUT_DIR}"

Can you set B to ${WORKDIR}/build to do a proper out-of-tree build?
GN/Ninja certainly can normally. You then get to use
do_configure[cleandirs] to have a clean build tree.

> +do_configure() {
> +       cd ${S}
> +       ./tools/install-build-deps

YUCK.  What is this installing and why can't that be done via DEPENDS
and SRC_URI?  This breaks offline builds and source archiving.

Ross

