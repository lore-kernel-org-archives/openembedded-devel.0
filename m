Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SJxbA-0002nF-Ly
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 03:52:52 +0200
Received: by qao25 with SMTP id 25so88142qao.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 18:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=0juo4uLd/rFd/vbBn5epF5bean0GtTPSgOMn+bcDSqU=;
	b=iqA25X3PRHOAnHwSwHsETJUv5D7aKYaqqaR1yQOrn8u91EmaMC8nHqQF8EQbaIJxyd
	g9oc2cZ58bSmeiwGXF5vyWL8dj6Y5Q08oTNkrxXqkfdOmc/bnsVDH09NgDZTIr0NMjvB
	vDJrm67En2o+KUdoRXgBZ2bZJrLs9ve0ElER0m+3cWecaWXscAhSPgIve7mH3o1o/sxc
	rj1vNmqqq/k/GAhX8UsVDd9O5+/ilKwCKkr+beBv4DsW3Vc2XHOJC+t9LPBt0vyfCfBY
	FZXKl9CIBzRXKfsQVfaDSEIRbtdokM441YgtsLCUGuNA08xFU+eeMeKgrHAd/f7WpOAR
	N8Hw==
Received: by 10.229.154.78 with SMTP id n14mr3819365qcw.119.1334627006312;
	Mon, 16 Apr 2012 18:43:26 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id dr4sm11273780qab.16.2012.04.16.18.43.17
	(version=SSLv3 cipher=OTHER); Mon, 16 Apr 2012 18:43:25 -0700 (PDT)
Message-ID: <4F8CCAAA.6050406@gmail.com>
Date: Mon, 16 Apr 2012 18:43:06 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com>
In-Reply-To: <4F8C9E68.9050106@gmail.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Tue, 17 Apr 2012 01:52:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2012 03:34 PM, j wrote:
> On 04/16/2012 03:28 PM, Gary Thomas wrote:
>> On 2012-04-16 16:11, j wrote:
>>> On 04/13/2012 03:50 PM, j wrote:
>>>> On 04/13/2012 03:46 PM, j wrote:
>>>>> There seems to be a couple of packages when I build that cause ld 
>>>>> segfaults such as
>>>>> [ 6635.846581] ld[14419]: segfault at 8 ip 0077f1bf sp bfbf4a8c 
>>>>> error 4 in libc-2.13.so[73d000+15c000]
>>>>> [ 6656.831878] ld[20772]: segfault at 8 ip 00ba61bf sp bfaf1bfc 
>>>>> error 4 in libc-2.13.so[b64000+15c000]
>>>>>
>>>>> I can not seem to be able to track down the package/packages that 
>>>>> are causing this. I have tried with a clean build dir and only 
>>>>> building nano and I get it so it is something in
>>>>> the getting environment ready steps. Is there a way I can easily 
>>>>> track down the build/builds that are causing this? Am I even on 
>>>>> the right track in this thinking? Nothing fails
>>>>> to build and other than task-native-sdk all result in what seem to 
>>>>> be working packages.
>>>>>
>>>>> Any info on what or how to figure it out would be greatly 
>>>>> appreciated.
>>>>> building for bbxm on 11.04(uptodate), build environment setup with 
>>>>> Angstrom scripts and all is up to date.
>>>>>
>>>>> Thank you
>>>> Sorry forgot the info from qa.log
>>>>
>>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>>> libgcc-dev path
>>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a' 
>>>>
>>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>>> libgcc-dev path
>>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a' 
>>>>
>>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>>> libgcc-dev path
>>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a' 
>>>>
>>>> bash-4.2: bash: Found a reference to /usr/ in
>>>> /home/beagle/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug 
>>>>
>>>> bash-4.2: Shell scripts in base_bindir and base_sbindir should not 
>>>> reference anything in exec_prefix
>>>>
>>>> Any other places to check, as these I do not think relate to a 
>>>> segfault?
>>>
>>> I have now tried the build on 3 different OS's the most recent being 
>>> Arch. All give the same QA log's and all give me segfaults. That are 
>>> all basically close to the same errors
>>> just differing libc versions.
>>>
>>> I have tried Ubuntu 10.04 11.04 Fedora 16 and now Arch. What is 
>>> causing the segfaults? Is it what is in the QA log?
>>>
>>>
>>>
>>> Most current
>>> [ 6433.379801] ld[22955]: segfault at 403 ip 00007f703ddcc435 sp 
>>> 00007fffb0bd9f50 error 4 in libc-2.15.so[7f703dd85000+197000]
>>> [ 6444.526227] ld[31806]: segfault at 403 ip 00007f0dffc51435 sp 
>>> 00007fffc0a990d0 error 4 in libc-2.15.so[7f0dffc0a000+197000]
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>> libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a' 
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>> libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a' 
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>> libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a' 
>>>
>>> bash-4.2: bash: Found a reference to /usr/ in
>>> /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug 
>>>
>>> bash-4.2: Shell scripts in base_bindir and base_sbindir should not 
>>> reference anything in exec_prefix
>>>
>>>
>>> The only reason I am concerned with this and it may be un related is 
>>> that every time I build task-native-sdk it does not build a working 
>>> sdk for my device. BB-xm. Yes I know I can
>>> install one from the repo, but I want to figure out what is wrong 
>>> with building one for me.
>>>
>>> Does anyone have input, advice something?
>>
>> You've tried different Operating Systems, but one would assume that
>> this is all on the same hardware?   Have you tried a different build
>> host (i.e. hardware/box)?
>>
> Also it seems to happen around when bitbake starts building gcc-4.5 
> from a fresh install that is why I posted the QA info about it.

