Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.36325.1605541556571211937
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 07:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L75yjx4s;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c20so14497356pfr.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2020 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=50FOWbEuQGR+ktByMa6sTi9zfRqrUQ8w5Rw7upIBy44=;
        b=L75yjx4s9jmAbne/ACuAn9rBTJ5d2at/9xEwtRou1h5SamgbpZvwVmsA1cJu4rA0kY
         nmU6kGK6ATn6N77FluhavvOiuWQnMEJG9PsuAsIg9Vh80N8m13Ffl+TQetrwRtUVPF0N
         Ps5fpsmkUsYY/WIqmydAfzGbHTq/A89/yyrCl4zucaHtVEBHAUGGvUH+IzP0TXhQ9Kpk
         O/b4/acf1sGz9+4epmGsv6R2IUPeGUKbpGw54Z+0ZH8K8Sc3kDt2hIlvpTy+AFIPPppm
         WlomHV4HPcOylQ1SxTZBbUpU6EpZqozLCfQ4B56dCm9I6NyqHXYZDY91hEK1GP6Vxmew
         13WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=50FOWbEuQGR+ktByMa6sTi9zfRqrUQ8w5Rw7upIBy44=;
        b=uL6DvYM/fKwCOu+UVnTt/RtkznhRDkktvUhT2BuOJgEM/ogoj229tBigvH5IUpnbIe
         niVCXW1LCS6KWC0IzEtEopO0pN1oMqZdI8VE4ZR+Sd3Q+Eywe2HnM6JQ3srWAyAdK1xr
         daUjk7Y1mN5GkJwYZtbvClIE5gU0hPYMXYnm9LNqfEgQEKPYnAHGFJl+WCamq6aesMNJ
         +vHcIlOumWn2OhktXhirCoTV4gJkV4FNHri9WErldDSRw4UYMEoEWWpIp/rCpQxn6lzx
         V+gLSvs9rSAC6LhJjhgn/CrpYiRnlF4A1vjaCVXVNcPRQbkcKKruMp5oC+1sEyOxtWQn
         Bqog==
X-Gm-Message-State: AOAM531fwPeealfYf4uRnJj+QV33Mj/HWoUy1zcXQhCg96ZjDm/H00/q
	H4pwSfj2uv6iUWureF1Z30k=
X-Google-Smtp-Source: ABdhPJzgONv8Jd/gI9beABtXy4iw1eHngqjrmiKsSQyqLG2Cbh2yVDTt7I9cjwOchwPjvYrZhQVncA==
X-Received: by 2002:a63:570b:: with SMTP id l11mr13502216pgb.110.1605541556117;
        Mon, 16 Nov 2020 07:45:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:40b2:a73b:6770:85fb? ([2601:202:4180:a5c0:40b2:a73b:6770:85fb])
        by smtp.gmail.com with ESMTPSA id i11sm5441894pjl.53.2020.11.16.07.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 07:45:55 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] usb-modeswitch, usb-modeswitch-data: fix usrmerge
To: Ulrich ?lmann <u.oelmann@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <16417565E85E3454.9771@lists.openembedded.org>
 <1645C54B3A3F0288.10479@lists.openembedded.org>
 <6rsg99vg1j.fsf@pengutronix.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <2885ec60-dc02-d0bf-6d52-5e055571b4ea@gmail.com>
Date: Mon, 16 Nov 2020 07:45:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6rsg99vg1j.fsf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/16/20 12:53 AM, Ulrich ?lmann wrote:
> Ping!
>
Thanks for the reminder,

Its under test in
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

My build system is under powered so it takes longer.

-armin
> On Mon, Nov 09 2020 at 08:09 +0100, Ulrich ?lmann <u.oelmann@pengutronix.de> wrote:
>> Gentle ping!
>>
>> On Mon, Oct 26 2020 at 07:00 +0100, Ulrich ?lmann <u.oelmann@pengutronix.de> wrote:
>>> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> (cherry picked from commit 50a487fc0b0123b154db73f79bbb18b23eb234f0)
>>> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
>>> ---
>>>  .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++--
>>>  .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
>>> index 938c0f9c26bd..ca970e59bb3a 100644
>>> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
>>> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
>>> @@ -11,9 +11,9 @@ SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
>>>  SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
>>>
>>>  do_install() {
>>> -    oe_runmake install DESTDIR=${D}
>>> +    oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d
>>>  }
>>>
>>>  RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
>>> -FILES_${PN} += "${base_libdir}/udev/rules.d/ \
>>> +FILES_${PN} += "${nonarch_base_libdir}/udev/rules.d/ \
>>>                  ${datadir}/usb_modeswitch"
>>> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
>>> index baad340908ac..6a5287af4959 100644
>>> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
>>> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
>>> @@ -19,7 +19,7 @@ RDEPENDS_${PN} = "tcl"
>>>  RRECOMMENDS_${PN} = "usb-modeswitch-data"
>>>
>>>  do_install() {
>>> -    oe_runmake DESTDIR=${D} install
>>> +    oe_runmake DESTDIR=${D} UDEVDIR=${D}/${nonarch_base_libdir}/udev install
>>>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>>>          install -d ${D}/${systemd_unitdir}/system
>>>          install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
>>>
>>> 
>>>

