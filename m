Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.1125.1590011366545047326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 14:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VTPUt4k/;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id 145so2219730pfw.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CKCqL/X+cuBzJ3YlpHUhPZQT8KwUZzJ+ZzvKTeE3IZk=;
        b=VTPUt4k/hbRrZG2yK4oWRJ5iSZVwX8Lc9i6mhvaqTeztLfhUOb89zXU2u2UBG+a3KN
         rD97k3v3dQV5p4FESMeJzqZdGjGmhPfl2gHR4w0sBDcbuUhx7L8/90LV4HIV+cwg+ZKE
         MVaUa24LiwmFtWAWK7TK9u2uPRHobi6egfujChb47MMmaCHfx1S9PxW8jeMDbHDaAr9H
         obXkBchZLyy+/EDcxjY1LjC5OleI0vRL3tHm/SleRUqAsU9wnf0n0rzUFMfpfrURHXhr
         +wKvpqcu2MDAozl44rl8RueHqff6C7HQHRXeplj1z0RKUUlQtDhY2zOELHavTDlbEKp9
         Wskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CKCqL/X+cuBzJ3YlpHUhPZQT8KwUZzJ+ZzvKTeE3IZk=;
        b=Bu//isQRYBCr0kDaOKT1vTS3+iwKJmR21t6KwqFl5DRtplzPnIffVrAbiLPVYkEeGf
         r3KGNReiyM6DSrCr93PMIdw8XN288XjQrsOlAm+La/amRss6hzbPoMfnPMQWnghi/5sd
         k3F5VX+MQnkFCdjswasfFUEqkip6dgKn/jMCKQYWwnc0qLTDFK4kXRaV5aOBTu++SwLW
         OfEW7thJkjzCp/fPchp4dwb0gkz0UUqjXmjEG7BGO3OBELzdd6b5eA7CH0YHGLBkz5vc
         10AtVlhVjWU6oadjPLexWfLA5e/8LvOR5G1XAXFOhi8/i1R2EMjON4SH8cynaUztWtRw
         3XoQ==
X-Gm-Message-State: AOAM532Q+6AwDxAHAqt2y2n0f2phDOcA6ThJQ5GQUmujRwtvdnr41svF
	BXBlj2wn4gC7UFJexvsowno=
X-Google-Smtp-Source: ABdhPJwlGNUS+iBgMkPCzBfvWwGDHPx6lx6Z+i3ykR6s4rrPzeIeKxJKoEs/qITEPdXBsRlF/4puCw==
X-Received: by 2002:a63:5646:: with SMTP id g6mr6144741pgm.315.1590011365786;
        Wed, 20 May 2020 14:49:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8d2e:b702:900e:97e5? ([2601:646:9200:4e0:8d2e:b702:900e:97e5])
        by smtp.gmail.com with ESMTPSA id lj8sm2840923pjb.1.2020.05.20.14.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 14:49:25 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 2/2] toybox: bump version to 0.8.2
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Adam Miartus <adam.miartus@gmail.com>
References: <20200520213408.140096-1-raj.khem@gmail.com>
 <20200520213408.140096-2-raj.khem@gmail.com>
 <27b3ee25ff574ba3ac887dbc68602e28@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <407fb98a-700a-87cb-d432-4112efafae23@gmail.com>
Date: Wed, 20 May 2020 14:49:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <27b3ee25ff574ba3ac887dbc68602e28@XBOX03.axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/20/20 2:44 PM, Peter Kjellerstedt wrote:
> Why is the update for toybox 0.8.2 made as two commits? It does
> not make any sense at all. After the first commit, the recipe will
> be broken since PV has been updated but the checksums have not,
> not to mention all the other changes that seem to be needed to
> build 0.8.2.
> 

yeah and there is 0.8.3 release so perhaps I will send a v2

