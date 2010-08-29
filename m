Received: from smtpauth22.prod.mesa1.secureserver.net ([64.202.165.44])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1OpWUP-0003Yt-JG
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 03:15:19 +0200
Received: (qmail 32122 invoked from network); 29 Aug 2010 01:08:05 -0000
Received: from unknown (209.242.7.179)
	by smtpauth22.prod.mesa1.secureserver.net (64.202.165.44) with ESMTP;
	29 Aug 2010 01:08:05 -0000
Message-ID: <4C79B2E7.6070806@mwester.net>
Date: Sat, 28 Aug 2010 20:07:51 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>	<i586bt$t12$1@dough.gmane.org>	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>	<i5aoas$sja$2@dough.gmane.org>	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
In-Reply-To: <AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.44
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Sun, 29 Aug 2010 01:15:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Koen brought up this in the thread on the review process. As it
> (mostly) is about this thread I felt it was more appropriate here.
[snip]
> I don't know what others think about it, but I see only a few matches.
[snip]
> PS: I think this is also an excellent case why it is a good idea to
> identify the maintainer within the recipe/

I think this gets at the heart of why Frans' recent changes make *me*
uncomfortable -- their scope is broad and the general approach by Frans
is to make everyone else provide detailed and precise arguments
defending why the broad change should not apply to specific items.

I, for one, would like to understand where this "cleanup" effort is
ultimately going to go.  What distros will ultimately remain in OE?
What what will be the final criteria for recipes being permitted to
remain in OE (it seems to be converging on "it must build with bitbake
world, despite the many emails that have offered sound reasons for why
that is a poor test of recipe quality (which begs the question of why
recipe buildability might be a valid measure of quality in the first
place)).

Most of the patches and changes in OE have very specific distros in
mind, or they set out to solve reasonably bounded problems when they
cross distro boundaries.  Frans' changes do not.  The result is that
each and every of these patches must be carefully reviewed.  I asked a
specific question of Frans earlier that he did not answer, for whatever
reason.  I'll ask again: What distros does Frans test to ensure that his
patches are sane?

It's great that we "clean up" OE, but in my opinion, it's being done
with a sledgehammer approach, and I for one find it uncomfortable being
"threatened" by the creator of these global giant patches setting
policies about same that require the community to carefully defend their
work or interests, or else.

C'mon folks -- I'm not the only one who's busy, and who's uncomfortable
with this.  Dev branch or not, this is NOT the way to get a community
working together.

-Mike (mwester)


