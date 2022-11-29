Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE82AC433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 22:20:10 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.1041.1669760405130563328
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 14:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l8Fce8e9;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-142b72a728fso18844067fac.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 14:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ahKjCfbNPAsdxnk6pXFNDu2Zz6Pgxr2uA3eTNTRmiwc=;
        b=l8Fce8e98OUl8T7hjw+1qGLXxNRkRv71Gv3tUFKrAvf945D5U6sJEW3H+dfDgqkCeB
         gnL+NqSMB+1kT20qjM6PpvMkSNosd4W7RwPvaYdzxi0fPaS7AzJ3c3Kfl9aQpj53hyGP
         NaiPfsZQwzqMvUk7FQYfZxbdkSQGvVphtPfjvJRaLLXjujLZtJaOsAvNltPGKsP2ZE8f
         yKEBXeoHe9wZMUBs1rAt4ULMP7vQXpDdN0XwdE9LRUoZcYkpIicdY3q/IIe+znrgMxsC
         DTKZsebdRj7NtEwuGTtJcaUd14rE22FAUA4iUrH79xlmrOBa47k9sQdcvzZNq3H/WoSt
         Fx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahKjCfbNPAsdxnk6pXFNDu2Zz6Pgxr2uA3eTNTRmiwc=;
        b=lOLdQXxh+7M5MxFWXL74vGg+VcxV1Z3ShHcTj1w76gzqhdQrRCf20A5O9JhHVsWS0S
         nMM5k/gAshBjD0Ag05+K5G1iEUt+DdSgPUjINRDYXbQeyzwlLFmH/nD9PaJDg9HE8CDt
         tp5xMp1KeRPfCdrlNCCoDE+gwbGFxe8RE/kkyzR7lK+Jl9RVRnkVy0bn0Jy/+smCdeff
         OqGriwoYDVGn0YHcqM93nVmmfE/09iEtiKXMG5E88NJoEGrdJmDqpfNwend/HplL3N8n
         Hs8xu/mPV+z/vvMaxhVeWUR8TZdn11dJN0Jy2WAmED81O2TwKXi1ExENt0kksdGjt/4o
         wmUA==
X-Gm-Message-State: ANoB5pk37/D7wOaqyNQhapZ27mj3H3TtqAFKdxJIvJsjmE+CV7wJs0hz
	mjtf9I6xmAvRQ1al9C+yryPyJSYeXGHwVwxSYfULAM0VB+U=
X-Google-Smtp-Source: AA0mqf5gTBCcbEi7oDTvgyCpxOrQPZfISigFQjCHe3mTPPjfrZH/kllslDE3ZevGYx/bTc4FuvFBUzWPOi4KK584Tqg=
X-Received: by 2002:a05:6871:4199:b0:142:d126:dc55 with SMTP id
 lc25-20020a056871419900b00142d126dc55mr22645746oab.262.1669760404155; Tue, 29
 Nov 2022 14:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20221129145137.18173-1-kai.kang@windriver.com>
In-Reply-To: <20221129145137.18173-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2022 14:19:38 -0800
Message-ID: <CAMKF1srqJdZGB2OpQ3Phb_x_7rHF=hyryW9MhijKmBUkL_ykag@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-wxgtk4: replace deprecated inspect.getargspec
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 22:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99851

