Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RNND4-0000iy-PS
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 12:17:50 +0100
Received: by wwf4 with SMTP id 4so5309610wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 03:11:38 -0800 (PST)
Received: by 10.227.208.149 with SMTP id gc21mr28384618wbb.10.1320664297996;
	Mon, 07 Nov 2011 03:11:37 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id es5sm27361543wbb.11.2011.11.07.03.11.37
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 03:11:37 -0800 (PST)
Message-ID: <4EB7BCE8.8080604@dresearch-fe.de>
Date: Mon, 07 Nov 2011 12:11:36 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <4EB79325.80107@dresearch-fe.de>
	<1320660702.22985.636.camel@phil-desktop>
	<4EB7B383.10106@dresearch-fe.de>
	<1320663454.22985.643.camel@phil-desktop>
In-Reply-To: <1320663454.22985.643.camel@phil-desktop>
X-Enigmail-Version: 1.3.2
Cc: Tim Riker <Tim@Rikers.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: default route handling of udhcpc
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
X-List-Received-Date: Mon, 07 Nov 2011 11:17:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2011 11:57, Phil Blundell wrote:
> On Mon, 2011-11-07 at 11:31 +0100, Steffen Sledz wrote:
>> What do you mean with stale routes? If an interfaces supports a
>> default route it is availailable as long as the interface is up. If
>> the interface goes down all routes using this interface are removed.
> 
> I was thinking about the case of an interface changing address without
> actually going down.  For example, try this:
> 
> # ip addr add 192.168.11.2/24 dev dummy0
> # ip route append default via 192.168.11.1
> # ip addr add 192.168.12.2/24 dev dummy0
> # ip addr del 192.168.11.2/24 dev dummy0
> # ip route append default via 192.168.12.1
> 
> which, I think, will leave you with a "stale" default route pointing to
> 192.168.11.1 even though you no longer have any addresses on that
> subnet.

OK, i see.

> If it's the case that interfaces always do go down and then up again
> when changing configuration then you're right, it would be a non-issue.
> I guess maybe the best thing to do is to make sure that this is true and
> then we could avoid the unconditional route squashing as you suggest.

I can't imagine that one of the OE related distros reconfigures network interfaces in described way. I believe they all use something like ifup/ifdown.

>> On the contrary. As i mentioned above we really hit a problem with current setting.
>>
>> * Interface ethA (static config with default route) comes up and sets this default route.
>> * Interface ethB (in our case a USB-NIC for diagnostic purposes, DHCP with default route) comes up and *replaces* the former default route.
>>
>> scenario a)
>> * Interface ethB goes down and removes its default route.
>> * There does not exist a default route any longer. :(
>>
>> scenario b)
>> * Interface ethA tries to go down.
>> * This fails because removing the not-existing default route of config ethA fails. :(
> 
> That latter scenario sounds like a separate scripting bug: failing to
> remove a route shouldn't prevent the interface going down.  But I agree,
> scenario A does sound like one that we should try to support and I guess
> it oughtn't to be too hard to make the default scripts work with that.
> 
> There is still an unavoidable ambiguity about which default route should
> actually be used, though: at some point something, somewhere is going to
> have to decide whether the "new" or "old" default route is the preferred
> one.  I suppose the most sensible default policy would be to have the
> newer one win.

Why do we have to make this decision? Let them both exist and the kernel make the routing decisions depending on its built in strategy and config.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


