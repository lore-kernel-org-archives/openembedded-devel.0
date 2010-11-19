Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJVbx-000441-PF
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 19:23:02 +0100
Received: by yxd5 with SMTP id 5so3041529yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rcn07duarqzxv88a4c6RVivqy7YBgWCyLVk9/drcKnE=;
	b=nfVbziGQpnZBSjan2TsefoWCo7bGSqnmmIvj4H5EypPjlaIBVfBQtstqUl+xxkqkSe
	lnpAddJInM3Zh55u15FBCv6MnopBSaN/qE/1zzJIAvboKxBow6vE+/LyPXDiUeAISOiZ
	4oO7zKFuw68zSknytFRzpuH1/TX7hDghKYE2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DmXZBiHrMpJZ0f76b7AX59vttgy8H6mUhXp1atHah4v4rCNjQ6lTzV/oPNxz6oezf9
	jDMxr2BB5lDvtsPnXMmiZ2Bdt5mIazp7naEtPKCxK1PPADeL8DDET39c3plirUMSjumJ
	eRB+aWa7dW4zchQebqTF8nxXQ+MlGUim0K6lI=
Received: by 10.100.119.5 with SMTP id r5mr1714304anc.88.1290190911505;
	Fri, 19 Nov 2010 10:21:51 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 6sm2078515anx.12.2010.11.19.10.21.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 10:21:50 -0800 (PST)
Date: Fri, 19 Nov 2010 10:21:12 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119182112.GA30296@gmail.com>
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
	<ic5jrc$ksc$1@dough.gmane.org> <4CE67FA1.6020901@mentor.com>
	<ic60r2$hrs$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ic60r2$hrs$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Fri, 19 Nov 2010 18:23:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/11/10 15:16), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 19-11-10 14:46, Tom Rini wrote:
> > On 11/19/2010 03:34 AM, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 18-11-10 22:27, Khem Raj wrote:
> >>> Hello all,
> >>>
> >>> The work branch for upcoming 2010.12 release has been created.
> >>
> >> Why was this created? We were *very* clear at OEDEM that there would be
> >> no branch, only a tag.
> >>
> >> Why was this changed? I only see some vague handwaving from the TSC
> >> (well, from Phil, saying it was the TSC) who didn't consult the OE
> >> developers at all.
> >>
> >> The whole point of releases was that they are based of a tag from .dev,
> >> not some random branch. Again, why was that changed?

We intend to make releases which works on wider number of platforms, as
we want to keep master open for all kind of commits it can hinder the
release as you also voiced your opposition to let master slow down on commits
too. So we dont have a master which is release quality everyday, we dont
want to wait on commits on master so only way left out is create a
stabilzation branch and release from there. Its clearly mentioned that
this branch is dead after release.

> > 
> > At least for making a release tag exist, if we can't have a freeze on
> > .dev (or otherwise an agreement that .dev should focus on making the
> > testing packages build and work, over new work) making a temporary
> > branch to cherry-pick into seems to be the next possible solution.
> > Otherwise the release tag is just another testing tag...
> 
> Well, that was the whole point. The release is supposed to be only a
> testing tag...
> 
> We were very clear at OEDEM, no *branch* only a tag. If .dev isn't
> working, find a testing tag in the past that does work and use that as a
> release.

thats was because we were not releasing and its also a measure when someone
wants to be close to master but really not on bleeding edge. I am sure
if we have predictable release cycle a lot of users will like to use
the releases thats one reason to get it in good shape.

> 
> It seems people are trying to polarize issues, when they shouldn't. So
> no "freeze .dev", but "pay more attention to .dev" and no "release
> branch" but "encourage getting more green into tinderbox".
> 
> The idea was to get a release out and see how people are using it to
> improve the process and test conditions, not making a kneejerk process
> for this release.
> 
> I've seen no discussion on this list why we need a branch or a freeze
> instead of following the OEDEM plam, only people stating that we need
> it. So what's wrong with the original plan of getting the release out
> and using actual experience as feedback for future releases?
> 

I think if we make a flaky release which is not usable for a bit wider
range of machines/images, it wont do any good to users and not many will use it.
and it will turn out to be a bad experience.
Therefore It should be a bit better than weekly testing IMO. 
If we could have agreed on some sort
of commit holds on master for a week or two, it could have been done as a tag
from master too but there were no concensus on that. May be we would have
improved the process so much next time that we could do the same with much
less time but we did not take that approach.

I am happy to do whatever people want, we need a decision and stick with it and
not waste time and effort by changing directions sometimes its good to disagree and commit to a given approach.

> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFM5oahMkyGM64RGpERAk1OAJ9Oo6sMLydFi5HYoVQAfQr4AoVVrQCfRd0V
> v06+p6STeoj35fihSo/Lu2I=
> =d9+8
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


