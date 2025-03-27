Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA8EC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:38:28 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.2506.1743097105866194392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bfVQn9sT;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so2413391a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743097104; x=1743701904; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zuxjQPQIN48Na+89SR3suEbWS9Y/WLUBd+Kij12LDLU=;
        b=bfVQn9sTAiGcs8Crax99KPXk0NDuIuYGPofydfH+GzzYPf8wUtLUiUzbxu+4rBS+m0
         lQO4nSQygu5XmDwOD7jVI7JaGtAGNA44o5JNPxzswCywUmi/n/2ak7RrH93KmD7c9qoR
         237spjQ0RLY4x4EFyFEAq0UDSoUnGahYpxp/SAbCYViHQCc4NXcIsI6JEX2dYcbhH4u5
         pDW0PaE2v24XrIR2F52Y3voxNLzWTNp0E/4nRIalq2O6tCtTjLUklaKc7385CufaDkd4
         HvNd85zpFCeISNenX3Z/rXLSeW6ULTqEDt4M9hkxb5YKcurJIGa6/EsvvIwwhhht3X/1
         QB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743097104; x=1743701904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuxjQPQIN48Na+89SR3suEbWS9Y/WLUBd+Kij12LDLU=;
        b=ddcqIohKr46tqf8qviTe4IVDfiYXKP2lYRlDsx7LEIY9tTGE+ywZsR1wMi6BDfMRKL
         H12KcDrsXBjpXVA8Uvbx5+A1BmsbkJBd5uKv55H7Ea4rm1Wi6wsDvBE5DNJnOVZn+iz3
         fAvyEF/HiL1U6jqZeQH1TqOFBtfqodvhQ88ttCgpxjSD4TrrHCbytP4D+zhxBnASy6Gy
         DVX2zoLEsqUOKkhua993IzNPsGT81P3Y05ZdVMoqQKGUi9/g79JKlypTnxnLgJbP47Bj
         SRDAOkzNHRU2nvUZQR+yRN7sD49pfWD/swtfe1HcPJiXJTYKjaubkUtKyu+ESHXtMo2S
         yU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBwhp9OJDLr5+80LE49vtQHfvULhVMKq22U0NK5WxaFMEiBKGOErLj0p0QxPBA9P4/eP5gqur8/1jWyEa4IDL/7qI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YynJFHTzr+6P+7hzc5rv5+7mraEAsAClxMl2FANrOKNd4+woAD1
	nJhzfqDMU/xAXO1Ok1swAfqe5CTOFBlNWB3uGFZoFdDbd4CmXN2C
X-Gm-Gg: ASbGncs5TQOSTJ8iNe6+ebxhV5VvbJNCW9fItecFj0xo0+NKbJeP3eHVvsUwXxu4Jx8
	Lm8p9KKbkYFbPlMrxH8iZgv6Io22Ht55MCDwBMBAM99g7yZa1CNDdF7SQ6mIHud63BoNeMlSmr0
	01VP18PEcChX1ZWg8LMnJhbau23ToYZ/kpSuzcdWNs9bctReJBXbAyqxAs+8/D7ELWfmp597mad
	NLqjcvkOr7DA47eL74qySzxYgcEep1kkaYUrbVflO8zlVeSFhOczeIH0eUaKLxTPdtV/RnSemQw
	uHQn5uo/7QxR1SLhC6IiQHwr9hcyAqCsljUTEdkqfFK3JIBXbJZl
X-Google-Smtp-Source: AGHT+IFPWo+JuomBuX8ZEpo96MJeU2BTl+OUCDTkPG20zDJHQNtSOtZlP0g9kk3D4mM0SXE+tlii2A==
X-Received: by 2002:a05:6402:3592:b0:5e0:4c25:1491 with SMTP id 4fb4d7f45d1cf-5edbf33d181mr1432268a12.7.1743097103920;
        Thu, 27 Mar 2025 10:38:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f1b73sm122016a12.46.2025.03.27.10.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 10:38:23 -0700 (PDT)
Message-ID: <9b61caf0-abc6-429a-9506-de7d504eeb5e@gmail.com>
Date: Thu, 27 Mar 2025 18:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCHv4] gimp: update 2.10.38 - 3.0.2
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250327172247.3885-1-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250327172247.3885-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 17:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116324

On 3/27/25 18:22, Markus Volk via lists.openembedded.org wrote:
> +PACKAGECONFIG[appdata-test] = "-Dappdata-test=enabled,-Dappdata-test=disabled,appstream-glib-native"

I believe here the dependency should be appstream-native (instead of
appstream-glib-native). Otherwise it errors out:

../gimp-3.0.2/meson.build:1271:15: ERROR: Program 'appstreamcli' not
found or not executable



