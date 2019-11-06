Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CF4477F7DA;
	Wed,  6 Nov 2019 21:41:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 477g2Z3tmdz9v;
	Wed,  6 Nov 2019 22:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573076470;
	bh=l2Gxf3HpoIo8ARDKF61anQdWtuHoxneZqIYYSNtmaro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THxfQ8kbwedo4zPNHKHopMttbcSVr1FjOi2ZMVQDToNAoGnLmPV/FpqQf6zPLA6qt
	bAyxl4IxFUpj6FqT5gz2g3iMFO7PLDswMwrQWJOVHPiECPuGpiPWlqNZW3JcvhS4eY
	oQrSTkVofUpsC5zhUySF/ZtHy1gry4KC/ANk6QH1OEgSWjeIApr+mK9PNgVM+pqjSN
	u7Y58HOABfevvrJFg7mCJLpG8Y7rkDTMKJrmM09z/mbasmDLBvAwYwx93puX1I+BHY
	ozjIjYT3xEODwz9WEwNpHafRYZxV/c8a2VnYc0fGgKaI0SCzIgZ1X8uEj2Yu0avCBi
	zTbSoLqP8qZWt58/M1FRaDQJjte2sIdNprK/VcBqu68LV53+MFoiAnDOuhCyTBtS3h
	E4iRgP1vKIwgEyHlak0QpGg8EyQpIPDFT2Hn/Evd/W7P94R7+hol9zq543b3/485aq
	zwq+cLNQzcIGlgSVip42MfAI6EYrrx5EC6ZVR+PTsR7/jLmBVDlDHQZFBfFgEUF/pK
	Deh748DDYGzI0RTCzY9mJhdKrRFqjPkPyty6zoDDw8Jh3kHB1cI2WrQjofRw1/nkmD
	HOYWuFifklZcrytiObsjfZr2hNyFWnsdv6M/mSEk9eMp0Zx5ldM/v1oyQFJXaSKc7K
	u3fof44ThkkwcFFTxlvAlwzA=
Date: Wed, 6 Nov 2019 23:41:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Paul Barker <paul@betafive.co.uk>
Message-ID: <20191106214108.GC14721@localhost>
References: <ab96ec4a-5dcb-4d01-8519-13c00094a44c@www.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <ab96ec4a-5dcb-4d01-8519-13c00094a44c@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE Architecture <openembedded-architecture@lists.openembedded.org>,
	OE Devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Using GitLab for OE/Yocto layers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2019 21:41:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 06, 2019 at 04:01:03PM +0000, Paul Barker wrote:
>...
> At the risk of bikeshedding I'd like to get some feedback on these ideas at this stage. Have I missed any advantages/disadvantages?
>...

Three comments from me:


1. Patch review

Merge requests work well when there is one maintainer who reviews 
everything. For not regressing on the current level of review before
something hits master, merging a merge request into master-next
should then result in patch review emails sent to a list.
Or a setup where creation of a merge request automatically generates
review emails.

This is similar to all patches for stable branches now being sent for 
review to the mailing list a few days before they get merged into the 
stable branch, which has caught problematic patches due to more people 
reviewing them.


2. Maintaining an own GitLab instance

This was mentioned as an option. Expect upgrades to new GitLab releases 
once per month, which is work and as with all software never without 
regression risk.

Not a dealbreaker, but has to be resourced.


3. Long-term suistainability

Whatever the past track record of GitLab is, chances are the company 
behind it will sooner or later be bought by another company - and then 
anything can happen.

The code behind SourceForge was also at some point made available under
an open source licence, and forks being used in instances like Debian
Alioth ended up being unmaintainable dead ends long-term.

Berkeley DB would be an example where the company behind the software 
was bought by another company, and now there are plenty of CVEs that
are unfixable due to changed licencing.

Is there anyone capable and willing to continue open source maintainance 
of the GitLab open source sources if the company behind it would stop 
the open source releases tomorrow?

With projects like GNOME using GitLab the answer might be "yes",
but this should be evaluated before moving infrastructure to GitLab.


> Paul Barker

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


