Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N13UI-0005ES-KD
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 21:38:21 +0200
Received: from gandalf.denix.org ([71.251.63.147]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRX007FYL56NEJ2@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	22 Oct 2009 14:36:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B011214AF60; Thu,
	22 Oct 2009 15:36:40 -0400 (EDT)
Date: Thu, 22 Oct 2009 15:36:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091022193640.GA20195@denix.org>
References: <4AE0B157.80807@gmail.com>
MIME-version: 1.0
In-reply-to: <4AE0B157.80807@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Question about bluez4 and PROVIDES_append_angstrom
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
X-List-Received-Date: Thu, 22 Oct 2009 19:38:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 22, 2009 at 09:24:07PM +0200, Marco Cavallini wrote:
> Hello,
> first of all I must say that I am not a OE expert and I'd like to learn
> and understand, so please apologize if my question is too silly for most
> of you :-)
> 
> I am quite confused about a few lines I found into the following files.
> The result of these lines faced me to errors using KaeilOS distro.
> 
> This modification looks (to me) related to bluez4 and Angstrom only and
> I wonder why some package recipes (bluez4*.bb) contains some lines that
> strictly ties them to Angstrom distribution breaking other distributions.

Can you please be more specific as to what is broken for your distribution?

> Files I found are the following:
> recipes/bluez/bluez4_4.35.bb:PROVIDES_append_angstrom =
>  " bluez-utils bluez-libs"
> recipes/bluez/bluez4_4.37.bb:PROVIDES_append_angstrom =
>  " bluez-utils bluez-libs"
> recipes/bluez/bluez4.inc:PROVIDES_append_angstrom =
>  " bluez-utils-dbus bluez-utils bluez-libs"
> 
> Lines are similar to these:
> # For angstrom we want this to replace at least bluez-libs
> PROVIDES_append_angstrom = " bluez-utils-dbus bluez-utils bluez-libs"
> RPROVIDES_bluez4-dev_angstrom = "bluez-libs-dev"
> 
> My question is: why these lines are not into angstrom*.bb distro recipe
> making bluez*.bb distro-independent (agnostic)?
> 
> Thank you in advance for your hints.

PROVIDES_append_angstrom is an override in bluez4 recipe specific to Angstrom. 
For other distributions it won't do anything. For Angstrom, it will _extend_ 
the default PROVIDES variable with extra values.

It's pretty standard to see small alterations for specific machines or distros 
in recipes, when most of the recipe is still common.

-- 
Denys


