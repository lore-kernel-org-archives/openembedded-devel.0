Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LhvBW-0004hf-PA
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 01:23:35 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LhvBG-0003ch-6y
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 19:23:18 -0500
Message-ID: <49B9A775.7020607@dls.net>
Date: Thu, 12 Mar 2009 19:23:17 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1236900736.26901.8.camel@grond.atmel.com>
In-Reply-To: <1236900736.26901.8.camel@grond.atmel.com>
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 00:23:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> Is there any activity to make this more useful?
> Just managed to install a Core i7 machine, which speeded
> up my Buildroot build from about 4 hours to less than 1 hour.
> (There was an error in the build right at the end,
> so it could have been downto 40 minutes or so)
> Building the cross compiler took 10 minutes with "make -j 16"
> compared to 1-2 hours on a P4 @ 3GHz.
> 
> Openembedded does not seem to use PARALLEL_MAKE extensively.
> I have the frequency meter activated for all 8 CPUs in the Core i7,
> and most of the time the CPUs seems to idle at 1.6 GHz,
> with one CPU (or rarely 2) are running at the full 2.67 GHz.
> 
> Last time I built OE on a P4@ 3 GHz it took ~40 hours 
> for the SAM9263, so some speedup would be nice.
> Maybe we should make an effort?
> 
> Best Regards
> Ulf Samuelsson

I build often with PARALLEL_MAKE set, and have been rather regularly
flushing out packages that break due to improper Makefile dependencies.
 The latest offender is thttpd; I'll be committing the fix to force that
to always run without PARALLEL_MAKE shortly.

My new quad-core does a dandy job of keeping all four cores busy almost
100% of the time -- but you need to specify BB_NUMBER_THREADS to get it
to do that.  Ever since somebody fixed the fetcher problem, that works
very, very nicely indeed.

-Mike (mwester)


