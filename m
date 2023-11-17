Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B556C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 23:07:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10313.1700262425016538957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 15:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=tVU/+CC9;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40a5a444c3eso18733665e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700262423; x=1700867223; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iVTyn+vwh92J8RkjvtPkjp6A6czeF6OskwzCRJdspQ=;
        b=tVU/+CC9Wyg7WF1v3TA0FCt/Zd25rJdHuoG/FYZCxw0d1OQT9Z+9QK2znYwjqJzBRd
         mVh6PTTe6oJUp8dH2FsG0OGTPxveKf4p3Ge7nZTZZd/F8c9ckWOgCznrmD7EeyTxHuET
         EzOgUJtYMT3QF/RHMw2dwARsHpykkscxO4Vy4rg5WgiEb3aTJsB7wBQUJRmqA+L901pL
         7HpugTgtLTG9LW4EzlYqlr5/KHoT5M7I2H6/wSWtQA8XkEewcCwWzaQMpnaAqDc/K9JL
         xvcY1Ed34YNVb4erWLlt7yE8EhcnIrHpVSvOMcdxYThFTlJu9yrdChXVMu6x+2iHDRdB
         E56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700262423; x=1700867223;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iVTyn+vwh92J8RkjvtPkjp6A6czeF6OskwzCRJdspQ=;
        b=LbInblGLv5FeESbqPPmppodw7wqYtSdujqMvC+fXrOtzOnG/F8S1OaXraSL2UkJ6xx
         V9uCQCBj4rMHEEjTe6J/zHl+E+SmD+Qz/LDOacZPeEEvokwjYVqq+TOP2O/CnnOxwxnZ
         V0OGPOycu04hffy/MHWhPEUSYizCCXEIXQWJfl+02OTv7uUrtpfCTMCw2scBs9CWpW9c
         ROxTkjnHNqKpjfqMbkjbJUe/Z+oeOqyfIKiWX+SIDrczN3FyB7zKNn2bNQyzXh9Rejnm
         aPiYPrjDgxVW18RCQ/X7QmwErC5ZY5ddtlBqxg2uEBwxZfzdL8fCohWtYEB1+D3ubeAk
         KXdg==
X-Gm-Message-State: AOJu0YzK0bPwgaWtiMQjIWiMxUqbnfqGU0WeW+CCxxG0obw9feXbtZix
	TQQCRnQBGAm1VgNKojGmHRRUcDtsXx19MJBL+iE=
X-Google-Smtp-Source: AGHT+IGYCWsp0M0+xhZZHIwA/3iqcg2/lbXU0pBeXHfYfOOz6eYopnAh8HLpUfo5ETf/i+py+L02EQ==
X-Received: by 2002:a05:600c:1987:b0:401:b504:b6a0 with SMTP id t7-20020a05600c198700b00401b504b6a0mr422124wmq.3.1700262422453;
        Fri, 17 Nov 2023 15:07:02 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id b19-20020a05600c4a9300b003fc16ee2864sm4186530wmp.48.2023.11.17.15.07.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 15:07:02 -0800 (PST)
Message-ID: <dc8c58c0-bc7c-4cf3-975b-4f0803b7c915@smile.fr>
Date: Sat, 18 Nov 2023 00:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-python][kirkstone][PATCH 1/2] python3-cson: fix DEPENDS on
 python3-native
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20231117091824.450741-1-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20231117091824.450741-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 23:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106880

Le 17/11/2023 à 10:18, Yoann Congal a écrit :
> python-native is not provided by meta-python anymore and this is clearly
> a python3 recipe.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-python/recipes-extended/python-cson/python3-cson_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> index c4fcc61ec..da174ad55 100644
> --- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> +++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> @@ -13,7 +13,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
>  S = "${WORKDIR}/git"
>  
>  RDEPENDS:${PN}:class-native = ""
> -DEPENDS:append:class-native = " python-native "
> +DEPENDS:append:class-native = " python3-native "
>  
>  inherit setuptools3
>  

It would be better to backport https://git.openembedded.org/meta-openembedded/commit/?id=40b4cf5a83098a5f1be873be5c29f26380bc7993 instead of this patch
In the current state :
root@qemux86-64:~# python-cson
Traceback (most recent call last):
  File "/usr/bin/python-cson", line 5, in <module>
    from cson import main
  File "/usr/lib/python3.10/site-packages/cson.py", line 11, in <module>
    import argparse, copy, json, sys
ModuleNotFoundError: No module named 'json'

I'll send the backport.
-- 
Yoann Congal
Smile ECS - Tech Expert

