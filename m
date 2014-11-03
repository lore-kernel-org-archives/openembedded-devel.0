Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 177EC65D59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:29:36 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id a13so4324242igq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=a981+XmCnTAD2hDebzyCWYYXIKRXxlrOae7k2vufIRw=;
	b=VkP2/3GPOT0ag/zjH/RZs8GqLcZfKLUXFhA5wZ7G5VbDLzCE0+WB/3u6uoEbR+K2Wb
	g2yvX9D4e2Fzuw+I4wJ2lrXo/XvEh/DCCH+1VClOuyFcj8kr8LPVW5vFPeM9fjQGwtkt
	AB+7NaD+UVXgpL7AbNOw7Po8y/jB8ddqNAzfH52g5i53XBspSkCYGFDjat4UaOvvYgkA
	uUmfNTtZONpgh2c8CQI/cQIHbh6Ohpjc3VxMp2xkgaWAPvBxE7ixpaQJTpohl8wpTu1S
	im5N3ljMmijXwqIa2pOWY3FEgc0u7SL5WFQ0OnON51vwq+806jxUBInNDIUquK6Yey+j
	xOFA==
MIME-Version: 1.0
X-Received: by 10.42.197.136 with SMTP id ek8mr39442298icb.41.1415010576928;
	Mon, 03 Nov 2014 02:29:36 -0800 (PST)
Received: by 10.107.148.76 with HTTP; Mon, 3 Nov 2014 02:29:36 -0800 (PST)
In-Reply-To: <5453B011.4020004@gmail.com>
References: <CAD0=qkKGx8o9xAf14G1NOXxD5QzKXKJBqfCXDBgc8saTfrW_zQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F384F4B@IRSMSX105.ger.corp.intel.com>
	<5453B011.4020004@gmail.com>
Date: Mon, 3 Nov 2014 11:29:36 +0100
Message-ID: <CAD0=qkJBXrEWtqkpujQ4+2YrCCcaRnA8-c8x3Smor=5HmRUz7A@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto 1.7 building alsa-lib do_package fails
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
X-List-Received-Date: Mon, 03 Nov 2014 10:29:47 -0000
Content-Type: text/plain; charset=UTF-8

Just for information: I found my mistake. After switching from dora to
dizzy I didn't see the disappearance of mx6s SOC_TYPE.
After changing it to mx6dl everything works fine.

2014-10-31 16:51 GMT+01:00 Sven Ebenfeld <sven.ebenfeld@gmail.com>:
> Am 31.10.2014 16:06, schrieb Iorga, Cristian:
>> Hi,
>>
>> There might be something wrong with the target machine/processor architecture in your setup..
>>
>> tmp-angstrom_v2014_12-glibc/work/-angstrom-linux-gnueabi/alsa-lib/1.0.28-r0/ looks strange;
>> A common root cause will trigger the ipk/opkg error.
>>
>
> You're right I didn't see that. This looks very strange.
>
>> Please provide the necessary steps to reproduce the issue.
>
> I wrote my own machine-configuration based on the wandboard-solo
> configuration. I will try to find a way to reproduce this issue using a
> standard machine configuration. This might even exclude errors in my own
> configuration.
>
>>
>> Regards,
>> Cristian Iorga
>> Yocto Project
>> Intel Corporation
>>
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Sven Ebenfeld
>> Sent: Friday, October 31, 2014 12:14 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] Yocto 1.7 building alsa-lib do_package fails
>>
>> Hi,
>>
>> When I try to build alsa-lib on master branch of oe-core I get the following error:
>>
>> ERROR: Function failed: opkg-build execution failed
>> ERROR: Logfile of failure stored in:
>> /media/bitbakeTmp/angstrom-dizzy/build/tmp-angstrom_v2014_12-glibc/work/-angstrom-linux-gnueabi/alsa-lib/1.0.28-r0/temp/log.do_package_write_ipk.29979
>> Log data follows:
>> | DEBUG: Executing python function sstate_task_prefunc
>> | DEBUG: Python function sstate_task_prefunc finished
>> | DEBUG: Executing python function do_package_write_ipk
>> | DEBUG: Executing python function read_subpackage_metadata
>> | DEBUG: Python function read_subpackage_metadata finished
>> | DEBUG: Executing python function do_package_ipk
>> | *** Error: CONTROL/control is missing field Architecture
>> |
>> | opkg-build: Please fix the above errors and try again.
>> | DEBUG: Python function do_package_ipk finished
>> | DEBUG: Python function do_package_write_ipk finished
>> | ERROR: Function failed: opkg-build execution failed
>> ERROR: Task 1625
>> (/media/bitbakeTmp/angstrom-dizzy/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb,
>> do_package_write_ipk) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2214 tasks of which 15 didn't need to be rerun and 1 failed.
>>
>>
>> I'm using Angstrom setup-scripts on branch angstrom-v2014.12-yocto1.7
>>
>> Can anybody give me an advice where to look for the source of the problem?
>>
>> Regards,
>> Sven
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

