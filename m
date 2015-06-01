Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4107562E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 16:40:28 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BDD5CF811E1; Mon,  1 Jun 2015 10:40:28 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 20445F811D9;
	Mon,  1 Jun 2015 10:40:28 -0600 (MDT)
Message-ID: <556C8B1C.2080200@mlbassoc.com>
Date: Mon, 01 Jun 2015 10:41:00 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mki170$14s$2@ger.gmane.org>
In-Reply-To: <mki170$14s$2@ger.gmane.org>
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
X-List-Received-Date: Mon, 01 Jun 2015 16:40:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-01 10:28, Neuer User wrote:
> Hi
>
> I'm currently moving from Dora to Fido. I moved all my recipes to a new
> yocto installation and are modifying the recipes where necessary.
>
> I have a very strange error when configuring a kernel recipe
> (linux-cubox-i). Actually, there is no error when using the defaut
> recipe included in fido. Only if I add the following bbappend file in
> order to change the kernel configuration, I get the error:
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/linux-cubox-i:"
>
> SRC_URI = "file://defconfig \
>             file://videoin.cfg \
>             file://networking.cfg \
>             file://wlan.cfg \
>             file://dm-crypt.cfg \
>             file://no-caam.cfg \
>             file://leds.cfg \
>             file://mod-to-builtin.cfg \
>             file://watchdog-nowayout.cfg \
> "
>
> KERNEL_IMAGETYPE_cubox-i = "zImage"
>
>
> Error:
>
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | WARNING: exit code 128 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/ubuntu/yocto1.8/build/tmp/work/cubox_i-poky-linux-gnueabi/linux-cubox-i/3.14.14-r0/temp/log.do_configure.29043)
>
>
> Nothing more in the configure log.
>
> Any idea, what is wrong? In general I just want to use a diffent kernel
> config. Actually a kernel config that worked before without problems on
> dora. I really have no idea, why this isn't working or even what the
> error means.

Your SRC_URI line is overriding the kernel sources.
You should probably use something like
   SRC_URI += ...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

