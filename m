Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L4TVX-0005xv-BJ
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 05:57:11 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L4TSl-00050d-R7
	for openembedded-devel@openembedded.org; Sun, 23 Nov 2008 22:54:20 -0600
Message-ID: <492A3368.4070302@dls.net>
Date: Sun, 23 Nov 2008 22:54:00 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.18) Gecko/20081105 Thunderbird/2.0.0.18 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ggd81q$re5$1@ger.gmane.org>
In-Reply-To: <ggd81q$re5$1@ger.gmane.org>
Subject: Re: Bitbake r1090 (env hiding) makes my build fail.
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
X-List-Received-Date: Mon, 24 Nov 2008 04:57:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rob Kramer wrote:
> Hia,
> 
> I'm tracking the stable branch and recently updated bitbake to HEAD. When
> trying a build-from-scratch, I noticed BB quickly failed in shasum-native.
> Some manual svn disecting pointed to r1090 as the one that caused the fail.
> I tried adding a BB_PRESERVE_ENV, but no difference.
> 
> Output is at http://pastebin.com/m65e66603. There is no log.do_compile
> generated for some reason, and a build with -D shows nothing much. The gcc
> invoke actually works OK and produces the oe_shasum256 executable.
> 
> Any ideas what could be wrong with my setup?

You've gotten further than I have in tracking this down!  Good find in
pointing the finger of suspicion on the env hiding stuff.

There have been a number of folks who have encountered this problem --
including me, at one point.  I struggled with it, determined it was
ccache that was messing up, and at that point I took the easy way out
and just renamed the /usr/bin/ccache binary to get my builds running again.

Oddly enough, now ccache seems to work fine, and I can troubleshoot no
further.

Try messing about with ccache -- disable it, or clean the caches out,
and see if anything will help.  Or you can just do what I did, and
disable it by brute force (rename the hosts' ccache binary).

Mike (mwester)


