Received: from mail3.sea5.speakeasy.net ([69.17.117.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NUqDy-0001Wu-Qh
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:32:38 +0100
Received: (qmail 29266 invoked from network); 12 Jan 2010 23:23:46 -0000
Received: from dsl093-132-204.sfo4.dsl.speakeasy.net (HELO [192.168.1.108])
	(msundius@[66.93.132.204]) (envelope-sender <msundius@sundius.com>)
	by mail3.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	12 Jan 2010 23:23:46 -0000
Message-Id: <5AD5D63B-53C4-4E82-BC11-D0F78DAD9D06@sundius.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001111254j4a52b1a8xb6fa1c6c3a9567d6@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 12 Jan 2010 15:23:45 -0800
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
	<1263236290.22868.33.camel@andromeda> <hig2fe$ui2$1@ger.gmane.org>
	<ac9c93b11001111254j4a52b1a8xb6fa1c6c3a9567d6@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
X-SA-Exim-Connect-IP: 69.17.117.5
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: dependencies between packages
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
X-List-Received-Date: Tue, 12 Jan 2010 23:32:38 -0000
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit


>>
>
> One way to resolve this without bumping all the PR's would be to
> record the PRs of all pacakges it depends on.  (direct and indirect).
> If you rebuild a package and any of the depends packages has a PR that
> is increased, the package is rebuild, even if PR is not changed.
> Another way could be to use the timestamps. If the staging timestamp
> of a package one depends on is newer than the last build of the
> package itself it is rebuild.
> And a third way is to compute all packages that depend on another
> package and rebuild those when the package is changed. However that
> would probably rebuild way too much (everyone depends on glibc so if
> that changes this would become a bitbake world).
>
> However, I think the problem is not the rebuilding of packages, but
> more the deployment of packages. Currently PV + PR are used to
> determine if an upgrade is needed and that kinda gets lost (unless
> opkg also has a version or time check; yuk)..
>
> Frans.
>

Frans,

In your suggestions for solutions to the problem below you described  
that  "if <condition> then the package should be rebuilt".. .it seems  
that this is within the domain of bitbake, since its deciding if the  
tasks should even be run right?

so could you give me a pointer to where I would look to see the part  
of bitbake I would have to modify to add such a check?

I'm not much of a python hacker, though now it looks like I'll have to  
become one. If anyone has a pointer to how bitbake internals are  
organized or advice I'd appreciate it.

My thoughts are that I'll try to work from the 2nd option Frans  
suggested since it is really developers who are wrenching on code and  
recompiling many times in a day... I don't suspect they'll update the  
PR in the recipe each time. (thoughts?)


mike


