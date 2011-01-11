Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pcaoy-0002QG-4N for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 10:47:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcaoU-0004IY-V5 for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 10:46:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 10:46:50 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 10:46:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 11 Jan 2011 10:46:35 +0100
Message-ID: <igh8tr$c8i$1@dough.gmane.org>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>	<ifl85e$ets$1@dough.gmane.org>	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>	<4D1E32AF.70203@balister.org>	<AANLkTinDNZbGuuXj4rkkphC5bdN+zaLfc+TYYD5gQS+j@mail.gmail.com>	<1294680282.4307.7639.camel@mill.internal.reciva.com>	<AANLkTimXV8BGQf8DQ7rNqu42d2E-RFaEUYkfMEOLPh+6@mail.gmail.com>
	<4D2C22A3.3030602@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D2C22A3.3030602@xora.org.uk>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Tue, 11 Jan 2011 09:47:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-01-11 10:28, Graeme Gregory wrote:
> This is really a technical disagreement between two developers so
> forwarded it back to the technical list.
> 
> I do not have my panda yet to test new bootloaders, I can rely on the
> one official supported by TI working well until tests on a newer version
> can be performed. Until new version is tested on real panda I am against
> upgrading it. If some distro does not have the sources in its fetchable
> list can the source archive not be copied to a more general source mirror?

I was actually working with Tom to get the OE and angstrom mirrors
synced, but I stopped that.


