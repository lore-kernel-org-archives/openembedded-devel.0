Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20567C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 17:22:01 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.1938.1644254519728547629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L5KEHsi6;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id r14so12496735qtt.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=qbZWy5PZPdkMnAKDSozY5h1gWSZtBCVtQ4GAolw3Fu8=;
        b=L5KEHsi6rg1B4fHLTo5o5Ahp1MnyWcZqMoiXRo0UK1e1fNHL6dE2krjuM8rET9NYm6
         NGMItWZ+RYOR9aAIcHnzOxM6rL0TFmFbSZpTzKh6Ag0G1Hd25XubP5Qam7nMmyrv0DWz
         mLsliQM9uXs/kPBQaISXXxWyMEz3UfkWv5J6TSfL8f/x0HbytB2Ja7tqZptv59KX7YKZ
         CHdsVFRyM2fDp+3Di65t9sBZuSutQnKPOT8DOLNpPAOWaEYyWPH32RyhALjCB4c5TVBn
         MlDQkTqblvSzKUGt1GQLSkfOVF2rqn5lUhegJDEGGHyi7Y49b4UEOOWYvWWlE+j3o0Y8
         ImRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qbZWy5PZPdkMnAKDSozY5h1gWSZtBCVtQ4GAolw3Fu8=;
        b=X54xULfuW7UFqZ+BThIPDVC5a4PQxkVNmkYYlD0epac+i2aiiWfLbR1gB29zKvNHCf
         kZtk9ISZV3auItCnY0xePOdpuEUR8+iW9/kFZVTsfdkUgJYiJUE0BBHkC54EOnVwY/BR
         F4xLyvOTQ9l47z/6KhuD501uPe4D7FPUxtlgAjuHk2mA2jS8ahkVoA5eHBzx+QIX0ju0
         K7T5ggOElYF6c2u/J26nF44TeNdK/teHke9cMby+oJTvJook1mLSvwZ3QzqtbNfYGS3e
         mCuOAJwg+XJLKalP836st0VwZI7SkPm7puHjKcqdgkDdQ/J2Qu6SFSr6PeK2rZ1+i4di
         H09w==
X-Gm-Message-State: AOAM532rg6jHHG7z9af4wPlQXwkKKfWWEZpnj4CBSBBcrwBlqgb1YtNL
	3x3Vkcg28PRKE4hOQ2IMGlmDIx4pr5pUDqvp8iZe85lykzU=
X-Google-Smtp-Source: 
 ABdhPJwT4jSbcHV4Nz88ZcbQ2f2MhL+kVtzvgAzpZuABWsGr8Q/JqMNNl80aNVx7dIjpuNE2zaWkCvihJxx0bcar6uY=
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr363425qty.229.1644254518579;
 Mon, 07 Feb 2022 09:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20220207171708.1641455-1-raj.khem@gmail.com>
In-Reply-To: <20220207171708.1641455-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2022 09:21:32 -0800
Message-ID: 
 <CAMKF1sp5egVq_o=UQnqL1oXG7bMuxmW0C=qHjrpz-V0_Uo1igQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] gpsd-machine-conf: Point to BSD-3-Clause
 template
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 17:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95244

ignore this, since there already is a patch on ml before this one, I
will use that one.

On Mon, Feb 7, 2022 at 9:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> BSD template has been removed from oe-core.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> index 8d74eb4a2c..9c1db3a6b0 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Machine specific gpsd config"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
>
>  # empty by default
>  # BSP layers can add stuff like meta-openmoko example:
> --
> 2.35.1
>

