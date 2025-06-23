Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E136C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 05:36:06 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.12782.1750656963706640463
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 22:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1j7SnLz;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d098f7bd77so400492685a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 22:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750656963; x=1751261763; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xPUgrr/pk3woH8N0rCSVX7/meH7mLi91olWw4YXDkRk=;
        b=Y1j7SnLzOf8pOMRF25bPqLX2fqC0AKGtNOMyV+DZ0ldUslD94u6/6De6994KGPinkA
         jP7vrf2iyHR80k3ymBhEbDK3UK8BxLOlmaAPA3/AbMiGgbHV+Z5JQdzg5oZsWln99vhF
         RVo1WbCweQzfhFLCASVtQm4t0qUnYiEYP7a0iQB2vCvMB1/wFJgyGLF83u5iyxNemeQ8
         XDX85VT9paDwcxZebKn4CqsWCjjBTXxAsSn1Eya+0/jTY1x3syOBi8z2K2Mhls2mt8CX
         nl7m4XQVHQriJdTk2xVsykYYtDGqlq3tmMn2tm22RyhVWNXLEn07ly6pItjN5PV+cxsu
         iGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656963; x=1751261763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPUgrr/pk3woH8N0rCSVX7/meH7mLi91olWw4YXDkRk=;
        b=KstdrmBQlsQPPe4HgakbMaX92oFLg8XGLiDU90DAPdB+C+tKgZvSTyCKh9YfeUViAb
         E/etBgXA7pXykeUdEAuTBbdrNQ0S5rob5Y4LAK2y0NGcQUwU1NgaDDezzH2t9rZwd2jF
         uT+TAS06arkpYxOmK1WfBlOwcnnbFAybEZGePvULd9GmcS6Njh5IGzPWjR/+jN+i4JEz
         C3ZPrhTAywSsEtaEQAnfKWZBXMM3//d8cVe52UkeyDugIfm4FeZjbNtLWh2eNZ7TfcK3
         2WqLQE0/uSYSIJidspfvPNQdsg3rch6CzRXs74OAzXqnrP/ftQRoZw0SiqIWC/N6TXD/
         go8Q==
X-Gm-Message-State: AOJu0YyOlOy5/k+FfR5xG6ne12q05wbnsjpkdNca3yLtOXHJ4lncJqMp
	1WFz4gQz+jYQGMVm9moxnxp6xcb/xfcXfoZL3iRHqy7LaNjsp1jF1LD5p6YX94kjhzF9zmbtq47
	ocHJJ/bSo+7+ItgUtHNoEFM42Ta+s5Zk=
X-Gm-Gg: ASbGncsFs9pgUAQCEKxEvpr+Z8UUOKYBGidBBqXwMw8JDqzUFRamxWFF3a1+QXMxNym
	dpN89tapcroy/+lmDJ3bhxyxU1k9XsqcMUTMzUJ2YkoWpZxEPL+wqjh5TuU+9v/ZPXPZche1VBh
	BscFu4a5SAMm0tk4XrGumSj8gA8Rnpveewtx9OuLsfca3+mF6ZFi6df8EGfdx1DxcBlafdw95Gj
	daqqA==
X-Google-Smtp-Source: AGHT+IGrtd6LDwqo9MkRErHBSo8AaevbwcrTLqF+gq++UKMSBwOHMuMs06mms2nmPjKfMDl0TQzyEwco2tw7Y+O89hY=
X-Received: by 2002:a05:620a:4112:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7d3fc0625a9mr1328168085a.23.1750656962611; Sun, 22 Jun 2025
 22:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250621194009.350944-1-skandigraun@gmail.com>
In-Reply-To: <20250621194009.350944-1-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Jun 2025 07:35:51 +0200
X-Gm-Features: Ac12FXyQZ7CaeT1eV8dgwUfGWwVkvF4OBe7pr7e-ofZIsaLbdeFuzOU8LtER5-w
Message-ID: <CANNYZj97Dh6m=PzMcdoQK-Om4T18VC+ubw_6hQrVd=_0JDQHLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: ignore QEMU_OPTIONS for native
 signature generation
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 05:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118028

This looks like a better fix possible. Why is qemu a dependency for
native variant to begin with, if it's not used? Shouldn't that
dependency be eliminated?

Otherwise, this is prone to regressions if some other qemu-related
variable starts invalidating sstate.

Alex


On Sat, 21 Jun 2025 at 21:40, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
>
> NodeJS recipe uses qemu to run some target binaries during compilation
> in qemu, in case the build machine's and the target machine's CPU
> bit-width are different. The task that generates some helper scripts
> (do_create_v8_qemu_wrapper) is executed before do_compile.
>
> In case the target machine changes, that also changes the value of
> QEMU_OPTIONS variable, since that is always derived from the target
> machine's properties, even when the current recipe is class-native.
>
> This also means that in case the target machine changes, that invalidates
> the do_create_v8_qemu_wrapper's sstate cache (along with the very costly
> do_compile), for both target and native builds.
>
> However for native builds qemu isn't used at all, since the target and build
> CPU are the same, their bit-width matches too.
>
> To avoid unnecessarily invalidating the sstate cache of nodejs-native
> when the target machine changes, add QEMU_OPTIONS to BB_HASHCONFIG_IGNORE_VARS
> in order to exclude it from the signature generation.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> index 4bc829f140..bf2bae27f1 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> @@ -47,6 +47,10 @@ CVE_PRODUCT += "node.js"
>  # v8 errors out if you have set CCACHE
>  CCACHE = ""
>
> +# Changing qemu options can incorrectly invalidate sstate, even though it is not used.
> +# Exclude it from signature generation.
> +BB_HASHCONFIG_IGNORE_VARS:append:class-native = " QEMU_OPTIONS "
> +
>  def map_nodejs_arch(a, d):
>      import re
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118011): https://lists.openembedded.org/g/openembedded-devel/message/118011
> Mute This Topic: https://lists.openembedded.org/mt/113762550/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

