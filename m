Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PZ6ty-00040V-AC
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 20:14:06 +0100
Received: (qmail 11694 invoked by uid 1003); 1 Jan 2011 19:13:44 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Jan 2011 19:13:44 -0000
Message-ID: <4D1F7CE8.6070704@balister.org>
Date: Sat, 01 Jan 2011 14:13:44 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>	<ifl85e$ets$1@dough.gmane.org>	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>	<4D1E32AF.70203@balister.org>
	<AANLkTinDNZbGuuXj4rkkphC5bdN+zaLfc+TYYD5gQS+j@mail.gmail.com>
In-Reply-To: <AANLkTinDNZbGuuXj4rkkphC5bdN+zaLfc+TYYD5gQS+j@mail.gmail.com>
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
X-List-Received-Date: Sat, 01 Jan 2011 19:14:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 01/01/2011 01:37 PM, Frans Meulenbroeks wrote:
> [Added TSC to the email, as I would like to request a decision on how
> to handle this]
>
>> Frans, given these two choices:
>>
>> 1) Recipe that builds and has tested output (but depends on distro source
>> mirrors).
>>
>> 2) Recipe that builds (even without source mirrors), BUT the output is not
>> tested.
>>
>> We should use choice #1, since the OUTPUT is tested. If someone who can test
>> the output wants to bump the SRCREV, that is fine. Bumping SRCREVs just to
>> get recipes to build and not testing the output only leads to frustrated
>> users who think the output works.
>>
>> I'd point out that no one on the panda list (or this list) has mentioned
>> they noticed the recipe doesn't build, so I am not sure you are addressing
>> an actual problem.
>>
>> Philip
>>
>
> Philip, thanks for your reply.
>
> I'd like to point out that the fact that the recipe does not build has
> been reported to this very list late oct 2010.
> At that point Steve Sakoman (the owner of the git from which the
> recipe pulls) suggested to use u-boot 2010.09.
> I did not get to fixing the recipe until yesterday. As u-boot 2010.12
> is already out I figured that this would be a better choice.
> I am also on the u-boot list and I know the changes from Steve are
> pulled into u-boot master.
> (and wrt to availability: I am quite confident that in a few years
> time this version can still be retrieved).
>
> The problem that this recipe does not build is already known for more
> than 2 months but the machine maintainer apparently is not interested
> in fixing his recipe.
> As such I feel the maintainer is doing a bad job.
>
> There are several ways to fix the problem.
> To coin a few:
> - move to a SRCREV that seems to me more stable (e.g. because it is a
> merge with upstream). I agree that there is still a chance of getting
> a breakage in the future
> - putting the tarball for the version that we have now at e.g.
> downloads.openembedded.org or so and adapt the recipe (we have done
> this for other recipes as well)
> - move to upstream. The panda changes from Steve have been merged by
> Wolfgang. I am not aware of any reason not to do so.
>
> While each alternative has its pro's and con's none of them is
> complicated, and any of them could have been done easily.
> As the problem is already reported last october, I feel the maintainer
> is not doing a good job, and actually makes things worse by abusing
> his powers to block others who want to fix it.
> Apparently spending a few minutes to resolve the issue is too much
> work, but there is of course always time to bitch and moan toward
> others who do want to keep OE a system that supports multiple machines
> and multiple distros.
>
> I'd like to ask the TSC to come up with a decision on how we should
> fix this recipe. I have already indicated a few solutions above. Yet
> another alternative (which is not too desirable) is to create another
> machine that chooses a proper recipe for u-boot.

For the TSC's consideration, how about we start moving BSP's (board 
support packages) into layers and letting the users of boards be 
responsible for their maintenance?

Philip


>
> Frans
>
> PS: the fact that there are no other reports of this is probably
> because not many people rebuild u-boot. Most of my boards still use
> the u-boot that was on the board when I got it. I guess this also
> holds for other people.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


