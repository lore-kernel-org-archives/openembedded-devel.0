Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8L2y-0003F1-SE
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 21:43:40 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L8KzT-0004kU-3l
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 20:40:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 20:40:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 20:40:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 21:35:12 +0100
Message-ID: <gh9eu1$10o$2@ger.gmane.org>
References: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>	<gh6l93$480$1@ger.gmane.org>
	<87bpvrog4z.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <87bpvrog4z.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: wierd rdepends on libvolume-id-dev
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
X-List-Received-Date: Thu, 04 Dec 2008 20:43:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 21:10, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> On 03-12-08 19:16, Otavio Salvador wrote:
>>> Hello,
>>>
>>> I've noticed a very weird rdepends on libvolume-id-dev. Take a look
>>> bellow:
> <...>
>>> Do someone has any idea why it has this depends?
>> Have a look at
>> /OE/angstrom-dev/staging/i486-angstrom-linux-gnueabi/shlibs/libvolume*.list
>> to see what OE thinks the -dev package provides.
>
> otavio@neumann:~/hacking/ossystems/oe$ cat tmp/staging/i486-ossystems-linux/shlibs/libvolume-id-dev.list
> libvolume_id.so.0
> otavio@neumann:~/hacking/ossystems/oe$ cat tmp/staging/i486-ossystems-linux/shlibs/libvolume-id.list
> libvolume_id.so.0
>
> Any idea how to fix it?

It seems package.bbclass got confused and generated the wrong shlib 
providerlist, try putting in some more bb.note to see where it goes wrong.

regards,

Koen