> 
> Graeme
> 
> On 10/01/2011 22:10, Frans Meulenbroeks wrote:
>> Dear TSC,
>>
>> Thank you for your reply.
>> I agree that replacing the SRC_URI with one that is fetchable
>> independent on distro specifics is the safest way to handle this.
>> (but then again the solution I took was suggested by the upstream
>> maintainer of the code).
>>
>> Unfortunately I feel that this decision does not touch the core of the
>> problem.
>> The issue at hand is that we have a maintainer that is already aware
>> of the issue for almost three months (I've reported this problem
>> already back in october).
>> However this maintainer fails to take action, and has an attitude of
>> "it works for me and my distro it is ok, and if it does not work for
>> someone else, I don't care".
>> I would have appreciated it if the TSC would take a position against
>> this attitude,and the neglection to properly act as a maintainer.
>>
>> I feel this attitude is damaging OE.
>> The blunt actions of this person have already driven away several
>> people, and frankly speaking I'm also rapidly loosing interest to work
>> on issues that are not strictly needed for my own projects.
>> I feel we have a serious problem at hand that should have been dealt
>> with a long time ago, difficult as it is.
>>
>> If we want to have a future beside yocto, it is important to be a
>> friendly, respectful and cooperative community. Otherwise I fear OE
>> will be history in a short while (which is something that I would
>> pity, having been a member of the project for 5 years or so). As a
>> crew I feel we are already close to being subcritical in number.
>> Anyway, I for me, I am getting tired of being bitched at, where a
>> polite message probably would have had much more effect.
>> This is especially the case if it is by someone who has repeatedly
>> shown disrespect for the work of others when it comes to making
>> changes.
>>
>> A bit sad,
>> Frans Meulenbroeks.
>>
>>
>> 2011/1/10 Phil Blundell<philb@gnu.org>:
>>> Frans,
>>>
>>> Thanks for your email.  We discussed this issue at the TSC meeting held
>>> on 2011-01-05.
>>>
>>> The TSC feels that we should be guided by two key principles, namely:
>>>
>>> a) all recipes should have a SRC_URI which is fetchable without relying
>>> on any DISTRO-specific configuration (e.g. custom source mirrors); and
>>>
>>> b) the version number (or SRCREV) of a given recipe should only be
>>> bumped after testing and consultation with its users.  This applies
>>> particularly to packages such as bootloaders and kernels which contain
>>> many machine-specific parts and which would have particularly bad
>>> consequences if inadvertently upgraded to nonworking versions.
>>>
>>> In this particular case the TSC believes that the right course of action
>>> is to:
>>>
>>> 1. Find a way to repair the SRC_URI for the existing u-boot recipe so
>>> that it is fetchable for everyone, but without changing the version of
>>> the source code in use or the resulting binaries.  (For example, the
>>> SRC_URI could be pointed directly at a snapshot tarball hosted in some
>>> suitable place.)
>>>
>>> 2. Create an additional recipe for the current mainline version of
>>> u-boot which can be fetched from SVN.  Individual machine maintainers
>>> can test this version and, if it works for them, switch to using it at
>>> their discretion.
>>>
>>> Regards
>>>
>>> Phil
>>> (for the TSC)
>>>
>>> On Sat, 2011-01-01 at 19:37 +0100, Frans Meulenbroeks wrote:
>>>> [Added TSC to the email, as I would like to request a decision on how
>>>> to handle this]
>>>>
>>>>> Frans, given these two choices:
>>>>>
>>>>> 1) Recipe that builds and has tested output (but depends on distro
>>>>> source
>>>>> mirrors).
>>>>>
>>>>> 2) Recipe that builds (even without source mirrors), BUT the output
>>>>> is not
>>>>> tested.
>>>>>
>>>>> We should use choice #1, since the OUTPUT is tested. If someone who
>>>>> can test
>>>>> the output wants to bump the SRCREV, that is fine. Bumping SRCREVs
>>>>> just to
>>>>> get recipes to build and not testing the output only leads to
>>>>> frustrated
>>>>> users who think the output works.
>>>>>
>>>>> I'd point out that no one on the panda list (or this list) has
>>>>> mentioned
>>>>> they noticed the recipe doesn't build, so I am not sure you are
>>>>> addressing
>>>>> an actual problem.
>>>>>
>>>>> Philip
>>>>>
>>>> Philip, thanks for your reply.
>>>>
>>>> I'd like to point out that the fact that the recipe does not build has
>>>> been reported to this very list late oct 2010.
>>>> At that point Steve Sakoman (the owner of the git from which the
>>>> recipe pulls) suggested to use u-boot 2010.09.
>>>> I did not get to fixing the recipe until yesterday. As u-boot 2010.12
>>>> is already out I figured that this would be a better choice.
>>>> I am also on the u-boot list and I know the changes from Steve are
>>>> pulled into u-boot master.
>>>> (and wrt to availability: I am quite confident that in a few years
>>>> time this version can still be retrieved).
>>>>
>>>> The problem that this recipe does not build is already known for more
>>>> than 2 months but the machine maintainer apparently is not interested
>>>> in fixing his recipe.
>>>> As such I feel the maintainer is doing a bad job.
>>>>
>>>> There are several ways to fix the problem.
>>>> To coin a few:
>>>> - move to a SRCREV that seems to me more stable (e.g. because it is a
>>>> merge with upstream). I agree that there is still a chance of getting
>>>> a breakage in the future
>>>> - putting the tarball for the version that we have now at e.g.
>>>> downloads.openembedded.org or so and adapt the recipe (we have done
>>>> this for other recipes as well)
>>>> - move to upstream. The panda changes from Steve have been merged by
>>>> Wolfgang. I am not aware of any reason not to do so.
>>>>
>>>> While each alternative has its pro's and con's none of them is
>>>> complicated, and any of them could have been done easily.
>>>> As the problem is already reported last october, I feel the maintainer
>>>> is not doing a good job, and actually makes things worse by abusing
>>>> his powers to block others who want to fix it.
>>>> Apparently spending a few minutes to resolve the issue is too much
>>>> work, but there is of course always time to bitch and moan toward
>>>> others who do want to keep OE a system that supports multiple machines
>>>> and multiple distros.
>>>>
>>>> I'd like to ask the TSC to come up with a decision on how we should
>>>> fix this recipe. I have already indicated a few solutions above. Yet
>>>> another alternative (which is not too desirable) is to create another
>>>> machine that chooses a proper recipe for u-boot.
>>>>
>>>> Frans
>>>>
>>>> PS: the fact that there are no other reports of this is probably
>>>> because not many people rebuild u-boot. Most of my boards still use
>>>> the u-boot that was on the board when I got it. I guess this also
>>>> holds for other people.
>>>>
>>>> _______________________________________________
>>>> tsc mailing list
>>>> tsc@lists.linuxtogo.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/tsc
>>>
>>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNLCb7MkyGM64RGpERAo5eAJ9JK6wiIgYldJdVJDXW1ab6mmPTvQCfbXQ+
n7QUhom6IBcJzv4lfFAq/74=
=EcQF
-----END PGP SIGNATURE-----



