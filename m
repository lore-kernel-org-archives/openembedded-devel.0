Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD38CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:35:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.43800.1760362539097096013
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2N4jhp5;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-421b93ee372so2286624f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362537; x=1760967337; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47T2FwvJcx8xzrMTcWx3NeGtmoJswBWBigIELbDgQ64=;
        b=k2N4jhp5rq2Sgx00Z1MbZ2TL5n3nrKo4vzqiAre5GPYdgBvLkId7dK2QzqueVL982R
         LYTfL8rIty972HBjJW2b7yTZ3+1OK3WC/6qrxeAIrJ0+HEGAWkcPyKfllVbrgIag4v6S
         0OZLNnKP2howytbmzJd6CVdZEDHkPPW7pTsAuxUsuA2X2SzmHZXrwCXYxKNs5D4sSHuC
         m+oBK4YMWOBiLxBqS6jUSiOi6ULardsoXfcvHbdhwNjIlQF2mz8YF+yTdN7+u/mrVE1b
         PlvcUdIZ60Jgh5JKb5Z2FI471KvFerlVmOJYTPrwp6ROwMMbczF1wC6QisIEE558au3I
         csLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362537; x=1760967337;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47T2FwvJcx8xzrMTcWx3NeGtmoJswBWBigIELbDgQ64=;
        b=DfLvzLkE49xC/gSTE+fTeOLrJA+SYQC9z1Ju5k5TqJJg8CYvkSinrSYCLQJQc86rE4
         n21Bnk4xaTC/8p6tOFqxUg5D9EPkwikHlFEXT6x2xiiuOodCdfj6t0M4atgcuMbspOjW
         fMQe1SksFN8uUjW9mL7PoeswdCl8uGuGMzyarnGxUsd4NaFtuKbd5w+tmH+qJWEPiluJ
         SUykrU8pYmaVrvVB7FuJE6/fyJoT1aIY7ou4EeTveGXfV3VRZDuJrLkATmn0xc7utfTF
         pI1jeCipX6zy+xvfO6Yh+IKLHbXwhusEfQRH3Gdh+tSXqHFmKOMfnYQkwNoGoFSfZ9h9
         8HjQ==
X-Gm-Message-State: AOJu0YyKyoYbA1CMag0/L84PlMMcQBaXuh6DVFRqG9ilV1wMi+TcDi4n
	AUi6sBQIju+ueWYhSKGsYc4XwFxwAmmRVfDp9vebBb/eIMIbjD7En1mO4VEYUA==
X-Gm-Gg: ASbGncuJH+fvhsVI15KAik1XLURFnW+zOfciXppEJVCc91WCYNk8eS8qTwdYGjN2hSN
	/5wKQs/9IlAGASekgkhrr8/AmNPd7MQOkEa41AjjmtcRJd3fzCJX869azpnE05Tq2rS9yYDQ86Q
	s5Md5b0p9xtgFmof2oPcK4NxDtXCoqGykCLc+5d/Lx3WoHZUXIzqtmjhyNR/MxiapCvERj2PjiS
	mtfmZvI2CcfKnUSEkQH7bs1zEkaoFoKn6Pw9cXgsuFuzXVr1PpnB3IlF1zAjpunbjC8Ev2bFM1A
	sW2jF7hlygiIZnkOOTPO2oGB4rgnytk9dZ7DKjbv3zmPSQ/zLTZRR8WAtKmwDgpxRIeufSHVEot
	3mNNEhsmyQ7Xg8kJAkJjf4UA75KMkMWrzD/ptu5TTud6My3/kTpngu5DGwgIR
X-Google-Smtp-Source: AGHT+IEmb6h+0ooFG3jgpWba9RpSxcapLydaZUaMFPw3FSMmrp4fxKhEyh7lkRHDZgkpN2vdP18z4Q==
X-Received: by 2002:a05:6000:1ac8:b0:3ee:1118:df81 with SMTP id ffacd0b85a97d-42666abb532mr14472821f8f.13.1760362537229;
        Mon, 13 Oct 2025 06:35:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589a21sm18833405f8f.23.2025.10.13.06.35.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 06:35:36 -0700 (PDT)
Message-ID: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
Date: Mon, 13 Oct 2025 15:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: CVE reports for meta-oe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120536

Hello,

Probably you noticed the CVE reports I have just sent.

For now this is kinda experimental to see if it is useful - I find it
useful for oe-core, and hope it will make sense for meta-oe layers too.
I plan to send them weekly until at least the end of November for all
non-EOL branches, and if it proves to be not spam, then will find a way
to make it happen indefinitely in an automated way.

Currently these lists are generated from the master branch and from the
stable staging branches.

All help with busting CVEs would be very welcome[1].

Would be happy for all kind of feedback, either on this ML or in private.

Thank you,
Gyorgy

[1]: except for Walnascar. At this time I consider the Walnascar branch
complete (assuming nothing happens that would mandate it otherwise)

