Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F340C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 03:58:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3496.1699329518567073543
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 19:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=tJT7SoeS;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.54, mailfrom: troth@openavr.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso44882195e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 19:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1699329517; x=1699934317; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0Fi6HCnF+8FYcxBVcV5qXAOkjItSBDtW+/UTY3t0QY=;
        b=tJT7SoeSaSA9Fq40WtLILh5AUV0LXQfcWbBiOwY2P+UTk1nzLc4xdyBNQA58ow/rVJ
         W32eVYhV5fQMnotKs+4zJURJK9lSfbCznXUbnREgViQZUi69/HHz4cMb2rPmndLfV99F
         N7eNezJ3jzm8XU+q4uLglMRvW1r/UQKReYg6tLB5tVt8Nji6n+PNy40gGuH0J5n/qMn/
         a57gKfbAToIPlKgo59MlgQbIbP7iHIb/L07NUntz+VJaNsbwWvOlXF5RPOHlMXAUC3t3
         tweUtdup+eZCdLINOAg0x5Bqy+75+6aySSP9/JXuwWFAIoXmIBp3ywkhKermJUGCW9cL
         Y9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699329517; x=1699934317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0Fi6HCnF+8FYcxBVcV5qXAOkjItSBDtW+/UTY3t0QY=;
        b=GQzc/aRqSHbIOCyy1aBwbREWsBQRbLLw0rH5yHu9hQE9z9BeHLkj62K74dc1BrqjUB
         iNItO3EFlcJgqUKqLC0kEpjFZh9txMLBfxgJvQ5s02k4tTOApal4DTrrbmTA5a2TzVND
         2koTQJypEOOZNZ3O2SxmRXcMpRklzxZZugZBSBz4z9WoLKq+LuVAqCa9QK/0U8TQZ4Fy
         UGxm4crf5Ju2SbeuYsVUSGPCZyhCm6bXUq+w4rcucc/v2gVz2sSoiPOhZz4Y2tP2sutQ
         LSBQplflw7NaB1bhk1hU7SMKho2nvJtLwsKJyz2O1RgLfOE6003kyJvya4KuLPBjZ90D
         BZJw==
X-Gm-Message-State: AOJu0Yz2i1fr9CxSH9iRtbQ7N+KeZLIjBFoNDWmWgsEnDZz98qdiXU94
	Y1hUD1WyaXbWxrSUhMYJIk8pv1XSgP9T3VbIZv+TyQ==
X-Google-Smtp-Source: AGHT+IEJZF+WMaDRYmljH2vlnwDf8HTydyZbv715jwR7LaEOtnxPAp+J/4VpkZOMDm2RQGQy1ReM9vWh7fvYlwPJPt0=
X-Received: by 2002:a5d:5b08:0:b0:32d:bb4a:525c with SMTP id
 bx8-20020a5d5b08000000b0032dbb4a525cmr37002893wrb.14.1699329516660; Mon, 06
 Nov 2023 19:58:36 -0800 (PST)
MIME-Version: 1.0
References: <0101018b96bed4bc-d43306c3-deb1-4fad-8737-e15d03ce0f3c-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b96bed4bc-d43306c3-deb1-4fad-8737-e15d03ce0f3c-000000@us-west-2.amazonses.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Mon, 6 Nov 2023 20:58:25 -0700
Message-ID: <CAFMvBt09Z7EUh1kRUggWdQ9_HJfMzZdP1qynNrN+Mg3ESseNRA@mail.gmail.com>
Subject: Re: [oe] [AUH] modemmanager: upgrading to 1.23.1 SUCCEEDED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Forced@yoctoproject.org, maintainer@yoctoproject.org, for@yoctoproject.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 03:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106418

On Fri, Nov 3, 2023 at 1:53=E2=80=AFPM Auto Upgrade Helper <auh@yoctoprojec=
t.org> wrote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *modemmanager* to *1.23.=
1* has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-modemmanager-upgrade-1.22.0-1.23.1.pat=
ch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From ad32b52fe87e6edc3885802cbb85b8524e4c156a Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Fri, 3 Nov 2023 16:08:56 +0000
> Subject: [PATCH] modemmanager: upgrade 1.22.0 -> 1.23.1

Why is modemmanager getting updated to 1.23.1? That is not an official
release, but is a
development release as far as I can tell. The tag in git is '1.23.1-dev'.

The latest release is 1.22.0 (announced on Oct 11 on the ModemManager
mailing list).

Ted Roth

