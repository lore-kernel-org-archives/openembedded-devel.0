Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0063C4707E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.1458.1649447671196342661
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ydz5iYI3;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 b2-20020a17090a010200b001cb0c78db57so7486842pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=y7g9G6oSeqN2b4eUW1it+hz9k9hwhA4Rb0bSBOTmyag=;
        b=Ydz5iYI3GYPOIc1HJHtdlhZBJiCjexXaXciBajI+iswWRHB9Te52MhX83Rf81O6GVb
         wrQs2CKkpud2UT7v/Qv7hL3ehGn/LTOP9Rk1xs6BDViwJOU+zV14qLLL2gF66+7uNAyE
         voRU3WX6g8BniyD17Y8pklFovCIjdFceDF12kf+F45rlTibYyYiR29VgI4SiXPjDnBA3
         s//Gbe07QNiMguLvU/lmZb4xHQo4W3Aa2c17mNh1k2J7ypE/r2vNANnbGKx1bNIcTT8+
         X0y/va09Y2V1kUbTn5k+Xq9slLRlvwLtGUDFIs7NTYJadAQBHqBYiR3JwBaiVMSLPjze
         Ndmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=y7g9G6oSeqN2b4eUW1it+hz9k9hwhA4Rb0bSBOTmyag=;
        b=P1IssdRfkd9xz6fT7L+wqKsfqs44PQzU6s7SUkgaJeF5Y69JiWgFg6+OmlUfV8md/n
         v5lLPbzvEIXVSRE2cwVJsvMCE8yp9fzWS6ddgQ0HmB7BtEJWksn3z7iw6we1DDMYknIY
         xExj0v19NOmL/m0u3lT+BwgNfzoSlW7fL4TY716s1JwkRsCaJk8F9meRr9gurRee7DrT
         na8AZh8xUhdDRAXMRyuGRYHVc3HC2D8l2tssJuG59DMywGnDdp2i9D2dhyikxpGoLqEW
         IIuRDw4A0nkmyJX1wPmJCulYdLbMjHKsXGg/gHW9KXnrpsWMzr7OG3c+n35QNJe55ojy
         ZESg==
X-Gm-Message-State: AOAM530fp1nKxBl0I10/iBk2RIWRXc7h8Rv8Om42sRKfnMJd3tiZLJFF
	rZExr4X6o5F2RJP2ltwAIgYzq7AUMs/mcQ==
X-Google-Smtp-Source: 
 ABdhPJxfMZaG7uccotnm2PvKO4pJtjGkE4BzRg99NntkcxFHHovrc8hbKacivLbOO+nWg7hCRxqecg==
X-Received: by 2002:a17:90a:c70f:b0:1bf:3e2d:6cfa with SMTP id
 o15-20020a17090ac70f00b001bf3e2d6cfamr23819007pjt.70.1649447670017;
        Fri, 08 Apr 2022 12:54:30 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:55c2:182d:f2d6:dc4b?
 ([2601:646:9200:a0f0:55c2:182d:f2d6:dc4b])
        by smtp.gmail.com with ESMTPSA id
 pf2-20020a17090b1d8200b001c6f65ca66fsm12918362pjb.47.2022.04.08.12.54.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 12:54:29 -0700 (PDT)
Message-ID: <65578df1-1e96-d136-7c1a-db73d6c18d37@gmail.com>
Date: Fri, 8 Apr 2022 12:54:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][PATCH] ndctl: Remove run test of typeof
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220408194242.1224639-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220408194242.1224639-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96488

there is a patch in master-next

https://lists.openembedded.org/g/openembedded-devel/message/96468

does this solve your issue ?

On 4/8/22 12:42 PM, Jeremy Puhlman wrote:
> ../git/meson.build:213:0: ERROR: Can not run test applications in this cross environment.
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   ...sume-typeof-exists-in-our-modern-gcc.patch | 45 +++++++++++++++++++
>   meta-oe/recipes-core/ndctl/ndctl_v73.bb       |  4 +-
>   2 files changed, 48 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> 
> diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> new file mode 100644
> index 000000000..b47510a6b
> --- /dev/null
> +++ b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> @@ -0,0 +1,45 @@
> +From 3abfe16bf2eb89efe3c823a935a6752c4a5b99d1 Mon Sep 17 00:00:00 2001
> +From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
> +Date: Fri, 8 Apr 2022 19:31:02 +0000
> +Subject: [PATCH] Assume typeof exists in our modern gcc
> +
> +cc.run tests are not useful in a cross environment.
> +
> +Upstream-Status: Inappropriate [Assumes modern compiler]
> +Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> +---
> + meson.build | 18 ++----------------
> + 1 file changed, 2 insertions(+), 16 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 42e11aa..e8d218b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -210,22 +210,8 @@ conf.set('ENABLE_DESTRUCTIVE', get_option('destructive').enabled())
> + conf.set('ENABLE_LOGGING', get_option('logging').enabled())
> + conf.set('ENABLE_DEBUG', get_option('dbg').enabled())
> +
> +-typeof = cc.run('''
> +-  int main() {
> +-    struct {
> +-      char a[16];
> +-    } x;
> +-    typeof(x) y;
> +-
> +-    return sizeof(x) == sizeof(y);
> +-  }
> +-  '''
> +-)
> +-
> +-if typeof.compiled() and typeof.returncode() == 1
> +-  conf.set('HAVE_TYPEOF', 1)
> +-  conf.set('HAVE_STATEMENT_EXPR', 1)
> +-endif
> ++conf.set('HAVE_TYPEOF', 1)
> ++conf.set('HAVE_STATEMENT_EXPR', 1)
> +
> + if target_machine.endian() == 'big'
> +   conf.set('HAVE_BIG_ENDIAN', 1)
> +--
> +2.33.0
> +
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_v73.bb b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> index c88d39297..e2049ce2f 100644
> --- a/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> +++ b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> @@ -13,7 +13,9 @@ inherit meson pkgconfig bash-completion systemd
>   SRCREV = "dd58d43458943d20ff063850670bf54a5242c9c5"
>   SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
>              file://0001-util-Correct-path-to-iniparser.h.patch \
> -           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch"
> +           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch \
> +           file://0001-Assume-typeof-exists-in-our-modern-gcc.patch \
> +"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96487): https://lists.openembedded.org/g/openembedded-devel/message/96487
> Mute This Topic: https://lists.openembedded.org/mt/90343683/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

