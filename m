Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LJtMX-0005az-DT
	for openembedded-devel@openembedded.org; Mon, 05 Jan 2009 18:35:38 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LJtGj-0006MK-QE
	for openembedded-devel@openembedded.org; Mon, 05 Jan 2009 17:29:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 05 Jan 2009 17:29:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 05 Jan 2009 17:29:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 05 Jan 2009 18:29:24 +0100
Message-ID: <gjtg1m$rsd$1@ger.gmane.org>
References: <1230827114.5320.42.camel@dax.rpnet.com>	<20090101182526.GF7040@smtp.west.cox.net>	<1230840687.5320.56.camel@dax.rpnet.com>	<20090101220229.GH7040@smtp.west.cox.net>	<1230858713.10424.4.camel@dax.rpnet.com>	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native and sdk recipes)
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
X-List-Received-Date: Mon, 05 Jan 2009 17:35:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-01-09 15:31, Esben Haabendal wrote:
> On Fri, Jan 2, 2009 at 5:37 AM, Tom Rini<trini@kernel.crashing.org>  wrote:
>> On Fri, Jan 02, 2009 at 01:11:53AM +0000, Richard Purdie wrote:

>>> This does reverse the logic that the current sdk class we use however
>>> since MACHINE is now the machine we want to run the compiler on, not the
>>> machine we want to compile for. It should be simple enough to add some
>>> MACHINEs and version setups which correspond to a Linux 32 bit system, a
>>> Linux 64 bit system and a windows system though. Assuming the choice of
>>> TARGET for gcc-canadian is controlled by a variable like SDKTARGET, to
>>> run the builds I'd want, I'd run:
>>>
>>> MACHINE=i686-generic   SDKTARGET=armv5te-generic bitbake gcc-canadian
>>> MACHINE=x86-64-generic SDKTARGET=armv5te-generic bitbake gcc-canadian
>>> MACHINE=winxp-generic  SDKTARGET=armv5te-generic bitbake gcc-canadian
>> Or 'meta-toolchain-sbox' for an existing SDK type target.
>
> I'm sorry, but this seems like a dangerous way of starting confusion of terms.
> MACHINE in how I see OE is really the _TARGET_, ie. the small device this all
> is targeted at.

MACHINE is where the generated stuff will _run_ on, so MACHINE=x86 
SDKTARGET=armv5te would be more in line with what OE expects, but I 
agree it can be confusing if you are thinking in autotools terms.

regards,

Koen



