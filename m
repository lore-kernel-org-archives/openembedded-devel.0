Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEC360169
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 15:51:48 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id f15so7076642lbj.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+XuU4cQTtl2MVF9TV2uFwdAnyBMfWeWQnDnI1C3qbYo=;
	b=F88BOIrpzfngRm0eduvHivydQrZ/qg2xoTkC2u70TnZG6HiOplcRr9x0xZxF2zD4GA
	HlhLpwAqMJ+7mNKG9llC1YxsBrcelPdlW9qAxJKveY9Ci9MsW0tiRD7zQNWXRehRm42X
	V2nhKpnMvIpIcWQl773XLCSqIWYesoSgvwv01QS9HNtAfPpmQVt3bEecO7NYVYMkLVpF
	aWUXf8vdmHe1tYKOn1TfAZt+Hkc4omapaMrgR1wyBmsXtXtQz/N5Ca+/eBSMh5F++cD+
	41c3Tg/0eqREcjicwCGK0VIJVb7P8cl7F/TW4ZTSOnJYeC3Bz4CyfMgztLalcZI/jSeZ
	Z91w==
X-Received: by 10.112.219.3 with SMTP id pk3mr27255405lbc.18.1414770707927;
	Fri, 31 Oct 2014 08:51:47 -0700 (PDT)
Received: from [192.168.50.237] (ip-84-119-116-50.unity-media.net.
	[84.119.116.50])
	by mx.google.com with ESMTPSA id e3sm4574914lam.26.2014.10.31.08.51.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Oct 2014 08:51:47 -0700 (PDT)
Message-ID: <5453B011.4020004@gmail.com>
Date: Fri, 31 Oct 2014 16:51:45 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAD0=qkKGx8o9xAf14G1NOXxD5QzKXKJBqfCXDBgc8saTfrW_zQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F384F4B@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F384F4B@IRSMSX105.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 31 Oct 2014 15:51:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 31.10.2014 16:06, schrieb Iorga, Cristian:
> Hi,
> 
> There might be something wrong with the target machine/processor architecture in your setup..
> 
> tmp-angstrom_v2014_12-glibc/work/-angstrom-linux-gnueabi/alsa-lib/1.0.28-r0/ looks strange;
> A common root cause will trigger the ipk/opkg error.
> 

You're right I didn't see that. This looks very strange.

> Please provide the necessary steps to reproduce the issue.

I wrote my own machine-configuration based on the wandboard-solo
configuration. I will try to find a way to reproduce this issue using a
standard machine configuration. This might even exclude errors in my own
configuration.

> 
> Regards,
> Cristian Iorga
> Yocto Project
> Intel Corporation
> 
> 
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Sven Ebenfeld
> Sent: Friday, October 31, 2014 12:14 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] Yocto 1.7 building alsa-lib do_package fails
> 
> Hi,
> 
> When I try to build alsa-lib on master branch of oe-core I get the following error:
> 
> ERROR: Function failed: opkg-build execution failed
> ERROR: Logfile of failure stored in:
> /media/bitbakeTmp/angstrom-dizzy/build/tmp-angstrom_v2014_12-glibc/work/-angstrom-linux-gnueabi/alsa-lib/1.0.28-r0/temp/log.do_package_write_ipk.29979
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> | DEBUG: Python function sstate_task_prefunc finished
> | DEBUG: Executing python function do_package_write_ipk
> | DEBUG: Executing python function read_subpackage_metadata
> | DEBUG: Python function read_subpackage_metadata finished
> | DEBUG: Executing python function do_package_ipk
> | *** Error: CONTROL/control is missing field Architecture
> |
> | opkg-build: Please fix the above errors and try again.
> | DEBUG: Python function do_package_ipk finished
> | DEBUG: Python function do_package_write_ipk finished
> | ERROR: Function failed: opkg-build execution failed
> ERROR: Task 1625
> (/media/bitbakeTmp/angstrom-dizzy/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb,
> do_package_write_ipk) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2214 tasks of which 15 didn't need to be rerun and 1 failed.
> 
> 
> I'm using Angstrom setup-scripts on branch angstrom-v2014.12-yocto1.7
> 
> Can anybody give me an advice where to look for the source of the problem?
> 
> Regards,
> Sven
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

