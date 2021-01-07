Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.251.1610052182465223199
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 12:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rPN325SA;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id s21so4620969pfu.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Jan 2021 12:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GC4vBcotFhHP1TlXIhuJtb3ybxoIOWVTz2GLq3ev/7Q=;
        b=rPN325SAbpyIh9ZFBN5DOg+/MGAqQgcwNUKRqMy74ulwRTT5knQ39EFaipBq3oXcYV
         VtYLsPWxG8oBHu5vlgJ6c9FbeJ752HicB3J3+wsX3RwszbOWYZkgMDoGJofaRRge2B99
         c8HW+mNL8XwkRc6x1SR3+0l5UwvLb5OG/f1e2JJo88O6oqfL6pZk8rI4D9yYsTjnQRtt
         yHwlyNjP+Ioev7NzbbouoQM+RDF1sFpaSRUIbCyKIOK4z04DqmlxeZJ1O1Cp3gm3MPSZ
         bYkQC2uiwBz/joE5MdrHbqEVvV3mKBET/SlMg1LMWuWFaVfPWnFanr5YaEdd+g25xxzW
         mHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GC4vBcotFhHP1TlXIhuJtb3ybxoIOWVTz2GLq3ev/7Q=;
        b=cnavHTHZOnn6eoEJUsQ1gBQKc9qFD+nR7wEnux5hj7bSyfOz+opUi3QuVT0l/zgHK9
         59qS7jhhOlltaDHfw2lKWR9YMkPIi5Vv7Hawnr7KrYBUjCLxO7tMx8cFa9SYinumX0Qv
         sRTSHJrGRrHWeaLc+6Vmc9DFhF03tp52mrEr972Eomr1gdXTueYBntZfcI1diAmTTmYP
         K9yHyRjYWZlaUPYI3qnlztAlglNQk5A70VxFm+QBj0voIRxOIxNZbP4EQYZGJELxO+4C
         AKLLYDo84/iCpxOLU1XuxUV33KB0HKY95AVcErf7gEaXr9ITUKB9h6cPhbMiuAg7iG7b
         WXfg==
X-Gm-Message-State: AOAM531b7l1inFJFaAcyZEHHB765KCwuPz7M2FXdSPk3PxYgK2KAP4el
	nk6zxkKJ3iZMFdl+m2Ev3/I=
X-Google-Smtp-Source: ABdhPJzzPrqxhugkIbxAWBL//8lYbHDkZEq+ii12M78kPaQOEYOoF7v/CrihN9wHzPmD/Q+tQGhn3Q==
X-Received: by 2002:aa7:9055:0:b029:19e:4bf4:c6bc with SMTP id n21-20020aa790550000b029019e4bf4c6bcmr3722376pfo.58.1610052181965;
        Thu, 07 Jan 2021 12:43:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:5c56:5407:3123:1ff9? ([2601:646:9200:a0f0:5c56:5407:3123:1ff9])
        by smtp.gmail.com with ESMTPSA id k11sm6851713pgt.83.2021.01.07.12.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 12:43:01 -0800 (PST)
Subject: Re: [oe] [OE-core][PATCH] go.bbclass: don't stage test data with sources of dependencies
To: tperrot <thomas.perrot@tupi.fr>, openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
References: <20210107180238.1866108-1-thomas.perrot@tupi.fr>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <0319ba44-3ac6-d21c-b483-4ce0dba17ff8@gmail.com>
Date: Thu, 7 Jan 2021 12:43:00 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107180238.1866108-1-thomas.perrot@tupi.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Thomas

This needs to go into openembedded-core mailing list.

On 1/7/21 10:02 AM, tperrot wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
> 
> As for the sources the dependencies contain test data, ELF files and other
> binaries which aren't necessary for building and which lead to unnecessary QA
> warnings.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>   meta/classes/go.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 5b26378a4e..fa147892b0 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -116,7 +116,8 @@ go_do_install() {
>   	install -d ${D}${libdir}/go/src/${GO_IMPORT}
>   	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
>   		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
> -	tar -C ${B} -cf - --exclude-vcs pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
> +	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
> +		tar -C ${D}${libdir}/go --no-same-owner -xf -
>   
>   	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
>   		install -d ${D}${bindir}
> 
> 
> 
> 
> 
