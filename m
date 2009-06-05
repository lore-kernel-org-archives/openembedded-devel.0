Received: from [65.55.111.175] (helo=blu0-omc4-s36.blu0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tiankongever@hotmail.com>) id 1MCP42-0003ch-Oh
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 04:21:50 +0200
Received: from BLU137-W9 ([65.55.111.137]) by blu0-omc4-s36.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 4 Jun 2009 19:12:42 -0700
Message-ID: <BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
X-Originating-IP: [219.142.122.100]
From: =?gb2312?B?wfW3vLuq?= <tiankongever@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jun 2009 10:12:42 +0800
Importance: Normal
In-Reply-To: <1244144325.6678.0.camel@port4>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Jun 2009 02:12:42.0124 (UTC)
	FILETIME=[1B7A34C0:01C9E583]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: How to convert OE hardware platform from ARM into X86
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
X-List-Received-Date: Fri, 05 Jun 2009 02:21:51 -0000
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: 8bit




Hi,Denis:
   Thank you for you attention!
   Let me describe the details for you now:
   The hardware target of OE in my system is ARM.And it was configured and changed by ourselves for some purpose.Now we need to convert the hardware target into X86 on the base of current environment. I didn't  know the exactly step,just tried by myself.But while I go back to the  ARM hardware target environment,after I build ,I meet error:

NOTE: Handling BitBake files: - (6654/6654) [100 %]
NOTE: Parsing finished. 6367 cached, 1 parsed, 286 skipped, 0 masked.
NOTE: build 200906051003: started
sh: git: command not found
sh: git: command not found

OE Build Configuration:
BB_VERSION        = "1.8.13"
METADATA_BRANCH   = "<unknown>"
METADATA_REVISION = "<unknown>"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qsd8x50"
DISTRO            = "millos"
DISTRO_VERSION    = "20090605020341"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 6.5.2 of mesa-dri not available (for item libgl)
NOTE: preferred version 6.5.2 of mesa-dri not available (for item libglu)
NOTE: preferred version 1.15 of lcms not available (for item lcms)
NOTE: preferred version 0.2 of ttf-liberation not available (for item ttf-liberation)
NOTE: preferred version 2.34 of gpsd not available (for item python-pygps)
NOTE: preferred version 2.34 of gpsd not available (for item gpsd)
NOTE: preferred version 2.1.4 of libmusicbrainz not available (for item libmusicbrainz)
NOTE: preferred version 0.1.5 of vala not available (for item vala)
NOTE: preferred version 1.15 of lcms not available (for item lcms)
NOTE: Runtime target 'gnome-system-tools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-system-tools', 'liboobs-1']
ERROR: Required build target 'millos-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['millos-image', 'gnome-system-tools', 'liboobs-1']


I tried my best,but still can't resovel the error,help me please,and tell me the correct step for this convert!

 FangHua




> From: GNUtoo@no-log.org
> To: openembedded-devel@lists.openembedded.org
> Date: Thu, 4 Jun 2009 21:38:40 +0200
> Subject: Re: [oe] How to convert OE hardware platform from ARM into X86
> 
> On Mon, 2009-06-01 at 18:39 +0800, 刘芳华 wrote:
> > Hi!
> > 
> > I need to convert OE hardware platform from ARM into X86,but I don't know the correct step, I tried as follows:
> >       Change the contents of file  ~/stuff/build/conf/local.conf, the changes are:
> >                            MACHINE = "i586-generic";
> >                            #TARGET_ARCH = "arm"
> >                            TARGET_OS = "linux"
> > then, build ,but a error occured:
> >   ERROR: Build of /home/build/stuff/openembedded/packages/xorg-lib/libx11_1.2.1.bb do_compile failed
> >   ERROR: Task 3164 (/home/build/stuff/openembedded/packages/xorg-lib/libx11_1.2.1.bb, do_compile) failed
> we need more info on the build error
> such as the log of the build
> Denis.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

_________________________________________________________________
Messenger安全保护中心，免费修复系统漏洞，保护Messenger安全！
http://im.live.cn/safe/
From elvis.dowson@mac.com Fri Jun 05 09:12:25 2009
Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MCTbE-0004Ln-Ju
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 09:12:25 +0200
MIME-version: 1.0
Received: from [87.201.169.29] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKR00GWB7L9FF50@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Fri,
	05 Jun 2009 00:03:14 -0700 (PDT)
Message-id: <A98BBCED-33BD-498A-A42F-2BFB11C2D1ED@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Fri, 05 Jun 2009 11:03:07 +0400
X-Mailer: Apple Mail (2.935.3)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe] How to copy Ralink RT2571w firmware image to /lib/firmware
	folder
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
X-List-Received-Date: Fri, 05 Jun 2009 07:12:25 -0000

Hi,
	I have created a bitbake recipe for the Ralink RT2571w 1.6.4 WiFi  
network module.

Part of the installation process requires me to copy the a firmware  
file called rt73.bin to the /lib/firmware folder.

How can I do this?

Here is a link to the firmware file: http://www.ralinktech.com.tw/data/RT71W_Firmware_V1.8.zip

Here is a copy of my bitbake recipe:

Filename: rt2570-k2wrlz_1.6.4.bb

DESCRIPTION = "Enhanced Driver for Ralink rt2570 USB 802.11g WiFi  
sticks"
HOMEPAGE = "http://homepages.tu-darmstadt.de/~p_larbig/wlan"
SECTION = "kernel/modules"
LICENSE = "GPL"

PR = "r1"

SRC_URI = "http://homepages.tu-darmstadt.de/~p_larbig/wlan/${PN}-$ 
{PV}.tar.bz2"

inherit module

S = "${WORKDIR}/${PN}-${PV}/Module/"

do_compile_prepend_arm () {
   MAKE_TARGETS="arm"
}

do_compile() {
   export KERNDIR=${STAGING_KERNEL_DIR}
   module_do_compile
}

do_install() {
	install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/extra
	install -m 0644 rt2570${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/ 
modules/${KERNEL_VERSION}/extra/
}


Best regards,

Elvis



