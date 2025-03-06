Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE392C282DE
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:40:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.18505.1741279245161908268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 08:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BsRD9MgR;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7430e27b2so151922766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741279243; x=1741884043; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DK8SwHCmINGi5CuXGB6omr5BD+6Z94D8WeQ+LwV7JRw=;
        b=BsRD9MgRiAso6EXbYXWEvf1ipPZMEbhHJYeo5ho4zdByflgimku5DoiIX4tqK/eyZ/
         wfNoV577cvMQWQdSHXskPNRLWu88DYUjIkBHqKJk9bz/amFarKRT23nIzcusCFbW4Tur
         VWlKQh7uYeoMUKse9IH7Mp9nTaSrHus7uAUngX1ksyifT4fEk63Wz0ExnwQ7BnV0dafm
         2W4HpekTdX49iFWcTkkR1g9b3f8OvyiABn9WymgLFFpOnGAUlxxyzzfPIuDYoYR15k14
         fWjKLLNWRFGsU99liOA64E5aeEETt6aPn1aqMs94agVGzxVntUfhQvszSdA0WgXBPXl/
         9FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741279243; x=1741884043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DK8SwHCmINGi5CuXGB6omr5BD+6Z94D8WeQ+LwV7JRw=;
        b=I3sIfXcGugCqPSgrXHkd64aRzbBZeqN0ewHEwtYWzh4i34/kqXAsrklQnkuS8jJMoH
         7puz16GZczyE4PNgTqJQmJX1prCtdjscj3q70GvavM/C7Mo0SbVwlKcZD+9yPqcynByR
         3HZd5gVmIcRS8jvB8AeG65auzsLDPVsQRALg1BKV6KLor2bchiV/k/yDs2Ww7xT8HRra
         sB936NvprRmmJ0NKkZh/YT1k72YISZlanR0NuGAZRHW6WK/FIvKe3JRAL9qxHg7iPGbT
         leL302II3onQ21YHdqYlOyMskHJocFtohPUQTdbHLRR8aEdmdwMtMuLGnXQg8n6lB/ve
         4/og==
X-Gm-Message-State: AOJu0YwHBj8Jb6krzIgjWCQj9iP4K5XEVTZSmUSVlRIHJVa62NqEBjYW
	DvCwfD1CnCIjLggDoqrgagedcDqLfihuJDgbniXDDsEVZoh5pHh7
X-Gm-Gg: ASbGncuFKrH0fBn0Wh5LJhdv9d5YhGNFODW4X1MNvkuv2a9L7ywUDEeONR4AUoB7Yoz
	qfeeyPBkwjjxIfmAhdp3AcGIyJ06GTHlvPEPN0/yWvOHD6zMn34AhVWL32MMIO/KCBnxZ7CK/3X
	tIXO+ZW2iggHxU6U4QBVkbk7z9EXY7Fs5wDrEpGb3y0RfJMwJdeM8QMrZBxWHvq+GvpnFd+2V/h
	gYztcXx7e3PJiEtlhZGR4QbeRQCUzQvbH/xs0ShjrfEabrVHOuuYyUvsWzwwVSGmiFQDgzYVtgn
	pU5igfohKKIyRu6SMjIs1OuFAVs4GrGOEuaCzKRORZskwxFn/9mU
X-Google-Smtp-Source: AGHT+IH/0aFAqYfXjOxcHmJJIXDkenf+uyn2CQC8xPxZRfqpR9Nc82f5ZqPVRFvtQKNmoyQd+KaD/w==
X-Received: by 2002:a17:906:564d:b0:ac2:47e5:a1f1 with SMTP id a640c23a62f3a-ac247e5a81cmr103917966b.26.1741279243098;
        Thu, 06 Mar 2025 08:40:43 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988e590sm118762966b.150.2025.03.06.08.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 08:40:42 -0800 (PST)
Message-ID: <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com>
Date: Thu, 6 Mar 2025 17:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build
 output
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-devel@lists.openembedded.org
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org>
 <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 16:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115773

I haven't heard back anything, but based on my understanding the reason
seems to be the wrapper script, created by cargo_common class, which
includes config for both host and target.

$UNPACKDIR/cargo_home/config.toml has the following:
[target.x86_64-unknown-linux-gnu]
linker = "${WORKDIR}/wrapper/build-rust-ccld"

And in turn build-rust-ccld script passes all the the BUILD_LDFLAGS,
including the rpath ones to gcc, and it invokes it directly a few lines
later.

I think you would see the same issue on Ubuntu if you would pass similar
rpath arguments via RUSTFLAGS. E.g. if I do

export RUSTFLAGS="-C link-args=-Wl,-rpath,EASY_GREP"

(which is kinda comparable in a very simplified way to what's going on
in the script, in my understanding), then build coreutils on my machine
(without Yocto, just my OS), I see the following:

[meeee@desktop release]$ strings coreutils | grep EASY
EASY_GREP


On 06.03.25 16:59, Etienne Cordonnier wrote:
> Hi Gyorgy,
> it is nice that you found the root-cause. I had debugged this as part
> of https://github.com/uutils/coreutils/issues/6833 , but had not found
> why the yocto build had this issue and not the normal ubuntu build of
> uutils-coreutils.
> Have you received some feedback regarding this patch?
>
> Étienne
>
> On Sun, Jan 26, 2025 at 12:37 PM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     > -ERROR_QA:remove = "buildpaths"
>     > -WARN_QA:append = " buildpaths"
>     > +BUILD_LDFLAGS:remove:class-target = "
>     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
>     > +                                     
>     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
>     >
>     If this patch isn't shot down and you are trying to build this,
>     there is a
>     chance that it will fail: that's because BUILD_LDFLAGS is excluded
>     from
>     base config checksum, so your sscache might conflict with the actual
>     recipe state.
>
>     If you want, can send a v2, including a PR-bump, or something
>     along the
>     lines.
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#115101):
>     https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_115101&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=Yru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=1KkFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&e=
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_115101&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=Yru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=1KkFM14R2UQ7JO-6EseQURf5y34LFqkZw0utLRAXoTk&e=>
>
>     Mute This Topic:
>     https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_110820444_7048771&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=Yru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=YitLjZ8Dz37qUS8nauvE0C8CELqvGUPDhZo4LQ_5PzQ&e=
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_110820444_7048771&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=Yru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=YitLjZ8Dz37qUS8nauvE0C8CELqvGUPDhZo4LQ_5PzQ&e=>
>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=Yru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=KewRVjyJaNI2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&e=
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=Yru-Hz_1VrJInO_CPayuPmmjTpIq3jyiRHa5Rz7x9MqHysQQnpBZ6NRR143MBmi1&s=KewRVjyJaNI2vMrB_GXcyi4smxqyuSViorm5-wvLgXQ&e=> 
>     [ecordonnier@snap.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>

