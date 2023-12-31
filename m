Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E17CC4707B
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.198987.1703983116404732652
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eD97F2kr;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28bc870c540so6046569a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983115; x=1704587915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++7UVqMyNWP5mV4OPcRynX1qEdAQGGNYvblsi5zYW/8=;
        b=eD97F2krHtgyG9A1xIVSf88bs+kuDF36tVIOWfWMqj9cT7ikSgWCdOci87jZ1uvoiM
         tdwmWkK4ZtOJoo4aWvWyesPduoEQvMIiYG52qMeDHaWkSdhppwCO+oZfR8w6Nxd9inYS
         w8dsxID8lkEQ8Anb9xo+/IV4Iq1ja6D7T1gMJZN75uK9HCs7K/5By85OynJmJBllR/P+
         oC9RGPrRxRiaePo6sfUB2bhkofnJNgR69D03AG5EUHuGnYCBN7lXadRrIRTaLxBNQTZ0
         nOfd5mw0mDZQ+/seFkYLc/BtwoBS7ovrr8kB7Po/3W1/WsAkWZX3KTA/hVbbMmKEc80d
         VOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983115; x=1704587915;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++7UVqMyNWP5mV4OPcRynX1qEdAQGGNYvblsi5zYW/8=;
        b=PCQVr7QFXKychfe73/5Xs9e8OCDawMzBh9bxNzTndvGAt0LZaVzvPsuKmo5JcFbKwn
         Dl5o1H5sOqGKyMBziuwqT3JAhzlJu8C3ZvFOLu0xbDxRKDeinsTSX8rnoOzpcNiL0I+U
         LqDvuh2IRgmTpKOVu553L90jrXHEZVKM2YfXmI9zK55pegMzIJbOuWIg1IZSg0R1BZ48
         Z3txAIfvKXiCukpg3+7jSHWMHLkPvMDd3uO2S9Gwiqrhee7+PheFPl8+9h5CYootNoII
         fnRA0u32vk8AKfK6t8h8lejFrHwJUMWZAedyDrqG6gRhTkGX6OAhW6yRF2KYfWDF6qWE
         zqQg==
X-Gm-Message-State: AOJu0YzSLQyluML2/u8eUc1Q+zdJA+eYs46FyuYF7jvjX4oddeECtvgl
	QbkL7HnbZROK5ouLa0CSDdPqN4Hp7W8=
X-Google-Smtp-Source: AGHT+IHaZWf7yNvNGXFZzaT27DCtoIjw8gSO/+KA59jz4DfSj/tAryX+K5Z2WsluUeFFiaNOgtrOSQ==
X-Received: by 2002:a17:902:f7d5:b0:1d4:208e:a8a0 with SMTP id h21-20020a170902f7d500b001d4208ea8a0mr13996845plw.71.1703983115586;
        Sat, 30 Dec 2023 16:38:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703575711-13218-1-git-send-email-wangmy@fujitsu.com>
References: <1703575711-13218-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-cassandra-driver: upgrade
 3.28.0 -> 3.29.0
Message-Id: <170398311471.873206.11563272388487283531.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107931


On Tue, 26 Dec 2023 15:28:31 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Add support for Python 3.9 through 3.12, drop support for 3.7
> -Removal of dependency on six module
> -Raise explicit exception when deserializing a vector with a subtype that
>  isn’t a constant size
> -Remove outdated Python pre-3.7 references
> -Remove backup(.bak) files
> -Fix doc typo in add_callbacks
> 
> [...]

Applied, thanks!

[1/1] python3-cassandra-driver: upgrade 3.28.0 -> 3.29.0
      commit: 7ede8295ef5016778db39350e4f0cf33527d9c8e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


