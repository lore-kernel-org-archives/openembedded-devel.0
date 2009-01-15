Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LNXVY-00076U-9Y
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 20:04:03 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LNXP0-0004Zv-31
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 18:57:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 18:57:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 18:57:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 15 Jan 2009 19:57:02 +0100
Message-ID: <gko0tu$hel$1@ger.gmane.org>
References: <20090115061418.GA13352@denix.org>
	<gkmmn6$pmf$1@ger.gmane.org>	<20090115074118.GC7020@gmail.com>
	<gkn5jf$7gl$1@ger.gmane.org>
	<19c1b8a90901151053n5402dcbdle52c090fe5c94c71@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <19c1b8a90901151053n5402dcbdle52c090fe5c94c71@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Fix udev pulling in libvolume-id-dev
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
X-List-Received-Date: Thu, 15 Jan 2009 19:04:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-01-09 19:53, Khem Raj wrote:
> On Thu, Jan 15, 2009 at 3:10 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 15-01-09 08:41, Khem Raj wrote:
>>> On (15/01/09 07:56), Koen Kooi wrote:
>>>> On 15-01-09 07:14, Denys Dmytriyenko wrote:
>>>>
>>>>> libvolume-id-dev does not provide the actual .so library, but it
>>>>> contains a
>>>>> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!)
>>>>> instead of ../../lib/ one...
>>>> That's the intended behaviours, since installing the packages will have
>>>> it point to ${libdir}/libvolume.so.0 on your device. I'm not sure if we
>>>> want to patch every package to use relative symlinks.
>>> We would use -dev packages on staged area normally to compile other apps
>>> depending on a given packge if we do not fix the symlink I think it will
>>> try to link to wrong library.
>> We don't use the -dev packages to populate staging :) I keep trying to
>> convince Richard that we should use them, but he keeps coming up with good
>> reasons not to do so :)
>
> Hmm then why do we generate them ?. We do not need these packages on
> target unless we switch to
> native development on target.

SDks and as you say native development (which is getting quite popular 
with the beagleboard folks).

regards,

Koen



