Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B395DC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 18:40:09 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.334.1651776002066259815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 11:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eth10kU8;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id p4so3826864qtq.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 11:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z6OkDQkzu8sN35oA7qgemidoQxd582KSXlcw3pvRCPA=;
        b=Eth10kU8rJWxejQuuy6zCAOExWZzoguDC3FEz+bRvMuYLquJRAE8B1WaAfUcttmLlN
         wrteHNrx/u9rUfNiQ077rQegkdy2SYmBcXmNKwkzq5TjxBZLL/j+4qsaIuCYwrNPC7Ty
         i5i0RxH8aKkvSNAzY4z8gfT92TX/750u673miBSRguGtZcn6OCCC48WCQMc7C5NCbCyK
         X9692gR7Gw0ip+odboyreJlxwHBI4ttXVisVq53R2P3n55+kvmXjFGN27TltkDuWnUeh
         zLXcZ8yp4XzmZ8ZiS5NLIRRvtPuUZX71H+1XhGuqWoNW7I+RssEBu1pkqoWakisEu7ay
         NVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z6OkDQkzu8sN35oA7qgemidoQxd582KSXlcw3pvRCPA=;
        b=5I+85AN5O2pr9kv3rqKszAiKfESIF5wNWQEhlwYcZENH9+1l8vq5WF0q818mrYLbzi
         gXzAVrK9IXcbXHtsBoeTPxPDpvtBdS24r896gFHAdBG3bCsAKMFSnEfiLHjQDV5/ZqRV
         NTDX/qixDEtEMLBD6r1koW+m60WfAuxLXzDMYPqkhenyv9HHHUU9XXKks1Vz45CyNZFj
         T6cMo2NeBHqyYVTPLal6KPDJ0RNxaoz4VLkXFzVEBLhswDf7+sIemp5n3LEnMDZIe2yX
         Y0kXOVAWRqQuV148OX//YbfAQYxHwJvXsrEGDnNWsoZEOTPor+4ggYahiIRpPIcSolvN
         bpqw==
X-Gm-Message-State: AOAM5330J7thz8jI36IkZiqFmW3VynkD73hAcWHqhuD4Er2t2BTL9kGu
	iesUGdwHu4u0sEPa8+Tx1ujKmPKPkBjnZKQJrnI=
X-Google-Smtp-Source: 
 ABdhPJw05uaX1wdkxaRCFG/+OFCOw3h9YrVsvSGeHAaCMyA2HMa1S6bpvdHpTcH3KBSRy1keL+4dsRRjQe1/Sgq83S8=
X-Received: by 2002:ac8:7f86:0:b0:2f3:953f:6036 with SMTP id
 z6-20020ac87f86000000b002f3953f6036mr25145790qtj.330.1651776000991; Thu, 05
 May 2022 11:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220505093308.824156-1-mingli.yu@windriver.com>
In-Reply-To: <20220505093308.824156-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2022 11:39:34 -0700
Message-ID: 
 <CAMKF1sqczzPwThyAhNuDRQSyUMFNyCTbfHmT=yESKi67X-vVyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] s-nail: Set VAL_MTA
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 18:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96964

Can we pass VAL_MTA from recipe via EXTRA_OEMAKE or something ?

On Thu, May 5, 2022 at 2:33 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Some build server may provide sendmail like /usr/lib/sendmail which
> may result the VAL_MTA to be /usr/lib/sendmail during do_configure,
> but the sendmail is actually /usr/sbin/sendmail on the target.
>
> Fixes:
>   # echo "invalide address email" | s-nail -s "test mail" -r test@test.com tester@test.com
>   s-nail: Cannot start /usr/lib/sendmail: executable not found (adjust *mta* variable)
>   /home/root/dead.letter 10/234
>   s-nail: ... message not sent
>
>   # which sendmail
>   /usr/sbin/sendmail
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../files/0001-make.rc-set-VAL_MTA.patch      | 48 +++++++++++++++++++
>  .../recipes-extended/s-nail/s-nail_14.9.24.bb |  3 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
>
> diff --git a/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
> new file mode 100644
> index 000000000..f4decda14
> --- /dev/null
> +++ b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
> @@ -0,0 +1,48 @@
> +From da8c7a027390de7828d4272a3c8bcdbffbac25ad Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 5 May 2022 16:57:48 +0800
> +Subject: [PATCH] make.rc: set VAL_MTA
> +
> +Some build server may provide sendmail like /usr/lib/sendmail which
> +may result the VAL_MTA to be /usr/lib/sendmail, but the sendmail
> +is actually /usr/sbin/sendmail on the target.
> +
> +Fixes:
> +  # echo "invalide address email" | s-nail -s "test mail" -r test@test.com tester@test.com
> +  s-nail: Cannot start /usr/lib/sendmail: executable not found (adjust *mta* variable)
> +  /home/root/dead.letter 10/234
> +  s-nail: ... message not sent
> +
> +  # which sendmail
> +  /usr/sbin/sendmail
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + make.rc | 9 +--------
> + 1 file changed, 1 insertion(+), 8 deletions(-)
> +
> +diff --git a/make.rc b/make.rc
> +index 98bd968..45ac0d4 100644
> +--- a/make.rc
> ++++ b/make.rc
> +@@ -96,14 +96,7 @@ VAL_MAIL=`\
> +
> + # Path to the local MTA (Mail-Transfer-Agent).
> + # MTA aliases (aliases(5)) are optionally supported via OPT_MTA_ALIASES.
> +-VAL_MTA=`\
> +-   if [ -x /usr/bin/sendmail ]; then \
> +-      echo /usr/bin/sendmail;\
> +-   elif [ -x /usr/lib/sendmail ]; then \
> +-      echo /usr/lib/sendmail;\
> +-   else \
> +-      echo /usr/sbin/sendmail;\
> +-   fi`
> ++VAL_MTA=/usr/sbin/sendmail
> +
> + # Today a lot of systems no longer use sendmail(1), but a different MTA.
> + # To ensure compatibility with sendmail(1), a system called
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
> index bc514b577..539f9c3c8 100644
> --- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
> +++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
> @@ -6,7 +6,8 @@ LICENSE = "ISC & BSD-3-Clause & BSD-4-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"
>
>  SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
> -           file://make-errors.patch"
> +           file://make-errors.patch \
> +           file://0001-make.rc-set-VAL_MTA.patch"
>  SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
>
>  DEPENDS = "coreutils-native"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96959): https://lists.openembedded.org/g/openembedded-devel/message/96959
> Mute This Topic: https://lists.openembedded.org/mt/90907417/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

