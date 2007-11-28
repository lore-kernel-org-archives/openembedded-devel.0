Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1IxO0J-0000A0-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2007 15:35:07 +0100
Received: from [192.168.1.65] ([::ffff:78.86.128.56])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Wed, 28 Nov 2007 14:32:10 +0000
	id 0006822F.474D7BEA.00001A5D
Message-ID: <474D7BE6.6070907@xora.org.uk>
Date: Wed, 28 Nov 2007 14:32:06 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <474D5541.2020107@xora.org.uk>
	<474D707E.2000504@student.utwente.nl>
In-Reply-To: <474D707E.2000504@student.utwente.nl>
X-Enigmail-Version: 0.95.5
Subject: Re: [RFC] Fix uImage generation in way compatible	with	kernel.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2007 14:35:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Graeme Gregory schreef:
>> I would like to do the attached patch to linux.inc to change uImage
>> generation so it is compatible with the way kernel.bbclass does things.
> 
>> This means the uImage ends up in kernel-image not some random file
>> called uImage but not really a uImage.
> 
>> koen said the do_install_prepend stuff was to work around vendor bugs
>> and is no longer needed in this file.
> 
> Looks good, except for these bits of collateral damage:
> 
> -        if test -e arch/${ARCH}/boot/images/uImage ; then
> -             ln -f arch/${ARCH}/boot/images/uImage
> arch/${ARCH}/boot/uImage
> 
> The above is needed for various powerpc/ppc boards, and the below is
> needed for at least blackfin:
> 
> -        if test -e arch/${ARCH}/kernel/vmlinux.lds ; then
> -             ln -f arch/${ARCH}/kernel/vmlinux.lds
> arch/${ARCH}/boot/vmlinux
> 
> The linux kernel doesn't seem to have a strict policy on image placement
> and various vendor patches aren't exactly helping the situation :/
> 
Ok, I misunderstood you and thought they were all not needed lines, I
shall restore these two then.

Graeme