> //Peter
> 
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: den 20 maj 2020 23:34
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Adam Miartus <adam.miartus@gmail.com>; Khem Raj <raj.khem@gmail.com>
>> Subject: [oe] [meta-oe][PATCH 2/2] toybox: bump version to 0.8.2
>>
>> From: Adam Miartus <adam.miartus@gmail.com>
>>
>> remove OE-path-changes.patch as already applied to upstream
>>
>> fix CC, CFLAGS and CROSS_COMPILE variables as toybox is strict
>> on what is expected to be filled in these variables:
>> CC = should contain compiler name
>> CROSS_COMPILE = should contain compiler prefix
>> CFLAGS = should contain only compiler flags
>>
>> License wording changed due to commits:
>>   8014d31278411e22655aeae47338e95f209e2907
>>   b31192fd73b382358b1deb33dc6c4cf4ce9c613f
>> in toybox repository, type of license remains the same
>>
>> Signed-off-by: Adam Miartus <adam.miartus@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../toybox/toybox/OE-path-changes.patch       | 195 ------------------
>>   meta-oe/recipes-core/toybox/toybox_0.8.2.bb   |  23 ++-
>>   2 files changed, 18 insertions(+), 200 deletions(-)
>>   delete mode 100644 meta-oe/recipes-core/toybox/toybox/OE-path-
>> changes.patch
>>
>> diff --git a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
>> b/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
>> deleted file mode 100644
>> index e42c22ebd4..0000000000
>> --- a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
>> +++ /dev/null
>> @@ -1,195 +0,0 @@
>> -diff --git a/toys/net/microcom.c b/toys/net/microcom.c
>> -index d34e1fe..a369e6c 100644
>> ---- a/toys/net/microcom.c
>> -+++ b/toys/net/microcom.c
>> -@@ -2,7 +2,7 @@
>> -  *
>> -  * Copyright 2017 The Android Open Source Project.
>> -
>> --USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_BIN))
>> -+USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config MICROCOM
>> -   bool "microcom"
>> -diff --git a/toys/other/blockdev.c b/toys/other/blockdev.c
>> -index 38e0993..c5d9fcd 100644
>> ---- a/toys/other/blockdev.c
>> -+++ b/toys/other/blockdev.c
>> -@@ -4,7 +4,7 @@
>> -  *
>> -  * No Standard.
>> -
>> --USE_BLOCKDEV(NEWTOY(blockdev,
>> "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(gets
>> ize64)(flushbufs)(rereadpt)",TOYFLAG_USR|TOYFLAG_BIN))
>> -+USE_BLOCKDEV(NEWTOY(blockdev,
>> "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(gets
>> ize64)(flushbufs)(rereadpt)",TOYFLAG_SBIN))
>> -
>> - config BLOCKDEV
>> -   bool "blockdev"
>> -diff --git a/toys/other/chrt.c b/toys/other/chrt.c
>> -index a1c37a0..d6db3a5 100644
>> ---- a/toys/other/chrt.c
>> -+++ b/toys/other/chrt.c
>> -@@ -4,7 +4,7 @@
>> -  *
>> -  * Note: -ibrfo flags sorted to match SCHED positions for highest_bit()
>> -
>> --USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]",
>> TOYFLAG_USR|TOYFLAG_SBIN))
>> -+USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config CHRT
>> -   bool "chrt"
>> -diff --git a/toys/other/hwclock.c b/toys/other/hwclock.c
>> -index 1d313e3..412582d 100644
>> ---- a/toys/other/hwclock.c
>> -+++ b/toys/other/hwclock.c
>> -@@ -4,7 +4,7 @@
>> -  *
>> -  * No standard, but see Documentation/rtc.txt in the linux kernel
>> source..
>> -  *
>> --USE_HWCLOCK(NEWTOY(hwclock,
>> ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-
>> ul][!rtsw]", TOYFLAG_USR|TOYFLAG_BIN))
>> -+USE_HWCLOCK(NEWTOY(hwclock,
>> ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-
>> ul][!rtsw]", TOYFLAG_SBIN))
>> -
>> - config HWCLOCK
>> -   bool "hwclock"
>> -diff --git a/toys/other/modinfo.c b/toys/other/modinfo.c
>> -index 1178d67..966a9de 100644
>> ---- a/toys/other/modinfo.c
>> -+++ b/toys/other/modinfo.c
>> -@@ -4,7 +4,7 @@
>> -  *
>> -  * TODO: cleanup
>> -
>> --USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_BIN))
>> -+USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_SBIN))
>> -
>> - config MODINFO
>> -   bool "modinfo"
>> -diff --git a/toys/other/pmap.c b/toys/other/pmap.c
>> -index abb0a33..2acef02 100644
>> ---- a/toys/other/pmap.c
>> -+++ b/toys/other/pmap.c
>> -@@ -5,7 +5,7 @@
>> -  *
>> -  * No Standard.
>> -
>> --USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_BIN))
>> -+USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config PMAP
>> -   bool "pmap"
>> -diff --git a/toys/other/printenv.c b/toys/other/printenv.c
>> -index e8bcf29..65f62ed 100644
>> ---- a/toys/other/printenv.c
>> -+++ b/toys/other/printenv.c
>> -@@ -2,7 +2,7 @@
>> -  *
>> -  * Copyright 2012 Georgi Chorbadzhiyski <georgi@unixsol.org>
>> -
>> --USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_USR|TOYFLAG_BIN))
>> -+USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_BIN))
>> -
>> - config PRINTENV
>> -   bool "printenv"
>> -diff --git a/toys/other/taskset.c b/toys/other/taskset.c
>> -index 8ffdab7..89fd528 100644
>> ---- a/toys/other/taskset.c
>> -+++ b/toys/other/taskset.c
>> -@@ -2,7 +2,7 @@
>> -  *
>> -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
>> -
>> --USE_TASKSET(NEWTOY(taskset, "<1^pa", TOYFLAG_BIN|TOYFLAG_STAYROOT))
>> -+USE_TASKSET(NEWTOY(taskset, "<1^pa",
>> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
>> - USE_NPROC(NEWTOY(nproc, "(all)", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config NPROC
>> -diff --git a/toys/other/timeout.c b/toys/other/timeout.c
>> -index 9b93466..e1d0f4d 100644
>> ---- a/toys/other/timeout.c
>> -+++ b/toys/other/timeout.c
>> -@@ -4,7 +4,7 @@
>> -  *
>> -  * No standard
>> -
>> --USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_BIN))
>> -+USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config TIMEOUT
>> -   bool "timeout"
>> -diff --git a/toys/other/truncate.c b/toys/other/truncate.c
>> -index 142d3c7..40eb1e5 100644
>> ---- a/toys/other/truncate.c
>> -+++ b/toys/other/truncate.c
>> -@@ -2,7 +2,7 @@
>> -  *
>> -  * Copyright 2011 Rob Landley <rob@landley.net>
>> -
>> --USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_BIN))
>> -+USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config TRUNCATE
>> -   bool "truncate"
>> -diff --git a/toys/posix/nice.c b/toys/posix/nice.c
>> -index 4b587ee..9f7b119 100644
>> ---- a/toys/posix/nice.c
>> -+++ b/toys/posix/nice.c
>> -@@ -4,7 +4,7 @@
>> -  *
>> -  * See http://opengroup.org/onlinepubs/9699919799/utilities/nice.html
>> -
>> --USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_USR|TOYFLAG_BIN))
>> -+USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_BIN))
>> -
>> - config NICE
>> -   bool "nice"
>> -diff --git a/toys/posix/nl.c b/toys/posix/nl.c
>> -index 9b02bfa..41e1b89 100644
>> ---- a/toys/posix/nl.c
>> -+++ b/toys/posix/nl.c
>> -@@ -7,7 +7,7 @@
>> -  * This implements a subset: only one logical page (-ip), no sections
>> (-dfh).
>> -  * todo: -lv
>> -
>> --USE_NL(NEWTOY(nl, "v#<1=1l#b:n:s:w#<0=6E", TOYFLAG_BIN))
>> -+USE_NL(NEWTOY(nl, "v#<1=1l#b:n:s:w#<0=6E", TOYFLAG_USR|TOYFLAG_BIN))
>> -
>> - config NL
>> -   bool "nl"
>> -diff --git a/toys/posix/paste.c b/toys/posix/paste.c
>> -index ea04f02..8972f71 100644
>> ---- a/toys/posix/paste.c
>> -+++ b/toys/posix/paste.c
>> -@@ -6,7 +6,7 @@
>> -  *
>> -  * Deviations from posix: the FILE argument isn't mandatory, none == '-
>> '
>> -
>> --USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_BIN|TOYFLAG_LOCALE))
>> -+USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
>> -
>> - config PASTE
>> -   bool "paste"
>> -diff --git a/toys/posix/ps.c b/toys/posix/ps.c
>> -index aef2a7f..b559e09 100644
>> ---- a/toys/posix/ps.c
>> -+++ b/toys/posix/ps.c
>> -@@ -44,7 +44,7 @@
>> -  * TODO: top: thread support and SMP
>> -  * TODO: pgrep -f only searches the amount of cmdline that fits in
>> toybuf.
>> -
>> --USE_PS(NEWTOY(ps,
>> "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]",
>> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
>> -+USE_PS(NEWTOY(ps,
>> "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]",
>> TOYFLAG_BIN|TOYFLAG_LOCALE))
>> - // stayroot because iotop needs root to read other process' proc/$$/io
>> - USE_TOP(NEWTOY(top, ">0m" "O*Hk*o*p*u*s#<1d#=3<1n#<1bq[!oO]",
>> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
>> - USE_IOTOP(NEWTOY(iotop, ">0AaKO" "k*o*p*u*s#<1=7d#=3<1n#<1bq",
>> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT|TOYFLAG_LOCALE))
>> -diff --git a/toys/posix/sed.c b/toys/posix/sed.c
>> -index cf7d15e..130ac08 100644
>> ---- a/toys/posix/sed.c
>> -+++ b/toys/posix/sed.c
>> -@@ -10,7 +10,7 @@
>> -  * TODO: handle error return from emit(), error_msg/exit consistently
>> -  *       What's the right thing to do for -i when write fails? Skip to
>> next?
>> -
>> --USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]",
>> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
>> -+USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]",
>> TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
>> -
>> - config SED
>> -   bool "sed"
>> diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.2.bb b/meta-
>> oe/recipes-core/toybox/toybox_0.8.2.bb
>> index 2f82978334..89c154db2b 100644
>> --- a/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
>> +++ b/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
>> @@ -3,21 +3,34 @@ HOMEPAGE = "http://www.landley.net/toybox/"
>>   DEPENDS = "attr virtual/crypt"
>>
>>   LICENSE = "BSD-0-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
>>
>>   inherit cml1 update-alternatives
>>
>>   SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
>> -           file://OE-path-changes.patch \
>>              "
>> -SRC_URI[md5sum] = "a8bb502a1be941f06dd2644fff25f547"
>> -SRC_URI[sha256sum] =
>> "3ada450ac1eab1dfc352fee915ea6129b9a4349c1885f1394b61bd2d89a46c04"
>> +SRC_URI[md5sum] = "f5cec2e37842ef552753b8b698c69690"
>> +SRC_URI[sha256sum] =
>> "9a2760fa442e9baf1be6064ab5ba8b90f2098e1d4bc33c788960b8d73f52fed5"
>>
>>   SECTION = "base"
>>
>>   TOYBOX_BIN = "generated/unstripped/toybox"
>>
>> -EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()}'
>> +# Toybox is strict on what CC, CFLAGS and CROSS_COMPILE variables should
>> contain.
>> +# Fix CC, CFLAGS, CROSS_COMPILE to match expectations.
>> +# CC = compiler name
>> +# CFLAGS = only compiler flags
>> +# CROSS_COMPILE = compiler prefix
>> +CFLAGS += "${TOOLCHAIN_OPTIONS} ${TUNE_CCARGS}"
>> +
>> +COMPILER_toolchain-clang = "clang"
>> +COMPILER  ?= "gcc"
>> +
>> +EXTRA_OEMAKE = 'CROSS_COMPILE="${HOST_PREFIX}" \
>> +                CC="${COMPILER}" \
>> +                STRIP="strip" \
>> +                CFLAGS="${CFLAGS}" \
>> +                HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()} V=1'
>>
>>   do_configure() {
>>       # allow user to define their own defconfig in bbappend, taken from
>> kernel.bbclass
>> --
>> 2.26.2
> 
