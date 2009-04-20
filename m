Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LvqGq-0008CY-7q
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 11:58:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LvqCe-00031d-Hu
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 09:54:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 09:54:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 09:54:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 11:54:02 +0200
Message-ID: <gshgnr$t3e$1@ger.gmane.org>
References: <1236373070.7461.49.camel@utx.utx.cz>	<359c5480903061431t30283e9dgda3d57aedfbb8999@mail.gmail.com>
	<1240220030.14678.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240220030.14678.5.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] new interface is already up but udev must call ifup anyway
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
X-List-Received-Date: Mon, 20 Apr 2009 09:58:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20-04-09 11:33, Stanislav Brabec wrote:
> Nicola Mfb wrote in Fri 03/06 2009 at 23:31 +0100:
>> 2009/3/6 Stanislav Brabec<utx@penguin.cz>
>>
>>> Few weeks ago yet another change happened in the dark, and network did
>>> not start to work automatically after inserting my WLAN card.
>>>
>>> Debugging this problem, I found that interface is already up﻿ but not
>>> configured when /etc/udev/scripts/network.sh is called. This script
>>> thinks, that card is already configured and quits. This behavior is
>>> intentional and was introduced three years ago﻿ (and working).
>>>
>>> The fix actually reverts following change:
>>> Author: Matthias Hentges<oe@hentges.net>
>>> Date:   Thu Apr 20 16:01:09 2006 +0000
>>>     udev: network.sh: Do not ifup an already configured network device
>>> again.
>>>
>>> That is why I am asking:
>>>
>>> Is anybody aware of change, that made new interfaces up without
>>> configuring them? Was it an intention or not?
>>>
>>
>> I had the same problem with bnep bluetooth networking, and another issue
>> when spawing dhcp, take a look at:
>> http://lists.openmoko.org/pipermail/devel/2009-February/004895.html
>
> I researched this problem a bit. It seems, that it's caused by
> wpa_supplicant. New wpa_supplicant quickly responds to the device
> addition. It turns the device up and sets up the wireless link, but not
> network.
>
> It causes several problems:
> - link is up ->  no ifup
>
> After applying mentioned patch:
> - AP lookup takes about 20 seconds. Too much for dhcp client =>
>    it fails. Surprisingly avahi succeeds.
>
> Proposed solution:
> Either:
> wpa_wupplicant should perform (or trigger somehow) wlan network hotplug
> completely (i. e. call ifup after network association instead of udev
> device addition)
> or:
> Revert previous behavior - "passive" wpa_supplicant.
> or:
> Apply mentioned patch. Ugly, it fixes only symptom, not the cause.

With my distro hat on: shouldn't something like connman take care of 
wireless? Which would probably mean going back to a passive wpa_supplicant.

regards,

Koen



