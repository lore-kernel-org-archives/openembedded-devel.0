Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SLiIV-0004Gs-MB
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Apr 2012 23:56:52 +0200
Received: by vcbfl13 with SMTP id fl13so8102918vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Apr 2012 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=hP8X9c+L/SKgI8jNJsSIce3AxuY4zFWkKCbsLqe2xQM=;
	b=t0rQZtuKyzDtli2cUlYqoO2lSAHfXm50wxm/XtBEcZ9xZn5eLoFT0V6vaL2U5yFMBx
	Aww0TgVahbXUbqlSaYp5aAq5+q2IqNhGu+cOzXKjVcOc4EX4ByWGhsmRCLeRLNXBJFxm
	u+StR3Dl2lLUbgSJKz5Hj2r6D85097wk7Yo+YnQJQfVB9L1oOHfMGCEM4cIon7lCe5+E
	daJ74eSySu3MAe9QvosMK+wFdId3/aeAEezaL7ZfRQ23r40PimlR40pn1jRA7AZL3+81
	Hstv06No6cclBvowLMiONNKoGR+MIERfAWNalRlb9bvhk8EkHWoDB98h/Oo+O99ckx5w
	bbHw==
Received: by 10.52.37.228 with SMTP id b4mr8408072vdk.131.1335044839832;
	Sat, 21 Apr 2012 14:47:19 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id e4sm15836833vdh.10.2012.04.21.14.47.14
	(version=SSLv3 cipher=OTHER); Sat, 21 Apr 2012 14:47:19 -0700 (PDT)
Message-ID: <4F932ADB.7040003@gmail.com>
Date: Sat, 21 Apr 2012 14:47:07 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com>
In-Reply-To: <4F91A4E4.2090608@gmail.com>
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Apr 2012 21:56:52 -0000
X-Groupsio-MsgNum: 38365
Content-Type: multipart/mixed; boundary="------------010905000203090600000800"

--------------010905000203090600000800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

OK I have now tried with 3 build machines all varying components the 
last one being a server. All 3 of these machines are segfaulting, all 
saying it is a ld segfault with libc. No packages are actually failing 
and stopping the build. This is the segfault that is showing on each 
machine but of course libc version is dependent on the OS being used.
[47152.769257] ld[22617]: segfault at 403 ip 00007f2149cfd435 sp 
00007fffb83ccb50 error 4 in libc-2.15.so[7f2149cb6000+197000]
2012-04-18T14:50:08-07:00 localhost kernel: [47163.860996] ld[31096]: 
segfault at 403 ip 00007fc2da152435 sp 00007fffab491c30 error 4 in 
libc-2.15.so[7fc2da10b000+197000]

My first question is what from these 3 machines can I share with the 
list to help? The qa.log's on all 3 look almost identical just depending 
on if I build a full image or just start fresh and build only perl. I 
have attached one for example. Can anyone explain the qa.log to me? 
Would cooker logs from each machine help? I dont want to just attach a 
bunch of things if they would not be of help.

I have tried enabling core files as per Khem suggestion's but for some 
reason I am not able to either find them or it is not producing any. I 
have set all 3 to unlimited.

My current setup:

My first machine:
Toshiba Qosmio x505-887 nvidia graphics, Have tried with Ubuntu 10.04 
32&64bit and 11.04 64bit, Fedora 16 32bit, ArchLinux,

1st machine borrowed:
Dell xps 400 tower nvidia graphics, Have tried ArchLinux, Ubuntu 10.04 
32bit and 12.04 server beta 32bit

2nd machine borrowed
Dell poweredge 1750, setup with Ubuntu server 12.04 beta and 10.04 
server both 32bit

I will have these borrowed machine for about a week more to help me try 
and figure this out. But I am really at a loss as now 3 machines have 
the same issues how am I this unlucky?

My steps to build
1. Fresh install of OS
2. Update the OS completely
3. reconfigure dash if on Ubuntu
4. Download distro requirements from the OE and your Distro page, then 
reboot
5. clone the angstrom setup scripts
6. setup for BBXM as per Angstrom setup page
7. source my environment
8. bitbake perl

That is what I have done each time, am I missing something? Not doing 
something properly? Again OE classic(gumstix overo) builds on my laptop 
the Toshiba, and has been for awhile. This started once I bought a BBXM 
and went to setup a dedicated install for the BBXM. If this is hardware 
related as mentioned before what hardware could it be since the 
poweredge does not have the nvidia graphics the other 2 did.

