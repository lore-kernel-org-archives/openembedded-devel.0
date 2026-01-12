Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7061ED2505E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:26:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29461.1768209956692000010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPMt7K7d;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso25953485e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 01:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768209955; x=1768814755; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHFkMC4jMtOIQ2w35vOCGlT6tEm9t02IRVxsnpSWnk0=;
        b=UPMt7K7druWvqVighaKV33iILnO79+tefVmeYh1vBp8JNcC21X5TlA1NyJ8KVtBCPt
         bzQ5eE6TQ7hBwRlLKZWjd6AGwSNkrC8h3ryS4AhHcEdAuojox5lyeHVZXiAJDVtyQKOj
         08HpuAv7xRpM/neKhDK5WErmTzXWwes8G849gshsztBf5FEIzFwKzmb88ATv2hsTldBo
         jdgB7E/4JpatITk0IisOhQJ6Y091ig7hMPP2vEa6IhShSeIh/o3e/GdxrlnN8LANJKXy
         1gSZHcJV6Lqv7wezJBOn+l3yXAod0CtsmVHUg68l9waY3mFglLY7nRooD5ceJdaPysJU
         LINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209955; x=1768814755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHFkMC4jMtOIQ2w35vOCGlT6tEm9t02IRVxsnpSWnk0=;
        b=KW9uEcf9SRC8SuvgL9BMIuytlj/hyJ/ym0GSESHlhy/Qro0zWeQEX3eVaSWgb4FA3W
         85lRJUKedgaqivxb02CtnRY2mNwcPIT9V6lSGPHkgIkDnfEHsk+zKjE8WMWvLTBj/4aq
         b7FYc7MMWDUBIwthLNCA/Yf/j9Vn/HHMrnmiPX3J3B6FHIOR2SFhy6gB6vbWeXX8AfY1
         jpWuEPUwcHw8q+opi5kM21FSWSB+TbmxzMtXUW2/yM/EIiJ5pYiJ8Q/wMugqYrUNMQmM
         0lBlffZzV9c5w3bHQx/1gefiMwzszv5739xL1AOsaylLNb0HS/4g3LbzHoHJjRnLDEby
         aAgA==
X-Gm-Message-State: AOJu0YxozLJCOz63MjKJoU4PQ3QV0rfjTubzAVKC5EnTit1fnJiskuLs
	oig8Ki1kWOj+Q1Cz1rltAppB0KYVctjwjkvx+xtGPIpSOOdmy+XGj582
X-Gm-Gg: AY/fxX52phnYsMH6Zl2ELxYomMddhAyhvnGQ11bmthtP6LjU3+3OUA10qMheWvo+XQ3
	/79ozzYxBxIveJODmy+vV0kJQ98HZZmSUZaLsdGxt5Y2Zc1Y+1/KvH+Ckvyzl/ca1iwGLhw1oaS
	VKQtaijMW+G3pu9BkZuffg1tZVp3gscDgqAR+pj8y0kd36XwOU3H9aVfFVxIEUx4o0/TMjcZxK5
	vO3u18HcXGHs3sAiPVkTetMlqM3J9ZisSAxQuGPv3mSGXGFqfYeBsM0J35zDeZOKI9yee29coTi
	bFbNP2+nLcKl3cd1HHoj36OFut5NRDNmIuvJew7GhLO2qTXl0gOBzX6uB3mSLPfhsPg97izEBcs
	885DzvbiNkckBfp2M2evSMa76LBeiaxxse0fMlNUq7oN/ooehMXIp/o4j5AhViSNMAgKf/CU0HT
	tX+D57P4yQpCiIhVw4ItakUuXtuBTXfw==
X-Google-Smtp-Source: AGHT+IHW74TrPke9Z3vSUfUk3m67QE50w5VEOEm8iihlR4NjRGVmiQ0isLPNaupI9s60iw1lxGmYAQ==
X-Received: by 2002:a05:600c:450a:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47d8483cc37mr171583715e9.3.1768209954978;
        Mon, 12 Jan 2026 01:25:54 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm341210175e9.13.2026.01.12.01.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:25:53 -0800 (PST)
Message-ID: <d5e36eda-385c-4281-94d3-b15be15268f8@gmail.com>
Date: Mon, 12 Jan 2026 10:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][krikstone][PATCH v2] python3-django: Fix
 '_lazy_re_compile' is not defined
To: anuj.mittal@oss.qualcomm.com, Haixiao Yan <haixiao.yan.cn@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
 <CA+s=J=y+tCNA9PjOwfgcR68vx10nEuu+P5Denc_HmSjfWmhNPw@mail.gmail.com>
 <1c1a7717-97f9-4177-b4e4-ae8902080002@windriver.com>
 <CA+s=J=yHdgNtdDWMyNz4fcF_d8vdrrR69uTe0vNUw3WNW6ABpw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=yHdgNtdDWMyNz4fcF_d8vdrrR69uTe0vNUw3WNW6ABpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123373

On 1/12/26 10:09, Anuj Mittal via lists.openembedded.org wrote:
> On Mon, Jan 12, 2026 at 1:06 PM Haixiao Yan
> <haixiao.yan.cn@windriver.com> wrote:
>>
>> On 2026/1/12 11:10, Anuj Mittal wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> On Sat, Jan 10, 2026 at 6:01 PM Yan, Haixiao (CN) via
>>> lists.openembedded.org
>>> <Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
>>>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>>>
>>>> - Fix:
>>>>    NameError: name '_lazy_re_compile' is not defined
>>>>    introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
>>>> - Revert the modification for docs/releases/2.2.28.txt
>>>>
>>>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>>> ---
>>>> v2: Fix a typo in the title
>>>>
>>>>   .../python3-django/CVE-2024-27351.patch       | 35 ++++------------
>>>>   .../python3-django/CVE-2024-39329.patch       | 27 +++---------
>>>>   .../python3-django/CVE-2024-39330.patch       | 40 +++++-------------
>>>>   .../python3-django/CVE-2024-56374.patch       | 42 +++++--------------
>>>>   .../python3-django/CVE-2025-26699.patch       | 37 +++++-----------
>>>>   .../python3-django/CVE-2025-32873.patch       | 33 ++++-----------
>>>>   .../python3-django/CVE-2025-57833.patch       | 33 ++++-----------
>>> It's hard to look at a patch patching a patch file .. Why are the
>>> other patch files being changed which didn't have this problem?
>> For CVE-related fixes, I don't think updating the release notes is
>> necessary, as no version upgrade is involved.
> Is this fixing any issue?
>
>> For fixing the issue '_lazy_re_compile' is not defined, do you suggest
>> leaving the original patch untouched and creating a separate patch instead?
>>
> Yes, I think it'd be better to separate these two issues.
>

Personally I have no big problems with this patch - but if you'd prefer
to update it, do you think it could be sorted on top of this, instead of
a v2?
If you really need to do a v2, that's fine also, but then I will drop
this one from the currently prepared PR.



