Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631DCE7315C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 12:18:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51037.1770034719025412036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 04:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OjIfzHGK;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso40124275e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 04:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770034717; x=1770639517; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydGJIJWTKFuXX36fgfYDjrLrqF+Ji4BaUiFww6r3COY=;
        b=OjIfzHGKuF9HAuuYFi7PsWLKvxvBcct310UC6T+wHLLxyIgKoc8DV6iy7At3XBNz3F
         MNRjy/aeS1z3QMYxLO9EDMljQoXwbGzc7JXbyBQIiUaiNgkT1LivFfmbLqonTrP6xBfa
         h9MKPXbk9jZR2mpl3K2BeUR7ComVEE47+bbKullyGS8DGG5joumQSV25PVbN9qvMg8iA
         9q5qlnXetgxu5PdRrf1nY2rMguX5e7ILmpxJl7lD1GPSo9LMdYKqrnO9zIGuVvUxCKVE
         cc8GLaiT9wZpsxwNDsGNCvwi1jVaQ824w5Oe8XxDyc9MTYdF8CN9RlBcUx+M1gumuVud
         OhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770034717; x=1770639517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydGJIJWTKFuXX36fgfYDjrLrqF+Ji4BaUiFww6r3COY=;
        b=QZCNMyKv+5voR/5RwJe8WoLGxHFJS1OyDCBbGw3T+4ldsCj9u4PvmYmSMRm1kQ4vxB
         qT+g7Z2Na+e3IOlqddNfTZmfl3lUrxdhTZdpHVgzwz6CupbJY+lM4EgyiK42IQQRsRhh
         +pFfxEpbmbB+7Hwq+YwFzrE1UCj0wew6pZZbm09zYIFWsTwR73A98PRL57b+TYdC35Fw
         MfthToPRfh55HDmRawvimFdzSIMzQx0OVF/jeOZMbObLsdpvEaJ2FGsECGniWQxaG0/g
         woyYVyeoVsHUVe9xjOznqdsgz6IZDqctgEn7sry6V35wbaIrn3urAmYTnYX5m6Q6QF7Z
         Lt3g==
X-Gm-Message-State: AOJu0YzAQkOb+AfN8RjfiDIfMPpnY2zOFR2RZkVNq4uX/aftVlYdtxtF
	R4XT7aotos5BkRo+gSv0lsMbN0rl/r0WWd1aZAhnB4oXEYC9SxJApMDA
X-Gm-Gg: AZuq6aLbhY6Cpl3S9rgaR8cB/t77/TsMMKA2Ks9EkgEIRu6+S8HuAPj8q3ZnbsN4SOx
	cpflxiz75Ru31ssIU2sSVeTGocbYuqQNWnwDAGOGggX/pUERh8N6t4KWVp3bgtAputPAtyWC2ua
	7NEd81le/u4gkZZWe/bciYn8B5Wf2wRTqBDbDksQnWJX+RN5FD4bdnRztCnT+Sy8i9W5jikLqIY
	jSerwIFy048iLMezu0zG/sJKEvu1fVWZixSO2rMnqg0DEYCEFbz/aft42xvTg59odhh694lRBSV
	18IZHjiu1pjn4Lw6bGRm8/lGUfpdegvRMh+65eD2OgD9NzJgM+gPHKiIlnOWyAQQ+pwqXdQdVzI
	srltctpvZ4432IVyw40qXjvCdvGEX2tZnQlSoGfUi96rSJ614s3dmtcfoxhvcvF30e/BTNSNlns
	TSpyw2Py3EjWtHaTWFpqna+7HGYDDLAw==
X-Received: by 2002:a05:600c:8b42:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-482db49728bmr128371215e9.32.1770034717098;
        Mon, 02 Feb 2026 04:18:37 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267b699sm89996405e9.16.2026.02.02.04.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:18:36 -0800 (PST)
Message-ID: <4d7bb419-c430-49c3-b9bf-08175e4eafc9@gmail.com>
Date: Mon, 2 Feb 2026 13:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 0/3] Update and split mime-support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260131215636.2633863-1-skandigraun@gmail.com>
 <CAMKF1sqKVzcq67nyqST2QLmaxfiswhmFc5DmdimrMs=J3C9fRg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqKVzcq67nyqST2QLmaxfiswhmFc5DmdimrMs=J3C9fRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 12:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124058

