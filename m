Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxHKH-0001Ut-6z for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 14:49:57 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxH8y-00086W-S4 for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 14:38:16 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 14:38:16 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 14:38:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 03 Aug 2012 14:38:18 +0200
Message-ID: <jvggnd$naj$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Fri, 03 Aug 2012 12:49:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-08-12 12:32, Khem Raj schreef:
> 
> On Aug 2, 2012, at 1:11 AM, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> 
>> On Wednesday 01 August 2012 15:56:34 Khem Raj wrote:
>>> On Aug 1, 2012, at 8:11 AM, Koen Kooi <koen@dominion.thruhere.net>
>>> wrote:
>>>>> Along with upgrade use the release tarballs instead of git
>>>> 
>>>> For an update we need to pull in some patches from master, so a git
>>>> recipe is still the preferred way.
>>> 
>>> OK, you know more about it then me but do you know how many those
>>> will be ? in other words does systemd releases mean much for
>>> stability yet or still its a project moving at so fast pace ?
>>> 
>>> I see that releases are rolled out almost every month, that sort of
>>> could mean either way, we wait until the next release or just take
>>> from a commit upstream
>>> 
>>> I feel like staying with a release+patches could be one way if we are
>>> not importing pathes too often. but I don't know how often that would
>>> be. For the testing I did release worked well for those platforms
>>> x86, ppc and arm
>> 
>> One might suggest, if stable releases are working and you want to live
>> on the bleeding edge in your distro, you can easily do so there…
> 
> This is moving forward from where we were so it includes all the git
> commits that were there until cd96b3b86abb4a88cac2722bdfb6e5d4413f6831
> commit so this update is inclusive.
> 
> we can also think of having a stable recipe and a git recipe but systemd
> releases are almost a month apart it would be more or less covered if we
> moved from release to release with some patches if needed.

If you look at the fedora and debian packages you'll see that they also pull
in a fair number of patches, so it's not uncommon to do what we're doing.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQG8Y6MkyGM64RGpERAjOXAJ4mDqgr4BngOrGZk9drnilAvprDygCcCnW7
yiaKvRITgm6shVyoul4z3a0=
=bngc
-----END PGP SIGNATURE-----



