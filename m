Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D74CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 07:10:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2403.1764659407191915942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 23:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eckT7wqn;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779d47be12so40938435e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 23:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764659405; x=1765264205; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDGR1j5h3OFHrvqNZog84Fkf2Fv9b4fGqabw8JqXKR0=;
        b=eckT7wqngcVt3rCbgE//NsHtJtHsQofMNpTvco0IqDRgJz4TncZG8BUHu4SBN6xy1u
         BxwYxRDmC79lRBjJBGnbrHVndPRHKpHq7acGFylUiylpqDX9Rr97WcsOfX/yvmSzpA0x
         ljVqMW+wUwHf7mClaNmgKySorfcZofXzuHOLsOWZTdWcXzklWaN+It2nrqUPCDdgL+TY
         yrNzd7HEXfiSsPxeNei+mzhnTN6J2mXpzNza2XjYgYiBPa61MsPUKIAjezE/etjvfFG7
         Yn2Kq9iDhncGB/7o9fRLi1CfjmAhJ/dfVNwe2naloPdMry924qU9afYwSRTwyFhfLkiq
         w0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764659405; x=1765264205;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDGR1j5h3OFHrvqNZog84Fkf2Fv9b4fGqabw8JqXKR0=;
        b=fsUdPN5FbvUWWDdLSZ41HcUTT8susMQUOmsDcOueBZfy827iRgoBBkcIc9c9Tash//
         1Nn+scy6grVrEU9V7Kj47mjKTTIhSr4BNMe0Bq+h2sYkXzEejz8HMuszVLOEhDltJO3N
         wFzMOhC90VxXfUEBNZs0hVJVUEuE65HJywEn6GkSLJVWaUDB0/KsGefoVHx1UthfpDcw
         BO06Wg5/k3FCCnVTXI7faptTNwRNgFCm/rV/Jf68De/aKa4wwE0Bx4yu2Gl03DXA6NpI
         azu8apQ8lO8xOJCXEYtNEHvGKTbJSMTtjzzvfuFXW/tTWlCvDhlBwzgrlXU0jd62hnCk
         adcw==
X-Gm-Message-State: AOJu0YwDjDnLIf6odmjeFLAT1+xJ+KZEQO1DhjdT26z68Ow5/gFKCf4s
	ijekb9P7ualf+AcuduMBNIFRCxJ7pWHmRiFendF0YIf7icu7swiGsZwM5A05HQ==
X-Gm-Gg: ASbGncsRZrAdFjtsuF+6QedslovMuhbC6zpqNSKCtch9z5L/GgAkc9Sy5PGNoOvBtl9
	WqKIHtf+VDGJy1Q9oJdL941Ta1BagtcIRpJjIvFqaEkY4UDZeEzbQNt7HcTXJcPMfc0mccCZp3D
	uR46PhdK6FeEKEj1MiGs+GWPSkb8TVZNHbWVfYILi8M4y2qOvYKVk67+lZhNaF1syWcPUIErKHG
	DUNialDFPLjYVYmy4qksA24nlX+nTtXxrRtvLaF8IMayJRhsQ+VM2X7BWDuAyAwAWoNQztJzLRx
	kfzBdsrjfq6cw+ju+nrYYjT9CztxNngvzizhZIMAPyuyqVHkSx4c9z8hjXDirqcRJE9sKKt8frP
	HtRSYcaI53hi4jHkngTKU/fcM3xLLErXPqkp0I0Ha/lEmh/+VBymOpOgaNjSqQ2jNdlUKpmHuU0
	aL/z9p4tpg1+Qo7usfgGMT+m8eSMMgOQ==
X-Google-Smtp-Source: AGHT+IHCDFJZcSOCaD3AlAiCpBLZvI2P3WKlfqWXrr+AAalDS7/F9ro1RsGMq37mFU9Qn5S+v1A7fA==
X-Received: by 2002:a05:600c:4f4d:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-477c00ef4f9mr451182285e9.0.1764659405228;
        Mon, 01 Dec 2025 23:10:05 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add608bsm347841925e9.5.2025.12.01.23.10.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 23:10:04 -0800 (PST)
Message-ID: <31eb13ff-4eef-4756-a30b-c218b768e1b8@gmail.com>
Date: Tue, 2 Dec 2025 08:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Call for Kirkstone patches for next release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 07:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122231

Hello,

The next Kirkstone PR for meta-oe is planned around next Tuesday. All
patches that arrive till the end of this Saturday (end of 6/Dec, any
timezone) will be considered for inclusion in this PR. Patches that
arrive after this time will be part of the next merge window.

The currently planned set can be found here:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Thank you,
Gyorgy

