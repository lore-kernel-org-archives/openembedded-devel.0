Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N2TS4-0000TS-Hk
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 18:33:55 +0100
Received: by ywh7 with SMTP id 7so10297459ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=GIuWhvlSmbtNQ5sZcTk+5/pbz8/Z/vVX6E/dpJOtl8c=;
	b=bu4WNxgigBp02wGSCPi3V19REapRruErwn3U1frozGnu052OY6nb7uOaeR2lUEkp6w
	o03lg9vTdmeFUZMMlVaxIaHY5tkYAiMVThTNRwYK+/TSZ7I7l46JKdpXFJzS2ejTtets
	7QKP4cEr//G5aXNjkTz/q+AcxQzrgV/RVm0zM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=px5G+TMZTnGPc375YSFv4pTNVx+WnxAcmCBUo3wZVif3T9POPKMkas8WofKUtElTKu
	LFHocZ7w8Q4Nbr5t5sZb+KhPCXV2h+luGmTw4Z5O5Eh3FuVsrEpK0LOpmPB1kvCzwqhz
	HgjqQPfPdD1snN+EB9DQw04lG8S6VrhTU5pOI=
MIME-Version: 1.0
Received: by 10.101.195.34 with SMTP id x34mr9519390anp.175.1256578366968; 
	Mon, 26 Oct 2009 10:32:46 -0700 (PDT)
In-Reply-To: <ac9c93b10910260903o5daa5e8erd5ea2d0c5838ccb6@mail.gmail.com>
References: <ac9c93b10910260837m708ebc41ja934d825c6b1bec3@mail.gmail.com>
	<hc4g14$tpm$1@ger.gmane.org>
	<ac9c93b10910260903o5daa5e8erd5ea2d0c5838ccb6@mail.gmail.com>
Date: Mon, 26 Oct 2009 18:32:46 +0100
Message-ID: <ac9c93b10910261032w4d56a5c2g6dd33aaf0fde1b31@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_KERNEL_PR issue
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
X-List-Received-Date: Mon, 26 Oct 2009 17:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/10/26 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2009/10/26 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 26-10-09 16:37, Frans Meulenbroeks wrote:
>>>
>>> Hi,
>>>
>>> While creating a recipe which generates a module I bumped into the
>>> following issue.
>>> If I do
>>> inherit module
>>> the package name uses MACHINE_KERNEL_PR and not PR.
>>> I understand the reason for this: if the kernel is modified you want
>>> the proper modules.
>>> However in a recipe this means that if the recipe changes for whatever
>>> reason that technically one should increase all MACHINE_KERNEL_PR
>>> values (as otherwise the new version is not used).
>>> In my eyes this is not very desirable.
>>>
>>> Any opinions how we should fix this?
>>
>> koen@dominion:/OE/org.openembedded.dev$ grep PR_append recipes/ti/*
>> recipes/ti/ti-cmem-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
>> recipes/ti/ti-dm355mm-module_1.13.bb:MACHINE_KERNEL_PR_append = "a"
>> recipes/ti/ti-dmai_svn.bb:MACHINE_KERNEL_PR_append = "c"
>> recipes/ti/ti-dsplink-module_1.61.3.bb:MACHINE_KERNEL_PR_append = "a"
>> recipes/ti/ti-lpm-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
>> recipes/ti/ti-sdma-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
>
> Ah, ok didn't know about that one and when coined this on #oe no-one
> mentioned this solution.
> Thanks alot! Frans
>

Two more things:

We have about 83 recipes that do inherit module.
and 12 that have MACHINE_KERNEL_PR (10 ti ones, linux omap pm and
open-iscsi which I just added)
so ti seems 71 have a problem

and why not change the class and add _$(PR) or so instead of _append ?

Frans


