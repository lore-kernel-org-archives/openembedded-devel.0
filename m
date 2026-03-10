Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43740EB106D
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 15:17:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42581.1773155841436721888
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 08:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQN/uFFR;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so6054916f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155840; x=1773760640; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nyk7o+7smuCYVRYYAY9tWFpGdasPYbOLof9QxXE2xkA=;
        b=QQN/uFFRhuf7As2/o5mzQ9mt2yb/oTHnNItvxuPcBRWzwvq9iSjm9/T3I3/CP+yNVs
         hyec+fxz7mkFxU+UdV+dlXnD+ejivZ1WJQyvBAT4MU9nId2l8SmJmato0il6137JQiRQ
         orm7aUlQchIUvaqOHB52jOWzGX/gvaSA+YIfsZ21StOn4ZcC+pJ4MPD+zjryBdaKaAIY
         C/WgcvGIK8hYNAqhapKaO8dyX76x83hQ4GO0Cx6jJFhkOxBRMUz/cnjnwqLQkuSGr1jS
         ooqL1l4FpAFF1CQX/p6Pwy/FlHNd/AWakzegSvrtuDL0R5fFL7htAPwtdoj3Ytd+ziEL
         peyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155840; x=1773760640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nyk7o+7smuCYVRYYAY9tWFpGdasPYbOLof9QxXE2xkA=;
        b=sTfpY2nKLrET4NfoYGR+MFvBzEeSH+/E7n64dpf29uIrrq+HP8TxqMMlXfUrIAbMot
         tPJSCJYdsU+LgSitEqfYlfQDFmsbC6j/OqneBKXVBc1mKkeHqz11URragauayob28GJ2
         2YIVXujAfCt7bqO5UjKcDCx3oASsBjBykCN6nwA7C4ArnuLIAAzRNqFg3FKcjIeg9I6A
         +YHwMfFVZyKvUl9D69GHplV4smsKDgyve8QKYqEvQjbFdxhvPbl+VI0MuiM0ViPxRsTv
         UZtn3i17hMa3MILAvP1JVD5WE6SzoQ/AEWrD+NxNi/s8E/F8XjzSZPXjWM+R+HGOKlvs
         6H8A==
X-Forwarded-Encrypted: i=1; AJvYcCXH5SIbbM5SIQQLBgWTMB5lAHYK+FMRhMnlF4DN9CigS1H8cqrzv3mGgO3BUgqG2rdaLhSvOmmuA07tYRDx1+JE9zs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy05XaEQGptrzaYFz1r3GW35B0qBqqv9QDjnlMjWoaNuyAX8Tv5
	+KkQCljUxKUmyRYTTnm+7uwKPFxqDCs3S5apB/ks501soeKsUocaMPas
X-Gm-Gg: ATEYQzyWTsZua/Cg5nhm4dNbkQxWxCzMZRb4IpTXSJ9y5wfjpTWTUM+MXCuweo/SvSS
	QB3sY0wXyzbwj7J8+in3TT6sVBZLYkasJlyN6rYVNwe5fF1Qmv8UASjyb6gzeUfVKmRSjH9EEjB
	kPW1hVSuhHKn59QPFXSFVyLQb9zbdfWN5T+RTofyG4SjQgv0X+eluV5/DMwXC1V/qeUHpu3MM0e
	iIqPUwgdBS4aVf+2zifZEHKSkYuvcXHx/yINQTSP2iTypciUDYacRjedNe8JrEjmqGC25s4gTuU
	hnOPuxwQr9vTvpnTE2vMmd3ivmd9g9amfsS1/EuJ6lcimLoU6P0gkiAiSXBO+jvrybccE0YguQx
	J6TAEKKrF7w5Ku4veBf+T6NwXstW8N4n95+2/4DZz3qnDtCALfJacxemwMnGONBR0OanQvfVSXE
	awOUm36wHT+GzWu11G9IeD+jEms6mfTlyqifvFX4QzEA==
X-Received: by 2002:a05:6000:608:b0:436:3761:583b with SMTP id ffacd0b85a97d-439eff68b10mr7055810f8f.27.1773155839470;
        Tue, 10 Mar 2026 08:17:19 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm37950171f8f.0.2026.03.10.08.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:17:18 -0700 (PDT)
Message-ID: <593925f1-85be-4064-a5b7-f7bb93c21a12@gmail.com>
Date: Tue, 10 Mar 2026 16:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][master][PATCH] libssh 0.11.3: Fix
 CVE-2026-3731
To: deeratho@cisco.com, openembedded-devel@lists.openembedded.org
References: <20260310121417.194408-1-deeratho@cisco.com>
 <f6cdce97-d5cb-4d6d-889f-584aa8c51877@gmail.com>
 <86833.1773155605803464203@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <86833.1773155605803464203@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 15:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125034

On 3/10/26 16:13, Deepak Rathore via lists.openembedded.org wrote:
> Hi Gyorgy Sarvari,
>  
> This CVE is fixed in libssh-0.12.0 tag and master branch which is
> major upgrade for master branch. Please refer below URL:
> projects/libssh.git - libssh shared repository
> <https://git.libssh.org/projects/libssh.git/commit/?h=libssh-0.12.0&id=855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60>
>  
> Please suggest if we can upgrade to libssh-0.12.0 release or not.

Certainly you can - the Stable/LTS policy for frozen major versions is
only valid for the named branches.
Master branch can take all version updates anytime, without any special
process.

>  
> Regards,
> Deepak
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125033): https://lists.openembedded.org/g/openembedded-devel/message/125033
> Mute This Topic: https://lists.openembedded.org/mt/118239463/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


