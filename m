Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E464E99058
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 05:16:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.178678.1775884571617741643
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 22:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N9PQCZ/r;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso26410635e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 22:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775884570; x=1776489370; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsCY67EV5Y1clgJX95rzB9pqTATOLS386VnrpS7D1xI=;
        b=N9PQCZ/rGl4BMMBe8GwBVnFEYclb7f/ELGFrsMSeg643xW7Mnzfdx97q5RW/Dq/Qin
         uiAtUBcp5sNQWaexx+Zzbcpq+w4tbyNOz624xy/PS+RMkso8uKgInaW6ylP0eHKEbOpC
         aiqeKmK6XISwWHIwZEvFl6p/qX1MCaze13cCCcQTurn4XKefWNPrajs8fFnEPiGAkluz
         hsd6h0Od5qKz076h1IvfAMvTu2ypZXvIc+9RvtXexaGvLrt6IJw4CjcT6e0vWvfxgSZN
         H79kDh+nQG1V2M5eS96PLjrEzY49qBdstjP/MibPj0sNEcXEqECmpjLqxnRpZilT2mtw
         kUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775884570; x=1776489370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsCY67EV5Y1clgJX95rzB9pqTATOLS386VnrpS7D1xI=;
        b=gNp6wrDm3KKhhnYWa1m/vM9PMJhVYbtCO8pkLR84HjuCvUryhMXmHGwEiMdeV8niUu
         wx/LWhPhgqQSo9HeYWAqwR0k3nC31ERxdViiPHM+ONxImDzYZulFLgazgq7XNiTj/Dg+
         XTDjfqiWdzK/DYyYTDeOUx8m0uDwnjwDcBWp+pFVcStc1hZclCjyxszBdF6VhZWniQjQ
         RC1UvsYNE2AqFpadlaZAIupMEDUr3vsD6P2MZ03k+cWp922b8pi2Uk8r6U5ByZmW0fTb
         OIN11QeTRAwoukAjlL7hx6I7NDBn+RLgYNGL+xAEeSFU0621akIfZ447YilxkUB2egsG
         acjw==
X-Gm-Message-State: AOJu0YzOrqLkbmfHq3ss/2EcyUOQlBGPIdALSvNejvPMB9s6f9Egv4ve
	yVY8/dIM8taR7N2IjIGfl2y11wNrdlJrGihtB+wHS8wr+KBXbFbfaGUx
X-Gm-Gg: AeBDievZ2wQUigOZmHUeRxfhqCnZxfjQ5DqMtRSDhtC6/IwzeMBZAUxrBQJRs3NM9Bj
	dmwFzjrtMnfnfugLC7sL/oJDJT/TUql0r/hznxPbkT1GnL0uX6SsSELMaQYuU0NCTHvhq+3fIXp
	RFoWOtzCaVdvRajY8fssxP4iLLhV4ap2Hx8nCC4Zr1ebQ288ABeKag4rxUlCp6Z7BxGo8YTUsso
	DygthVnhXoBTI9Y/sRuhMXXzbOqCoHprFYysoT/7EhdU5e0KOoCwwN2fzsyuEcJXSgYO77QneJH
	/Yr51LxleflvZMvxzbkxiDy2I8NK2r9n0dxM+KW0zg5RAuGTlZ2xUXoOC61HSwwz6uuY+QQS6VL
	jh3ou2WGgJMZjDLV846O3ZvsLG85Nb2fKokKLoMTZD5DNbGygQonc8qFBJ/j4CQaauFjOV+gAQ8
	/bNo4rndpQMcycjTHv0d+k4s8BrD7C5MY=
X-Received: by 2002:a05:600c:3f19:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488d67bbc2amr67213605e9.1.1775884569730;
        Fri, 10 Apr 2026 22:16:09 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888a97sm145232335e9.2.2026.04.10.22.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 22:16:09 -0700 (PDT)
