Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 53CA5601A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 12:56:19 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so1173391wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=vmPpbHWj3QwGc7Es+tCkImrnhHfsJB3Mu3rsrIv0rf8=;
	b=js02vtMgcJK4Xn+OgNCHUuuPhi4onj4fAzbaOBx4OJikVtXBGc1qa23QqikoazY7o6
	74+qbsS1FRk++9KbjiiBaTvhUIq3VkE6UKzSUkoFkwaZ7uR/Pbj3iuDRdwdkIA8/s1v5
	cGPHsPj2+k6i2bm7eJ/yBtbFHXd9Qd5UX+ulZhvyEHnhsCwbC5dAbf0m6f2ox2JPO/BR
	O25U1yS5akf/HLBktLT++z4VFOMqOZMyUAtd8k9wCFeOCgyIHGAa5nL2w325yHRPOyTm
	bjCPUzHkOi09JyLONwFeSzq3AcV81sfkEBH8vKsjA3c87uTeK0P6JFIyEqNbYV+fkoJy
	8xtg==
X-Gm-Message-State: ALoCoQlotN13Tz1EVEbwogL9UGK0PzPiEkKXntUJhMI/GDSFM0t0JqMs0rvW0QLNEMRdgWl49RY3
X-Received: by 10.194.7.167 with SMTP id k7mr5900886wja.11.1406724980426; Wed,
	30 Jul 2014 05:56:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.76.5 with HTTP; Wed, 30 Jul 2014 05:56:00 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 30 Jul 2014 15:56:00 +0300
Message-ID: <CAK18fxEwnZdq5nObukmqOCahN6p7JcLRbctDzS2-tJjqALMDCw@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] Issues while building gpsd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 12:56:22 -0000
Content-Type: text/plain; charset=UTF-8

I'm using Fedora 20 and yocto / meta-oe master / HEAD. While trying to
build gspd I encounter this error:

...
| i586-poky-linux-gcc -m32 -march=i586
--sysroot=/build/tmp/sysroots/qemux86 -o gpspipe.o -c -O2 -pipe -g
-feliminate-unused-debug-types -D_GNU_SOURCE
--sysroot=/media/SSHDD-WRS/Projects/Genivi/2014-07-23-qemux86/tmp/sysroots/qemux86
-Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers
-Wcast-align -Wmissing-declarations -Wmissing-prototypes
-Wstrict-prototypes -Wpointer-arith -Wreturn-type -g -O0 gpspipe.c
| i586-poky-linux-gcc -m32 -march=i586
--sysroot=/build/tmp/sysroots/qemux86 -o gpxlogger.o -c -O2 -pipe -g
-feliminate-unused-debug-types -D_GNU_SOURCE
--sysroot=/build/tmp/sysroots/qemux86 -Wextra -Wall -Wno-uninitialized
-Wno-missing-field-initializers -Wcast-align -Wmissing-declarations
-Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wreturn-type -g
-O0 gpxlogger.c
| //usr/lib/libpthread.so.0: undefined reference to `__uname@GLIBC_PRIVATE'
| //usr/lib/libpthread.so.0: undefined reference to
`__getrlimit@GLIBC_PRIVATE'
| collect2: error: ld returned 1 exit status
| //usr/lib/libpthread.so.0: undefined reference to `__uname@GLIBC_PRIVATE'
| //usr/lib/libpthread.so.0: undefined reference to
`__getrlimit@GLIBC_PRIVATE'
| collect2: error: ld returned 1 exit status
| scons: *** [gpsdecode] Error 1
| scons: *** [gpsctl] Error 1
| scons: building terminated because of errors.
| ERROR: scons build execution failed.
| WARNING:
/build/tmp/work/i586-poky-linux/gpsd/3.7-r14/temp/run.do_compile.24778:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/build/tmp/work/i586-poky-linux/gpsd/3.7-r14/temp/log.do_compile.24778)
ERROR: Task 6 (//meta-openembedded/meta-oe/recipes-navigation/gpsd/
gpsd_3.7.bb, do_compile) failed with exit code '1'

Any hints?
-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

