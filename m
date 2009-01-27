Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LRj2M-0000zP-Uc
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 09:11:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 799232C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 08:03:18 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edhmp4vapnYb
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 08:03:17 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id A89222C792
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 08:03:16 +0000 (UTC)
Message-ID: <497EBFF3.8000302@gmail.com>
Date: Tue, 27 Jan 2009 09:04:03 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <497D7E2A.8050302@gmail.com> <gll57g$5s3$2@ger.gmane.org>
In-Reply-To: <gll57g$5s3$2@ger.gmane.org>
Subject: Re: Building for i486 based non-FPU device
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
X-List-Received-Date: Tue, 27 Jan 2009 08:11:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> On 26-01-09 10:11, Marco Cavallini wrote:
>> Hello,
>> This discussion was in thread "FOSDEM OE stand"
>> I'm trying to build for a machine I'd like to let at OE stand.
>> http://www.koala.it/it/nanopc.htm
>> It's a i486 based non-FPU device (Vortex86sx), so I tried to build
>>
>> DISTRO = "angstrom-2008.1"
>>
>> I created my new machine copying it from
>>   conf/machine/i586-generic.conf
>> and changing the following settings:
>>   TARGET_ARCH = "i486"
>>   PACKAGE_EXTRA_ARCHS = "x86"
>>   PREFERRED_VERSION_linux = "2.6.26"
>> (I also changed 2.6.26 recipe)
>>
>> I found several problems:
>> i586-generic uses TARGET_ARCH = "i586" : ok but for 586
>> x86          uses TARGET_ARCH = "i586" : build broken
>> qemux86      uses TARGET_ARCH = "i586" : not used
>> i486-generic uses TARGET_ARCH = "i486" : build broken
>>
>> No one of the previous tested build give a useful result,
>> what could I change to get a running system?
>>
>> Maybe do I have to specify TARGET_CC_ARCH = "-march=i486" ?
>> Would be better to switch this discussion to IRC ?
>> Any hint will be greatly appreciated.
> 
> 'MACHINE=vortex86sx bitbake glibc' works for me with angstrom. It
> doesn't use softfloat yes, as gccs configure script doesn't like
> --with-float=soft, so we'll problably end up messing with TARGET_CC_ARCH.
> 
> regards,
> 

Hi Koen,
built successfully minimal-image and x11-image with MACHINE=vortex86sx
I'm testing it on target board.

Thank you
--
Marco Cavallini




