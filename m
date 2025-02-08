Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91DEC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 17:42:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.13774.1739036537055865080
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 09:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AC03kOkC;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso5728223a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 09:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036535; x=1739641335; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kvsT9MjnqPnNwy+mp6MwtyYqTvhWW+K/aeC7UKnIXKw=;
        b=AC03kOkCMm4f+pyVdJB6yfIqkWRE5dkn0gS/OAlvo6fuR90ju217L0M1EKzUgcaqFP
         j6OYXqQkUn43jQXXYMRG4U03Opt8GXno0DHt3sOO/rX2VAWRqrbKQQut1Se05bNq1lVW
         BkYlLFEKtMC0g8O5xfMnDckEqwCBGBh/KjuNnJVP937Z/ZC4VN/3X1NlC21WeZ8roqHg
         6ZRBoECulgcXjtmYR/2+6IblFCOzYa59p+g3rEcOseHqQPQxC+QKMLPGNSxqcCJrGXFb
         Xu1UR7pTrOXOTbqbevRsId9bP5LKK0yELHgxQ1ISlShEElhvOz809rkV7H4xGP3NvLV7
         Xy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036535; x=1739641335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvsT9MjnqPnNwy+mp6MwtyYqTvhWW+K/aeC7UKnIXKw=;
        b=KQUxP3yPaqrjrNmOVmra0Um/qwr4Y/0GmOiRCUBMl69WOJlXCfsHj0giIn323woCn5
         OlblnJOeAYDGOjOu0JBrHs+VvGXBrSlrTTf7K1Fq/5gwWo2gBSsm6a0aHN9qePbA4hEZ
         Ec5yQOs44OLOe1ise73FOwLo8diFgxz0OAAGmMnVSRmmdq81pmJPAoLQBJcEuyX31wf5
         YZCLKmF4iIbeLuii1N3vjm6RVOoeZRV4K9xI/tnr7i/w3g7AMalLeM5KCUwsFgNNAKSU
         RLtt9Ctz50c4UV6SMErrvn4i62SB1max9JHNcT9Grnlvq23ahX76VQfvRVXlOIgc88Bq
         XJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWIcikXZRf9RSveFGTwvLTUg0+qUHOdiING1q3lnoHdbq6aE5FgO/p3LEHFJjsmOOfBfxSHlQ0ZdDbKvTbbuHz7KZ4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuwDfLtywa4msG7Uza5dPjllTakQG9Lt/1WyTn8mUmVpwPCOiz
	YCSiGYQ6OsboY4lw+V9zao/Anw8CzIsZr8XJf2uzuSBG8nH3t50Y
X-Gm-Gg: ASbGncsxQMxGVWuEO8g9P7p9DscHvRqq5y12pp+vqo8mTKLiY2iwGWVPVBhS0HzCEeo
	MbkbI57gp62OmqyrrbYd4uRVseftCiTyp91blzZvThZ9pYzvtFLHX9iD8LNlkHbmCRz3A4KtobH
	ERmLU0AJ7IqkhSYpvp9Rv7i87BfF7PznRFK2MLCEafcAaietQWO5g3VrVosk2HaGosVHG4la+mG
	WysryCBvW/FysVVFFSFM0r4H/AQHjNge6mIxMMZq041MNOr0Dg+5QsDRFJ9kGRHgIOFyltJj5Gt
	TTigahmaC1ZfWN8xMOHSKeQ=
X-Google-Smtp-Source: AGHT+IFyPsentZpSkx4zTqI/GIsOY4BPJC47Wo7lWiVwVuHpVGfSu4T9wZZyUeuf84k882OcfHws3Q==
X-Received: by 2002:a05:6402:4605:b0:5d1:1f1:a283 with SMTP id 4fb4d7f45d1cf-5de4503ffdbmr7787780a12.4.1739036534946;
        Sat, 08 Feb 2025 09:42:14 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c77esm4698325a12.69.2025.02.08.09.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 09:42:12 -0800 (PST)
Message-ID: <8abe2241-03de-405c-a862-d4c4c5e754c7@gmail.com>
Date: Sat, 8 Feb 2025 18:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 3/4] grpc: fix protobuf-lite package config
To: peter.marko@siemens.com, openembedded-devel@lists.openembedded.org
References: <20250208150308.2451484-1-peter.marko@siemens.com>
 <20250208150308.2451484-3-peter.marko@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250208150308.2451484-3-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 17:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115314

> Note: for native, this packageconfig does not even compile and for
> target it fails to link.
Since it couldn't be more broken even if it tried, what do you think 
about dropping this conf altogether and simply hard-disabling it in 
EXTRA_OECMAKE (if it's not off by default)?

