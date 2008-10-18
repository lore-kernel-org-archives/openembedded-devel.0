Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1Kr9J7-0004MN-VJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 12:45:18 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 4EAEB18142A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 06:45:09 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sat, 18 Oct 2008 06:45:09 -0400
X-Sasl-enc: H3OF4C19it3zLmCC5UQ5hK6DeayuEK1rherp1qGsCPr4 1224326705
Received: from [120.16.255.73] (unknown [120.16.255.73])
	by mail.messagingengine.com (Postfix) with ESMTPA id 73FF72D3EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 06:45:00 -0400 (EDT)
From: "Rod Whitby" <rod@whitby.id.au>
Date: 18 Oct 2008 21:14:00 +1030
To: <openembedded-devel@lists.openembedded.org>
X-Mailer: ChatterEmail+ for Treo 6xx/700p (3.0.10)
Message-ID: <3307209263.22706@mail.messagingengine.com>
Subject: Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 10:45:18 -0000

I'm not on the core team, but wanted to say that I would support the decision of the core team if they agree that Richard's proposals are worth the effort to keep the architecture and history clean.
-- Rod

-----Original Message-----
From: Richard Purdie <rpurdie@rpsys.net>
Date: Saturday, Oct 18, 2008 7:37 pm
Subject: [oe] Some open issues
To: openembedded-devel <openembedded-devel@openembedded.org>Reply-To: openembedded-devel@lists.openembedded.org

Hi Guys,
>
>I have a few issues with the way certain things have happened recently.
>
>1. The FILE_PR change.
>
>This was mentioned in an email on Wednesday with the title "[oe] [RFC] Enable --hash-style=both for all recent gcc4 targets" at 9am. At 8pm we have "I decided to land now as PRs are changing all the time and keeping up with things is pretty hard...". This is not in keeping with the major changes policy we agreed by any stretch of the imagination.
>
>This change breaks compatibility with everyone's overlays and creates the nightmare scenario of external OE "branches" being forced into the change or forever being unable to sync (Openmoko and Poky spring to
>mind).
>
>What is most annoying is that given a bit longer I think we could have done something that would have meant this was unnecessary, specifically inserted the revision into the package at package_*.bbclass time where we can manipulated PR as needed. This combined with a staging ABI change would have been all that was needed. If staging ABI isn't enough, we can insert the modified PR into STAMPS instead of the real PR or some other magic. My point is that there are better options than FILE_PR, it just needs some thought. The fact the testing branch had so many merge issues should have meant a better idea was sought, not that is should be
>committed ASAP.
>
>2. The Git conversion including the BKCVS data.
>
>I'd made it quite clear this should have been a tree graft and this wasn't done so we're now stuck with broken history :(. This is pretty frustrating since I'd repeatedly said not to include it and went to the effort of gathering my conversion data and sending it to Jan who then didn't realise what I meant by graft (though no fault of his own).
>
>3. Merging Bitbake into OE
>
>People are saying things like "Might be a chance to reconsider
>maintaining BitBake in the OE repository.". Could people please talk to the bitbake maintainer about things like this *before* encouraging it in public. If we need a release lets make one (which seems to be the real problem).
>
>4. Bitbake changes
>
>These should go to the bitbake list as well as the OE list and should be discussed. I've raised issues with patches which have been ignored and these patches have now just need committed. I'm not happy about the
>process that was used :(. I know people have various commitments but we need to try and stick to some kind of process for this kind of thing.
>
>
>Where from here?
>
>I'd actually like to a strong line on this and suggest we revert the FILE_PR change since its badly thought out and also that we consider
>redoing the git conversion ASAP and the replaying the recent commits
>before its too late to get rid of the corruption in there. This is
>probably going to have to go to a core team vote since its a pretty big change to suggest but opinions are welcome.
>
>Richard
>
>
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



