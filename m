Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpIgD-0007lu-Ir for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 12:30:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpIfk-00016H-4d for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 12:30:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 12:30:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 12:30:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 28 Aug 2010 12:27:40 +0200
Message-ID: <i5aoas$sja$2@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 10:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Your patch does too many things at once, to recipes I maintain, so
please split it up per recipe and I'll ack/nack the seperate patches.
I'm getting suck of such jumbo patches that can't be reverted cleanly.
I'm still dealing with the fallout from the crappy deletions frans did,
so patches like this aren't helping.

On 27-08-10 17:31, Khem Raj wrote:
> Hi Koen
> 
> Thanks for your time to look into it and comments. It would help if
> you could explain a bit more why you think
> changes are not good. I have individually explained the reasons below
> your comments. It would really help to
> improve these if you could shed some light on the reason why you think
> the changes are not good. If you think
> 
> 
> On Fri, Aug 27, 2010 at 4:08 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 27-08-10 10:11, Khem Raj wrote:
>>>> * Move recipes to nonwotking which are depending upon other recipes
>>>>   which are already in nonworking state.
>>>>
>>>> * Fix other recipes for renamed dependencies etc.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  recipes/angstrom/angstrom-bootmanager.bb           |    2 +-
> 
> NAK
> 
> 
>> if you have explained whats wrong that would have helped. I certainly dont
>> claim to be knowing all the recipes. recipes it depends upon do not exist
>> so whats the best thing to do ? This same applies to your other NAKs too.
> 
> 
>>>>  recipes/esc/esc-node-demo_git.bb                   |    4 +-
> 
> NAK
> 
>> This depends on a recipe which is under review and I have commented the same.
>> Or do you see something else is wrong?
> 
> 
>>>>  recipes/meta/meta-toolchain-arago-dvsdk.bb         |    1 +
> 
> NAK
> 
>> I wonder if you really looked at this change because all it does is removes
>> meta-toolchain-arago-dvsdk from world build. What problem do you see here ?
> 
> 
>>>>  recipes/sugar/sugar-fructose.bb                    |    2 +-
> 
> NAK
> 
>> Elena already explained it.
> 
> 
>>>>  recipes/tasks/task-arago-toolchain-target.bb       |    3 +-
> 
> NAK
> 
>> This change is removing libpng12-dev which is not provides. and
>> e2fsprogs-libs-dev
>> is now e2fsprogs-dev or am I missing some point here.
> 
> 
>>>>  recipes/tasks/task-demo-x11.bb                     |   17 ++---
> 
> NAK
> 
>> are libgles-omap3-x11demos different that non existing libgles-omap3-demos
>> if so then I can change it to just removing libgles-omap3-demos
> 
> 
>>>>  recipes/tasks/task-gmae.bb                         |    7 ++
> 
> NAK
> 
>> it uses XSERVER what doesnt really define it. What is wrong here.
> 
> 
>>>>  recipes/tasks/task-gpe.bb                          |    6 +-
> 
> NAK
> 
>> virtual/xserver is a virtual target you can not RDEPEND on it
>> but you can depend atleast thats what bitbake tells me.
> 
> 
>>>>  recipes/udev/udev-compat141_141.bb                 |    6 ++-
> 
> NAK
> 
>> if machine is not one of spitz akita c70x poodle then it is not needed
>> to RDEPEND on it. what is wrong here
> 
> 
>>>>  recipes/vlc/vlc-davinci_0.8.6h.bb                  |    2 +-
> 
> NAK
> 
>> is non existing codec-engine different then ti-codec-engine ?
>> if yes then I guess either these codecs should be committed to OE
>> or the recipe should be moved into nonworking what would you think.
> 
> 
> 
> 
> 
>>
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMeOScMkyGM64RGpERAg8/AJ0RBUVxDjLuQNTX6xgZ385GhEYvOACbBo7V
0aWBiF/l1F2zZDvltA+/aGY=
=ne75
-----END PGP SIGNATURE-----



