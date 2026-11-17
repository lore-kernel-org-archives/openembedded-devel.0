Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14164.1794907728750463260
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 01:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20260707.gappssmtp.com header.s=20260707 header.b=Kjs4ASGZ;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.128.182, mailfrom: jester@theyoctojester.info)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b315dd057bso26835037b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 01:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794907727; cv=none;
        d=google.com; s=arc-20260327;
        b=QfLjJL76QLXnNlP7p3OK/AS03azU86atjL2I8o5MuS8A4cOB0WCWFj3jkoq+qTNmUb
         7B8+RbERrtEbGcIf6LORpTXw6km7EWZtJgs82tP8x5TH6UnKdG5lyzaPA4FmVK8CYj/X
         8FKKCQpH+PCkaSQzVn4huu249pqAyRgmMJ8agBK5q5DdoUX6QE0uQcp6A253S8os9STz
         g7VcPjU7FUfjqx8BIn09PeYc1k1SuAOcGjOmikc0ptj0Jo1GxoD8VRlmmc9CkkPHam+Z
         WLstv+RXGV5MSP3KMgqV3c/uj2D8CS5H8S2UJGaKeQIBFgp38Ac1SVybQQOu59j5EGbE
         bUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7zGHJge/+/jVxb6TNIn8p4XO+EYoA7MCp//QCyrMLbw=;
        fh=/+mNK09QZDW8ckzToE4kD1u+YM9+290DzyHrjwvZ6mQ=;
        b=lHVmZo8Ub4vd1Cp6f9d4Sh7rrXPCU+KPpP7tGQ1t2gHptijtxv+PGZF4E02o8vs3mS
         tlQHlZ2tUyqWhO5B9FZEYM6mUgjMNIgAT2asW5QSWadxtfRyQhP5AdJaN+5x88uQYDHE
         RAjZKJJZrhOcmkDkFNMrPUyNQsU4qKSilW3NkclYVt23ZJx20GJO6O3IJ2AUyC+1RHF+
         9GbU4TJvjH1LX/fAgfWgaw9BM2j56uj514TMHMUH2+oDY5hLqENLRvboTE1ZW0683kFQ
         Ynh2aJ0ePjGQ8dJvJNH+4w9KFgaAdNU/E7hFhK9TMQVxJBScqf/MzqAVCbKMC2U6cdEP
         6gKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20260707.gappssmtp.com; s=20260707; t=1794907727; x=1795512527; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7zGHJge/+/jVxb6TNIn8p4XO+EYoA7MCp//QCyrMLbw=;
        b=Kjs4ASGZSyBGD71+otkCX9UUMUaeVjN/iD29PdM+gsyp/YIrpddtlstWcCZwmd/l1/
         pXayUvd+Ds+TTMLdXZAphDznQw0gWidN/PgRcvjTp55FTzRmHlOPc95hKnDXIOBydvlb
         lb/k2M4vy6SbHQHZcXpZ0zaToK3CG5MqGgkxaWs8MROec84dt8iFJdJQJX1ez8N37GfB
         I8qWRhvyrNhwz1qFRRDpFay8dGgOtsTQIbYwsUFct4V4LVbbW7M1NYdFOZfUfGTrntlb
         7kPTLaRoqRxM/gxuPIuQjwQh1uiGFW/iHZSvHFE6FttoU5VG/mPV6eSSPh+8CEk1odtF
         HPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907727; x=1795512527;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zGHJge/+/jVxb6TNIn8p4XO+EYoA7MCp//QCyrMLbw=;
        b=ri05euvaWGhV8odLiRTf/EJZjVobKYmyih4E1D8ZTab1nxvHWwizHFmCdTQGPpBhlG
         jS/zyviCgYW11zcBJXKSA2NN0VjhLm2WXtlP2kWD0DazlcyioU3nwSr3s6G82QNca68u
         J+hyttvHwSIzZ13tzLzGKq3RRflEtXwhQ7F9kWa0QTLB0i07NPuXIzCRn3zO5EnKOe8l
         cK8GemivYSaYcApHkk3XjLKbUVjpkyT9IA3/tNEDCWKfrLVsYJj7K1GX6QW4/pNbk3ex
         ron9UtShAyHiAKjm7RR9zEGxZzsYvqJMXIKkUoMgAAnZ19JoKoY3eshdHPEqHccQOAMq
         FNeQ==
X-Forwarded-Encrypted: i=1; AL+hErHpoNCuWoxiU9LoQcHyNbviv+B0ahJ22ecI+7ZX5JKBtC61zGay9RhUXpRdWxLfpjo8vFHjOFtzsFo5lc6TeGo0Vo0=@lists.openembedded.org
X-Gm-Message-State: APuU4Z9d3SWrhB3TiZsV+yVDuU9t0ZS0QCkd5dSURffkqWOCWcDtWTye
	InFKeLGN7MFWIpWBLUeP0kakYza9JDe2EeDVf4jF/8q6JtUUNyvytUXDUcUTPr50iMTaHX3uFdV
	SJqa70Hspl4X17u1Riecr0Z25W8z+3EhgNFkZz4zEuQ==
X-Gm-Gg: AZFdTZd8HHM2WpWHJ2nv8VdtpeyHaMKZ7K9jP/7psT1kab2uHHeC8S5E0SrRsZCSau8
	gPItCHvWT+ke1tCF67vqBrXjOxUmkFWVl6VUmf9epsRKogFNgmIgDT099ccSP7CIQW85UvLcl/f
	ZayJm4eDcZVja4u0c2kbKQkQ9Ln8d4aAKxBSp3mZZBSOiSlFwGjPzC4+j7yvcDZ0Egmov3MTSgW
	FpsbwdYxX2JeQ8Nixf8VgPc+a3wWxa9SvMbAb9ApiIBXtig9AZ4sqJS1wmStc1pmSuswwyilipC
	U6NKg53QwirNa+Z/eyfsY6DDCzK4dAG/rfaxCdBrfkwmXcxDZQcl4YMHOihb7YBEXoLkjpDQkmh
	FlaLrgK01DmaO5t66pAU04sXyrc+jlp8dPJmqoAsD82qeJ3nzkkMpwqvTowjmaYQ3LQzWZLgo95
	3SyGKK5hYCI7RCqW9auxI6FgcAyq7LTQblKGhXlvUCRg==
X-Received: by 2002:a05:690c:f03:b0:8b0:bc6c:9229 with SMTP id
 00721157ae682-8b4aa2e33c0mr84636287b3.27.1794907727496; Tue, 17 Nov 2026
 01:28:47 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Tue, 17 Nov 2026 10:28:21 +0100
X-Gm-Features: AclHuK_RWciqAMZ5aWmBm-5DFBFJHFzzw7jqQk-UCGMm5KHZEAGdLt5dnKHPr6c
Message-ID: <CAEt6NwrXK7Zcz=Ljc7VS4U0Qu+yfTb33SDpjUn-GA62CDgP0pA@mail.gmail.com>
Subject: YPS 2026.12 - schedule and registration
To: Josef Holzmayr <jester@theyoctojester.info>
Content-Type: text/plain; charset="UTF-8"
Bcc: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 09:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132576

Hear me, hear me!

The schedule for YPS 2026.12 is almost finished, and we've got the
good, the bad, the ugly... I mean, the good, the better and the best
things lined up for you. Check it out at
https://pretalx.com/yocto-project-summit-2026-12/schedule/

And then, hurry up, head over to
https://register.linuxfoundation.org/yocto-project-virtual-summit-2026-12
to grab your seat! No change since years, still only 40$ for a
whopping 3-day program.

See you there!
Josef
