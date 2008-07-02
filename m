Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xbenlau@gmail.com>) id 1KDwwE-0006ZJ-Ii
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jul 2008 09:39:38 +0200
Received: by wf-out-1314.google.com with SMTP id 23so279063wfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jul 2008 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=KXDST9OmawGpa1CuuH8m0qAfh+p4TpqVHOypokQxf14=;
	b=iWxkjugtxE11XnywzVQkIu3a4o0lPB0FANLndUw8OnFl6TlBS0EpgZOQL0c8U0b5Kf
	NqduTPGb8K4bAvm+B+BBOXjsDl143pUI0KYCtW15NHPA29//HsCvFhDGAGQuxWiTMipR
	drnuSxV6jWRUKitgD1HkzeEa7+HrF+ooIK+sM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=E1zbPiJif9vIHvsgrPsKZKselJvciPnjDeDslhQYlB8B3lsGPn2YK/XGFTxkIVdZJ9
	JHLMSW/7tzsHKF3jLWjGBfx09xVz8T4HcrQH6WFmSGwAztabFWevtP53CghshcVBRB0v
	cu0Phf/iv6+KBF+jK0CnRmPUgjzBtn/dstHSw=
Received: by 10.142.51.4 with SMTP id y4mr2900610wfy.220.1214984186854;
	Wed, 02 Jul 2008 00:36:26 -0700 (PDT)
Received: by 10.143.48.1 with HTTP; Wed, 2 Jul 2008 00:36:26 -0700 (PDT)
Message-ID: <f9a7555e0807020036g11261addn37530155264123b8@mail.gmail.com>
Date: Wed, 2 Jul 2008 15:36:26 +0800
From: "Ben Lau" <xbenlau@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <486A73F5.2010906@balister.org>
MIME-Version: 1.0
References: <4861533F.7020906@balister.org>
	<440abda90806291608g2b4bdfbp71ed039b167e9aa9@mail.gmail.com>
	<486A73F5.2010906@balister.org>
Subject: Re: Building a rootfs, without building a kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 02 Jul 2008 07:39:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 2, 2008 at 2:14 AM, Philip Balister <philip@balister.org> wrote:
> David Baird wrote:
>>
>> 2008/6/24 Philip Balister <philip@balister.org>:
>>>
>>> I am trying to build a powerpc root file system for a xilinx ml403 board.
>>> Since we do not have a working kernel build for this machine, I tried
>>> commenting out the PREFERRED_PROVIDER for virtual/linux. The build then
>>> tries to build linux-rt. I tried ASSUME_PROVIDED for the kernel when the
>>> preferred provider is not commented out and it still tries to build the
>>> kernel.
>>>
>>> Looking at the dependency graphs seems to suggest the requirement comes
>>> from
>>> the do_rootfs task.
>>>
>>> Does anyone know how to build an image, without building a kernel for a
>>> machine?
>>
>> I have been using this pattern in my BBMASK:
>>
>>    BBMASK = "(linux-ml403-slab-2.6.x_git[.].*)"
>>
>> and then I made up my own task and image .bb files to establish what
>> files I want in my rootfs.  I would also appreciate suggestions on a
>> better way to do what to do this.
>
> I pushed changes to linux-ml403-slab (I think I renamed the recipe
> linux-xilinx-slab) so the compile completes. I don't do anything to prepare
> the kernel for actual use. This lets the images build. When I finally figure
> out how to build kernels for Xilinx FPGA based PPC boards, I'll worry about
> creating a bootable kernel. (Unless someone beats me to it)
>
> Possibly, we should create a dummy kernel bb file since this may be the best
> solution for the general case of people building images without a working
> kernel bb file.
>
> Philip
>

I am not quite understand why OpenEmbedded force to generate kernel
and the dependence would force it to be installed in the user land. As
the kernel is usually installed on another partition. It should not be
a part of the file system image.

Therefore, I usually comment out few lines in task-base and task-boot
to avoid the dependence.


