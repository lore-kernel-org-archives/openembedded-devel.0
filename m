Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.17525.1616994851165034228
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 22:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TUIENsRe;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id l123so9109840pfl.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 22:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hlbC45xF3LuZM7nupLtQGjmWmyE+l7HyHvqTeB++FYQ=;
        b=TUIENsRejb788Et9nWGGSpV4Qh8Rw+VuQXda0RJuVSN6Np0U7TVEGKzHnbmLv/OzmD
         f15fJ3r00H0fdCZryMZTTP2igRgbCO4fsAYclb5uKWTbSi2Yexyn2Hk3E0VirLDTLIBI
         UCrG1gA7Ckf+GZ/sTFqjoyeWpeiu63NW0ZbwtB2VMXlINT1F4lehhX5x+gGuwCu1ANWl
         GGgPrFsNTySG5twVK2a2odULw0xvPs7guICSJGz8oCGtAFfGPUt2WfgWmztP4YwLUPW3
         tICHgnQnCyvfBqYeSHHMmjbanBMR1p7kIaucYq2wA3LlFru80B995vTPDg7CTzEbTQYt
         dpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hlbC45xF3LuZM7nupLtQGjmWmyE+l7HyHvqTeB++FYQ=;
        b=jxakntxJdcywq917S7/QnUo3N4mUCeFOstspulHD4xYgk1m7Yj8VkMq0zKAVyBYml4
         c+Onyon4znl5PXuqK2ORNSWDtVk9e/Jkzyi+LGwvtlsV4jk/NOK4VtQMzHLwfbeiDO1f
         ZlbiAifiz6mTZeuy7hLQSsNa7W2tfmGRRpHh3ULmuYljcv7NpRWQdV15w8MlsC6e0HvM
         DvDTsmMtUcdQ1QWM+FLBwi9JwwGN9pX37uccW7HdZ8xzFYEwO4XO9VxOvUo84/YO9JA8
         Kb7015slbvzBPneaId1rTjZzfCoMvUGSRWk1bUOBmK6vK5rIjym1jT5LoeAW/+yKIW2m
         eHTA==
X-Gm-Message-State: AOAM5317rCBYMtwe+OiX08r/Bfk679X4rdLBmwfcZyYz/xcm4CgqVWaR
	ftcY4iHy50TflJOwBU9sJGn1MjlSsek=
X-Google-Smtp-Source: ABdhPJwa4fyHf/4UW7H7BuVkn8XYxERAE1fnM55WB3Izy8TR5LSfiWRxw1lqgp2NqJRkWsttFxa/Jw==
X-Received: by 2002:a62:2a07:0:b029:214:fd95:7f7 with SMTP id q7-20020a622a070000b0290214fd9507f7mr23910291pfq.60.1616994850370;
        Sun, 28 Mar 2021 22:14:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:bd6f:140d:c71:b10c? ([2601:202:4180:a5c0:bd6f:140d:c71:b10c])
        by smtp.gmail.com with ESMTPSA id z8sm14483219pjd.0.2021.03.28.22.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 22:14:09 -0700 (PDT)
Subject: Re: [meta-oe][dunfell][PATCH] freerdp: Add missing libxkbcommon WL dependency
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
References: <20201204234722.20315-1-marex@denx.de>
 <df600449-0f38-223a-e91a-c2f9bb6bd51e@denx.de>
 <760ce487-ef1b-3022-bfc4-36a68d13d25b@denx.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <73b914d2-c05d-4b81-99a5-9ef406b9dc73@gmail.com>
Date: Sun, 28 Mar 2021 22:14:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <760ce487-ef1b-3022-bfc4-36a68d13d25b@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/27/21 5:47 PM, Marek Vasut wrote:
> On 3/12/21 3:18 PM, Marek Vasut wrote:
>> On 12/5/20 12:47 AM, Marek Vasut wrote:
>>> The WL build depends on libxkbcommon, so add the dependency.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>>   meta-oe/recipes-support/freerdp/freerdp_git.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>> b/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>> index 7cafbb799..82ef561fb 100644
>>> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>> @@ -40,7 +40,7 @@ PACKAGECONFIG ??= " \
>>>   X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv
>>> libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
>>>   PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON
>>> -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON
>>> -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON
>>> -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
>>> -PACKAGECONFIG[wayland] =
>>> "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native"
>>> +PACKAGECONFIG[wayland] =
>>> "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native
>>> libxkbcommon"
>>>   PACKAGECONFIG[directfb] =
>>> "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
>>>   PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
>>>   PACKAGECONFIG[pulseaudio] =
>>> "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
>>>
>>
>> +CC Armin, would be nice to have this picked up.
>
> Any news on this ?

its in the queue

thanks

