Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDB9E909B3
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 14:31:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13340.1771338680534992951
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 06:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lRyarb9H;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371bb515eso48788435e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338679; x=1771943479; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fLyJ3G7GnPPvV7gm9csc7zxd+SXBfOEax2cwY+I3V0=;
        b=lRyarb9HmqMFjsWqq/3dL/cIwIi3X9q421vwUH4jDBhcBqHCqk/aPW88D6P5VJ1UfM
         /GwUq2xiQU0FDPxWyWXV3uwHKVLfu9L6MdqQljw0r7/W/kN5CWVsrK8/WQzeBJCjyTxp
         cfFBdzaUWRvYJd6vjboBj3EAqA7xc/7TPbq9zDOmlBz7KLQb4PkQbr+Mnc8issA9MFmH
         qiUK0KKPPU5xBNe6EBXAllGPz4uOfx79yutfpB06x55zQYNMxSVSrb5XY7RgHNqPuqXR
         OyPjJ4FbTOEhshBN1K78JoJ3XzeIkHl4v+aQhR6VVrCdgB6eLH+sXRrSGptJELLKnv87
         lyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338679; x=1771943479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fLyJ3G7GnPPvV7gm9csc7zxd+SXBfOEax2cwY+I3V0=;
        b=dXTXg5D/lcLt2aff+Vuo4uMdbkoHu4J4kbMgiBdHmWfR8LHeg94HgRVYEf8JoiULVc
         bS/BDe59lo5hqsa/S5LFYmtY/xEncajkWqfPzk1GCAyfsqxqkui+EfK4zlarotr3E2Eb
         j/h6Be/zVvBM1YDZZdwCTBkw6pAC6Y2igBrHqqWQT/vLcJUSiveU1JNlCBnZb7y6MofK
         Vib86qmn294B3JdJ7UmFvyMLmz1FcU6FWqqlpBnAAJT8AT4e9AIrs8ZiZPqWr873EyE/
         LJnS+G8ZhulAbgJ2jpXt+w+rLNSqPolnu5wdmi5nh/M4orBCWFFY/HfDExtLy4rWRzwk
         tvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiGYE2lnLKcTlziWLXxH1o2eD18OPVZZhd5Rm+oq9dWk+mKOYMQHrsycoxgfKVPpDMpJhtGEYFq+uEAm0pG98DHiQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMPySejIGCqxM4gZr3+varBo0excD4umchJqELioWFOcDobXII
	2bvkH6cVKs9STMpkGXCPyExUlxFRAiOhYqhIVsKClJbHTs2/RSdu7vFb
X-Gm-Gg: AZuq6aIrvndFLmHxYHTOJPIigu8oONi9A5pCwHi1Wkv+sSB3PXwIhG6FTfQWIeMq2TI
	soqfa+nHJMCZjU0ISoxt75uTMWHeCmhYrNd1jHqvXe/SzkbTr38yvblLliLA7WI44d2QC8teP16
	Rai++Ox2dSGze89JPNhipcAst8ty86+59tOJdYNuIX7E0rj5kNTRvm3YZMLT2rr/krHAtA9/D5R
	sGEXafFHxPzCT6psFcL35j725IL3ICEg+OM+w1RZ5og1i4dYsqyxWOyAYnWlGNgKQ4szNVT8usa
	yHDycNOzg7SEosOEHZVci88ZT6iy3iVpxzEcy51DO/D+7iKnFChD48nouH/sk6RgA0lPZWJ1nMu
	2B1NYtZT3M8PUP+l8FYh+vgamVi3m1QQkoVdLO+DMM2Go2laONJ+uP/NbODJ7JMBYqAMS7hMuh4
	zlGfc5vsPZrtoq7Hl+VhWHBmKwc4QAttU=
X-Received: by 2002:a05:600c:870b:b0:483:71f7:2767 with SMTP id 5b1f17b1804b1-48373a13679mr211898205e9.11.1771338678649;
        Tue, 17 Feb 2026 06:31:18 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm158478275e9.7.2026.02.17.06.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 06:31:18 -0800 (PST)
Message-ID: <929dcb10-a224-4fa1-9dd8-8f888e076c38@gmail.com>
Date: Tue, 17 Feb 2026 15:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH 00/73] Scarthgap pull request
To: Martin Jansa <martin.jansa@gmail.com>, raj.khem@gmail.com
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <cover.1770970700.git.anuj.mittal@oss.qualcomm.com>
 <CAMKF1soLJVcZEOcLzE1MUERuAgSv0nq86xWy2ssP6933t1Mf+w@mail.gmail.com>
 <CA+chaQdLs=1ua6CpS1uQPY-sGFQwVx=AGVQ8GuHd3aPF1c8-jQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+chaQdLs=1ua6CpS1uQPY-sGFQwVx=AGVQ8GuHd3aPF1c8-jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 14:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124454

