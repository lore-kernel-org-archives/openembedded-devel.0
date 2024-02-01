Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF56C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:39:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9593.1706827192709751753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 14:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=VGOxqOwr;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so13185505e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 14:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706827190; x=1707431990; darn=lists.openembedded.org;
        h=content-transfer-encoding:organization:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oFbf0Lcih1Z0kMAKF79pEYYGj6hkLWZjWKHcIBSHAIk=;
        b=VGOxqOwrpNlzwq/xQvWNIyG96YWy15yIPbIvXwhprDCZOCz25PBaooy5R5s4/jfFbN
         exixIZu1Wjb7doMRTHHFswr+P/3dzR7tyvo5eWqmLnX+YRuIhjJkd2EIDpUh24CBB/0V
         kjXcNZSZyHU1b8ieyeaW8vKw06IY8dvAAT4h+O6jD+mlNxq4YqRKvCXViUr+2dKner0y
         GbwPIYRXF7Y60QJV8ItbOxSo46lrBMfnGbZIQfJV6FSEkiNCMafo6W3Pnw8EEjHVoMwB
         P/9b7Kj3Q9QGPZI/CoTxwRZFk7ULLzkMoRqKeJv3T1EjaoEO2f8FcyHU9Jg4VmvCCiFF
         pjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706827190; x=1707431990;
        h=content-transfer-encoding:organization:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFbf0Lcih1Z0kMAKF79pEYYGj6hkLWZjWKHcIBSHAIk=;
        b=nJ6xrN7lEO7XO/gs7PIpFmtmAMHVkGFXR/hZzAFQHvF+8tEPshlBYHd3H88lvXuT2p
         b8i1lizuKjMUshG3erWv9f7Bd65lO0s8rGQ4xsrWV+sLnn+xO1BnMjNFiH8BerwCYTL8
         sj8smC4CeFf2XlYY4/v6GVGouLcEz212afYJmD+xXUY4o7mPGpT7Hr33pGfIi8qTCkvp
         CxldFmOJ6d72DEh1dq1T/JWn66d0yUmZhNaYdYhEmIGw1Rb+HLA9xK9rbB0JFQwUwyJt
         h1WTRuEimA03dfNxXbxVMOeprYU84RlI/GOIq1fT3o+zpwTETILH9w4E9Kdy5NlHqUsa
         p4eQ==
X-Gm-Message-State: AOJu0Yw0fhIKccUMLti4QmnS0IEBCNJrZY8pAvYNvS1zbFFvW48eHyb3
	FSdz4NKRgrby3yRYzWWIt4SUxPTPYXdWqKprZj4jzvEBg6sS+H/Ck6xQyOc8TnfxLnB7gU/1ZjU
	akpM=
X-Google-Smtp-Source: AGHT+IG8HC674Uw4oKxvXmKuWHybJI54ZNdFOQHnTEnj3q7v7322vLzVjeReZ6KkVn4z4OrEBIAgcw==
X-Received: by 2002:a05:600c:1f93:b0:40e:f66f:1959 with SMTP id je19-20020a05600c1f9300b0040ef66f1959mr4648613wmb.17.1706827190281;
        Thu, 01 Feb 2024 14:39:50 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b0040fbc9a3405sm2885886wmq.0.2024.02.01.14.39.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 14:39:50 -0800 (PST)
Message-ID: <c9858cf1-f8e5-4462-9d6a-db84b0924f1c@smile.fr>
Date: Thu, 1 Feb 2024 23:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoann Congal <yoann.congal@smile.fr>
Subject: Bug tracking for meta-openembedded ?
To: openembedded-devel@lists.openembedded.org
Content-Language: fr, en-US
Organization: Smile ECS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 22:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108521

Hi,

We recently extended some of the continuous tests from oe-core/poky to meta-openembedded :
* meta-oe-mirror: mirroring all meta-openembedded sources
  * https://autobuilder.yoctoproject.org/typhoon/#/builders/156
* reproducible-meta-oe: is meta-openembedded reproducible?
  * https://autobuilder.yoctoproject.org/typhoon/#/builders/155
* auh-meta-oe: Are there upgrade available upstream?
  * https://autobuilder.yoctoproject.org/typhoon/#/builders/159

All of those tests are *wide*, they try to fetch "universe" and build "world" for all meta-openembedded sub-layers.
Doing that it caught a bunch of warning/errors.

For example, take https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/9:
* Some packages are not reproducible (this is not surprising)
* Some throw warnings at build: "mariadb-native: native/nativesdk class is not inherited last[...]"
* Some simply don't build : "radvd-2.19-r0 do_prepare_recipe_sysroot: radvd: useradd command did not succeed."

My question is: How can we report/track/attribute these problems?

I've asked this question during the Yocto bug triage meeting. Information I've got then was:
* The current way to report bugs to meta-openembedded is this mailing list (Which I didn't know)
* The Yocto bugzilla might host the meta-openembedded bugs (the bug triage effort being a separate subject)
* This subject need a larger conversation (maybe involving meta-openembedded TSC) 

So, this is me, starting this conversation :-)

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

