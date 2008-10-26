Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KuBab-00087W-B6
	for openembedded-devel@openembedded.org; Sun, 26 Oct 2008 20:47:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KuBZq-0001PG-FP
	for openembedded-devel@openembedded.org; Sun, 26 Oct 2008 19:47:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 26 Oct 2008 19:47:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 26 Oct 2008 19:47:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 26 Oct 2008 20:46:57 +0100
Message-ID: <ge2hfh$3pq$1@ger.gmane.org>
References: <gdv0a2$u5k$1@ger.gmane.org>
	<1225048399.4235.340.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081023 Shredder/3.0b1pre
In-Reply-To: <1225048399.4235.340.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Making thumb builds easier in OE
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
X-List-Received-Date: Sun, 26 Oct 2008 19:47:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-10-2008 20:13, Phil Blundell wrote:
> On Sat, 2008-10-25 at 13:35 +0200, Koen Kooi wrote:
>> Hi,
>>
>> I noticed that Phil fixed thumb interworking in glibc for armv4t which
>> spurred me to do this:
>>
>> arm tune files: include tune-thumb by default
>> * it defaults to non-thumb, so no functional change
>
> Sadly it is not true to say that there is no functional change.
> Including tune-thumb.inc with no further changes will set interworking
> on by default: this is fairly transparent at ARMv5 and higher, but not
> for ARMv4T.  It is probably not a good idea to default interworking on
> for the latter architecture, which is to say that I think your changes
> to tune-arm920t.inc and tune-arm9tdmi.inc should probably be undone.
> (The same might be true for others: for example, I'm not sure offhand
> what architecture ep9312 uses.)

Right, I made interworking opt-in as well, I got thrown off by the 
ARM_INSTRUCTION set on top. ep9312 uses an arm920t core + maverick FPU.

regards,

Koen


>
>> So people can now set ARM_INSTRUCTION_SET = "thumb" and resulting ARM
>> builds will be in thumb mode.
>>
>> This does raise a few issues:
>>
>>    1) How can we handle thumb2? I only changed the arm9 and arm11 tune
>> files, how should we do the arm1176 and cortex ones?
>
> I'm not really sure what sort of 'handling' you are thinking of here.
> Can you elaborate?
>
>>    2) Since thumb packages are compatible with non-thumb ones we don't
>> really need a seperate arch, but keeping them same feels wrong and is a
>> QA nightmare.
>
> I'm not sure that this is any worse than, say, -O2 vs -Os vs -O0, or
> using different compilers.  There are already plenty of ways you can get
> different output binaries in a way that isn't reflected in PACKAGE_ARCH,
> and I have no real desire to see PACKAGE_ARCH become a sort of sha1 hash
> of everything that went into the build environment.  Ultimately, I think
> this is just something that DISTROs need to be grown-up about: they
> should pick a set of policies for each nominal architecture, stick to
> them, and be responsible for QAing any interoperability issues that
> arise if they decide to change.
>
> p.




