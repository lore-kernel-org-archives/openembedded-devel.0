Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AEAE68149
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 08:51:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8259.1771318313658704021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 00:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJtnpqkW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so28455215e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 00:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771318312; x=1771923112; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puqt+BEAtHU1VOOpf+ZFNFNvkBUmtBDagfOt7wQ5Oes=;
        b=HJtnpqkWd/FImOYHfNXe3ANq/sashLRA9f22f2Fldfne5WyGczTwbURMTAmmJLxdX4
         v4r+G5SIbOyccJKiSplDT8jLVrlpKiDadBkTV9CefkNuRtJAIH5CLpOwEK4BXqhkyCUH
         YkMAYZ5yeaP+8+jCwOeFrqMHLNnb7bck0ieIZHqdR0eeZz+tx9HQT/zUMpvH8KHiqoSx
         zHbZ5fwnRclUEd/LETvBRXI8L8uC6SfvFrJc0rHe1NKa8kC9GghwbuirwngnK3OugQL6
         lzu07JkBTChBOFaBMOQNBsri77Mjls6Rywz/52kEG6kH4hRuXvgkUMrE/yNtSZMkCRQu
         YhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771318312; x=1771923112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puqt+BEAtHU1VOOpf+ZFNFNvkBUmtBDagfOt7wQ5Oes=;
        b=bUpfqf5FQVv2dpXWBTuA6epBC8WgcgV3Fl80M+qGogFM+CKFzyvQNtj69XMG49qN9/
         gfifrEmXMAp+8JtveVecYmSTIlW80O5vWdAMaTwBjFWxIlnRz6Sjr6apszb9tsGAeemu
         EWfbO4mWQnXER6JCSPDVhbUH9yC4kwL0vX65nYuWfRp8zc+8dCgRqGORcB32W8O7aB59
         mSYLBCJMbMK4QmJ3aOyYRnPLrFbCY2AK+pq7cDXcmSTlok7OTOeJWVPsGXOjPQbIjLA0
         T2LmWMR87Lkg142pOo9xVVLWLC/Hckhy3SG4NWzojvHTTAqoEwUalfDDS1qWd6B8uNg2
         KgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEj6zAwDBTuFwyPoD8TCwWmiSd8bxnHDsipA9B1YFx0LPM2vnR+Hgqt8uIWbHvLSR0Utio5hq0nwSa4Uf8orkfFTw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGCeuxNk2vi1YcZpNWND5cMbAZ6tEMEpCAb7yCD3/Xn7oekG5f
	VJY7hkDnv49D5Wob0Ve4rWe0pR4Yt+h4arz0XMuyVO9EONkoS2bJuU2G
X-Gm-Gg: AZuq6aKxZ7JH1uIoMsPuL23IVGNRr+TWE80HUlyYi8f/eOSCJGTSiIsHQM/WNwOiOXZ
	AYCPXW/ruVQB61+ip45CVIBDG3sjSNmqcr+RvDE8lUTNQA3w+1AU4/kSio74vfsXu4C1SCzIV5/
	MCRJzhnO9pdzufM8KyZMgLs1K9FQ4NIA7VQKnAtUW5qNp0UvlPhXVpqF2m7gy6fagkdUF/TY/xT
	oVKhG9BWqMWb/42ox0lWA1x3qJlUYYwuUV0tgF6sR0KgAmS0miBWwMY9Fm/ySMnBow2lguz8DRF
	F2/G7oedW5GbbQNcs6whEyx9S2hsdRyXF4kw4Q3LkX3MMniLnk6Z42iLeffvsROL9wUVVCLOHNT
	KMz9eD5GDo0++M5WTjq+9JJw9/KW70y+pi9pZ/WckqotvzijusoXRTzMZEaoPgV3kR2RHrEW/JO
	jtxr4Of1MfjdXEEwzJnJLWQTYCcE2F9+OfL55xQ5WnMQ==
X-Received: by 2002:a05:600c:4e56:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48373a58997mr238552805e9.31.1771318311866;
        Tue, 17 Feb 2026 00:51:51 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm308263485e9.2.2026.02.17.00.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 00:51:51 -0800 (PST)
Message-ID: <f5e65e58-d861-4d71-bb37-b421cb19e00c@gmail.com>
Date: Tue, 17 Feb 2026 09:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
 <189484259C10B564.151929@lists.openembedded.org>
 <1894CA12D56D82D6.964619@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1894CA12D56D82D6.964619@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 08:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124440

On 2/16/26 18:25, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 2/15/26 21:03, Gyorgy Sarvari via lists.openembedded.org wrote:
>> On 2/14/26 02:35, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
>>> Fix the following error:
>>> ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['tigervnc'] have failed. If the intention is to defer them to first boot,
>>> then please place them into pkg_postinst_ontarget:${PN} ().
>> How could I reproduce this?
>> I added tigervnc to IMAGE_INSTALL, and built it once with systemd as
>> INIT_MANAGER and once with sysvinit (also added systemd/sysvinit to
>> DISTRO_FEATURES), but the build succeeded in both cases.
>> Am I missing some config step?
>>
> Yes, I was missing an important step: I wasn't trying it correctly :)
>
> I could reproduce it... but I'm not sure if this patch is how it should
> be solved.
> Currently it looks that systemd integration is broken for this recipe.
> systemd is complaining during rootfs generation:
> "Failed to enable unit: Refusing to operate on template unit
> vncserver@.service when destination unit multi-user.target is a
> non-template unit"
>
> It says the same during runtime too, when I try to enable the script
> with systemctl.
>
> Not really sure what this error means in English, if it's only a problem
> with the script name or something more. Will try to mine it from the
> systemd docs (if someone knows the answer already, please feel free post
> it).
>

I think managed to figure it out. Most of it is also present in the unit
file, as a comment. I suspect this has been always broken...
Now I think disabling the init script as you did makes sense, but I
believe the recipe could use some extra changes.

The issue is that the init script needs a target also to start: though
the script is called vncserver@, it needs to be started as
vncserver@TARGET (where TARGET is a display number associated with a user).

Due to this I think "SYSTEMD_SERVICE:${PN}" should be weak assignment
(?=), so users override it easily to set it correctly.
Maybe it could also have a valid value, like "vncserver@0.service",
thought I guess it's debatable if it's better than the original.
I think the recipe could also use comments how to enable the service
(most likely it's enough just to mention that further steps are listed
in the unit file itself)

What do you think?

>>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>>> ---
>>>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
>>> index a5413a9108..12854632d5 100644
>>> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
>>> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
>>> @@ -95,6 +95,7 @@ FILES:${PN} += " \
>>>  "
>>>  
>>>  SYSTEMD_SERVICE:${PN} = "vncserver@.service"
>>> +SYSTEMD_AUTO_ENABLE:${PN} = "disable"
>>>  
>>>  CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
>>>  CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
>>>
>>>
>>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124430): https://lists.openembedded.org/g/openembedded-devel/message/124430
> Mute This Topic: https://lists.openembedded.org/mt/117803450/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


