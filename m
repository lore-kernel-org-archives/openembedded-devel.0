Received: from [64.202.165.29] (helo=smtpauth17.prod.mesa1.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1N8zpk-0006mn-MA
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 18:21:20 +0100
Received: (qmail 19334 invoked from network); 13 Nov 2009 17:13:16 -0000
Received: from unknown (75.49.209.68)
	by smtpauth17.prod.mesa1.secureserver.net (64.202.165.29) with ESMTP;
	13 Nov 2009 17:13:16 -0000
Message-ID: <4AFD93A6.4090600@mwester.net>
Date: Fri, 13 Nov 2009 11:13:10 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130443520.1157@localhost>	<4AFD4DD6.70509@balister.org>	<alpine.LFD.2.00.0911130732220.17745@localhost>	<4AFD5440.6080202@balister.org>	<1258129007.5799.73.camel@dax.rpnet.com>	<alpine.LFD.2.00.0911131129020.5980@localhost>
	<1258130362.5799.80.camel@dax.rpnet.com>
In-Reply-To: <1258130362.5799.80.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 64.202.165.29
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 17:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

> That readline tweak is a hack and there is a bigger problem here. I'd
> like to solve it completely so yes, I'd like to confirm that was the
> problem please. Once someone has done that I also have a proposed fix:
> 
> http://tim.rpsys.net/python-hostfix.patch
> 
> For completeness, I've included some before/after logs below for what
> we're now potentially avoiding. I'm cc'ing the python maintainer to make
> sure he sees it, its his call whether to include this patch. I'd also
> argue it could be worth removing more "/usr" references from setup.py
> but that is his call and my patch solves 90% of the problem (but not
> sqlite3 notice). Also some modules now failed to build - DEPENDS would
> need to be fixed to get them back if we want them.
> 
> Cheers,
> 
> Richard

The python-hostfix.patch resolves the issue for me.  The logs (before
and after) show that with the patch, we no longer have references to
/usr/lib/ and /usr/lib64/ -- thanks!

-Mike (mwester)



