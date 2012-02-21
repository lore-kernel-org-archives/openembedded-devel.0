Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=391ed13fc=rich.pixley@palm.com>)
	id 1Rzubu-00013O-T1 for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 19:38:48 +0100
X-IronPort-AV: E=Sophos;i="4.73,459,1325491200"; d="scan'208";a="11810950"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 21 Feb 2012 10:29:21 -0800
Received: from fuji.noir.com ([10.100.2.8])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q1LITKZl001786;
	Tue, 21 Feb 2012 10:29:20 -0800
Message-ID: <4F43E280.1090209@palm.com>
Date: Tue, 21 Feb 2012 10:29:20 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.1) Gecko/20120208 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F3EED56.3080400@palm.com> <4F3F9112.3050700@mlbassoc.com>
In-Reply-To: <4F3F9112.3050700@mlbassoc.com>
Subject: Re: runqemu?
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
X-List-Received-Date: Tue, 21 Feb 2012 18:38:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/12 03:52 , Gary Thomas wrote:
> On 2012-02-17 17:14, Rich Pixley wrote:
>> What do I need to do to be able to run core-image-minimal on Ubuntu-11.10 amd64?
>>
>> --rich
>>
>> cd /home/rich/projects/webos/openembedded-core&&  . ./oe-init-build-env&&  runqemu qemux86
>>
>> ### Shell environment set up for builds. ###
>>
>> You can now run 'bitbake<target>'
>>
>> Common targets are:
>> core-image-minimal
>> core-image-sato
>> meta-toolchain
>> meta-toolchain-sdk
>> adt-installer
>> meta-ide-support
>>
>> You can also run generated qemu images with a command like 'runqemu qemux86'
>>
>>
>> Continuing with the following parameters:
>> KERNEL: [/home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/bzImage-qemux86.bin]
>> ROOTFS: [/home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/core-image-minimal-qemux86.ext3]
>> FSTYPE: [ext3]
>> Setting up tap interface under sudo
>> Acquiring lockfile for tap0...
>> WARNING: distccd not present, no distcc support loaded.
>> Running qemu...
>> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qemu -kernel
>> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/bzImage-qemux86.bin -net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no,downscript=no -hda
>> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/core-image-minimal-qemux86.ext3 -show-cursor -usb -usbdevice wacom-tablet -vga vmware -enable-gl
>> -no-reboot -m 128 --append "vga=0 root=/dev/hda rw mem=128M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 "
>> Enabling opengl
>> Could not initialize SDL(No available video device) - exiting
>> Set 'tap0' nonpersistent
>> Releasing lockfile of preconfigured tap device 'tap0'
> This looks like qemu couldn't find a [graphic] display to use.
>
> Did you run this locally from a desktop environment?
Er... no.  I can't.  I have only X11 access.

--rich