Thank you for your time and help.

--------------010905000203090600000800
Content-Type: text/x-log;
 name="qa.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="qa.log"

libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r49+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a'
libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r49+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a'
libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r49+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a'
libpam-1.1.5: libpam: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/libpam-1.1.5-r3/packages-split/pam-plugin-cracklib/lib/security/pam_cracklib.so links to something under exec_prefix
libpam-1.1.5: ldd reports: 	libpam.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam.so.0 (0xdead1000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead2000)
	libcrack.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libcrack.so.2 (0xdead3000)
	libz.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libz.so.1 (0xdead4000)
	libcrypt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcrypt.so.1 (0xdead5000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)

udev-182: udev: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/libgudev/lib/libgudev-1.0.so.0.1.1 links to something under exec_prefix
udev-182: ldd reports: 	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead1000)
	libgobject-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgobject-2.0.so.0 (0xdead2000)
	libffi.so.5 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libffi.so.5 (0xdead3000)
	libgthread-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgthread-2.0.so.0 (0xdead4000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead5000)
	libglib-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libglib-2.0.so.0 (0xdead6000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead7000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead8000)
	libgcc_s.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libgcc_s.so.1 (0xdead9000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdeada000)

udev-182: udev: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/udev/lib/udev/udevd links to something under exec_prefix
udev-182: ldd reports: 	libblkid.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libblkid.so.1 (0xdead1000)
	libkmod.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 (0xdead2000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead3000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead4000)
	libuuid.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libuuid.so.1 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)

libcgroup-0.37.1: libcgroup: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r1/packages-split/cgroups-pam-plugin/lib/security/pam_cgroup.so.0.0.0 links to something under exec_prefix
libcgroup-0.37.1: ldd reports: 	libcgroup.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libcgroup.so.1 (0xdead1000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead2000)
	libpam.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam.so.0 (0xdead3000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead4000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead5000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead6000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/bin/loginctl links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/bin/systemctl links to something under exec_prefix
systemd-git: ldd reports: 	libsystemd-daemon.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 (0xdead1000)
	libsystemd-journal.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-journal.so.0 (0xdead2000)
	libsystemd-id128.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-id128.so.0 (0xdead3000)
	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead4000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead7000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead8000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead9000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdeada000)
	liblzma.so.5 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 (0xdeadb000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/bin/journalctl links to something under exec_prefix
systemd-git: ldd reports: 	libsystemd-journal.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-journal.so.0 (0xdead1000)
	libsystemd-id128.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-id128.so.0 (0xdead2000)
	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead3000)
	liblzma.so.5 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead7000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead8000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead9000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-localed links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead4000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead5000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead6000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-hostnamed links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd links to something under exec_prefix
