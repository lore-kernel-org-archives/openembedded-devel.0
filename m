Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lkrd6-0005jf-CI
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 04:12:12 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lkrc0-00009i-TA
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 22:11:05 -0500
Message-ID: <49C45ABD.2090603@dls.net>
Date: Fri, 20 Mar 2009 22:10:53 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49C2BAEA.8050205@gmx.net>
In-Reply-To: <49C2BAEA.8050205@gmx.net>
Subject: Re: RFC: extension of policy on removing recipes
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
X-List-Received-Date: Sat, 21 Mar 2009 03:12:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Hi,
> the latest removal of the automake-native version just hit me today (I
> am not building chinook-compat regularly and I am basically the only
> person building it at all).

You're not at all alone on this.  It clobbered SlugOS as well.

The issue is that the autobuilders all built automake a looooooong time
ago, and until someone tries a build from an empty TMPDIR, this problem
won't be discovered.  There may be a few more folks who have yet to
discover that their builds will fail!

> What I found surprising is, that automake 1.10 was deleted although it
> was explicitly stated as PREFERRED_VERSION in the chinook-compat.conf. I
> was under the impression that we already discussed that if you remove
> something that is obviously being used, that patch is posted for RFC first.

Yep, agree.

Mike (mwester)