On Tue, Nov 29, 2022 at 6:51 AM Kai Kang <kai.kang@eng.windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patch to replace deprecated inspect.getargspec in lib pubsub.
>
> And add python3-pip to RDEPENDS which is required by utils wxdemo,
> wxdocs and wxget provided by python3-wxgtk4.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...eplace-deprecated-inspect.getargspec.patch | 65 +++++++++++++++++++
>  .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  2 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
>
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
> new file mode 100644
> index 000000000..4501667f9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
> @@ -0,0 +1,65 @@
> +Upstream-Status: Backport [https://github.com/wxWidgets/Phoenix/commit/9986a0d5]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 9986a0d5c24b5d45ddf571d60351f68765a8a9be Mon Sep 17 00:00:00 2001
> +From: Scott Talbert <swt@techie.net>
> +Date: Mon, 8 Aug 2022 22:35:58 -0400
> +Subject: [PATCH] pypubsub: Replace deprecated inspect.getargspec
> +
> +inspect.getargspec was removed in Python 3.11.  This is a backport of:
> +https://github.com/schollii/pypubsub/commit/089c7a73f85c76a3aa22e4b10c71db1bf65a8637
> +---
> + wx/lib/pubsub/core/callables.py | 23 +++++++++++++++--------
> + 1 file changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/wx/lib/pubsub/core/callables.py b/wx/lib/pubsub/core/callables.py
> +index 65eb1ebe..7e798c54 100644
> +--- a/wx/lib/pubsub/core/callables.py
> ++++ b/wx/lib/pubsub/core/callables.py
> +@@ -12,7 +12,7 @@ CallArgsInfo regarding its autoTopicArgName data member.
> +
> + """
> +
> +-from inspect import getargspec, ismethod, isfunction
> ++from inspect import ismethod, isfunction, signature, Parameter
> +
> + from .. import py2and3
> +
> +@@ -133,19 +133,26 @@ class CallArgsInfo:
> +         self.autoTopicArgName = None."""
> +
> +         #args, firstArgIdx, defaultVals, acceptsAllKwargs
> +-        (allParams, varParamName, varOptParamName, defaultVals) = getargspec(func)
> +-        if defaultVals is None:
> +-            defaultVals = []
> +-        else:
> +-            defaultVals = list(defaultVals)
> ++        allParams = []
> ++        defaultVals = []
> ++        varParamName = None
> ++        varOptParamName = None
> ++        for argName, param in signature(func).parameters.items():
> ++            if param.default != Parameter.empty:
> ++                defaultVals.append(param.default)
> ++            if param.kind == Parameter.VAR_POSITIONAL:
> ++                varParamName = argName
> ++            elif param.kind == Parameter.VAR_KEYWORD:
> ++                varOptParamName = argName
> ++            else:
> ++                allParams.append(argName)
> +
> +         self.acceptsAllKwargs      = (varOptParamName is not None)
> +         self.acceptsAllUnnamedArgs = (varParamName    is not None)
> +-
> +         self.allParams = allParams
> +-        del self.allParams[0:firstArgIdx] # does nothing if firstArgIdx == 0
> +
> +         self.numRequired = len(self.allParams) - len(defaultVals)
> ++        assert len(self.allParams) >= len(defaultVals)
> +         assert self.numRequired >= 0
> +
> +         # if listener wants topic, remove that arg from args/defaultVals
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
> index faea43777..df23037fc 100644
> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
> @@ -13,6 +13,7 @@ PYPI_PACKAGE = "wxPython"
>  SRC_URI += "file://add-back-option-build-base.patch \
>              file://wxgtk-fixup-build-scripts.patch \
>              file://not-overwrite-cflags-cxxflags.patch \
> +            file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
>              "

Fails to apply

patching file wx/lib/pubsub/core/callables.py
Hunk #1 FAILED at 12 (different line endings).
Hunk #2 FAILED at 133 (different line endings).
2 out of 2 hunks FAILED -- rejects in file wx/lib/pubsub/core/callables.py
Patch 0001-pypubsub-Replace-deprecated-inspect.getargspec.patch does
not apply (enforce with -f)


>  SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
>
> @@ -29,6 +30,7 @@ RDEPENDS:${PN} = "\
>      python3-image \
>      python3-numpy \
>      python3-pillow \
> +    python3-pip \
>      python3-pprint \
>      python3-pycairo \
>      python3-six \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99845): https://lists.openembedded.org/g/openembedded-devel/message/99845
> Mute This Topic: https://lists.openembedded.org/mt/95335564/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

