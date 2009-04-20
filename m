Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LvsVH-0008Ez-Lv
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 14:21:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LvsR5-0000jQ-El
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 12:17:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 12:17:19 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 12:17:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 14:17:06 +0200
Message-ID: <gshp43$n4q$1@ger.gmane.org>
References: <1236373070.7461.49.camel@utx.utx.cz>	<359c5480903061431t30283e9dgda3d57aedfbb8999@mail.gmail.com>	<1240220030.14678.5.camel@utx.utx.cz>
	<gshgnr$t3e$1@ger.gmane.org>
	<1240227187.6832.9.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240227187.6832.9.camel@hammer.suse.cz>
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
X-List-Received-Date: Mon, 20 Apr 2009 12:21:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-04-09 13:33, Stanislav Brabec wrote:
> Koen Kooi wrote:
>
>>> Proposed solution:
>>> Either:
>>> wpa_wupplicant should perform (or trigger somehow) wlan network hotplug
>>> completely (i. e. call ifup after network association instead of udev
>>> device addition)
>>> or:
>>> Revert previous behavior - "passive" wpa_supplicant.
>>> or:
>>> Apply mentioned patch. Ugly, it fixes only symptom, not the cause.
>>
>> With my distro hat on: shouldn't something like connman take care of
>> wireless? Which would probably mean going back to a passive wpa_supplicant.
>
> Yes, at least on distro build conf level (but probably also on runtime
> or package selection level) there should a way to select networking
> concept:
>
> - ifup/ifdown with /etc/network/interfaces, udev hotplugging and
>    wpa_supplicant handling lost association
>
> - connman handling everything
>
> - NetworkManager handling everything

There's a fourth option:

  - connman handling everything that isn't in /etc/network/interfaces, 
which is the option I like best :)

> OT: I have no experience with connman. Does it have the same "one
> network active at a time" constraint like NetworkManager has?

Nope :)

> And does connman automatically handle "association lost" case for wireless?

It does seem to do that for me with my wep network.

regards,

Koen




