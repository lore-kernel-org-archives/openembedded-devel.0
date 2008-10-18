Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrAz0-0000IC-QV
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 14:32:38 +0200
Received: from [92.117.26.22] (helo=[10.161.26.22])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KrAyp-0008BL-Ny
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 14:32:30 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Oct 2008 14:32:37 +0200
User-Agent: KMail/1.9.9
References: <1224320609.5215.15.camel@dax.rpnet.com>
In-Reply-To: <1224320609.5215.15.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200810181432.38565.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.26.22
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
X-List-Received-Date: Sat, 18 Oct 2008 12:32:38 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 18 October 2008 11:03:29 Richard Purdie wrote:
> Hi Guys,
>
> I have a few issues with the way certain things have happened recently.
>
> 1. The FILE_PR change.
>
> This was mentioned in an email on Wednesday with the title "[oe] [RFC]
> Enable --hash-style=both for all recent gcc4 targets" at 9am. At 8pm we
> have "I decided to land now as PRs are changing all the time and keeping
> up with things is pretty hard...". This is not in keeping with the major
> changes policy we agreed by any stretch of the imagination.

Sorry about that.


> This change breaks compatibility with everyone's overlays and creates
> the nightmare scenario of external OE "branches" being forced into the
> change or forever being unable to sync (Openmoko and Poky spring to
> mind).

Yes, this creates an extra burden for the people that need to keep that in 
sync.


> What is most annoying is that given a bit longer I think we could have
> done something that would have meant this was unnecessary, specifically
> inserted the revision into the package at package_*.bbclass time where
> we can manipulated PR as needed. This combined with a staging ABI change
> would have been all that was needed. If staging ABI isn't enough, we can
> insert the modified PR into STAMPS instead of the real PR or some other
> magic. My point is that there are better options than FILE_PR, it just
> needs some thought. The fact the testing branch had so many merge issues
> should have meant a better idea was sought, not that is should be
> committed ASAP.

I don't agree with this. This means package names will not match with the on 
dir directory name. For me this was the strongest argument against doing it 
automatically in the packaging bbclass. I really don't like the idea that if 
I bump the DISTRO_PR the existing build directories will be recycled and 
packages will be rebuild in there. That mostly defeats the purpose of a 
deterministic tool. And I really don't like the idea of adding more python 
black magic that is mangling PR... :)



>
> 2. The Git conversion including the BKCVS data.
>
> I'd made it quite clear this should have been a tree graft and this
> wasn't done so we're now stuck with broken history :(. This is pretty
> frustrating since I'd repeatedly said not to include it and went to the
> effort of gathering my conversion data and sending it to Jan who then
> didn't realise what I meant by graft (though no fault of his own).

Should we start over from scratch and rebase what we have already added? Will 
this be the _last_ time we consider it?



> 4. Bitbake changes
>
> These should go to the bitbake list as well as the OE list and should be
> discussed. I've raised issues with patches which have been ignored and
> these patches have now just need committed. I'm not happy about the
> process that was used :(. I know people have various commitments but we
> need to try and stick to some kind of process for this kind of thing.

???? Things have been ignored... three times...


>
>
> Where from here?
>
> I'd actually like to a strong line on this and suggest we revert the
> FILE_PR change since its badly thought out and also that we consider
> redoing the git conversion ASAP and the replaying the recent commits
> before its too late to get rid of the corruption in there. This is
> probably going to have to go to a core team vote since its a pretty big
> change to suggest but opinions are welcome.

Do whatever you want. I think FILE_PR is the right thing to do, feel free to 
invest the time to redo the conversion, the scripts are public and Jan might 
be able to upload the "source" for git-fast-import, please also coordinate 
the git-rebase (we will lose merges but that seems okay, but I did merge the 
FILE_PR changes on purpose for ease of reverting), make sure no one is 
merging old history with new history (this was not a big problem with the 
trial but will be one now)...



