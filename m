Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JdZLz-0002Ke-7q
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 00:11:51 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id B5C6ADE527
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 19:11:50 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 23 Mar 2008 19:11:50 -0400
X-Sasl-enc: /L0EEntDaUV3Aluri5bK+hsSR1xdTgYxwKCqtcloRGSX 1206313910
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTPSA id CECC02F691
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 19:11:49 -0400 (EDT)
Message-ID: <47E6E37E.4030708@whitby.id.au>
Date: Mon, 24 Mar 2008 09:40:54 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>	<1205858910.7500.39.camel@dax.rpnet.com>	<frosov$c0b$1@ger.gmane.org>
	<47E5A67B.5030809@dls.net>	<47E5E7DD.4030304@dls.net>
	<fs5dbl$n1g$1@ger.gmane.org>	<20080323181847.GD11817@smtp.west.cox.net>	<fs6930$cg0$1@ger.gmane.org>
	<20080323222006.GE11817@smtp.west.cox.net>
In-Reply-To: <20080323222006.GE11817@smtp.west.cox.net>
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Sun, 23 Mar 2008 23:11:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Sun, Mar 23, 2008 at 07:55:28PM +0100, Koen Kooi wrote:
>> Tom Rini schreef:
>> | On Sun, Mar 23, 2008 at 12:02:13PM +0100, Koen Kooi wrote:
>> |
>> |> Or use the stable branch? The stable branch seems to fit your needs:
>> |> It's available, it's maintained and changes can only go in through a
>> |> public and open review process.
>> |
>> | So you're saying that opkg will move to the stable branch once someone
>> | documents how to update distros for it?
>>
>> No, it can go into the stable branch once the steps in
>> http://linuxtogo.org/gowiki/Angstrom/Backport_from_dev_to_stable have
>> been satisfied.
> 
> Well, presumably there will be another stable branch declared at some
> point and my main point holds.  Lets use this as a chance to document
> how to move a distro up to opkg from ipkg, and maybe sort out the kinks
> (such as say making it easy at the distro level to turn off GPG if size
> is more important than signing).

Tom,

Unfortunately, that's not how Koen works.  He pushes something through 
with no regard for impact on other distros, as long as it works for the 
small set of distros that he personally uses.  Then he just blames 
everyone else for not keeping up instead of giving assistance to others.

So unless anyone else did the work to reverse-engineer how to move from 
ipkg to opkg, those with the knowledge of how to do so already will just 
keep maintaining their own favourite distros with no regard to the fact 
that they broke a number of other distros in OE, and when the time comes 
to cut the next stable branch they will say "oh, you didn't keep up with 
the changes, so you won't be part of this stable branch".

-- Rod (who is in favour of opkg, if deployed in a well-managed fashion)


