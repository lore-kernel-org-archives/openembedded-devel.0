Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LNQE6-00033n-39
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 12:17:30 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LNQ7c-0001yF-Ud
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 11:10:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 11:10:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 11:10:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 15 Jan 2009 12:10:39 +0100
Message-ID: <gkn5jf$7gl$1@ger.gmane.org>
References: <20090115061418.GA13352@denix.org> <gkmmn6$pmf$1@ger.gmane.org>
	<20090115074118.GC7020@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <20090115074118.GC7020@gmail.com>
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
X-List-Received-Date: Thu, 15 Jan 2009 11:17:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-01-09 08:41, Khem Raj wrote:
> On (15/01/09 07:56), Koen Kooi wrote:
>> On 15-01-09 07:14, Denys Dmytriyenko wrote:
>>
>>> libvolume-id-dev does not provide the actual .so library, but it contains a
>>> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!)
>>> instead of ../../lib/ one...
>> That's the intended behaviours, since installing the packages will have
>> it point to ${libdir}/libvolume.so.0 on your device. I'm not sure if we
>> want to patch every package to use relative symlinks.
>
> We would use -dev packages on staged area normally to compile other apps
> depending on a given packge if we do not fix the symlink I think it will
> try to link to wrong library.

We don't use the -dev packages to populate staging :) I keep trying to 
convince Richard that we should use them, but he keeps coming up with 
good reasons not to do so :)

regards,

Koen



