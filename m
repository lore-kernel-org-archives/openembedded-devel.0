Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KlBDt-0002OP-B1
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 01:35:13 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id E95B2171525
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 19:31:01 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 01 Oct 2008 19:31:01 -0400
X-Sasl-enc: sM4SvD/rkkJg5kqyhk1Rz0Ffwas4Yo8LdthD9RRacGhY 1222903861
Received: from [192.168.1.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D9D9B15B0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 19:31:00 -0400 (EDT)
Message-ID: <48E4082D.9030000@whitby.id.au>
Date: Thu, 02 Oct 2008 09:00:53 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E36C18.4090504@smartlink.ee>	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>	<48E3762E.6000203@smartlink.ee>	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>
	<gc017m$gq4$1@ger.gmane.org>
In-Reply-To: <gc017m$gq4$1@ger.gmane.org>
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 23:35:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 01-10-2008 15:34, Nicola Mfb wrote:
>> 2008/10/1 Kalev Lember<kalev@smartlink.ee>
>> [...]
>>
>>> Well yes, but if you just do:
>>> git clone git://git.openembedded.net/org.openembedded.dev
>>>
>>> you'll end up on master branch, which is not updating.
>>
>> Yes, the same here, i opened one of those bugs.
>> I'm using a semiautomated makefile environment for fso/openmoko, this use
>> git and not monotone, so this problem affects a lot of peoples, please fix!
> 
> That's what you get for using makefiles....

A typical response from Koen.  Sigh.  For once it would be good for him
to focus on the problem at hand (which was reported correctly with no
mention of makefiles) instead of trying to take childish potshots at
things he has a personal vendetta against.

A number of places on the internet (including
http://elinux.org/BeagleBoardAndOpenEmbeddedGit,
http://wiki.openembedded.net/index.php/Git,
http://wiki.neurostechnology.com/index.php/OpenEmbedded_OSD2,
http://linux.paduli.org/index.php?title=OpenEmbedded%2C_linux%2C_software_e_sviluppo_per_dispositivi_embedded!,
 just for some examples) advise users to type the following command to
clone the trial OE git repo, with no mention of needing a specific branch:

   git clone git://git.openembedded.net/org.openembedded.dev/

In fact, Koen himself advised users to use exactly that command (and no
mention of needing to check out a specific branch) in the #beagle IRC
channel on 14th June 2008 (see
http://www.beagleboard.org/irclogs/index.php?date=2008-06-14 at [12:43:48]).

That used to work, and now it doesn't, due to an unannounced change to
the operation of the trial OE git repo.

Note that I've been careful to say "trial OE git repo" everywhere, since
it's still a trial and there is no official OE documentation on whether
you should be pulling from the master branch or the org.openembedded.dev
branch (and as can be seen from the BeagleBoard page above, and Koen's
instructions to people on the #beagle IRC channel, the confusion exists
independently of whether a makefile is used or not).  So anyone using
the trial OE git repo does so at their own risk.

The beauty of a makefile is that *everyone* using it can be migrated to
the latest correct instructions for using the trial OE git repo
automatically.

Koen, are you going to go around and fix all the places on the internet
that have propagated the obsolete instructions on how to use the trial
OE git repo (including the IRC log where you yourself gave those
obsolete instructions)?

I'll be doing so today for all users of the Makefiles who are affected
by this change in how the trial OE git repo should be accessed.

-- Rod


