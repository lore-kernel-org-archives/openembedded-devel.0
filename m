Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.4169.1621725374310782305
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 16:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=COIfNYSY;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id n8so7557082plf.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 16:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OAeLvHmseGGV82GFoqrulOKJTbpeD/4YGCyurJLK9g0=;
        b=COIfNYSY+Mbif8NoKYvtucCbljpncW6GHUx9dzVQGmroIAu+nJpQqDXyJwlCHL5TNj
         d0+rNxMfeXt5a9UrWfkRX6nVvtjHssu1HSQYjQJjKqL9UBY+ol8Rb5uKyesJ8aKxpRTY
         sBVZ+0/jsFh7KtgruES1CBa+2m6BMeLdCLfaqvqyKp3s2UpETyGuVaGKfoAF3fcDiaNz
         1EiNiLe8zmSdT9R+UAEsROqoIFQW5qf/diL28ecExZg98gwzXvsC8Rd9pqeL+hZTjfAe
         Mg0yMZ29v0bylfdMcpz+trxhR6X4/yZcT9onjEhZPQZChherFysNRlvSAHV6sfZpp0DV
         /GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OAeLvHmseGGV82GFoqrulOKJTbpeD/4YGCyurJLK9g0=;
        b=Wa2TRw2mF36EwXOZbj31zCNfR8bAOf5ppakizWzqBtw6o8jkutCc1Cwec1MSCx6Spa
         DXh6WfOUki40GXjFbQkG6Rph/5rV9qsnWLIAUi0A9KqmVBjJAtk3bi0vOD8HCVcdM1N+
         tq63KmfyO6tg4D8tq1zWhEaRwdq+QgeFxz9Otd6UH4rXiNoPPeSyV3xHNT8K9Bx/hGKy
         jLKbzqcTrEX2+hITZiu33srxhKBnYpKIEX6nQB0Y3iAbiu4FyjHl9rO6wTGzf4Qk08ua
         M0y9J4I5xDZ8vmMD9fsvHy73BviRLl2BsDZ0FDIjhbbURDmxxi0o/SH+8dHAFiUZZalm
         T/eQ==
X-Gm-Message-State: AOAM531vRKMGJYtFhRKFgUo7rDj5MsHhWdNPE67QNZzd3u46O67Th0Ym
	FFEKN+U4vxXuZoqmVOIOyZM=
X-Google-Smtp-Source: ABdhPJxpHgkSbSKtdjdJ15nXklEygbI3jL9WxRHCafzNBWuBSECF/jp+zoTvobPI9OLoshlRTO4GEw==
X-Received: by 2002:a17:90a:de04:: with SMTP id m4mr16954562pjv.40.1621725373825;
        Sat, 22 May 2021 16:16:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2c86:80f7:821f:a12a? ([2601:202:4180:a5c0:2c86:80f7:821f:a12a])
        by smtp.gmail.com with ESMTPSA id 68sm7356419pfu.7.2021.05.22.16.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 16:16:13 -0700 (PDT)
Subject: Re: [dunfell][PATCH] linuxptp: Fix cross build
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <1620078960-57111-1-git-send-email-denis@denix.org>
 <20210517164640.GF1528@denix.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <ab9aa6d7-6b7a-c67f-26d8-71b52b655375@gmail.com>
Date: Sat, 22 May 2021 16:16:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210517164640.GF1528@denix.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in dunfell-next. waiting for merge.

-armin

On 5/17/21 9:46 AM, Denys Dmytriyenko wrote:
> ping.
>
> On Mon, May 03, 2021 at 05:56:00PM -0400, Denys Dmytriyenko wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Adjust incdefs.sh to use cross tools to poke for system functionality
>> Re-enable using incdefs.sh
>> export KBUILD_OUTPUT to point to recipe sysroot
>>
>> (From meta-oe rev: b6022761d6880382c5e6ffa4b3dc6f1ec2ae1e73)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> ---
>>  .../linuxptp/Use-cross-cpp-in-incdefs.patch        | 26 +++++++++++++++++++
>>  .../linuxptp/no-incdefs-using-host-headers.patch   | 29 ----------------------
>>  .../recipes-connectivity/linuxptp/linuxptp_2.0.bb  |  7 +++---
>>  3 files changed, 30 insertions(+), 32 deletions(-)
>>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
>>  delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
>>
>> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
>> new file mode 100644
>> index 0000000..8760886
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
>> @@ -0,0 +1,26 @@
>> +From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
>> +From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> +Date: Fri, 23 Dec 2016 18:12:29 +0100
>> +Subject: [PATCH] linuxptp: Use cross cpp in incdefs
>> +
>> +Use cross cpp incdefs.sh shell script since we are doing cross compiling
>> +we need to ensure we use correct setttings from toolchain
>> +
>> +Upstream-Status: Inappropriate [OE-Specific]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +
>> + makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +--- a/incdefs.sh
>> ++++ b/incdefs.sh
>> +@@ -27,7 +27,7 @@ user_flags()
>> + 	printf " -D_GNU_SOURCE"
>> + 
>> + 	# Get list of directories searched for header files.
>> +-	dirs=$(echo "" | ${CROSS_COMPILE}cpp -Wp,-v 2>&1 >/dev/null | grep ^" /")
>> ++	dirs=$(${CPP} -Wp,-v -xc /dev/null 2>&1 >/dev/null | grep ^" /")
>> + 
>> + 	# Look for clock_adjtime().
>> + 	for d in $dirs; do
>> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
>> deleted file mode 100644
>> index 02dbb23..0000000
>> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
>> -From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> -Date: Fri, 23 Dec 2016 18:12:29 +0100
>> -Subject: [PATCH] linuxptp: no incdefs using host headers
>> -
>> -Avoid using host headers via incdefs.sh shell script.
>> -
>> -Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> ----
>> -
>> - makefile | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/makefile b/makefile
>> -index 8cdbd15..85174b8 100644
>> ---- a/makefile
>> -+++ b/makefile
>> -@@ -33,7 +33,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
>> - SRC	= $(OBJECTS:.o=.c)
>> - DEPEND	= $(OBJECTS:.o=.d)
>> - srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
>> --incdefs := $(shell $(srcdir)/incdefs.sh)
>> -+#incdefs := $(shell $(srcdir)/incdefs.sh)
>> - version := $(shell $(srcdir)/version.sh $(srcdir))
>> - VPATH	= $(srcdir)
>> - 
>> --- 
>> -2.9.3
>> -
>> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
>> index 930c667..e80abc7 100644
>> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
>> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
>> @@ -4,15 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  
>>  SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
>>             file://build-Allow-CC-and-prefix-to-be-overriden.patch \
>> -           file://no-incdefs-using-host-headers.patch \
>> +           file://Use-cross-cpp-in-incdefs.patch \
>>             file://time_t_maybe_long_long.patch \
>>             "
>>  
>>  SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
>>  SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
>>  
>> -EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
>> -    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
>> +EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
>> +
>> +export KBUILD_OUTPUT="${RECIPE_SYSROOT}"
>>  
>>  do_install () {
>>      install -d ${D}/${bindir}
>> -- 
>> 2.7.4
>>

