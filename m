Return-Path: <lsorense@csclub.uwaterloo.ca>
X-Greylist: delayed 320 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Feb 2020 18:35:30 UTC
Received: from caffeine.csclub.uwaterloo.ca (caffeine.csclub.uwaterloo.ca
	[129.97.134.17])
	by mail.openembedded.org (Postfix) with ESMTP id 46391605A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 18:35:30 +0000 (UTC)
Received: by caffeine.csclub.uwaterloo.ca (Postfix, from userid 20367)
	id 84E09460D13; Wed, 26 Feb 2020 13:30:11 -0500 (EST)
Date: Wed, 26 Feb 2020 13:30:11 -0500
To: openembedded-devel@lists.openembedded.org
Message-ID: <20200226183011.x7pp6kwn6nlwgcrc@csclub.uwaterloo.ca>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: [meta-java] openjre-8 fmacro-prefix-map problem
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
X-List-Received-Date: Wed, 26 Feb 2020 18:35:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2019, Vincent Prince wrote:
> Hello again,
> 
> I see that there is a patch that should fix the problem:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch
> It is applied but it seems target compilation options are non filtered?

I just hit this problem too, and found out why it isn't filtering.
TARGET_CFLAGS isn't actually exported so the build can't use it to filter.

Adding this to openjre-8_242.bb fixes the problem:

export TARGET_CFLAGS
export TARGET_CXXFLAGS

No more problem with the host gcc/g++ complaining about -fmacro-prefix-map
being unknown.

I suspect openjdk-8 would need to same fix but I didn't build that yet.

-- 
Len Sorensen