Well just built systemd-image got some more info from the QA log. seems 
that during the initial build with GCC and libtool it throws the 
segfaults. Then as the rest of build goes others have issues.

I am going to try and rebuild the packages I think are causing this step 
by step and see if something sticks out during the process that might 
lead to a way to sort out the issue. I will start on a fresh boot of the 
system as well to make sure I can catch all the variables hopefully that 
are causing it. I also noticed some patches to perl I think it was that 
were ld related when 11.04 came out, could other packages possibly need 
some tweaking?

Though, I really dont get how oe-classic can build without issues on 
this same machine but with the new version I get segfaults with ld and 
libc. The rest of the errors seem to me as they are relating to the ls 
issue as well. Please correct me if my thinking is incorrect.

Current log info, if there are other logs/info I can provide I would 
happily do so. Again thank you for any info or help in this, please feel 
free to suggest things I could possibly do to sort out the complication. 
I hope to sort this out so I can make a patch for it.


libgcc-4.5: non -staticdev package contains static .a library: 
libgcc-dev path 
'/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a'
libgcc-4.5: non -staticdev package contains static .a library: 
libgcc-dev path 
'/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a'
libgcc-4.5: non -staticdev package contains static .a library: 
libgcc-dev path 
'/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a'
bash-4.2: bash: Found a reference to /usr/ in 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug
bash-4.2: Shell scripts in base_bindir and base_sbindir should not 
reference anything in exec_prefix
libpam-1.1.5: libpam: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libpam-1.1.5-r3/packages-split/pam-plugin-cracklib/lib/security/pam_cracklib.so 
links to something under exec_prefix
libpam-1.1.5: ldd reports:     libpam.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpam.so.0 
(0xdead1000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead2000)
     libcrack.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libcrack.so.2 
(0xdead3000)
     libz.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libz.so.1 
(0xdead4000)
     libcrypt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcrypt.so.1 
(0xdead5000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

udev-182: udev: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/libgudev/lib/libgudev-1.0.so.0.1.1 
links to something under exec_prefix
udev-182: ldd reports:     libudev.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libudev.so.0 
(0xdead1000)
     libgobject-2.0.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libgobject-2.0.so.0 
(0xdead2000)
     libffi.so.5 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libffi.so.5 
(0xdead3000)
     libgthread-2.0.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libgthread-2.0.so.0 
(0xdead4000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead5000)
     libglib-2.0.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libglib-2.0.so.0 
(0xdead6000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead7000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead8000)
     libgcc_s.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libgcc_s.so.1 
(0xdead9000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdeada000)

udev-182: udev: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/udev/lib/udev/udevd 
links to something under exec_prefix
udev-182: ldd reports:     libblkid.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libblkid.so.1 
(0xdead1000)
     libkmod.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 
(0xdead2000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead3000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead4000)
     libuuid.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libuuid.so.1 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

libcgroup-0.37.1: libcgroup: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r1/packages-split/cgroups-pam-plugin/lib/security/pam_cgroup.so.0.0.0 
links to something under exec_prefix
libcgroup-0.37.1: ldd reports:     libcgroup.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libcgroup.so.1 
(0xdead1000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead2000)
     libpam.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpam.so.0 
(0xdead3000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead4000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead5000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead6000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/bin/loginctl 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead2000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead3000)
     libudev.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libudev.so.0 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/bin/systemctl 
links to something under exec_prefix
systemd-git: ldd reports:     libsystemd-daemon.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 
(0xdead1000)
     libsystemd-journal.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-journal.so.0 
(0xdead2000)
     libsystemd-id128.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-id128.so.0 
(0xdead3000)
     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead4000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead7000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead8000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead9000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdeada000)
     liblzma.so.5 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 
