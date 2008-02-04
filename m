Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JLpsf-0006V6-Oa
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 02:12:17 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JLpsl-00055i-4y
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 01:12:23 +0000
Received: from ppp78-37-139-107.pppoe.avangarddsl.ru ([78.37.139.107])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 04 Feb 2008 01:12:23 +0000
Received: from dbaryshkov by ppp78-37-139-107.pppoe.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 04 Feb 2008 01:12:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 4 Feb 2008 01:12:17 +0000 (UTC)
Message-ID: <fo5oph$rre$2@ger.gmane.org>
References: <1201544344.5882.45.camel@hammer.suse.cz>
	<20080130124544.1f562944@widy.localdomain>
	<1201695196.27523.52.camel@hammer.suse.cz> <47A2D217.7070000@gmail.com>
	<1202075839.17746.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ppp78-37-139-107.pppoe.avangarddsl.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: Re: [patch commit request] kdrive xserver:	support	for	key	codes 128-255
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
X-List-Received-Date: Mon, 04 Feb 2008 01:12:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Stanislav Brabec wrote:

> Junqian Gordon Xu wrote:
>> On 01/30/2008 06:13 AM, Stanislav Brabec wrote:
>> >> Paul Sokolovsky wrote:
>> >> Can you please elaborate what the application of this patch would
>> >> mean for OE (besides fixing support for one specific obscure
>> >> peripheral)?
>> 
>> I guess I probably would be yelled at for not raising this before
>> committing your patch.
>> 
>> Is this patch specific to Zaurus clamshells, akita/spitz/c7x0? In other
>> words, are there any other devices benifiting from the extended
>> keycode.
>>   I vaguely remember Dmitry asked about extended keycode for tosa, but
>> I'm not sure he's talking about the same thing.
> 
> No. It adds support for key codes 128-255 in general.
> 
> Let he test to assign these key codes in the kernel driver. He should
> see them non-mangled in X.

Thanks. I'll test. Should I use -keybd keyboard or -keybd evdev... ?

> 
> Note that is cannot provide codes above 255 - it is a major limitation
> of X11 protocol.

Hmmm. According to the <linux/input.h> there are a plenty of keys with 
keycodes 0x160 -- 0x1ff. They can't be handled by the X11?

-- 
With best wishes
Dmitry




