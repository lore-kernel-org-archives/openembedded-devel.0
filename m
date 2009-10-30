Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N3mAe-00082W-5m
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 08:45:19 +0100
Received: by ywh7 with SMTP id 7so2505421ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=XlkUo97fo/x0eJUgRJVsljVqcW/6G+E7dC8HOCnLkzw=;
	b=A3awWRt3pG6kq/4ox+cJYsgqoBAv2cX9DMCeBVQ99As8hoQ17TK+fw+jaMd/o8KSou
	GlcsEmVgkTLDftRXty4QssAS2l02rjkbodw6rDaYpWr/rrQokAXWbKVwTkzhNx4Bla+9
	tigudq4YTSW8rmdRS+SDZVjd2P2kB7xtEzeTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZHkbSpkh5vzAjjV2+IMIBcRqbvYTWlr+hJV3O62VPU9IEz7ESES4E6E6CmktNK7qDP
	WP/4wNdb6W2royZggu/SxYSqo97dxmgZIhZKK6cus2tI2nS+W2o5ZAGGohqUrKs2oaaU
	r1ofTCU1oPV0u8Kk1kCKTURnBTMYewT/KfuY8=
MIME-Version: 1.0
Received: by 10.100.72.2 with SMTP id u2mr1045535ana.117.1256888647715; Fri, 
	30 Oct 2009 00:44:07 -0700 (PDT)
In-Reply-To: <ac9c93b10910261032w4d56a5c2g6dd33aaf0fde1b31@mail.gmail.com>
References: <ac9c93b10910260837m708ebc41ja934d825c6b1bec3@mail.gmail.com>
	<hc4g14$tpm$1@ger.gmane.org>
	<ac9c93b10910260903o5daa5e8erd5ea2d0c5838ccb6@mail.gmail.com>
	<ac9c93b10910261032w4d56a5c2g6dd33aaf0fde1b31@mail.gmail.com>
Date: Fri, 30 Oct 2009 08:44:07 +0100
Message-ID: <ac9c93b10910300044vf8ef4bdjf5cc1e2cfa32dc87@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Oct 2009 07:45:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/10/26 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2009/10/26 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> 2009/10/26 Koen Kooi <k.kooi@student.utwente.nl>:
>>> On 26-10-09 16:37, Frans Meulenbroeks wrote:
>>>>
>>>> Hi,
>>>>
>>>> While creating a recipe which generates a module I bumped into the
>>>> following issue.
>>>> If I do
>>>> inherit module
>>>> the package name uses MACHINE_KERNEL_PR and not PR.
>>>> I understand the reason for this: if the kernel is modified you want
>>>> the proper modules.
>>>> However in a recipe this means that if the recipe changes for whatever
>>>> reason that technically one should increase all MACHINE_KERNEL_PR
>>>> values (as otherwise the new version is not used).
>>>> In my eyes this is not very desirable.
>>>>
>>>> Any opinions how we should fix this?
>>>
>>> koen@dominion:/OE/org.openembedded.dev$ grep PR_append recipes/ti/*
>>> recipes/ti/ti-cmem-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
>>> recipes/ti/ti-dm355mm-module_1.13.bb:MACHINE_KERNEL_PR_append = "a"
>>> recipes/ti/ti-dmai_svn.bb:MACHINE_KERNEL_PR_append = "c"
>>> recipes/ti/ti-dsplink-module_1.61.3.bb:MACHINE_KERNEL_PR_append = "a"
>>> recipes/ti/ti-lpm-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
>>> recipes/ti/ti-sdma-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
>>
>> Ah, ok didn't know about that one and when coined this on #oe no-one
>> mentioned this solution.
>> Thanks alot! Frans
>>
>
> Two more things:
>
> We have about 83 recipes that do inherit module.
> and 12 that have MACHINE_KERNEL_PR (10 ti ones, linux omap pm and
> open-iscsi which I just added)
> so ti seems 71 have a problem
>
> and why not change the class and add _$(PR) or so instead of _append ?
As I saw no replies on this, replying to it myself to bring it on the
table again.

Can we agree on a policy wrt versioning of kernel modules.
My preference is a solution which uses ${MACHINE_KERNEL_PR} '+' ${PR}
where the recipe provides PR (just like for non-kernel recipes).
Can we agree on this (and can someone implement this, or do you trust
my measly python skills to do this myself :-) )

Frans