On 2/17/26 15:23, Martin Jansa wrote:
> On Mon, Feb 16, 2026 at 9:22 PM Khem Raj via lists.openembedded.org
> <raj.khem=gmail.com@lists.openembedded.org> wrote:
>> Merged now thanks Anuj
>>
>> On Mon, Feb 16, 2026, 1:55 AM Anuj Mittal via lists.openembedded.org <anuj.mittal=oss.qualcomm.com@lists.openembedded.org> wrote:
>>> Please merge these changes in scarthgap. Tested locally with
>>> qemuarm/qemuarm64/qemux86-64 and on autobuilder.
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1305
>>>
>>> The following changes since commit 7a5075cef77b5f7af454e9868e1d0019f2fd1394:
>>>
>>>   gnome-keyring: set CVE_PRODUCT (2026-01-26 11:16:37 +0530)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>>>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap
>>>
>>> Anil Dongare (2):
>>>   php 8.2.29: Fix CVE-2025-14178
>>>   php 8.2.29: Fix CVE-2025-14180
>>>
>>> Gyorgy Sarvari (52):
>>>   sox: patch CVE-2017-11332
>>>   sox: patch CVE-2017-11358
>>>   sox: patch CVE-2017-11359
>>>   sox: patch CVE-2017-15370
>>>   sox: patch CVE-2017-15371
>>>   sox: patch CVE-2017-15372
>>>   sox: patch CVE-2017-15642
>>>   sox: patch CVE-2017-18189
>>>   sox: mark CVE-2019-1010004 as patched
>>>   sox: patch CVE-2019-13590
>>>   sox: patch CVE-2019-8354
>>>   tigervnc: sync xserver component with oe-core
>>>   tigervnc: ignore CVE-2014-8241
>>>   tigervnc: ignore CVE-2023-6377
>>>   tigervnc: ignore CVE-2023-6478
>>>   tigervnc: ignore CVE-2025-26594...26601
>>>   fontforge: patch CVE-2025-15279
>>>   fontforge: patch CVE-2025-15275
>>>   fontforge: patch CVE-2025-15269
>>>   fontforge: patch CVE-2025-15270
>>>   ez-ipupdate: patch CVE-2003-0887
>>>   freerdp: ignore CVE-2025-68118
>>>   gimp: ignore CVE-2025-14423
>>>   gnome-settings-daemon: ignore CVE-2024-38394
>>>   imagemagick: patch CVE-2025-66628
>>>   libcupsfilters: patch CVE-2025-64503
>>>   mongodb: upgrade 4.4.29 -> 4.4.30
>>>   mongodb: ignore CVE-2025-14911
>>>   netdata: ignore CVE-2024-32019
>>>   proftpd: ignore CVE-2021-47865
>>>   python3-aiohttp: patch CVE-2025-69225
>>>   python3-aiohttp: patch CVE-2025-69226
>>>   python3-aiohttp: patch CVE-2025-69228
>>>   python3-django: patch CVE-2025-64460
>>>   raptor2: patch CVE-2024-57822 and CVE-2024-57823
>>>   python3-tornado: mark CVE-2025-67725 patched
>>>   python3-virtualenv: patch CVE-2026-22702
>>>   gnome-desktop: upgrade 44.0 -> 44.4
>>>   gtksourceview5: upgrade 5.12.0 -> 5.12.1
>>>   gnuchess: upgrade 6.2.9 -> 6.2.11
>>>   gnome-calculator: upgrade 46.0 -> 46.2
>>>   gdm: upgrade 46.0 -> 46.2
>>>   mutter: upgrade 46.1 -> 46.9
>>>   mutter: fix profiler PACKAGECONFIG
>>>   gnome-bluetooth: upgrade 46.0 -> 46.2
>>>   gnome-shell-extensions: upgrade 46.1 -> 46.4
>>>   nautilus: upgrade 45.1 -> 45.2.1
>>>   gnome-tweaks: upgrade 40.0 -> 40.10
>>>   tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
>>>   python3-django: upgrade 4.2.27 -> 4.2.28
>>>   gnome-commander: upgrade 1.16.1 -> 1.16.2
>>>   nodejs: upgrade 20.18.2 -> 20.20.0
> This introduces patch-status issue with missing Upstream-Status in
> meta-oe/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
>
> patch-status isn't in default ERROR_QA for scarthgap, but can we
> please add Upstream-Status here?
>
> I can send a fix if needed.

Sorry for missing this - yes, I think a fix would be useful



