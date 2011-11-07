Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RNMH4-0004ji-6d
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 11:17:54 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RNMB4-0006XN-Jz; Mon, 07 Nov 2011 11:11:42 +0100
From: Phil Blundell <philb@gnu.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 07 Nov 2011 10:11:36 +0000
In-Reply-To: <4EB79325.80107@dresearch-fe.de>
References: <4EB79325.80107@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1320660702.22985.636.camel@phil-desktop>
Mime-Version: 1.0
Cc: Tim, Riker <Tim@Rikers.org>,
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
X-List-Received-Date: Mon, 07 Nov 2011 10:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 09:13 +0100, Steffen Sledz wrote:
> Recently we hit a problem with the default route handling of udhcpc.
> 
> The provided script busybox/files/simple.script (aka /etc/udhcpc.d/50default) removes all existing default routes before setting new routes. I think that's wrong.
> 
> If multiple interfaces offer default routes (via DHCP, static config, or any other way) there is no reason to prefer one over another (without having any additional information). So the script should only add the new default route. A short search in the internet brings up a lot of useful scenarios for multiple default routes.
> 
> So i tried to remove the part from the script which removes the existing routes. This led to a confusing situation.
> 
> If the script uses "route add default gw ..." (which is the case if /sbin/ip is not installed) everything seems to work fine.
> 
> But if /sbin/ip (from the busybox package) is installed the "ip route add default via ..." results in an "ip: RTNETLINK answers: File exists" error. In my opinion this is an error in the busybox ip implementation.

It's not a defect in busybox ip; this is the intended behaviour of "ip
route add" and iproute2 behaves the same.  If you want multiple routes
for the same destination then you need to use "ip route append" instead.
Arguably it is a defect in "route" that you are allowed to set multiple
equivalent routes without having to specify any ordering but, given that
"route" is old and obsolescent, I am not too enthusiastic about trying
to fix it.

As to whether it makes sense for the default script to tear down old
routes, my view is that the current behaviour probably is the correct
default.  Wanting to use multiple default routes is a fairly unusual
case and anybody who does want to do that is probably capable of writing
a custom script for whatever their installation requires.  Whereas, if
dhcpcd were to leave old routes in place by default, you would probably
end up with naive users getting stale routes left around when switching
between networks and ending up with hard-to-debug connectivity problems.

p.




