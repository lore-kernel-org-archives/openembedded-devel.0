Received: from [189.27.144.79] (helo=internet.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LQARM-0007f5-9d
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 02:02:32 +0100
Received: from ossystems.com.br (neumann.lab.ossystems.com.br [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id DF1AC740BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2009 22:55:15 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 5532B6101CC; Thu, 22 Jan 2009 22:55:17 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <200901230131.09511.mickey@vanille-media.de>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 22 Jan 2009 22:55:17 -0200
In-Reply-To: <200901230131.09511.mickey@vanille-media.de> (Michael Lauer's
	message of "Fri\, 23 Jan 2009 01\:31\:09 +0100")
Message-ID: <87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 01:02:32 -0000
Content-Type: text/plain; charset=us-ascii

"Michael 'Mickey' Lauer" <mickey@vanille-media.de> writes:

> Hi guys,
>
> we have 1141 open bugs in the bugtracker, a couple of hundreds from ancient 
> autobuilder builds, some more hundreds application specific bugs, and then 
> some actual ones.
>
> I think there are two ways to deal with the mess:
>
> 1.) Officially close the bugtracker down.
>
> 2.) Attack the situation.
>
> I'm fine with either way, though if we'd go for 2.), I'd propose:
>
> 2.1.) Removing all autobuilder bugs completely (how can we script that?) and 
> stop autobuilder automatically adding bugs. It was a great idea, but it 
> didn't work out. We do not have enough manpower and it just messes up the 
> bugtracker.
> 2.2.) Remove all software specific bugs that have an upstream and are not 
> distribution-relevant, such as GPE, Opie, Kernel, etc.
> 2.3.) Reinstate the monthly bug squashing weekends.
>
> Opinions?

I propose to change the workflow a bit (and reuse few points you've proposed):

 1. stop using bugtracker to handle patches
 2. use mailing list to handle patches (comments bellow)
 3. drop autobuilder bug reporting (comments bellow)

Besides, I have no objection about your points 2.2 and 2.3 but I'm too
new in the OE environment to comment about them so let me comment
about my points:

 1 and 2:

 We're trying to get more people to review the changes to be done in
 OE dev tree and bugzilla UI is horrible and difficult to use (at
 least for me). Most people ends up redoing someone else patch since
 we don't watch carefully the bugtrack.

 I propose we move to mailing list reviewing process mostly like Linux
 kernel does. We can use PatchWork (http://ozlabs.org/~jk/projects/patchwork/)
 tool to make our life easier. I see some pros for that:

  . people will get more review into the patches
  . people will be aware of ongoing work and what is being prepared to
    be merged
  . less forgotten patches
  . less duplicated work

 I also see a single con for that:

  . more mailing list traffic

 3:

 Instead of reporting bugs, we could mail mailing list with the
 failure and link a log for someone to take a look. It makes us to
 worry more about the change since if we break something _everyone_
 we'll know it :-)

My 2c :P

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