Message-ID: <690f7b42-7d44-4ac3-9401-3d79e9ffa317@gmail.com>
Date: Sat, 11 Apr 2026 07:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH 21/33] minizip: upgrade 1.3.1 -> 1.3.2
To: raj.khem@gmail.com, wangmy@fujitsu.com,
 Samuli Piippo <samuli.piippo@qt.io>
Cc: openembedded-devel@lists.openembedded.org
References: <20260225093727.1284-1-wangmy@fujitsu.com>
 <20260225093727.1284-21-wangmy@fujitsu.com>
 <CAMKF1sqyBvg=6Pf0EPLzR8b=N27Nbry6jduL1t-tHdqAygwp8A@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqyBvg=6Pf0EPLzR8b=N27Nbry6jduL1t-tHdqAygwp8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 05:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126249

On 3/3/26 15:58, Khem Raj via lists.openembedded.org wrote:
> qtwebengine fails to build with this version of minizip, I do see meta-
> qt6 locks its own version but I think it will be good to reconcile the
> versions into a single recipe and see if meta-qt6 version can be removed.
> 


Why not do a scream test? Apply it, and see what happens.
I don't think that this is a good a reason to hold off such a patch
indefinitely. Or is it?


> On Wed, Feb 25, 2026 at 1:38 AM wangmy via lists.openembedded.org
> <http://lists.openembedded.org>
> <wangmy=fujitsu.com@lists.openembedded.org
> <mailto:fujitsu.com@lists.openembedded.org>> wrote:
> 
>     From: Wang Mingyu <wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>>
> 
>     License-Update: "Version 1.1, February 14h, 2010" removed
> 
>     Signed-off-by: Wang Mingyu <wangmy@fujitsu.com
>     <mailto:wangmy@fujitsu.com>>
>     ---
>      .../minizip/{minizip_1.3.1.bb <http://minizip_1.3.1.bb> =>
>     minizip_1.3.2.bb <http://minizip_1.3.2.bb>}            | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>      rename meta-oe/recipes-core/minizip/{minizip_1.3.1.bb <http://
>     minizip_1.3.1.bb> => minizip_1.3.2.bb <http://minizip_1.3.2.bb>} (77%)
> 
>     diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb <http://
>     minizip_1.3.1.bb> b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
>     <http://minizip_1.3.2.bb>
>     similarity index 77%
>     rename from meta-oe/recipes-core/minizip/minizip_1.3.1.bb <http://
>     minizip_1.3.1.bb>
>     rename to meta-oe/recipes-core/minizip/minizip_1.3.2.bb <http://
>     minizip_1.3.2.bb>
>     index 51a74d039b..49e4a4b561 100644
>     --- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb <http://
>     minizip_1.3.1.bb>
>     +++ b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb <http://
>     minizip_1.3.2.bb>
>     @@ -4,7 +4,7 @@ library which is used by many different programs."
>      HOMEPAGE = "http://www.winimage.com/zLibDll/minizip.html <http://
>     www.winimage.com/zLibDll/minizip.html>"
>      SECTION = "libs"
>      LICENSE = "Zlib"
>     -LIC_FILES_CHKSUM = "file://
>     zip.h;beginline=14;endline=30;md5=8eaa8535a3a1a2296b303f40f75385e7"
>     +LIC_FILES_CHKSUM = "file://
>     zip.h;beginline=14;endline=30;md5=b7d2930a7332b2bc68fc1a7fdc5ba775"
> 
>      GITHUB_BASE_URI ?= "https://github.com/madler/zlib/releases/
>     <https://github.com/madler/zlib/releases/>"
> 
>     @@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/
>     zlib-${PV}.tar.xz"
> 
>      S = "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
> 
>     -SRC_URI[sha256sum] =
>     "38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32"
>     +SRC_URI[sha256sum] =
>     "d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3"
> 
>      PACKAGECONFIG ??= "demos"
>      PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
>     -- 
>     2.43.0
> 
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124833): https://lists.openembedded.org/g/openembedded-devel/message/124833
> Mute This Topic: https://lists.openembedded.org/mt/117991965/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


