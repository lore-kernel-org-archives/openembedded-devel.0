Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.348.1611597448705510931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 09:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3etX6BT;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id y19so28330583iov.2;
        Mon, 25 Jan 2021 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zXw0nwKLOGrEzVZfpc+xpcNCEs/tZApC+1qrMQHYYTI=;
        b=h3etX6BT8yQ1pxc5SjALhNqlsuZj+lexslSK9mRTGcxoMMdE+tj5xa9CNWFcDcPl31
         99Y1In7mGqig78s77ZNDZT2oQ+Mt0lLsVebXrtxEchXpM0hdbt/h8vCONan6h73qMsYz
         KkHEvSQNhy0zdLS4vST6OqoKP45uBV9Ghd6lqbAOvffj7PUESUoiCAcLtx2lnFRTRPMv
         2I7vvhGee7FpADnw4uPalrsHms/FiUh+2wjbfLc6eAk6agxVH4+PBgGZFUKw3o9DWAMV
         j5i5/K4s3CFLjdUskONRnnicWDA4h71jFWvhVxDwsEQjdbI2bEtP9t0+SIuBuY1ouxiS
         6vVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=zXw0nwKLOGrEzVZfpc+xpcNCEs/tZApC+1qrMQHYYTI=;
        b=bNrWkKl5pCdXWDcyaAHEKv+oqqaS6nywmGdHMfKJ2OZJx44wizTXRCNgKW0m1/IzDz
         M4W+C0APijv/v15LM+pCKwkoE4eLHQzROG+WDlWI4Y2w4uTJfV7VxCp6PyA4bLzPu6e/
         5y4b+jLIP6Sfjlj1DwjPZkmIMtDlqhECkejg87HrCbmd3HtvaqsrO35r7nSerk2PlXMM
         MAvCmWVzDSoKTTiK2ZgtGzaKIb+M/vQmusDpgUb1tTJLcnJAYqCRXa7TXGEwqsHabBO5
         lVt80VnnHYzFDZCiT4gm825I2teGhMStBKmraHA4r4QJHlVwSb1+klOAHdMErllbrhxe
         cvaA==
X-Gm-Message-State: AOAM530YQt41mSThwQTg94x9alijRzBPVRS3PKr8zWAboa3uTuTqSE1W
	q1dH8v5FuDvJr1LZ4wA+dE6vJTFFuOQ=
X-Google-Smtp-Source: ABdhPJyyJ1Dsark6Q3MXHoWksg4pcaKSajxJfP1UwdKxz53Z8F3Mbg4yrrMAN7rUVKUQY6/siugl3w==
X-Received: by 2002:a6b:3115:: with SMTP id j21mr1338597ioa.55.1611597447928;
        Mon, 25 Jan 2021 09:57:27 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5442:4b7c:f358:5471? ([2601:202:4180:a5c0:5442:4b7c:f358:5471])
        by smtp.gmail.com with ESMTPSA id r6sm11749203ilt.56.2021.01.25.09.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 09:57:27 -0800 (PST)
Subject: Re: [RFC] Issues with mariadb-10.4.17 and aarch64
To: Dan Murphy <dmurphy@ti.com>
Cc: Openembedded-issues@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
Date: Mon, 25 Jan 2021 09:57:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Dan,


On 1/25/21 9:45 AM, Dan Murphy wrote:
>
> Hello
>
> I was wondering if there has been any reports of the mariadb update on
> the dunfell branch causing issues with 64bit compilers when the 'pam'
> is set for DISTRO_FEATURES
>

I am not aware of any.
>
> There does not seem to be a compilation issue but more of an
> installation issue in which the lib/security directory is not being
> created.
>
> We are seeing issues in our arago distro with the following errors
>
> mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security': No such file or directory
> *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'

I would be surprised if this was just limited to Arm64.

Would enabling "PAM" and appending mariadb to an image reproduce this?

-armin
>
>

