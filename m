Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KPJKY-0008Qj-JZ
	for openembedded-devel@openembedded.org; Sat, 02 Aug 2008 17:47:42 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KPJIc-00019O-ND
	for openembedded-devel@openembedded.org; Sat, 02 Aug 2008 15:45:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 02 Aug 2008 15:45:42 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 02 Aug 2008 15:45:42 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 02 Aug 2008 17:45:31 +0200
Message-ID: <g71ver$tg8$1@ger.gmane.org>
References: <1216087105.10214.7.camel@isis> <g71idt$s09$1@ger.gmane.org>
	<1217690093.25732.106.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008071203)
In-Reply-To: <1217690093.25732.106.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 02 Aug 2008 15:47:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Sat, 2008-08-02 at 14:03 +0200, Koen Kooi wrote:
>> -do_stage_prepend () {
>> +do_stage_append () {
>>    	# get rid of dummy libc.so
>>
>> This fixes builds from scratch for me (tried with armv5te and armv7a),
>> but I haven't tested if it breaks iconv again since I value working
>> builds over working iconv atm. I'm fairly sure it doesn't break iconv,
>> because the bogus libc.so is gone before glibc gets built, but as I
>> said, I haven't tested it.
>
> Iconv does still seem to be OK after this change.

Great! Thanks for testing this.

> However, the fact
> that this was needed indicates that something in gcc-c-i's do_stage()
> method is trying to link with the dummy libc.so, which might be causing
> some other subtle breakage along the lines of the original iconv
> problem.  Some scrutiny will be needed to figure out what exactly
> gcc-c-i is doing with libc.so at this point and whether or not it is
> safe to let it do so.

I suspect it's a side effect of using 'make install' for do_stage, but 
then again, I'm not a toolchain or gcc expert :)

regards,

Koen




