Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OIQlc-00044Y-1l
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 20:28:17 +0200
Received: from [87.241.107.86] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1430536 for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 20:24:06 +0200
Message-ID: <4C015BDA.2090506@station51.net>
Date: Sat, 29 May 2010 20:24:26 +0200
From: butters <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C00F3F4.5030801@station51.net> <htr2a9$f76$1@dough.gmane.org>
In-Reply-To: <htr2a9$f76$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 109.74.206.142
X-SA-Exim-Mail-From: butters@station51.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-gnome-image compilation error
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
X-List-Received-Date: Sat, 29 May 2010 18:28:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Well I had wondered if it was something with Ubuntu screwing it up. I 
had planned on trying Debian with it, but i haven't had the energy to do 
it yet. I was hoping someone else had experienced the same problem. I 
hope someone has a solution for it.


On 5/29/2010 2:46 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-05-10 13:01, butters wrote:
>    
>> Hello,
>>
>> I'm having trouble getting angstrom-gnome-image.bb to completely
>> compile. It stops at firefox_3.6.3.bb with this error..
>>
>> ./nanojit/NativeARM.cpp:949: warning unused variable 'was'
>> {standard input} Assembler messages:
>> {standard input}: 824: Error: selected processor does not support clz r1,r1
>> jsbuiltins.cpp
>>
>> I'm compiling for armv4t, for the mini2440 machine. Is this a known
>> issue? Because I've been able to compile this in the past.
>>      
> Looks like nanojit is forcing armv5te instructions even for armv4t,
> which the compiler and binutils have every reason to complain about.
>
> Does anyone familiar with the mozilla buildsystem know if we can disable
> things like CLZ for armv4t and below?
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMAQyJMkyGM64RGpERAiM+AKCKUkS9EmkuzA8ow//U+tu5jfkcqACeK6n5
> ZlKdnPlkE8axIRTN8APRKq0=
> =xuT6
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    



