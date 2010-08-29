Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpdmC-0001Rl-5y
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:02:09 +0200
Received: by iwn2 with SMTP id 2so3866574iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Tl3v3wLl04ibenbA3OVcj71Xglfbq15p2rrkEQjdw6E=;
	b=QObslDjVIaqRWscKZUXZQSUclk04R6dHDWHaZi77KQsY65PzhkevRFh1XSRilK4Lwq
	EJS5EWxGaJdbBTdaUd9KIb2oJOiqhTMoj1MOEOF1nNQH5ofQhxtL+ia87XPtr7pfOZtw
	1XxbURcCKmrxpplPtim53FsUczIvQUcXRDnAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=MlXvYraKar2e82fz1JQl87Nc0y78GqMGMrqlYSLHkDTQlUHxGu48hXRVW3LsbqfIBp
	DI/4YPmeBa4h5Z6NM9k7kJruOgIy1LoywNEtNNLk/l1oT/y0xfPzqfGYoGHQ3Ru3cPHu
	chKnMG5NnIf2G4tQODk9ftbyEGeHof56hRpfg=
Received: by 10.231.15.9 with SMTP id i9mr3571673iba.58.1283072499199; Sun, 29
	Aug 2010 02:01:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 02:01:19 -0700 (PDT)
In-Reply-To: <4C79B2E7.6070806@mwester.net>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
	<4C79B2E7.6070806@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 02:01:19 -0700
Message-ID: <AANLkTi=ouYU-pn4Po3G9bqgxNYTquRH+06RuWr8W5_z_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 29 Aug 2010 09:02:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2010 at 6:07 PM, Mike Westerhof <mike@mwester.net> wrote:
> Frans Meulenbroeks wrote:
>> Koen brought up this in the thread on the review process. As it
>> (mostly) is about this thread I felt it was more appropriate here.
> [snip]
>> I don't know what others think about it, but I see only a few matches.
> [snip]
>> PS: I think this is also an excellent case why it is a good idea to
>> identify the maintainer within the recipe/
>
> I think this gets at the heart of why Frans' recent changes make *me*
> uncomfortable -- their scope is broad and the general approach by Frans
> is to make everyone else provide detailed and precise arguments
> defending why the broad change should not apply to specific items.
>
> I, for one, would like to understand where this "cleanup" effort is
> ultimately going to go. =A0What distros will ultimately remain in OE?
> What what will be the final criteria for recipes being permitted to
> remain in OE (it seems to be converging on "it must build with bitbake
> world, despite the many emails that have offered sound reasons for why
> that is a poor test of recipe quality (which begs the question of why
> recipe buildability might be a valid measure of quality in the first
> place)).

From a distro maintainer POV I can understand you point very well. I
don't feel strongly
about removal of recipes if they work and are old but I don't see any
value in a recipe which does not build in any combination either.
would you agree? Either we fix it or we can get rid of it as second choice.

I think bitbake world might be a far fetched goal but then I think it
speaks of health of the metadata.
(once bitbake world worked in OE) did we improve the situation by
making it unbuildable I dont think so.
and other distros do have these targets and they build too (e.g. freebsd)
I am afraid If we leave status quo then the cruft will keep piling up
and it will become really
unmanageable. Somewhere we need to bite the bullet. IMO OE should not
become a dumpyard of recipes where
you dig the ones that work and create a distro out of it but we should
try to make it a collection of working recipes(most of them) which
offers a wide set of recipes(different versions of same package or
different alternatives) to distros.
and all ideas are welcome to do it in a co-operative way. Lets make
sure that patches get reviewed here
and chance given to voice opinions and test patches by interested
parties before they get applied.

>
> Most of the patches and changes in OE have very specific distros in
> mind, or they set out to solve reasonably bounded problems when they
> cross distro boundaries. =A0Frans' changes do not. =A0The result is that
> each and every of these patches must be carefully reviewed. =A0I asked a
> specific question of Frans earlier that he did not answer, for whatever
> reason. =A0I'll ask again: What distros does Frans test to ensure that hi=
s
> patches are sane?
>
> It's great that we "clean up" OE, but in my opinion, it's being done
> with a sledgehammer approach, and I for one find it uncomfortable being
> "threatened" by the creator of these global giant patches setting
> policies about same that require the community to carefully defend their
> work or interests, or else.
>
> C'mon folks -- I'm not the only one who's busy, and who's uncomfortable
> with this. =A0Dev branch or not, this is NOT the way to get a community
> working together.
>
> -Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