On 2/2/26 00:59, Khem Raj wrote:
> Seeing this error
>

Hmmm, looking at this, there is at least one more issue with this series
which I haven't noticed before: the mailcap package already has a
provider, fetched from Fedora. It is similar, but not the same - it is
missing the executable scripts for example, which the Debian version ships.

Do you have any preference, how should we deal with it? Drop the Debian
version? Or rename it to mailcap-debian or similar (personally I'm
leaning towards this)? Maybe just keep mime-support name, and merge the
two packages, ignoring the upstream split? Something else?


> Loading cache: 100% |##########################################| Time:
> 0:00:00
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100% |########################################| Time:
> 0:00:21
> Parsing of 3443 .bb files complete (0 cached, 3443 parsed). 5840
> targets, 178 skipped, 0 masked, 0 errors.
> NOTE: The "universe" target is only intended for testing and may
> produce errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Multiple providers are available for runtime libva-dev-native
> (libva-initial-native, libva-native)
> Consider defining a PREFERRED_RPROVIDER entry to match libva-dev-native
> WARNING: Nothing RPROVIDES 'mime-support' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on or otherwise requir
> NOTE: Runtime target 'mime-support' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe',
> 'mime-support']
> NOTE: Runtime target 'meta-oe-image-all' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['meta-oe-image-all',
> 'packagegroup-meta-oe', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-crypto', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-security', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-printing' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-printing', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-test', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-devtools', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-support', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-extended', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-kernel', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-graphics', 'mime-support']
> NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-core', 'mime-support']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-shells' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on or o
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-shells'
> NOTE: Runtime target 'packagegroup-meta-oe-shells' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-shells']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS o
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
> NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-connectivity']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-benchmarks' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-benchmarks'
> NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-benchmarks']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
> NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-navigation']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-dbs' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on or othe
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-dbs'
> NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-dbs']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-bsp' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on or othe
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-bsp'
> NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-bsp']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-ptest-packages' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest-packages'
> NOTE: Runtime target 'packagegroup-meta-oe-ptest-packages' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-ptest-packages']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-gnome' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-gnome'
> NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-gnome']
> WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-multimedia' (but
> /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> <http://packagegroup-meta-oe.bb> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-multimedia'
> NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-meta-oe-multimedia']
>
> On Sat, Jan 31, 2026 at 1:56 PM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     The mime-support recipe is fairly outdated: it ships a 7 years old
>     version of the package - Debian even stopped storing it on their
>     server,
>     and the SRC_URI was inaccesisble.
>
>     With version 3.65 (in Oct/2020)[1] Debian has split mime-support
>     package into
>     two subpackages: mailcap and media-types. With that they also stopped
>     maintaining the mime-support package (baically it is now a package
>     that just depends on the two new packages).
>
>     This small series removes the old mime-support recipe, and adds
>     recipes
>     for the two new packages. Made the media-types recipe to provide
>     mime-support
>     still, with the intention to avoid breaking recipes depending on it.
>
>     [1]:
>     https://salsa.debian.org/debian/mime-support/-/blob/master/debian/changelog?ref_type=heads
>
>     ---
>
>     Gyorgy Sarvari (3):
>       mime-support: drop recipe
>       mailcap: add recipe
>       media-types: add recipe
>
>      .../{mime-support_3.62.bb <http://mime-support_3.62.bb> =>
>     mailcap_3.75.bb <http://mailcap_3.75.bb>} | 33 ++++++----------
>      .../mime-support/media-types_14.0.0.bb
>     <http://media-types_14.0.0.bb>        | 39 +++++++++++++++++++
>      2 files changed, 50 insertions(+), 22 deletions(-)
>      rename meta-oe/recipes-support/mime-support/{mime-support_3.62.bb
>     <http://mime-support_3.62.bb> => mailcap_3.75.bb
>     <http://mailcap_3.75.bb>} (58%)
>      create mode 100644
>     meta-oe/recipes-support/mime-support/media-types_14.0.0.bb
>     <http://media-types_14.0.0.bb>
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#124020):
>     https://lists.openembedded.org/g/openembedded-devel/message/124020
>     Mute This Topic: https://lists.openembedded.org/mt/117568653/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


