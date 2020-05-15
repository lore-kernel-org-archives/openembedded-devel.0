Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.14775.1589553754357837601
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GxpfAUSq;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id s10so2971741iog.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wo7RQRdK0lc4JNhPlbconLVzx/47jEPn+ohCManLzNE=;
        b=GxpfAUSqFtiuIj6tv1sHZOIARbVGQouvT8kQd8MsM8ih5mJCVsjF+EtLbkdFxz0NQ/
         k5jvMN4uX654JqiuvY0whqNXXwU/Kjj0GWoSW1MkVdJEkvHwW+feXVWP3xQAsIVY0YDp
         l0LplgD4qunPq4NGofPFhJRsvf0lHXJ3QxX1cZWul1prWikh46VFFUHqtwKgFgG9TMNq
         +cU234v3j3jKE7GGeS0L3Q8xUPHt3e25uuez7F85a39Anig2gzD5z9rTLiLyRXHRv0io
         gDmLmx+J4x++yx5z5Ynb79wk7QskeQmln7FuiCsUbOCKfayhGVqK9tm4ug8WEozuzLV8
         SOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wo7RQRdK0lc4JNhPlbconLVzx/47jEPn+ohCManLzNE=;
        b=bKah1PiBFyHVDnXJK2d7733BtFOWjVsJ/HUyCkq6x74fIFtRgvvxOK1FLzGTtg68HM
         D2sw53nHLPdZSod+oTJeJfa0ByL8nuDwMPEH6a+KQDJNBfp+YMzOIQgk9XpgMPs6o5Eg
         c547TsKkvjk866sP3r1Ir60717yCLTMNUZziug+evdSz+mx25aVMPEguy5QC4tKXiN8h
         iJ/kSgS9s3/83KchZac/UZtxuKbwYcHUR/iSLV4E1A/baXBciD9KI9t7IDBUAp68MP+M
         CIBlRuHB7bvfplB3vXAt7v6SysOjhdOA4TkdHvhPUhCwjBcXP01dOSQIzuZXJrs4VhTG
         hUuQ==
X-Gm-Message-State: AOAM532KLpIPZjtgl5viHNExKEH7VQhZFzmrnheWScXpdUbcixGldwvx
	iwxQS8mtbgyG69Y5uHaQazc7+xuPEvw=
X-Google-Smtp-Source: ABdhPJyOItg6JLx2MLsT88lp1WCMP8pgnryPa6i73z5SdncCU7Dpx/LRq7FcP+dQdx8M+DKVQbycPw==
X-Received: by 2002:a02:2a47:: with SMTP id w68mr3516688jaw.76.1589553751382;
        Fri, 15 May 2020 07:42:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:33:f6fe:2ae3:dbd8? ([2601:646:9200:4e0:33:f6fe:2ae3:dbd8])
        by smtp.gmail.com with ESMTPSA id k5sm488484ilg.55.2020.05.15.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 07:42:30 -0700 (PDT)
Subject: Re: [[oe] [meta-oe] [PATCH]] gpsd: Upgrade 3.19 -> 3.20
To: Alistair Francis <alistair23@gmail.com>, Sean Nyekjaer <sean@geanix.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200511174505.2128564-1-sean@geanix.com>
 <CAKmqyKMtHjKwYpykOEAOCNp8YRqTsGQyKFfSv+ZnR+juxFfnww@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <2410d548-7b7d-6561-d7c1-87f168960757@gmail.com>
Date: Fri, 15 May 2020 07:42:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMtHjKwYpykOEAOCNp8YRqTsGQyKFfSv+ZnR+juxFfnww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/14/20 11:09 PM, Alistair Francis wrote:
> On Mon, May 11, 2020 at 10:46 AM Sean Nyekjaer <sean@geanix.com> wrote:
>>
>> Revert "SConstruct: Add test for sizeof(time_t), result in SIZEOF_TIME_T."
>> Do not cross-compile a small for it to be executed on the host.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> 
> This causes gpsd to fail to build when cross compiling for Aarch64
> with this error:
> 
> | aarch64-oe-linux-ld
> --sysroot=/home/alistair/oe-master/build/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot
> -o libgps.so.25.0.0 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> --sysroot=/home/alistair/oe-master/build/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot
> -pthread -shared -Wl,-Bsymbolic -Wl,-soname=libgps.so.25 ais_json.os
> bits.os gpsdclient.os gps_maskdump.os gpsutils.os hex.os json.os
> libgps_core.os libgps_dbus.os libgps_json.os libgps_shm.os
> libgps_sock.os netlib.os os_compat.os rtcm2_json.os rtcm3_json.os
> shared_json.os timespec_str.os libgpsmm.os -L.
> -L/home/alistair/oe-master/build/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot/usr/lib
> -lrt -lm -ldbus-1 -lbluetooth -ldbus-1 -lrt
> | aarch64-oe-linux-ld: unrecognized option '-Wl,-O1'
> | aarch64-oe-linux-ld: use the --help option for usage information
> | scons: *** [libgps.so.25.0.0] Error 1
> | scons: building terminated because of errors.
> 
> Reverting this patch fixes the issue.
> 

Stragely it does not show up on OE builders for qemuarm64, Somehow LD is 
set to bare ld, perhaps setting LD from what bitbake brings into 
environment should fix it.

> Alistair
> 
> 
> 
> 
