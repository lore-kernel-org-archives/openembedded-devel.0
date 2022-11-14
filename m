Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D65C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:30:20 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.5474.1668432614240432757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XMQdGKDa;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id h21so6719605qtu.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 05:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynvpsBojFwTFXiq81gOcpmiqjayKN+QJBPTdOE9TLoU=;
        b=XMQdGKDa+VZ+lOjCtcOCh40Wa0mnvznhi+ZNT4FhKX+UAtHto0OYkLIW3u/5HgaJHj
         SLPkmYvNCeVocVTqYEYpKtiEIrsxYhpAVdvda/TvoHTsDzQ3V6D8vWMeAzVztN+q0JmI
         I/FoBIzXP40SExtrvo6zcPXGbx1ee+2GufXtrUnPDQN8W6BfTyKrhvh175XxklgtcULX
         ioEQ93fFEFIffZiNszwlv6zzdoyZ79cbAvtWLmOxSgrpyf2/KAELsxDM5DNYFENsdeWS
         zeY5A/8by3q7yzNuXeZRm1gBma9asEmjHQx4vQEdcwC7DHiJ3tpQm+JJY9QuZUE+YQP3
         AVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynvpsBojFwTFXiq81gOcpmiqjayKN+QJBPTdOE9TLoU=;
        b=zI1VOK8GoHCaYpvCHDJHRcRby/EIJZGMtb8ecgpIsr3mOpvf+zm70GVzzztkQ6jKq0
         +Vdg0tRbV/RzPwLdJKEoiT7j79mIRHlUU/JgHPfodPcFcI8Z+ZIlEoPRRASFxM0ER/CO
         6rigviQTKY6SwAAVv0gtzymRJg94vNYyuNnQydYFJsVZgEkhv0Z6EK7PKMzBroydFz1g
         FTIBuVOFPCz4XZS/S7sacky4pAxnyZz8Og7LmFIJX4xU8BQ40X1mmalHEv1Dvipe5NO6
         Zj4IMU369/M7X9ui1x1Dv6MZYpKHn7fFCNvEPvz87t+IEke2OqWfoOxwGvijFJ5LTO1Y
         A9EQ==
X-Gm-Message-State: ANoB5plJAGHCXF1U9j+eeMLXWpaD6nHbRHJSs6vXXM2J0LnT5858SD/Y
	jCn7h5hmf5x2QWYV5VtEfl4=
X-Google-Smtp-Source: AA0mqf77oemSX+/+zdvUnZrETgKpiu3SgUg0OdQrPgRDGe+qsIUVcYerRuo3o8TGX5i3dVpMctR+IQ==
X-Received: by 2002:a05:622a:5818:b0:397:dd21:a231 with SMTP id fg24-20020a05622a581800b00397dd21a231mr12148665qtb.134.1668432613121;
        Mon, 14 Nov 2022 05:30:13 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:631:ae64:7d09:b9c7? ([2600:1700:9190:ba10:631:ae64:7d09:b9c7])
        by smtp.gmail.com with ESMTPSA id v7-20020a05620a0f0700b006bba46e5eeasm6585676qkl.37.2022.11.14.05.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 05:30:12 -0800 (PST)
Message-ID: <99e47dc5-aa2c-f983-6f80-838deb305a83@gmail.com>
Date: Mon, 14 Nov 2022 08:30:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] #error [kirkstone] mariadb-native is unbuildable for 2
 reasons
Content-Language: en-US
To: wojciech@rbmail.pl, openembedded-devel@lists.openembedded.org
References: <l50T.1668421414074374713.i1ex@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <l50T.1668421414074374713.i1ex@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 13:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99585



On 11/14/22 5:23 AM, wojciech@rbmail.pl wrote:
>
> Hi,
>
> I found 2 bugs in 'mariadb-native' package in 'kirkstone' branch.
>
> 1. Missing 'gnutls-native' in DEPENDS
> 2. Unable to successfuly perform 'do_compile' task:
>

Have you seen this on Master?
>
>
> The migration notes for 'kirkstone' states: 
> https://docs.yoctoproject.org/4.0.5/migration-guides/migration-4.0.html#fetching-changes
> "/Network access from tasks is now disabled by default on kernels 
> which support this feature (on most recent distros such as CentOS 8 
> and Debian 11 onwards). This means that tasks accessing the network 
> need to be marked as such with the |network| flag./"
>
> But during compilation there is a place in some CMakeLists.txt being 
> downloaded libfmt-8.0.1 from the internet, so the possibility to 
> download it must be unlocked in the recipe:
>
> do_compile[network] = "1".
>
> Finally my bbappend (mariadb-native_10.7.%.bbappend) looked like this:
>
> DEPENDS:append = " gnutls-native"
> do_compile[network] = "1"
>

Can you send a patch?

-armin
>
>
> Regards,
> Wojciech
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99584): https://lists.openembedded.org/g/openembedded-devel/message/99584
> Mute This Topic: https://lists.openembedded.org/mt/95016077/3616698
> Mute #error:https://lists.openembedded.org/g/openembedded-devel/mutehashtag/error
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


