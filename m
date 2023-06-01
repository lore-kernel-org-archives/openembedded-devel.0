Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EBBC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 20:38:49 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.3456.1685651922017342091
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 13:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QL8Ohiab;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565c9109167so12852507b3.2
        for <Openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685651921; x=1688243921;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ksoTfa+ZKa89DdnYOs3Eu65uvOg4WJryi4XHF07kek=;
        b=QL8OhiabWJ/mK55pafqnr3Be026m0Nz0z427sdmrDa9lqdPndXSdWk71yeo+DuFmJz
         MSGKYiVe699feNBXZcpuJ/4RonPDaoKIQ9PCKxSK6WK0huMf0rQoMe9tyvJfjIH735fY
         O73GHDihyqQQnExyTJ66G3wZpNWPJS6d6HXQr4Gt/uvpEloOF2ZYuLZ3Dl9fuCWvwNoT
         aT+6O1j8u++vRlZIBjE8Dyds6s4bEXR49fVzGf0QCa5XEJ/s3Ghq5U1gvuWmWlU4rYS9
         b/xVHmz5iuLg+JR7SfM4Fdgl0/ubLOefP83oA1/gDoYayQYVHtfa8TTH/uoyKSRG7fiM
         TLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685651921; x=1688243921;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ksoTfa+ZKa89DdnYOs3Eu65uvOg4WJryi4XHF07kek=;
        b=MWpSkvcEyHEHyAyaCt8kGGju0l7GaEVgpv6K4pjjw5SZzskGH24mEgLCwHGziCPskD
         YwDzfqphlR9RjUGAEoCd99dzE1Bsc+EK64Avjmzd7hRJOAUUxQNMx/CeM5fjJN2VdDMN
         /ihTPladGIQzljYm6IZ/fgHHpTLnOBleEK2gGCJi7v/gbgK/4EOvNr2vMIvkw5emQlRS
         Ks6yQX0iBNsboOT+HyMWsiVI2hc9nK+EIQGTby3Y7xsQx+/GvlhirrPGJnOVhi9nkDhy
         SIgb2805iR9eOjcfWyY1p3PjusV0d0SkzFCcNA8K4GuAg9aIb3BQGxmtiyG/eYCwiyO8
         rtog==
X-Gm-Message-State: AC+VfDyn5ii6TxTgIVsBK4Pl0ZN+5gWr4pCG1KL7Ur0YkJraCzWPlFm2
	VChsqh8P9Gf6DjneW1vKXTs=
X-Google-Smtp-Source: ACHHUZ7sASeVdKmCcr/ut6Y2PZYaEJgIZkNl0qxFYPe4n5I9Lz+EZ9AKwEXS+p8LJA2uzVSCbAFzLA==
X-Received: by 2002:a0d:d8c1:0:b0:565:d8f0:7534 with SMTP id a184-20020a0dd8c1000000b00565d8f07534mr9441619ywe.36.1685651921085;
        Thu, 01 Jun 2023 13:38:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:5862:3a98:b5a9:8131? ([2600:1700:9190:ba10:5862:3a98:b5a9:8131])
        by smtp.gmail.com with ESMTPSA id m124-20020a0dca82000000b0055c935364eesm5456093ywd.2.2023.06.01.13.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 13:38:40 -0700 (PDT)
Message-ID: <d60a9b2a-e0a9-c5ca-cd0e-3b35267ca9cb@gmail.com>
Date: Thu, 1 Jun 2023 16:38:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-oe][PATCH] libyang: backport a fix for CVE-2023-26916 ->
 For kirkstone !
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
 Nat Bailey <nat.bailey@windriver.com>,
 Openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20230531223435.2927651-1-nat.bailey@windriver.com>
 <5f4b92d0-7d69-541c-c383-a1c70596887f@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <5f4b92d0-7d69-541c-c383-a1c70596887f@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 20:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103089



On 6/1/23 1:48 PM, Randy MacLeod wrote:
> Oops, Nat forgot the branch prefix.
>
> Shall she re-send ?

No need. I moved it to the correct folder.

thanks for highlighting it.

-armin
>
> ../Randy
>
> On 2023-05-31 18:34, Nat Bailey wrote:
>> From: Natasha Bailey<nat.bailey@windriver.com>
>>
>> This patch fixes a bug in libyang which could cause a null
>> pointer dereference from a call to strcmp.
>>
>> Since this recipe includes ptests, the tests were run twice
>> (once before the patch and once after) with the same results:
>> all tests passing except utest_types, which is skipped.
>>
>> Signed-off-by: Natasha Bailey<nat.bailey@windriver.com>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   .../libyang/libyang/CVE-2023-26916.patch      | 57 +++++++++++++++++++
>>   .../libyang/libyang_2.0.164.bb                |  1 +
>>   2 files changed, 58 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
>>
>> diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
>> new file mode 100644
>> index 000000000..f3af3dbff
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
>> @@ -0,0 +1,57 @@
>> +From dc668d296f9f05aeab6315d44cff3208641e3096 Mon Sep 17 00:00:00 2001
>> +From: Michal Vasko<mvasko@cesnet.cz>
>> +Date: Mon, 13 Feb 2023 10:23:13 +0100
>> +Subject: [PATCH] schema compile UPDATE do not implement 2 same modules
>> +
>> +CVE: CVE-2023-26916
>> +Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/dc668d296f9f05aeab6315d44cff3208641e3096]
>> +
>> +Refs #1979
>> +---
>> + src/schema_compile.c | 20 +++++++-------------
>> + 1 file changed, 7 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/src/schema_compile.c b/src/schema_compile.c
>> +index ed768ba0..68c0d681 100644
>> +--- a/src/schema_compile.c
>> ++++ b/src/schema_compile.c
>> +@@ -1748,7 +1748,7 @@ lys_has_compiled_import_r(struct lys_module *mod)
>> + LY_ERR
>> + lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unres *unres)
>> + {
>> +-    LY_ERR ret;
>> ++    LY_ERR r;
>> +     struct lys_module *m;
>> +
>> +     assert(!mod->implemented);
>> +@@ -1757,21 +1757,15 @@ lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unr
>> +     m = ly_ctx_get_module_implemented(mod->ctx, mod->name);
>> +     if (m) {
>> +         assert(m != mod);
>> +-        if (!strcmp(mod->name, "yang") && (strcmp(m->revision, mod->revision) > 0)) {
>> +-            /* special case for newer internal module, continue */
>> +-            LOGVRB("Internal module \"%s@%s\" is already implemented in revision \"%s\", using it instead.",
>> +-                    mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
>> +-        } else {
>> +-            LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already implemented in revision \"%s\".",
>> +-                    mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
>> +-            return LY_EDENIED;
>> +-        }
>> ++        LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already implemented in revision \"%s\".",
>> ++                mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
>> ++        return LY_EDENIED;
>> +     }
>> +
>> +     /* set features */
>> +-    ret = lys_set_features(mod->parsed, features);
>> +-    if (ret && (ret != LY_EEXIST)) {
>> +-        return ret;
>> ++    r = lys_set_features(mod->parsed, features);
>> ++    if (r && (r != LY_EEXIST)) {
>> ++        return r;
>> +     }
>> +
>> +     /*
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
>> index 2817be7c8..7875c1ef7 100644
>> --- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
>> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
>> @@ -11,6 +11,7 @@ SRCREV = "a0cc89516ab5eca84d01c85309f320a94752a64c"
>>   SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
>>              file://libyang-add-stdint-h.patch  \
>>              file://run-ptest  \
>> +file://CVE-2023-26916.patch  \
>>              "
>>   
>>   S = "${WORKDIR}/git"
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux


