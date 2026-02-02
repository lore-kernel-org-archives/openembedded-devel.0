Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EBFD79779
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47313.1770013758427671168
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 22:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EErlAt2z;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48069a48629so41833265e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 22:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770013757; x=1770618557; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/hsKdnYLGnW6oq8SbtHzzfldr6XNCqQaOBTV4v+23Y=;
        b=EErlAt2ze/nxEi1UFOW8hb20JZqfUFZ8e1HGAAitKYBjgjsVOCjYVUj5z6+50qiFHT
         YBYU7duAof7Vco1yKXBUZKT9jeUM0BcX38lgprwD3B7aS4IONfNXeY8mgxK2hoM9kxCZ
         4ofY7Zd8oU2K4kKh9e42sfKg2k4VzilPnZb4WqSGSZ04A+YrZcqSRyyZS+pSwH+seTHo
         bIBzugHpECqe5Kiv4hc1vXrYzIpE+pXbin30peeEckjiO6fJqw7NM84ZF/CeDhghrRCS
         VZmmEW7zD+J2Z/dHjQbXiYThVOAAKOgbG4td9NkHiqHYF4Ga4qfDmjGwNiqHlNL+CyC4
         xVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013757; x=1770618557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/hsKdnYLGnW6oq8SbtHzzfldr6XNCqQaOBTV4v+23Y=;
        b=cwvtvEbagIxtDVKR7SMFaN3C/+JDLz9TPpXnNUzi7HUUgYqzUjg0lUUh6iBbVZUZEH
         NzXpNUqcQ6+RTbNwCF5sj1m6XqN5k88RaEicPDe240YyAepwbnCZvyMpVJ44NQ2hIek9
         iRM/nDaSj5wb+EUQqn1o9S1AuEHpLHNgnF5gLrZLMET+PSyCBirfI2IpCh+80JURnlhm
         c3nFUKie4xWSs0HNSInznnqkB7cBVekM4BrWlpZXx3J4XaLyAOqr2wuZNgAhrz2bkfoT
         2hOIGh9eol9z1T/NSR98ze3OvBshRzh8wIiT7f+rzGktTIGA79xVjWh1g2tgrHR6Ipma
         JMkQ==
X-Gm-Message-State: AOJu0YzeFpOcI8kUz0K01a97G+pVRtugkWY3s7BxWLbaq4dEcQy/QTno
	ID3/DLjD179rvTISEutMKQOZhZ7zhuxwcCkI5OCk3kfbw2/TkKWbx9fS7tlbvw==
X-Gm-Gg: AZuq6aKF1V8su6C7QZlm8XXLkOvwDMsS3tzVrxvgH6Xn4ZVjaEc8KBoqgzfNf+NMJrr
	cJXIBd2Y2hhzy92qkyL15Rpa8ILeUnI+bR8d7HT6BjbSIXRugQLPqfni6urGmYV6vcmymouv09d
	A6FdmwQDkQpxkxNG7lmhCp0nprg66E8n/QusCOhRrUc3gP0vJl6TtzQTSXz/7EFSlnwWo41n4eU
	xHSmYq7I+oOTesh3FjWOc6FxT9lXVkYflZdU96K1jlrMsexxFkpHzkjX1opet54wzl1wUD6vvwS
	Suwpt64n52rAnlP589jVKItE2EIEyfSvvdnCxO6k+WQxuY20wtbvaWIuqhV7M1eLGN/hL/5p2md
	lgfIooBL7FbBb/pnLY3ouBCAkOAn1busskXIFwNNedMctErKFJy7xUU+xLxthweJcxaF9M92/R7
	kF/t5Py3MMDu14+i3ish8=
X-Received: by 2002:a05:600c:64c9:b0:480:6999:27ec with SMTP id 5b1f17b1804b1-482db45ca9dmr129095785e9.13.1770013756482;
        Sun, 01 Feb 2026 22:29:16 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4360ef9e804sm373075f8f.41.2026.02.01.22.29.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:29:16 -0800 (PST)
Message-ID: <615fc1e7-0e57-42ca-84b4-a2316003b042@gmail.com>
Date: Mon, 2 Feb 2026 07:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - master - 2026-02-02
To: openembedded-devel@lists.openembedded.org
References: <189059EC3D7ED390.3527476@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189059EC3D7ED390.3527476@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 06:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124048


On 2/2/26 07:25, Gyorgy Sarvari via lists.openembedded.org wrote:
> ====================
>
> Removed this week (12): 
>  - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
>  - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
>  - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
>

I'd like add a couple of thoughts about live555 CVEs.

Why they got on this lists:

 - the first time they were LLM-derived (though later they received CPEs)
 - they were filed against an old version, but couldn't find relevant
code changes - that's why I kept them on the list even after they got a CPE
 - couldn't verify the exploits, because the PoC files required
registration with a Chinese phone number

Why they got off the lists:

 - the writeups were made inaccessible by the reporter
 - couldn't find a contact to the reporter
 - some other distros consider them fixed (though couldn't find the
version where it was fixed)

Due to the writeups being scrubbed from the internet, and with having
virtually 0 info about the issues, I decided that I won't forcefully
keep them on the list. They are not on ignore list, but the cve-checker
skips it, and I let it so.

