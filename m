Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1IxQae-00035K-AO
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2007 18:20:48 +0100
Received: from [192.168.1.65] ([::ffff:78.86.128.56])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Wed, 28 Nov 2007 17:17:50 +0000
	id 0006822F.474DA2BE.00001D46
Message-ID: <474DA289.8030306@xora.org.uk>
Date: Wed, 28 Nov 2007 17:16:57 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <474D5541.2020107@xora.org.uk>	<474D707E.2000504@student.utwente.nl>	<474D7D09.4090702@xora.org.uk>
	<474D8F63.6000401@student.utwente.nl>
In-Reply-To: <474D8F63.6000401@student.utwente.nl>
X-Enigmail-Version: 0.95.5
Subject: Re: [RFC] Fix uImage generation in	way	compatible	with	kernel.bbclass
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
X-List-Received-Date: Wed, 28 Nov 2007 17:20:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Graeme Gregory schreef:
>> Koen Kooi wrote:
>>  > Looks good, except for these bits of collateral damage:
>>> -        if test -e arch/${ARCH}/boot/images/uImage ; then
>>> -             ln -f arch/${ARCH}/boot/images/uImage
>>> arch/${ARCH}/boot/uImage
>>>
>> Actually isnt this bolloxed anyway by regenerating the uImage
>> in do_deploy?
> 
> It is, I think we can fix it in your shiny new do_compile_append method :)
> And pH5 is partly right about the linker script, I checked and in newer
> revisions the .lds file is indeed a linker script.
> 

Well it should already be fixed in the do_compile_append, as
arch/${ARCH}/boot/uImage is created, which seems to be the point of this
hack anyway.

Graeme




