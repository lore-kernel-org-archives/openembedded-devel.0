Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF393C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:35:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.2774.1750347296975256716
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbxWyx+E;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1640135a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750347295; x=1750952095; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjNWZonA32nLnco6dTnwCggtEDr/cIxwUaOcRDnn69I=;
        b=TbxWyx+ETpEdcVZFHjtcBw1R3JWH3fR4rFLCK+LZ6whwhPakKjBonAXyJ8S+3QjOu6
         ++XOAbz7ZA5PZKfifSvr1wVGxAq1/5N714y3Qpyp4NA6Sm69848eZBXk8VLkqZ7Nv8f4
         uqsHNMbGbf9IXmH8L50FjwTdiWnQJC6OpJS/heJOw9J7g2qUkoaIXJ/+5aiH9oyK4nXd
         T1ShG4lq5WDDN11cQO26Y7U7e39+7zZK3rlPokubenMugvpBemLbGUCcRlXvG5FpNrZA
         lFan96wuMrM1ZrmuOpJfyY2uk7Fz2EqeR/fPV+sVFT9YIckwN04xDmu8Prhq5TsJj9Oi
         RiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750347295; x=1750952095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjNWZonA32nLnco6dTnwCggtEDr/cIxwUaOcRDnn69I=;
        b=aqHpQruXK/NrGL7yKlMzOG+/P40xXgMluXL4xwttzMc+xjJkRjTnAZkHgVOSgui/p5
         5f8lv1Yqq1x5KB1RukaH3uDXtCSqVGnksDhlgqbQYfHDmX38z9ijgxQDskMTwln14CCZ
         FugB69ciXqKj8DIEFp2QH8fVRpaums2P7n3Bh15DiqjgxBvQLlKqkbX9dyZLXhi4Upr5
         WM3rNsFc1A97RWsalYPBvXjLNpCQQfvkHVmQxV8VyOqKfblAu5FND9qZLwujnzbYWFD4
         4ijMsdZHRnlrfUcwVbic1XkAIzwAHGQOVqSAzcl7j1kZ9BWJAU3PZoP3QJ0ZRB8S8osH
         0/iw==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZWWzKclfrRji4ckY63KvjKeSxXwRaE0b2eM4YJhh5z1bPOgCVhD93XJNTrI/tKeF39wYiu09ihNVK8f1bF91mEU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUzrVUpLav99MrUv5eY9WJpLAifC6q4lIDVEkttfzDaKFEb8PA
	G0PY0bH7he+ThJua9d+dfnlOWkMWWtvWS2p9swfx4o/mHC9zqMRzuYvy
X-Gm-Gg: ASbGnctZcuTtjPhdtKjmPv2uyUJ4P9d3PldngcMNnS0zOU/jQ0M/Q4+gZtBSfZ/RQwz
	1AZbqzZHPcux2ZG8jLxqjq6PsD3+is2eTVltHhp2+wqJhVjRnb3XTXbpqTKDPOchH4YPwUKTZ7I
	BF+4zsUKbgCUkWsK2JbAttsxmAjtEWCk4VLd9Li+xUYkc7oB8ip7a0ISyU+o6evBMRaEH8QmZpV
	u8g9OgNBIvL3tXMf7awIKjdphP28DoFsz13qORjZCYOPq/Zp5xoJHEQzuIz0SSytdTfekc7hDwh
	S6UvT6qKUEsGcl0zPk46YVKIEjlg3qOGrf0f/o0cYooG34/L+gaRLAb3w8wvAfx65Qh5AjlMqSw
	zNgn8
X-Google-Smtp-Source: AGHT+IHvUAVnxzxi1Gh6wHG9WQdI88ym0fMsgwC2ziR2Sr9v8WsiU5C94OMVYeDm5bkUOPzthhu9Ag==
X-Received: by 2002:a05:6402:510f:b0:608:1357:d1f7 with SMTP id 4fb4d7f45d1cf-608d09aad72mr21060253a12.22.1750347294911;
        Thu, 19 Jun 2025 08:34:54 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c94746sm69419a12.38.2025.06.19.08.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:34:54 -0700 (PDT)
Message-ID: <ab6d6f50-0409-4469-be0b-2b07f5333d6c@gmail.com>
Date: Thu, 19 Jun 2025 17:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Use go module fetcher
To: christian.lindeberg@axis.com, openembedded-devel@lists.openembedded.org
References: <20250619145738.3562283-1-christli@axis.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250619145738.3562283-1-christli@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 15:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117950

On 6/19/25 16:57, Christian Lindeberg via lists.openembedded.org wrote:
>  CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."
>  SKIP_RECIPE[influxdb] ?= "QA Issue: task do_compile has network enabled"
>
I believe your patch obsoletes this SKIP_RECIPE variable from the bottom
of the recipe.

