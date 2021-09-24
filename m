Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C59C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.492.1632496725303937673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 08:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P+CqmuSB;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id s16so9235698pfk.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=e+XE9yCnWYfEGxuQCnhmTu9OS6SKAjXa2XwPWRCvaJw=;
        b=P+CqmuSB/Kt9bpbnSE2Lu0r8dX/0U9IoaZR2i5agdDL5rGgd8FNMsXWx1RYgR7TiaV
         m84m3mG+oQxg1T8Wlx48Amgoo9HcwyUldSshCNj4EQI1tvWAmJ8hwfsicMsTx2i+ziVG
         d8G1gVuL7rH7+4dKg2kbugUfOC8N4su4pPA0388kuIdPoR66RF3MskgQrlCcLut2YrHF
         PFAbewTC3lSZicRLAjbkQbeqlTC8hRes/P1H55qkLpZU3vyvcKPTC5eVbO+HE3yZK97a
         iTPDjHRmm9zouVpyVFs2qRvDXuxt8Sd/4COmuNlVN8EWyR+Ioji0KAMLzcP9pGjHH2Rz
         Ppxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=e+XE9yCnWYfEGxuQCnhmTu9OS6SKAjXa2XwPWRCvaJw=;
        b=H/slNXhGFf3cmH15boAXJMqvGVm/4Ryyz6H0X9YRxTQTdJxclL68OArabqyUpqe+z+
         7Emh4Of84OcUNJl7aHUsrirqm3jBhFlsCdViMgLSeBpmg8TV0AOqvyhWlvufx4B7hkMD
         QT65N0dS8gnHGsCPGU6Wcy5n7UGh4KRCL2ttlQ1DK9Gzr88Elpvw/drjrdC/ZXJFjkQd
         m+YB4TPjzgdMvPDc/a/X5xtDFtT/NWtjlPDXEO89NoRxAq8/d1JVaAlHzgaGdfIzDq6Z
         QGeebHDu1FgjT1QYoDANWcaX7Qpk6rLCSY2+ozpY7IUC2S6LrGN6YItCMkoruDTkD+nf
         goTQ==
X-Gm-Message-State: AOAM533L++7jRmFFVEJ3X/p87DW40pmzLVSLvLYn2Jdsq9ZUAEguMSTK
	kMTM25UpgtyGdQdA7SCb1kk=
X-Google-Smtp-Source: 
 ABdhPJwZi5xd7e0hwozoSYfDyumLCC+hqAuEQ35JNrOzMMRjjCEf6exIGfd9p2GBxV9a4oTatMa3Ww==
X-Received: by 2002:a62:7997:0:b0:43d:f9e1:939c with SMTP id
 u145-20020a627997000000b0043df9e1939cmr10179014pfc.2.1632496724702;
        Fri, 24 Sep 2021 08:18:44 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:1dda:37cf:b1d6:5d51?
 ([2601:646:9200:a0f0:1dda:37cf:b1d6:5d51])
        by smtp.gmail.com with ESMTPSA id
 u10sm8737471pjf.46.2021.09.24.08.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 08:18:43 -0700 (PDT)
Message-ID: <1057dbcb-11ae-ae41-0b33-d42c6009ae80@gmail.com>
Date: Fri, 24 Sep 2021 08:18:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [oe] [meta-python] [PATCH] python3-rdflib: upgrade 6.0.0 -> 6.0.1
Content-Language: en-US
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1632514953-4648-1-git-send-email-zangrc.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1632514953-4648-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 15:18:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93126
Message-ID: <20210924151842.nPFttWeYwLAsKHn0dWYV1GqvgW1AdWD4latXXDRXxqA@z>



On 9/24/21 1:22 PM, zangrc wrote:
> 2021/09/17 RELEASE 6.0.1
> ========================
> Minor release to fix a few small errors, in particular with JSON-LD parsing & serializing integration from rdflib-jsonld. Also, a few other niceties, such as allowing graph `add()`, `remove()` etc. to be chainable.
> 
> * Add test for adding JSON-LD to guess_format()
> * Add JSON-LD to guess_format()
> * add dateTimeStamp, fundamental & constraining facets, 7-prop data model
> * fix: remove log message on import
> * Make graph and other methods chainable
> * fix: use correct name for json-ld
> * Allowing Container Membership Properties in RDF namespace (#873)
> * Update intro_to_sparql.rst
> * Iterate over dataset return quads
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../{python3-rdflib_6.0.0.bb => python3-rdflib_6.0.1.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-rdflib_6.0.0.bb => python3-rdflib_6.0.1.bb} (65%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.0.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-rdflib_6.0.1.bb
> index 589e6638bf..c08ad81c50 100644
> --- a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-rdflib_6.0.1.bb
> @@ -1,8 +1,8 @@
>   SUMMARY = "RDFLib is a pure Python package for working with RDF"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=89aa9a14f80a6ac70e1d5da763a309ed"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b6cde159c801514e0e45a40cf0a9d3d9"

why did license checksum change ? can you add a line in commit msg 
explaining that ?

>   
> -SRC_URI[sha256sum] = "7ce4d757eb26f4dd43205ec340d8c097f29e5adfe45d6ea20238c731dc679879"
> +SRC_URI[sha256sum] = "f071caff0b68634e4a7bd1d66ea3416ac98f1cc3b915938147ea899c32608728"
>   
>   inherit pypi setuptools3
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93121): https://lists.openembedded.org/g/openembedded-devel/message/93121
> Mute This Topic: https://lists.openembedded.org/mt/85834563/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

