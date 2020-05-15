Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.15454.1589556133924204007
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 08:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojvD9MVR;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id h10so3077036iob.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4shAyxyilaH4R2IjbYr7qj0dvCSDMD4/D2mNBpRKaWA=;
        b=ojvD9MVRW1mW7C384Iq+FZ3RdSX+ttBIFID7DFzmC+MCnTIK6lBuPh2CwshNVDLtH7
         i996IqTUOCQwC0O49jWVeDJDbqAm3GIWRrUxNWx+DlXEToRFFxCCOq8ZQZARQjEced3R
         bkh8Acxpqr6HSD4dtrg7Ee+0gMVv0LSZj3LUN8Upv452BGHiiGELmGMCRPaiDePyGX7o
         5cbNk3ObVBGpHw+neBAgoiB1VzjWqyz5qb/m6auTi+dGEjYjQWQBQCYKH/qeCepMgTgc
         nwOZhsl1PVy8ilDjd5wuBeW5liylK+QgwygZ7tw6UHnKblqqzkGs9VWA7pCaq593ipJ3
         qqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4shAyxyilaH4R2IjbYr7qj0dvCSDMD4/D2mNBpRKaWA=;
        b=aRxJY1+gN0wniTu9FXM627qpW/Gspz2Ejn54CvL/XHh18OAQvlzYaGabFK8grNfP4i
         KSDAwW4RpFPkU+IQ2WQKrJTaSbE+AqCN31yC81WcP7dUSb8SYjLN7cShK/ZgWmHqwPqh
         mGK/hOmrumMntMK6wtstCPNGMhU3ZAlGPjNqcFd5MD9KN+sIg9Qwfa/wfFZ7cQtOcKVa
         zzsYm4YRR6pMIxLXgGqU4rH6Uzb0Ux13pQhskYWFYrtE606EOJsv/por2Vhai06yOREi
         CLjKH/tDV9QqoEikJw69O9xMwcfLMM7D7RZXbdWCH9Vjk5T1cEW1mg9WoMYos3DScnrZ
         djcQ==
X-Gm-Message-State: AOAM533+oXCxVmYdnZoIDtaSYX5/f8gbtINcgxDOIJKYABy2xIvUlmpt
	BuUM2oGPqtHJ6MTOeJF4/9U=
X-Google-Smtp-Source: ABdhPJztp70kyz9lHup7OrRs5WKXvlmyxWsEpB3xK0VZClZ51b7QowD62BHNOuQK2Px5q3ss7WB2ig==
X-Received: by 2002:a5d:8591:: with SMTP id f17mr3463191ioj.26.1589556133172;
        Fri, 15 May 2020 08:22:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:33:f6fe:2ae3:dbd8? ([2601:646:9200:4e0:33:f6fe:2ae3:dbd8])
        by smtp.gmail.com with ESMTPSA id 17sm1023771ill.14.2020.05.15.08.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 08:22:12 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Martin Jansa <Martin.Jansa@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Sean Nyekjaer <sean@geanix.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20200515121436.2078760-1-sean@geanix.com>
 <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
 <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <ee978f33-6598-d425-2ae9-1784690b7ec3@gmail.com>
Date: Fri, 15 May 2020 08:22:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 5/15/20 8:07 AM, Martin Jansa wrote:
> I was seeing this issue also on arm (raspberrypi4), so it's not specific 
> to aarch64 as subject says.
> 
> With this fix I'm still seeing build failure:
> | ppsthread.c:1281: error: undefined reference to 'pthread_create'
> 

Perhaps also set LDFLAGS = "-pthread"

> going back to 3.19 fixes both issues (so it's not caused by my setup).
> 
> On Fri, May 15, 2020 at 2:24 PM Nicolas Dechesne 
> <nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@linaro.org>> wrote:
> 
> 
> 
>     On Fri, May 15, 2020 at 2:14 PM Sean Nyekjaer <sean@geanix.com
>     <mailto:sean@geanix.com>> wrote:
> 
>         Explicitly add ${CC} as linker, for it to understand -Wl option.
> 
>         Signed-off-by: Sean Nyekjaer <sean@geanix.com
>         <mailto:sean@geanix.com>>
>         ---
> 
>         Alistair please check in your setup :)
> 
> 
>     I had found the same error on dragonboard/arm64. This patch fixes
>     the build problem. Note that I have only done build test, not run time.
>     thanks!
> 
> 
>           meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>         <http://gpsd_3.20.bb> | 3 +++
>           1 file changed, 3 insertions(+)
> 
>         diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>         <http://gpsd_3.20.bb>
>         b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb <http://gpsd_3.20.bb>
>         index 0914f7ec2..5463c8231 100644
>         --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>         <http://gpsd_3.20.bb>
>         +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>         <http://gpsd_3.20.bb>
>         @@ -35,6 +35,7 @@ EXTRA_OESCONS = " \
>               systemd='${SYSTEMD_OESCONS}' \
>               libdir='${libdir}' \
>               manbuild='false' \
>         +    LINK='${CC}' \
>               ${PACKAGECONFIG_CONFARGS} \
>           "
>           # this cannot be used, because then chrpath is not found and
>         only static lib is built
>         @@ -44,6 +45,7 @@ do_compile_prepend() {
>               export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>               export
>         PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\"
>         pkg-config"
>               export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
>         +    export LD="${CC}"
>               export LINKFLAGS="${LDFLAGS}"
>           }
> 
>         @@ -51,6 +53,7 @@ do_install() {
>               export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>               export
>         PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\"
>         pkg-config"
>               export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
>         +    export LD="${CC}"
>               export LINKFLAGS="${LDFLAGS}"
> 
>               export DESTDIR="${D}"
>         -- 
>         2.26.2
> 
> 
> 
> 
> 
> 
