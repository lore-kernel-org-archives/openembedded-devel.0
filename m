Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id D417D77D3C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:35:30 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h4so3983353lfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=WMFdcOGNq5JiOk1XASQPtXyXTpPWFDy0Sd9ZCY4USV8=;
	b=YwkZAmgXBClTT0iF8pHXX3VSK0bqPRmcAco4pZ+SW2loCaEuM8fEXVVDl+ZJ5eLyBT
	s2TsQP4SyeR68RZA3zAld7+GE8q9hqvyovt4kAvylWolvI1uH9FRLD5JIaKdP84Kw6OO
	Zd9geGcbYXarqbEBho5f4ZKIKXJpq5TihODj6ixusNjlc0CC2PSBhLus0EIzQkY4n7QR
	cDM2xv4s3VHr7iBoY5BNbT5zAUva/ohNBF+jrAbeb6rCeE/pewi2mxoLF6nVY2syKu5c
	gccka1pKFsmHVxB7pmGzq27EcyDHhzbmNUAyFGA7uXw+e+A4+9dxfTAS8vZ3p8UnPX/z
	aeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WMFdcOGNq5JiOk1XASQPtXyXTpPWFDy0Sd9ZCY4USV8=;
	b=cqMDZUoCKxIQOQZSkaQ3m9KtaXgHevyjkNUjkHX54YVIqzjSLJ/WPoiE1LaZGv5Hlw
	8sw5I1z2Jtg6NFe0VxgjnRrodNYdAJSEYCkeVWyj4ST8bqBMxWFmO3ShhuUYpcOAH/Pq
	b1NY/QyBj3ZZiiUW+ACsI6TCo/PqQQ8RchRXIEtiaNSofLfoA3D4ZAw/FGrH68v2BJql
	56fJMbwQNSdAQMr2GDK9Vu0DcFjK46fRgOo0H3mDujqMZu6gaS4BBP6AgD0Avqnu2dKH
	AiezbuhI3HRkw27cvJvWBjj4g2KTNBDWPnRfDR8hfM5k7qfYBWj6CSg7ahuxB3gB/fWP
	c2bw==
X-Gm-Message-State: AODbwcD2HCE1r1T3Ia0duJIQmxkxXV5iWg6XlDPQJE4bLDGV6Qd63TS4
	huD4YFKvpOiiNlzw
X-Received: by 10.46.82.144 with SMTP id n16mr499348lje.0.1496320531286;
	Thu, 01 Jun 2017 05:35:31 -0700 (PDT)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	r38sm4415226lfi.4.2017.06.01.05.35.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 05:35:30 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
	<6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
Date: Thu, 1 Jun 2017 15:35:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
Subject: Re: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jun 2017 12:35:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.06.2017 10:30, Daniel Mack wrote:
> On 05/31/2017 08:40 AM, Samuli Piippo wrote:
>> * adapt QtWebEngine recipe to use GN instead of GYP
>> * add QtRemoteObjects as a new Qt module
>> * update available QtBase configure arguments
>> * remove obsolete patches
>> * patch all .pc files to remove build paths
>> * include generated QML cache files in packages
>> * the patch "configure paths for target qmake properly" could not
>>    be applied anymore and support must be done differently
> 
> When trying to build qtwebengine, I get the following:
> 
> | [1/330] CC base/third_party/libevent/buffer.o
> | FAILED: base/third_party/libevent/buffer.o
> | cc -MMD -MF base/third_party/libevent/buffer.o.d
> -I/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/build/src/3rdparty/chromium/tools/gn/out/Release/gen
> -I/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/git/src/3rdparty/chromium
> -I/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/git/src/3rdparty/chromium/base/third_party/libevent/linux
> -DNO_TCMALLOC -D__STDC_FORMAT_MACROS -O2 -g0 -D_FILE_OFFSET_BITS=64
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -pthread -pipe
> -fno-exceptions -D__STDC_FORMAT_MACROS -DNO_TCMALLOC
> -D__STDC_FORMAT_MACROS -O2 -g0 -D_FILE_OFFSET_BITS=64
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -pthread -pipe
> -fno-exceptions -D__STDC_FORMAT_MACROS -DHAVE_CONFIG_H  -c
> /home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/git/src/3rdparty/chromium/base/third_party/libevent/buffer.c
> -o base/third_party/libevent/buffer.o
> | /bin/sh: cc: command not found
> 

Parts of the chromium is built for the host and requires gcc-multilib to 
be installed when building on a x64 host. I should have noted that in 
commit message.

My /usr/bin/cc is a symlink to gcc

