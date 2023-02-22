Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DB8C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 17:17:46 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.96.1677086259954888928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 09:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TN7lr6lp;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17213c961dfso10052076fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 09:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IhtzkH7sohBUafUBnip6U2k49AdToZumeLPNAOtgIfI=;
        b=TN7lr6lp3EWgRpAKRymYFHUc0FJYxfqvW5u3Cl8BAbjRO9K7mbwqjMO0fiUy3a8m3z
         Lj9WTmr2HGkizVeQprUhrGPwUdyD07a4H2Rikscr6PKibHHXG9oenhLPrzdMpsiueiCl
         +A+Aiz9UA2J4942e0jX2X1FBJlnAqLmSSyni3OZfrbSzxOI8T6NU3VsLWRDZrIKudjjo
         0IYi7mFe28V9/V+qxucWGwvd5kZRoYrDzYjlbfiwkYNgByZcPsWwHpA21OWgUlJTvFUW
         yUguTTJAWhEmMFs4jKncU/YhwkwhnIHVA6ooxohkMCfqU6X56FrpfpOmGetZ8IZ6SnMk
         OeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhtzkH7sohBUafUBnip6U2k49AdToZumeLPNAOtgIfI=;
        b=O9HD2uc2BT7axU2pbsUtoI/Ws64p7okiuua3xRDQ5wM7qFhg/TFNc/DVqTQKCEADUX
         IMUacCZaaKng3A2bE+1LRB2oAUt58j8F/QxRCdeWfn0IKi3t7AbL/nTXUpjEOE0bD6XO
         vxe8W/Iffgt02C+lgKOaYdahFGMrRXlnO/+M5ujg0f203XPATz0vnU7RZU8eHmxNzBNF
         S/ICVuOd3WtgEZtQJlzgAPyCeJmFyNhrL4ysTm7NoLhcjfFekZgdNxW2qj6/oGU8m1z6
         EokwnaGeaoXUtc7BW7I5aIBi83yKnQowjmqqPfILfije+wkbWFdVWaBCdWlUYRRbww1h
         yLOQ==
X-Gm-Message-State: AO0yUKXqJ/XVC5fMsyExJMew0j1hFyhlHqndv+hiDv0AVrlYGqxKIXdm
	asqcQXixrcU9UNl/GIFU6izyK9oFruZMezePnWI=
X-Google-Smtp-Source: AK7set8jK5gBX/1jcuBEUC98iXpHV+wZl45KgPI4va9NOJj5UvPE0eXmVdElNcj1c9AqxgNhuFbtkuTC+yxWbaxaX60=
X-Received: by 2002:a05:6870:d188:b0:163:b85e:f1ca with SMTP id
 a8-20020a056870d18800b00163b85ef1camr1284151oac.262.1677086258913; Wed, 22
 Feb 2023 09:17:38 -0800 (PST)
MIME-Version: 1.0
References: <454042d0-ead3-9a8c-6312-9e4a4ab3f73c@gmail.com>
In-Reply-To: <454042d0-ead3-9a8c-6312-9e4a4ab3f73c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 09:17:13 -0800
Message-ID: <CAMKF1soB5knfr2U_PceTSQTLZFPxzi2w1tPrY9Pnij415-1ynw@mail.gmail.com>
Subject: Re: dunfell merge request: Feb 22
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 17:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101219

merged thanks Armin

On Wed, Feb 22, 2023 at 8:30 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit e707e9b7cf5c62bff4fee029965a87b22dd4ccba:
>
>    postfix: upgrade 3.4.23 -> 3.4.27 (2023-01-19 07:49:31 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 87571345059f82fb7599e3aa82e6fdcfbd361098:
>
>    zeromq: 4.3.2 -> 4.3.4 (2023-02-22 11:24:23 -0500)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (2):
>        net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
>        krb5: CVE-2022-42898 integer overflow vulnerabilities in PAC parsing
>
> Mathieu Dubois-Briand (3):
>        nss: Add missing CVE product
>        nss: Whitelist CVEs related to libnssdbm
>        nss: Fix CVE-2020-25648
>
> Roger Knecht (1):
>        zeromq: 4.3.2 -> 4.3.4
>
> Shubham Kulkarni (1):
>        python3-pillow: Security fix for CVE-2022-45198
>
> Wang Mingyu (1):
>        apache2: upgrade 2.4.54 -> 2.4.55
>
>   .../net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch       | 116
> ++++++++++++++++++++
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb      | 1 +
>   meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch     | 110
> +++++++++++++++++++
>   meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb                | 1 +
>   ...1-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch | 8 +-
>   .../zeromq/{zeromq_4.3.2.bb => zeromq_4.3.4.bb} |   4 +-
>   meta-oe/recipes-support/nss/nss/CVE-2020-25648.patch            | 163
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 7 ++
>   .../python/python3-pillow/0001-CVE-2022-45198.patch             | 26 +++++
>   meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb     | 1 +
>   .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} |   2 +-
>   11 files changed, 432 insertions(+), 7 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2022-42898.patch
>   rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb =>
> zeromq_4.3.4.bb} (87%)
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-25648.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/0001-CVE-2022-45198.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb =>
> apache2_2.4.55.bb} (99%)
>

