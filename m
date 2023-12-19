Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8546C46CD8
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.6754.1702967244910385607
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P7iQpkhV;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3ddccfaffso2085065ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967244; x=1703572044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka4JVmvm0kUuWF9WyVxj91pFzXMdFe9hASWf7xI9Zy0=;
        b=P7iQpkhVHuhOhjVkajCL7paparMoceByHT8HR9kAqu9EUafww5a1MOULUFWmEGwM/v
         Rrch2cOU9pEN9VkGz5HY0vITPA+Ia5kKbPq7DL3E2espiDOSupeVsw8LYD4LyTjtCHDB
         gNyvK+s16iSMUpqm5teqj/qN9hP8KrdEvhPv4AJ8N2NWNYXZ5BTxRv5cb+nR0ugKQ5Gx
         zN6R0mAmC9xfXP8W1LdV0X48HpQTPxTus+HgOMk3OemFiHFZsnN6pPoob+P9xKaNdayl
         4aJBYDL+umVJdqYPlENs2NZn1Xz3/Swa1niQTOrW4IfQrhIT9m68hiNHowD/KdISSp7q
         sfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967244; x=1703572044;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ka4JVmvm0kUuWF9WyVxj91pFzXMdFe9hASWf7xI9Zy0=;
        b=eWiWzUOun5qLtsV7HiXf8RwQM+G9HyRxwsEYTtuk4z4msFQTItFelwshKzqhvJRimg
         ZYRwAa72VQ5vhEAvgcw8L+UZFqDKd2RbUuPRKfJBlrh1rUJTMYv62W3ZG6fyZIUuERV8
         fyxLgDdMG4LU/t/oYla7wk+gXa1UbJeuy7kEJs1hnHrqsXgRT45ghQyFmVOCNBo+LYlP
         xFctceNv+PLAJp/FF0tgD6ohYIJudwndgVHQo8ZLLKqFGIXeZinQfqxNQWBIFf9F6sSf
         lqKQyuBXKMR7KLr1EPl9kQpMqnbAqenAWZNboCGgC1dtmcWFVwnH1Spx3m8IzsdfVhmX
         74fQ==
X-Gm-Message-State: AOJu0YyM7K4C7in6a5u9pHmtWvZ3Pf2cbDgy2s0EOQjZJG6rfjYrYm9G
	c1OVHbHJLJKJ1eMFKBTKEkU=
X-Google-Smtp-Source: AGHT+IFntqETHJ1tuPAIEpTnYZnGYd4ly3rysSmy/m9htplwHCNd/T9+AWwuU0L+tc9A6Cd31lzzOg==
X-Received: by 2002:a17:903:2304:b0:1d3:b3b7:5db0 with SMTP id d4-20020a170903230400b001d3b3b75db0mr3915490plh.4.1702967244277;
        Mon, 18 Dec 2023 22:27:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544005-27841-1-git-send-email-wangmy@fujitsu.com>
References: <1702544005-27841-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade
 2.14.0 -> 2.15.0
Message-Id: <170296724367.1627685.2131644711929713512.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107582


On Thu, 14 Dec 2023 16:53:25 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Add support for Python 3.12
> -Add type annotations to wrapped grpc calls
> -Add universe_domain argument to ClientOptions
> -Introduce compatibility with native namespace packages
> -Fix regression in bidi causing Thread-ConsumeBidirectionalStream caught
>  unexpected exception and will exit
> -Replace deprecated datetime.datetime.utcnow()
> 
> [...]

Applied, thanks!

[1/1] python3-google-api-core: upgrade 2.14.0 -> 2.15.0
      commit: 186765ab8d552744aaa71bb5d7449aa06f0dca71

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