(0xdeadb000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/bin/journalctl 
links to something under exec_prefix
systemd-git: ldd reports:     libsystemd-journal.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-journal.so.0 
(0xdead1000)
     libsystemd-id128.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-id128.so.0 
(0xdead2000)
     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead3000)
     liblzma.so.5 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead7000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead8000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead9000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-localed 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead2000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead3000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead4000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead5000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead6000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-hostnamed 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead2000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead3000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd 
links to something under exec_prefix
systemd-git: ldd reports:     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead1000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead2000)
     libudev.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libudev.so.0 
(0xdead3000)
     libwrap.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libwrap.so.0 
(0xdead4000)
     libpam.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpam.so.0 
(0xdead5000)
     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead6000)
     libkmod.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 
(0xdead7000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead8000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead9000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdeada000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdeadb000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-initctl 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libsystemd-daemon.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 
(0xdead2000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead3000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead8000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-journald 
links to something under exec_prefix
systemd-git: ldd reports:     libsystemd-daemon.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 
(0xdead1000)
     libsystemd-login.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-login.so.0 
(0xdead2000)
     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead3000)
     libacl.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libacl.so.1 
(0xdead4000)
     liblzma.so.5 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 
(0xdead5000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead6000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead7000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead8000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead9000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdeada000)
     libattr.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libattr.so.1 
(0xdeadb000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-timedated 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead2000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead3000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead4000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead5000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead6000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-logind 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libsystemd-daemon.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 
(0xdead2000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead3000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead4000)
     libudev.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libudev.so.0 
(0xdead5000)
     libacl.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libacl.so.1 
(0xdead6000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead7000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead8000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead9000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdeada000)
     libattr.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libattr.so.1 
(0xdeadb000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-modules-load 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libkmod.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 
(0xdead2000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead3000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead4000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-update-utmp 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead2000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead3000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead4000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead5000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead6000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-fsck 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libudev.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libudev.so.0 
(0xdead2000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead3000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/systemd/systemd-cgroups-agent 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead2000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead3000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead4000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead5000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead6000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/systemd/lib/security/pam_systemd.so 
links to something under exec_prefix
systemd-git: ldd reports:     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead1000)
     libsystemd-daemon.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-daemon.so.0 
(0xdead2000)
     libpam_misc.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpam_misc.so.0 
(0xdead3000)
     libpam.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpam.so.0 
(0xdead4000)
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead7000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead8000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead9000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdeada000)

systemd-git: systemd: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/systemd-git-r27/packages-split/libsystemd-journal/lib/libsystemd-journal.so.0.0.3 
links to something under exec_prefix
systemd-git: ldd reports:     libsystemd-id128.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libsystemd-id128.so.0 
(0xdead1000)
     libcap.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libcap.so.2 
(0xdead2000)
     liblzma.so.5 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/liblzma.so.5 
(0xdead3000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead7000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead8000)

consolekit-0.4.5: consolekit: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/consolekit-0.4.5-r9/packages-split/pam-plugin-ck-connector/lib/security/pam_ck_connector.so 
links to something under exec_prefix
consolekit-0.4.5: ldd reports:     libpam.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpam.so.0 
(0xdead1000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead2000)
     libck-connector.so.0 => not found
     libdbus-1.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libdbus-1.so.3 
(0xdead3000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead4000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead5000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

consolekit-0.4.5: consolekit: Found a reference to /usr/ in 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/consolekit-0.4.5-r9/packages-split/consolekit/lib/security/pam_ck_connector.la
consolekit-0.4.5: Shell scripts in base_bindir and base_sbindir should 
not reference anything in exec_prefix