systemd-git: ldd reports: 	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead1000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead2000)
	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead3000)
	libwrap.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libwrap.so.0 (0xdead4000)
	libpam.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam.so.0 (0xdead5000)
	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead6000)
	libkmod.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 (0xdead7000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead8000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead9000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdeada000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdeadb000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-initctl links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libsystemd-daemon.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 (0xdead2000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead3000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead8000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-journald links to something under exec_prefix
systemd-git: ldd reports: 	libsystemd-daemon.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 (0xdead1000)
	libsystemd-login.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-login.so.0 (0xdead2000)
	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead3000)
	libacl.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libacl.so.1 (0xdead4000)
	liblzma.so.5 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 (0xdead5000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead6000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead7000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead8000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead9000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdeada000)
	libattr.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libattr.so.1 (0xdeadb000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-timedated links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead4000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead5000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead6000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-logind links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libsystemd-daemon.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 (0xdead2000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead3000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead4000)
	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead5000)
	libacl.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libacl.so.1 (0xdead6000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead7000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead8000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead9000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdeada000)
	libattr.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libattr.so.1 (0xdeadb000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-modules-load links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libkmod.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 (0xdead2000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead3000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead4000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-update-utmp links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead4000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead5000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead6000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-fsck links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead2000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead3000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-cgroups-agent links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead4000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead5000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead6000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/security/pam_systemd.so links to something under exec_prefix
systemd-git: ldd reports: 	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead1000)
	libsystemd-daemon.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 (0xdead2000)
	libpam_misc.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam_misc.so.0 (0xdead3000)
	libpam.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam.so.0 (0xdead4000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead7000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead8000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead9000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdeada000)

systemd-git: systemd: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/libsystemd-journal/lib/libsystemd-journal.so.0.0.3 links to something under exec_prefix
systemd-git: ldd reports: 	libsystemd-id128.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libsystemd-id128.so.0 (0xdead1000)
	libcap.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libcap.so.2 (0xdead2000)
	liblzma.so.5 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 (0xdead3000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead7000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead8000)

bash-4.2: bash: Found a reference to /usr/ in /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug
bash-4.2: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
consolekit-0.4.5: consolekit: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/consolekit-0.4.5-r9/packages-split/pam-plugin-ck-connector/lib/security/pam_ck_connector.so links to something under exec_prefix
consolekit-0.4.5: ldd reports: 	libpam.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam.so.0 (0xdead1000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdead2000)
	libck-connector.so.0 => not found
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead3000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead4000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead5000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead6000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead7000)

consolekit-0.4.5: consolekit: Found a reference to /usr/ in /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/consolekit-0.4.5-r9/packages-split/consolekit/lib/security/pam_ck_connector.la
consolekit-0.4.5: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
udisks-1.0.4: udisks: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udisks-1.0.4-r4/packages-split/udisks/sbin/umount.udisks links to something under exec_prefix
udisks-1.0.4: ldd reports: 	libdbus-glib-1.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-glib-1.so.2 (0xdead1000)
	libgobject-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgobject-2.0.so.0 (0xdead2000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead3000)
	libglib-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libglib-2.0.so.0 (0xdead4000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead5000)
	libdbus-1.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 (0xdead6000)
	libgio-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgio-2.0.so.0 (0xdead7000)
	libz.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libz.so.1 (0xdead8000)
	libresolv.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libresolv.so.2 (0xdead9000)
	libffi.so.5 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libffi.so.5 (0xdeada000)
	libgmodule-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgmodule-2.0.so.0 (0xdeadb000)
	libdl.so.2 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 (0xdeadc000)
	libgthread-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgthread-2.0.so.0 (0xdeadd000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdeade000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdeadf000)
	libgcc_s.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libgcc_s.so.1 (0xdeae0000)

udisks-1.0.4: udisks: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udisks-1.0.4-r4/packages-split/udisks/lib/udev/udisks-probe-ata-smart links to something under exec_prefix
udisks-1.0.4: ldd reports: 	libatasmart.so.4 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libatasmart.so.4 (0xdead1000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead2000)
	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead3000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead4000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)

udisks-1.0.4: udisks: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udisks-1.0.4-r4/packages-split/udisks/lib/udev/udisks-part-id links to something under exec_prefix
udisks-1.0.4: ldd reports: 	libglib-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libglib-2.0.so.0 (0xdead1000)
	libudev.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 (0xdead2000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead3000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead4000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead5000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead6000)

udisks-1.0.4: udisks: /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udisks-1.0.4-r4/packages-split/udisks/lib/udev/udisks-probe-sas-expander links to something under exec_prefix
udisks-1.0.4: ldd reports: 	libglib-2.0.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libglib-2.0.so.0 (0xdead1000)
	libc.so.6 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 (0xdead2000)
	librt.so.1 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 (0xdead3000)
	/lib/ld-linux.so.3 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 (0xdead4000)
	libpthread.so.0 => /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 (0xdead5000)

gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libbackground.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libkeyboard.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libhousekeeping.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/liba11y-keyboard.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libsound.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libkeybindings.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libtyping-break.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libxrandr.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libfont.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libxrdb.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libxsettings.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libclipboard.a'
gnome-settings-daemon-2.32.1: non -staticdev package contains static .a library: gnome-settings-daemon-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-settings-daemon-2.32.1-r3/packages-split/gnome-settings-daemon-dev/usr/lib/gnome-settings-daemon-2.0/libmouse.a'
gnome-control-center-2.32.1: non -staticdev package contains static .a library: gnome-control-center-dev path '/work/armv7a-angstrom-linux-gnueabi/gnome-control-center-2.32.1-r0/packages-split/gnome-control-center-dev/usr/lib/window-manager-settings/libmetacity.a'
gtk-xfce-engine-2.9.0: non -staticdev package contains static .a library: gtk-xfce-engine path '/work/armv7a-angstrom-linux-gnueabi/gtk-xfce-engine-2.9.0-r0/packages-split/gtk-xfce-engine/usr/lib/gtk-2.0/2.10.0/engines/libxfce.a'

--------------010905000203090600000800--
