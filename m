Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54AEC32792
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 03:53:52 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.14399.1661140424857337328
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 20:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iHhTk7sC;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 83so3451369pfw.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 20:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nVPtHKDpVzLepGoBtYg5wAbshtExkqqsmC9ijacQK8Q=;
        b=iHhTk7sCYIl7ZoicCgex5UuFOPW4zvfjf3zsETC5EidwPHorOe2yhHTgsUQWtEHgD4
         2srM5fdxw74edFRk1R5TRwtUPwkQJqNpaYgUV9GJUoDf2ok/YAH0/JS8nGsIwK997+zp
         5I0IH0enqHJiZJAIQeW2yKHHY0SGLT85RdpBbvFQZjOw/1KXgZmtnEN/95kXvp5EzvaN
         bzuPofIwZhL5h4j+9Os91RhpdiN5fIs2lrOUwcWCnWEirqBzXskqFDqqlZ93LJgHj1wK
         6Sd517U6akNJCM3EyXXkt/dXCn1Z00hADPyBl+YaS6M96xbx7vpGDjvlL/ImxN2fyOQ8
         On5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nVPtHKDpVzLepGoBtYg5wAbshtExkqqsmC9ijacQK8Q=;
        b=Ot5XtpIGkPfGMplciAFIL9G36b7cuRQg8ZOO/YnkGLTrFbrlscQv19D8d1jR8JnFu7
         FHte+WZNa5IKnQF1vx842calwGNTwsuf/ng5CzNTlCRVMSq3HGRFhtDcNTNoUbSWA3yD
         72uEEgCPvZSC21KkbjdcKNjtTQX7aqywVY3PQFaRyGtpJ/GPVkd2jZ6mK1RCoOVxL0s4
         IL+0zuc5YPsCiWXULCJWhhhdyVajYG7JPMGdZxQ/a8VNavFYwoG1AVPK/ndFXXZNCTa1
         ysMEqQdmRSd6s6ogXij9bK6Hx8MXm9a9iD6cQpqlQ3WZvF/RECYHN2TdRMlpVkgu+KT9
         eJwg==
X-Gm-Message-State: ACgBeo2zApPfcZgOH1yLMiYfeBc0YJI2sELNnEydEw4B/bDnEmaEFWlH
	D38kaEDXXGUFIoTzwBq+9d4=
X-Google-Smtp-Source: 
 AA6agR7TObxb5VhiYq0tuAn4Ey40dOb6E2C/SDu8eQgykist0WcUmSUtkv7/FFPJkG24bMhQAZtYIQ==
X-Received: by 2002:a63:e342:0:b0:42a:411:fa34 with SMTP id
 o2-20020a63e342000000b0042a0411fa34mr14648193pgj.89.1661140424132;
        Sun, 21 Aug 2022 20:53:44 -0700 (PDT)
Received: from [10.10.4.41] (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 nb16-20020a17090b35d000b001f516895294sm6977952pjb.40.2022.08.21.20.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Aug 2022 20:53:43 -0700 (PDT)
Message-ID: <c60f9137-1f91-2393-61e0-8d6834ad5663@gmail.com>
Date: Mon, 22 Aug 2022 11:51:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][PATCH v3 1/1] mdio-tools: add recipes
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20220608163628.5745-1-potin.lai.pt@gmail.com>
 <CAMKF1sqpcSuHwd5tPz6R=WQ=Yo=yZneTCYSk9LQhq98kBgQPDg@mail.gmail.com>
From: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: 
 <CAMKF1sqpcSuHwd5tPz6R=WQ=Yo=yZneTCYSk9LQhq98kBgQPDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 03:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98348


On 6/30/22 18:59, Khem Raj wrote:
> This fails to build on master with latest linux-yocto for kernel.
>
> https://errors.yoctoproject.org/Errors/Details/659130/
Hi Maintainer,

The kernel config for enable MDIO feature has merged into yocto-kernel-cache.
LINK: https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-5.15&id=0d58e2d6a7824df62129af91bbe9fadfdb5f9dce

This patch should compiled for qemuarm by now, and I have tested with local build.
Just wondering that how to trigger patch merging process for this patch again? should I resend this patch with new version?

Thanks,
Potin
> On Wed, Jun 8, 2022 at 12:39 PM Potin Lai <potin.lai.pt@gmail.com> wrote:
>> From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
>>
>> Self-description from the README: mdio-tools is a low-level debug tool
>> for communicating with devices attached to an MDIO bus.
>>
>> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> ---
>>
>> LINK: [v2] https://lore.kernel.org/all/20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
>> LINK: [v1] https://lore.kernel.org/all/20220107150722.2221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
>>
>> change v2 --> v3:
>> * update version to 1.1.1
>>
>> change v1 --> v2:
>> * moved in recipes-support
>> * removed version in mdio-tools_1.0.1.inc filename
>>
>> ---
>>  .../recipes-support/mdio-tools/mdio-netlink_git.bb  | 13 +++++++++++++
>>  .../recipes-support/mdio-tools/mdio-tools.inc       |  9 +++++++++
>>  .../recipes-support/mdio-tools/mdio-tools_git.bb    |  9 +++++++++
>>  3 files changed, 31 insertions(+)
>>  create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
>>  create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools.inc
>>  create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
>>
>> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
>> new file mode 100644
>> index 000000000..b50d33f90
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
>> @@ -0,0 +1,13 @@
>> +require mdio-tools.inc
>> +
>> +DEPENDS += "virtual/kernel libmnl"
>> +# This module requires Linux 5.6 higher
>> +
>> +S = "${WORKDIR}/git/kernel"
>> +
>> +inherit module
>> +
>> +EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
>> +MODULES_INSTALL_TARGET = "install"
>> +
>> +RPROVIDES:${PN} += "kernel-module-mdio-netlink"
>> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
>> new file mode 100644
>> index 000000000..a37500d93
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
>> @@ -0,0 +1,9 @@
>> +DESCRIPTION = "A low-level debug tool for communicating with devices attached to an MDIO bus"
>> +SECTION = "networking"
>> +HOMEPAGE = "https://github.com/wkz/mdio-tools"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
>> +SRCREV = "07cbff2d5e2de05037e5e7edd5044d678394c8d1"
>> +PV = "1.1.1"
>> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
>> new file mode 100644
>> index 000000000..cd4df3da0
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
>> @@ -0,0 +1,9 @@
>> +require mdio-tools.inc
>> +
>> +DEPENDS += "libmnl"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig autotools
>> +
>> +RDEPENDS:${PN} = "kernel-module-mdio-netlink"
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97444): https://lists.openembedded.org/g/openembedded-devel/message/97444
>> Mute This Topic: https://lists.openembedded.org/mt/91627189/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

