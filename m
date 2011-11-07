Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RNMaH-0007Jt-RE
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 11:37:46 +0100
Received: by wyh5 with SMTP id 5so4493696wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 02:31:33 -0800 (PST)
Received: by 10.227.208.77 with SMTP id gb13mr30960405wbb.4.1320661893039;
	Mon, 07 Nov 2011 02:31:33 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id z33sm778197wbm.5.2011.11.07.02.31.31
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 02:31:32 -0800 (PST)
Message-ID: <4EB7B383.10106@dresearch-fe.de>
Date: Mon, 07 Nov 2011 11:31:31 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <4EB79325.80107@dresearch-fe.de>
	<1320660702.22985.636.camel@phil-desktop>
In-Reply-To: <1320660702.22985.636.camel@phil-desktop>
X-Enigmail-Version: 1.3.2
Cc: Tim Riker <Tim@Rikers.org>
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
X-List-Received-Date: Mon, 07 Nov 2011 10:37:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2011 11:11, Phil Blundell wrote:
> On Mon, 2011-11-07 at 09:13 +0100, Steffen Sledz wrote:
>> Recently we hit a problem with the default route handling of udhcpc.
>>
>> The provided script busybox/files/simple.script (aka /etc/udhcpc.d/50default) removes all existing default routes before setting new routes. I think that's wrong.
>>
>> If multiple interfaces offer default routes (via DHCP, static config, or any other way) there is no reason to prefer one over another (without having any additional information). So the script should only add the new default route. A short search in the internet brings up a lot of useful scenarios for multiple default routes.
>>
>> So i tried to remove the part from the script which removes the existing routes. This led to a confusing situation.
>>
>> If the script uses "route add default gw ..." (which is the case if /sbin/ip is not installed) everything seems to work fine.
>>
>> But if /sbin/ip (from the busybox package) is installed the "ip route add default via ..." results in an "ip: RTNETLINK answers: File exists" error. In my opinion this is an error in the busybox ip implementation.
> 
> It's not a defect in busybox ip; this is the intended behaviour of "ip
> route add" and iproute2 behaves the same.  If you want multiple routes
> for the same destination then you need to use "ip route append" instead.
> Arguably it is a defect in "route" that you are allowed to set multiple
> equivalent routes without having to specify any ordering but, given that
> "route" is old and obsolescent, I am not too enthusiastic about trying
> to fix it.

OK, thanx to clarify this.

> As to whether it makes sense for the default script to tear down old
> routes, my view is that the current behaviour probably is the correct
> default.  Wanting to use multiple default routes is a fairly unusual
> case and anybody who does want to do that is probably capable of writing
> a custom script for whatever their installation requires.  Whereas, if
> dhcpcd were to leave old routes in place by default, you would probably
> end up with naive users getting stale routes left around when switching
> between networks and ending up with hard-to-debug connectivity problems.

What do you mean with stale routes? If an interfaces supports a default route it is availailable as long as the interface is up. If the interface goes down all routes using this interface are removed.

On the contrary. As i mentioned above we really hit a problem with current setting.

* Interface ethA (static config with default route) comes up and sets this default route.
* Interface ethB (in our case a USB-NIC for diagnostic purposes, DHCP with default route) comes up and *replaces* the former default route.

scenario a)
* Interface ethB goes down and removes its default route.
* There does not exist a default route any longer. :(

scenario b)
* Interface ethA tries to go down.
* This fails because removing the not-existing default route of config ethA fails. :(

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


