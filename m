Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDNlQ-0004lN-CD for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 21:47:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDNkb-0004ai-9X for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 21:46:37 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 21:46:37 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 21:46:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Nov 2010 21:46:25 +0100
Message-ID: <iaptb1$bpb$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org>
	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Tue, 02 Nov 2010 20:47:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-11-10 08:02, Frans Meulenbroeks wrote:
> 2010/10/21 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Recipes/linux is a mess and recipes/u-boot is as well. It would be a
>> nice topic for OEDEM to see if we discuss switching to a poky BSP model.
>> It would boil down to:
>>
>> 1 base bblayer with shared files:
>> * conf/machine/include
>> * recipes/linux/*.inc
>>
>> 1 bblayer per machine or SOC_FAMILY containing:
>> * machine.conf
>> * first and second stage bootloaders
>> * kernel
>>
>> So, what are peoples thoughts on this? I haven't thought this through
>> myself, so feel free to point out any show stoppers.
>> I do not want this to turn into a "splitting the metadata" discussion,
>> while I'm all for that, it really is a seperate effort and discussion.
>> But any bblayer style split would benefit from OE being a collection of
>> git submodules instead of a monolithic tree[1].
>>
>> Regards,
>>
>> Koen
>>
>> [1] Provided git submodules stop sucking so hard in future git versions
> 
> Replying on the original message on purpose.
> 
> Is the discussion concluded?
> How do we proceed with this? Should we have a vote? escalate to TSC?
> postpone until after the dec 1 release? already do something in a
> branch?

I have an experimental beagleboard layer, but I want to spend a bit more
time using it before I come up with an RFC for it.

You have have a look at it at
http://gitorious.org/angstrom/angstrom-layers/trees/master/BSP/beagleboard
but I want to stress that it currently is a quick hack that doesn't
exploit bblayers fully yet.

RP did show me a neat trick to overlay files without copying the
complete metadata:

http://gitorious.org/angstrom/angstrom-layers/commit/9890faee0eb861bdfd995910090126a8fe83be90.patch

So I would encourage people to try creating their own machine layers to
get a feel for it so the discussion will be based on actual experience
instead of handwaving :)

I do fear that pulling things into seperate layers too much will make it
harder to propagate fixes...

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM0HihMkyGM64RGpERAtlXAKCFK7WmZFTQACKJiegOSKx+panfcQCeJpq0
Iotf629VoDn0Tb48DkbyHkw=
=ot/l
-----END PGP SIGNATURE-----



