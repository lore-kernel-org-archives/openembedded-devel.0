Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LeP3c-0005No-Fe
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 08:28:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LeOzl-0006b5-FL
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 07:24:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 07:24:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 07:24:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 03 Mar 2009 08:24:44 +0100
Message-ID: <goilvs$ps$1@ger.gmane.org>
References: <gh8v57$5nk$1@ger.gmane.org>
	<49380C4F.1050809@dls.net>	<49380EAC.5020809@dls.net>
	<gh94ov$rdk$1@ger.gmane.org> <20090303051111.GD26643@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <20090303051111.GD26643@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Tue, 03 Mar 2009 07:28:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-03-09 06:11, Denys Dmytriyenko wrote:
> On Thu, Dec 04, 2008 at 06:41:50PM +0100, Koen Kooi wrote:
>> On 04-12-08 18:09, Mike (mwester) wrote:
>>> Mike (mwester) wrote:
>>>
>>>> A slight improvement would be to make the dev.tar file dependent upon
>>>> the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
>>>> doesn't match the current command line.  This could be a very fast
>>>> operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.
>>> As I consider this further, we could actually just save and compare
>>> /proc/atags if that's present on the device in question (falling back to
>>> /proc/cmdline if not present).  That would catch *any* changes passed in
>>> to the kernel via the bootloader.
>>>
>>> Flashing a new kernel would seem to be another logical place to
>>> invalidate the cache, so adding a comparison of "uname -rv" would be a
>>> reasonable way to catch that.
>> That should indeed take care of bootargs and kernel version changes. I'm
>> still tempted to add option 2) to all that :)
>
> Sorry for bringing up this old discussion. Are there any plans to implement
> the above checks in udev?

Plans yes, time no :(

regards,

Koen




