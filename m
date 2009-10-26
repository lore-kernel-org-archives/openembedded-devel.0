Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N2S4E-0003nn-V7
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 17:05:14 +0100
Received: by yxe5 with SMTP id 5so7069965yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Fm+9QKOcH4/pEa2B5ywoX03nQd2iWbQRBba97j5SqZ0=;
	b=nrfsBlowf0ywpgZNVyLDfX4E4nzPCzWh/FkGYwE1WoFskhZm+eZrUSr7Khj1rW7Osf
	1KCogUc215xxqcjSQXkXa+9AsdttnkUR/yqiZyj5PbJAJh5/dfyTJlriWkgr7p0l8vjv
	l7viwwHu1UtQj/7M987gyZL3AZ/TCVG0F7Ibw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tvQOzm/PPPTNDB5aH4phYeDZWUP7mFPynkdI91jLErl5epq0xRxK+XEthsPR297sio
	kzCop6VxuKuCzG8zN6kF2DWP8UL0+6joN0O6s2zlD9IyCXEcdm0g6kbPvkS5cK4wK3IO
	89+ymHMhpQMvdPDPk+7xZzOL1aKPhLEZ8XhYo=
MIME-Version: 1.0
Received: by 10.100.78.16 with SMTP id a16mr1239249anb.180.1256573022903; Mon, 
	26 Oct 2009 09:03:42 -0700 (PDT)
In-Reply-To: <hc4g14$tpm$1@ger.gmane.org>
References: <ac9c93b10910260837m708ebc41ja934d825c6b1bec3@mail.gmail.com>
	<hc4g14$tpm$1@ger.gmane.org>
Date: Mon, 26 Oct 2009 17:03:42 +0100
Message-ID: <ac9c93b10910260903o5daa5e8erd5ea2d0c5838ccb6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
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
X-List-Received-Date: Mon, 26 Oct 2009 16:05:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/10/26 Koen Kooi <k.kooi@student.utwente.nl>:
> On 26-10-09 16:37, Frans Meulenbroeks wrote:
>>
>> Hi,
>>
>> While creating a recipe which generates a module I bumped into the
>> following issue.
>> If I do
>> inherit module
>> the package name uses MACHINE_KERNEL_PR and not PR.
>> I understand the reason for this: if the kernel is modified you want
>> the proper modules.
>> However in a recipe this means that if the recipe changes for whatever
>> reason that technically one should increase all MACHINE_KERNEL_PR
>> values (as otherwise the new version is not used).
>> In my eyes this is not very desirable.
>>
>> Any opinions how we should fix this?
>
> koen@dominion:/OE/org.openembedded.dev$ grep PR_append recipes/ti/*
> recipes/ti/ti-cmem-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
> recipes/ti/ti-dm355mm-module_1.13.bb:MACHINE_KERNEL_PR_append = "a"
> recipes/ti/ti-dmai_svn.bb:MACHINE_KERNEL_PR_append = "c"
> recipes/ti/ti-dsplink-module_1.61.3.bb:MACHINE_KERNEL_PR_append = "a"
> recipes/ti/ti-lpm-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"
> recipes/ti/ti-sdma-module_2.24.01.bb:MACHINE_KERNEL_PR_append = "a"

Ah, ok didn't know about that one and when coined this on #oe no-one
mentioned this solution.
Thanks alot! Frans


