Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4279FC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 06:32:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.115941.1699511523348346828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 22:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMRUPYjI;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5440f25dcc7so708714a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 22:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699511521; x=1700116321; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ua+cKvyoGf8Uphy9tQu93MrQopqrfF8PMqomJuGjHFM=;
        b=CMRUPYjIAM5fDeKPtE7sgRDn8eaRRYvZq6OLLKuBhiJLQVg8oQlh0c5SxXPXLh4dqA
         fTVnuusymh6ULYudJx/f3uxGXhZ0mTOAnq0zhYlIIYWitCdYknXOr35Wi2GJfXXQRowj
         j2Ykyx0npZU6sBWQbquEmaIQgH2vCA9WZyrCZRZBJWcbacUMIX+Ofc0qKGfjkz8kR9+v
         QE5UogHWTxF69599WQS+Iwf+nilgl/wPUa6/K6XMrn4O9t2pAftwADnq3KkPmg7v2JgK
         fSpAnbhVHS/4+IPfVp1KKnPGAVZL1yjITKmEKJYrW93tnG3+Q2EJktNzBdOmsfj3XaIl
         j3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699511521; x=1700116321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ua+cKvyoGf8Uphy9tQu93MrQopqrfF8PMqomJuGjHFM=;
        b=Hb2z2QssoOyJfw0/WDnBUiRnJyv/BrLcJpTHiq2ZkPLRF2vHOD9YQEwrYFbo2vBoLZ
         v17hDhmdPUbQifMHyFLqn6pVAoxzymBN0FqfqupIM5NYeXkeCUYFWiKsEI7TlxddekoL
         3RVN5bJUas5Ct0fvz9hui7gWvpHB8aw6zZcAwKX3KLXNyjrnSCg3uRW5pcB0tsvRBPbd
         sYAJaC7VNyAuVaaQUeY8Ap8477N2iEhgUxxmwkVpFDsOgC89trGvX4xIYvuRrgiSi9wt
         PmHf9OcF4m8elyLqira8yaLzILzFhQ3uvr6y58NYVK/Yio/R40PcnGuVrrs81Lg8uirC
         KjkA==
X-Gm-Message-State: AOJu0Yw4Se0zFlEZpOtwYkqCv4IR/6ovJFCkJUmgGLeBXjEH30NyzRkr
	r4mLrQVETXfjo6u7TwOAzw+XCtcH0HU=
X-Google-Smtp-Source: AGHT+IGC40X4WNDE0qqQmzILuy5s9yRidbh74tT73/ZtaNQ2PjdfO5QhnNHTQZ86XnugeyRL9u1YvA==
X-Received: by 2002:a50:8e1b:0:b0:544:a213:a6fc with SMTP id 27-20020a508e1b000000b00544a213a6fcmr3652665edw.2.1699511520530;
        Wed, 08 Nov 2023 22:32:00 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id eo12-20020a056402530c00b00530a9488623sm7642585edb.46.2023.11.08.22.32.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 22:32:00 -0800 (PST)
Message-ID: <3cf2e8c7-f517-4284-a136-9584d53298bc@gmail.com>
Date: Thu, 9 Nov 2023 07:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [AUH] geos: upgrading to 3.12.0beta2 SUCCEEDED
To: openembedded-devel@lists.openembedded.org
References: <0101018b96bec5d9-30e827d0-67b7-4918-bdd1-1e4d2879dd24-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <0101018b96bec5d9-30e827d0-67b7-4918-bdd1-1e4d2879dd24-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 06:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106509

Something went wrong here.
Final 3.12.0 was "upgraded" to 3.12.0beta2.

2023. 11. 03. 20:52 keltezéssel, Auto Upgrade Helper írta:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *geos* to *3.12.0beta2* has Succeeded.
>
> Next steps:
>      - apply the patch: git am 0001-geos-upgrade-3.12.0-3.12.0beta2.patch
>      - check the changes to upstream patches and summarize them in the commit message,
>      - compile an image that contains the package
>      - perform some basic sanity tests
>      - amend the patch and sign it off: git commit -s --reset-author --amend
>      - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> >From 44935dbd8ea98c3846fad098e6f6632a20713ac0 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Fri, 3 Nov 2023 12:37:48 +0000
> Subject: [PATCH] geos: upgrade 3.12.0 -> 3.12.0beta2
>
> ---
>   .../geos/{geos_3.12.0.bb => geos_3.12.0beta2.bb}                | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-navigation/geos/{geos_3.12.0.bb => geos_3.12.0beta2.bb} (88%)
>
> diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
> similarity index 88%
> rename from meta-oe/recipes-navigation/geos/geos_3.12.0.bb
> rename to meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
> index 95cb29775..e4e1b9db2 100644
> --- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
> +++ b/meta-oe/recipes-navigation/geos/geos_3.12.0beta2.bb
> @@ -6,7 +6,7 @@ LICENSE = "LGPL-2.1-or-later"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   
>   SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
> -SRC_URI[sha256sum] = "d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39"
> +SRC_URI[sha256sum] = "249c63c6f07ec827377e94a90b99a97d39e655aff180cfa71b50381d8e209382"
>   
>   inherit cmake pkgconfig binconfig
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105921): https://lists.openembedded.org/g/openembedded-devel/message/105921
> Mute This Topic: https://lists.openembedded.org/mt/102372013/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


