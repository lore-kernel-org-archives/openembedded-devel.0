Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RNMzU-000080-Ng
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 12:03:48 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RNMtS-0006YD-Rw; Mon, 07 Nov 2011 11:57:35 +0100
From: Phil Blundell <philb@gnu.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 07 Nov 2011 10:57:33 +0000
In-Reply-To: <4EB7B383.10106@dresearch-fe.de>
References: <4EB79325.80107@dresearch-fe.de>
	<1320660702.22985.636.camel@phil-desktop>
	<4EB7B383.10106@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1320663454.22985.643.camel@phil-desktop>
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
X-List-Received-Date: Mon, 07 Nov 2011 11:03:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 11:31 +0100, Steffen Sledz wrote:
> What do you mean with stale routes? If an interfaces supports a
> default route it is availailable as long as the interface is up. If
> the interface goes down all routes using this interface are removed.

I was thinking about the case of an interface changing address without
actually going down.  For example, try this:

# ip addr add 192.168.11.2/24 dev dummy0
# ip route append default via 192.168.11.1
# ip addr add 192.168.12.2/24 dev dummy0
# ip addr del 192.168.11.2/24 dev dummy0
# ip route append default via 192.168.12.1

which, I think, will leave you with a "stale" default route pointing to
192.168.11.1 even though you no longer have any addresses on that
subnet.

If it's the case that interfaces always do go down and then up again
when changing configuration then you're right, it would be a non-issue.
I guess maybe the best thing to do is to make sure that this is true and
then we could avoid the unconditional route squashing as you suggest.

> On the contrary. As i mentioned above we really hit a problem with current setting.
> 
> * Interface ethA (static config with default route) comes up and sets this default route.
> * Interface ethB (in our case a USB-NIC for diagnostic purposes, DHCP with default route) comes up and *replaces* the former default route.
> 
> scenario a)
> * Interface ethB goes down and removes its default route.
> * There does not exist a default route any longer. :(
> 
> scenario b)
> * Interface ethA tries to go down.
> * This fails because removing the not-existing default route of config ethA fails. :(

That latter scenario sounds like a separate scripting bug: failing to
remove a route shouldn't prevent the interface going down.  But I agree,
scenario A does sound like one that we should try to support and I guess
it oughtn't to be too hard to make the default scripts work with that.

There is still an unavoidable ambiguity about which default route should
actually be used, though: at some point something, somewhere is going to
have to decide whether the "new" or "old" default route is the preferred
one.  I suppose the most sensible default policy would be to have the
newer one win.

p.




