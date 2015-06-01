Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8F375688
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 16:47:28 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YzSs3-0006ji-CF for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2015 18:47:27 +0200
Received: from 80-218-32-173.dclient.hispeed.ch ([80.218.32.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 18:47:27 +0200
Received: from auslands-kv by 80-218-32-173.dclient.hispeed.ch with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 18:47:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Neuer User <auslands-kv@gmx.de>
Date: Mon, 01 Jun 2015 18:47:21 +0200
Message-ID: <mki2ap$q1p$1@ger.gmane.org>
References: <mki170$14s$2@ger.gmane.org> <556C8B1C.2080200@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 80-218-32-173.dclient.hispeed.ch
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
In-Reply-To: <556C8B1C.2080200@mlbassoc.com>
Subject: Re: yocto fido: Strange configure error (???)
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
X-List-Received-Date: Mon, 01 Jun 2015 16:47:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Gary, thanks a lot! It seems I was slowly getting blind here (oh my
god). Of course, this was wrong. Compile is running now (hope it runs
through).

Cheers

Michael

Am 01.06.2015 um 18:41 schrieb Gary Thomas:
> On 2015-06-01 10:28, Neuer User wrote:
>> Hi
>>
>> I'm currently moving from Dora to Fido. I moved all my recipes to a new
>> yocto installation and are modifying the recipes where necessary.
>>
>> I have a very strange error when configuring a kernel recipe
>> (linux-cubox-i). Actually, there is no error when using the defaut
>> recipe included in fido. Only if I add the following bbappend file in
>> order to change the kernel configuration, I get the error:
>>
>> FILESEXTRAPATHS_prepend := "${THISDIR}/linux-cubox-i:"
>>
>> SRC_URI = "file://defconfig \
>>             file://videoin.cfg \
>>             file://networking.cfg \
>>             file://wlan.cfg \
>>             file://dm-crypt.cfg \
>>             file://no-caam.cfg \
>>             file://leds.cfg \
>>             file://mod-to-builtin.cfg \
>>             file://watchdog-nowayout.cfg \
>> "
>>
>> KERNEL_IMAGETYPE_cubox-i = "zImage"
>>
>>
>> Error:
>>
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: Executing shell function do_configure
>> | WARNING: exit code 128 from a shell command.
>> | ERROR: Function failed: do_configure (log file is located at
>> /home/ubuntu/yocto1.8/build/tmp/work/cubox_i-poky-linux-gnueabi/linux-cubox-i/3.14.14-r0/temp/log.do_configure.29043)
>>
>>
>>
>> Nothing more in the configure log.
>>
>> Any idea, what is wrong? In general I just want to use a diffent kernel
>> config. Actually a kernel config that worked before without problems on
>> dora. I really have no idea, why this isn't working or even what the
>> error means.
> 
> Your SRC_URI line is overriding the kernel sources.
> You should probably use something like
>   SRC_URI += ...
> 



