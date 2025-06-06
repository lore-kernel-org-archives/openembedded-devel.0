Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9308CC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:29:32 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.34933.1749220165859593951
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2I49LR0;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo1035966a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749220164; x=1749824964; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AIP6otUIBo3umDkUSM0b+nnhglKEkftGuOCabExX794=;
        b=G2I49LR0DfqfzWbr4Wp7pLNiayOJm2LdsROK4nrneXbmPtZUfZl/gYMihjUv/DKsJX
         TAeK4l3P1kFLPR6FDNJq4N2h0uZ+7hJoLI53C/7CQqtBnuHaudGfGrIq6X2PuP0J6evo
         73qNKfF0oBHHEQluNXRub08QJm5gkL5EbcG9DAHuR51hHyp6qWfpx8CLuRH+YpcoQVNf
         WgnXXIrt6GtYj7ySa9k0l6ZpfEXuEzdLz9jPC8atcTFPlAsmSxD3KgCaL7ENEMyu312W
         BW+9IkqUiPTt7u6+a+psm+YyrXLE1vDTblP43IwkmHH5f+xJMOLSsgEC0zjYaowxGZET
         83oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220164; x=1749824964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIP6otUIBo3umDkUSM0b+nnhglKEkftGuOCabExX794=;
        b=SK/brszIS0YwgJ1Cnrh5pubsElQ407Eln4+CzKqq4d7CKPunoBKxQeUvwqE3QPXUZU
         oSdEyAn7ckcF7tOX2JTm9F6q/IWRUl9SwzwtH4fd+7dnL9+N/oZCg3R0OOudILpujqZ0
         iOu475nBCSee5SMGj5y+UUg6H9D9TuognlJfuo1zDKHH0j4vUxy7EJFfIIEvMFTUUCJd
         txz1VNzutDhp/NEJAIapfil3MzbGL7pEpv6ISZK4lxtzZAsxVc/G2Vnd4LB6/ECfoc9f
         sKUAzluBLimm+yga3cClQF2e/mvc817ubzFx8cmKQhImtEBWMpixtRW9mSNQrdOPRacx
         WN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVw1HPwGmF640jVDAC3N2P3RPxVXaN/VKzLcAobqF/tupm3T4sDs6kRlvPQCMkb+t3MrX1qaqNaHoiEDvQ5ZAIL/RQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8RGc9sueRiNgi+JXSvzmZOFAZ6SLcyIn04dNxh2XeMCGKO0LA
	cd9VjAkFpH6K/T0DfrZEQHf9KUj2T0NFf5ns3gUwkPLNAmqLeOc2dWHg
X-Gm-Gg: ASbGncvvQdy428yvVFLoTE+cOPWxnDl5wb4eHUgUsi9aWsj84rPh6NxYCGkpFTzBAPP
	9cf0322OmljvGGGD3pdyc7P9tNdOOaMBMkWCb6j0gKF+KHvs5jWWVCjywuoMsAmhFHDbqj38nqs
	lcuAhAix7BvUCvyQeOnuOIIsqSKajPkPyB7ZkRytZlIjbmjZNDB2mThuz6mTyOHiD0NfBbXtbxU
	xaVShfjO86HfdAklHrP3059VRR0npGiwWOJGJouf9Uvt4i3DsJKf5EMlIeUNIk0mSlnaeYqVecX
	dfi82HKWjEhNWMf5CuNus20zvNljpDeghlAVWEn+j32fIhH7I+Vtea4DYts=
X-Google-Smtp-Source: AGHT+IHHV6gxMGhw41DgsvbmqoC2NCVyGWrie0112/lwH8zrgOKoEpZ2hW9Zw7iDAfm8FQP4JlyDBw==
X-Received: by 2002:a05:6402:2712:b0:607:2d8a:9b3e with SMTP id 4fb4d7f45d1cf-60773ecaa18mr3025733a12.2.1749220164100;
        Fri, 06 Jun 2025 07:29:24 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783de35bsm1065494a12.67.2025.06.06.07.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 07:29:23 -0700 (PDT)
Message-ID: <2578857c-2b6f-45f0-bc7c-55cd80396b22@gmail.com>
Date: Fri, 6 Jun 2025 16:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] monit: upgrade 5.32.0 -> 5.35.2
To: geoffrey.vl@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
References: <20250606135700.1689460-1-geoffrey.vanlandeghem@niko.eu>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250606135700.1689460-1-geoffrey.vanlandeghem@niko.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117763

On 6/6/25 15:57, Geoffrey Van Landeghem via lists.openembedded.org wrote:
> Monit 5.32 seems to contain a bug where it runs its poll cycles much faster. This can be troublesome when setting up dependencies. See https://bitbucket.org/tildeslash/monit/issues/1131/service-with-many-dependencies-hits
>
> Signed-off-by: Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
> ---
>  .../monit/{monit_5.32.0.bb => monit_5.35.2.bb}            | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/monit/{monit_5.32.0.bb => monit_5.35.2.bb} (84%)
>
> diff --git a/meta-oe/recipes-support/monit/monit_5.32.0.bb b/meta-oe/recipes-support/monit/monit_5.35.2.bb
> similarity index 84%
> rename from meta-oe/recipes-support/monit/monit_5.32.0.bb
> rename to meta-oe/recipes-support/monit/monit_5.35.2.bb
> index e4ec9d5262..6ff74cf0d8 100644
> --- a/meta-oe/recipes-support/monit/monit_5.32.0.bb
> +++ b/meta-oe/recipes-support/monit/monit_5.35.2.bb
> @@ -6,8 +6,8 @@ causal actions in error situations."
>  HOMEPAGE = "http://mmonit.com/monit/"
>  
>  LICENSE = "AGPL-3.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ea116a7defaf0e93b3bb73b2a34a3f51 \
> -                    file://libmonit/COPYING;md5=2405f1c59ed1bf3714cebdb40162ce92"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=79ca9f26f1ecb1e377e90383109ede64 \
> +                    file://libmonit/COPYING;md5=44aaa0a664332e9568add09f1ddb01cb"

I got 2 notes:
1. When the checksum of the license changes, it is useful to include in
the commit message some notes why that is. Usually it is some minor
formatting change, but sometimes the license changes outright between
versions.
2. A bigger thing is, that generally this update is too big for a stable
branch. Usually only bugfix release updates are allowed, not feature
ones. Having the bugfix backported to 5.32, and including it as a patch
would be a better approach.

>  
>  SRC_URI = " \
>  	https://mmonit.com/monit/dist/monit-${PV}.tar.gz \
> @@ -15,12 +15,14 @@ SRC_URI = " \
>  	file://monitrc \
>  "
>  
> -SRC_URI[sha256sum] = "1077052d4c4e848ac47d14f9b37754d46419aecbe8c9a07e1f869c914faf3216"
> +SRC_URI[sha256sum] = "4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f"
>  
>  DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
>  
>  inherit autotools-brokensep systemd update-rc.d
>  
> +EXTRA_AUTORECONF += "-I config"
> +
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117762): https://lists.openembedded.org/g/openembedded-devel/message/117762
> Mute This Topic: https://lists.openembedded.org/mt/113503536/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


