Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QVjCK-0002CF-Rr for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jun 2011 13:51:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QVj94-0003Ov-BA for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jun 2011 13:47:58 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jun 2011 13:47:58 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jun 2011 13:47:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 12 Jun 2011 13:47:45 +0200
Message-ID: <it2911$eb0$1@dough.gmane.org>
References: <4DF0C472.4030608@dresearch-fe.de> <4DF14C7E.7000701@gmail.com>
	<4DF48491.6070901@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DF48491.6070901@dresearch-fe.de>
X-Enigmail-Version: 1.0.1
Subject: Re: Distros supporting older kernels?
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
X-List-Received-Date: Sun, 12 Jun 2011 11:51:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-06-11 11:19, Steffen Sledz wrote:
> On 10.06.2011 00:43, Khem Raj wrote:
>> On 06/09/2011 06:02 AM, Steffen Sledz wrote:
>>> Hi Distro Maintainers,
>>>
>>> as you could read in earlier messages of mine, we're forced to use an
>>> older kernel version (2.6.24) for our hardware. This brings a lot of
>>> problems as you can imagine (e.g. we're also bound to udev-141).
>>>
>>> Until now we've used angstrom-2008.1 with some own patches according to
>>> the linux-libc-headers and udev versions for our hardware which were
>>> reasonably not accepted by the Angstrom maintainers (see discussions [1]
>>> or [2]).
>>>
>>> In there current situation (angstrom-2008.1 is deprecated, the new layer
>>> concept will come up) we're looking for a new, better, less hacky
>>> solution.
>>>
>>> My first question therefor is if there are any distros explicitely
>>> supporting older kernels (pre 2.6.27) yet? Or are willing to work on it?
>>>
>>
>> I guess a machine layer on top of oe-core could be something you can
>> work out and add/override needed recipes in this layer.
> 
> I think it's not that easy.
> 
> For kernels prior to 2.6.27 you can't use a lot of core components (e.g.
> udev with versions higher than 141 or eggdbus) which *a lot of other
> components* depend on.
> 
> The underlying problem are some kernel API functions like inotify_init1
> or epoll_create1. Some distros (e.g. Angstrom) use linux-libc-headers
> 2.6.31 which is higher then 2.6.27 (what in my opinion conflicts with
> [1]). So there's no chance to detect the mentioned kernel functions
> correctly at compile time. :(
> 
> As a consequence you have to check this in *all* programs at runtime.
> This is a good wish but hard to realize. E.g. the udev maintainers
> itself rejected a related patch[2] and say that they are not willing to
> support older kernel versions.
> 
> So in my opinion there are two possible ways:
> 
> 1. Use only the old supported versions of the components (udev-141 and
> glib-dbus instead of eggdbus) with all the consequences for other programs.
> 
> 2. Determine *all* critical kernel functions, look for *all* the places
> where these are used, and patch them.
> 
> Both are a lot more than some override recipes. So i think this needs an
> own distro with all the maintenance and testing.

3) Cut your losses and update your kernel port. At some point it just
isn't economically feasible aymore to bend userspace against an obsolete
kernel.

I'm still stuck with 2.6.32 at work for a lot of customers, which is
accumulating more and more backports.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN9KdhMkyGM64RGpERArsBAKCcIqGbU9C7qjirf9YAU4xUBdAKMACfV50G
GOjNf7icEEzOcx81w0N64Uk=
=SMzJ
-----END PGP SIGNATURE-----



