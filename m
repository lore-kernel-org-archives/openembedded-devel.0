Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcLyC-0004tJ-Ep
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 16:46:48 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcLv3-00028m-DO
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 15:43:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 15:43:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 15:43:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 16:43:21 +0100
Message-ID: <go3oup$b6r$1@ger.gmane.org>
References: <49A4EAFC.3080806@dls.net>
	<go2tlk$akt$2@ger.gmane.org>	<1235550209.2621.28.camel@andromeda>
	<49A5606D.3050507@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <49A5606D.3050507@dls.net>
Sender: news <news@ger.gmane.org>
Subject: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Wed, 25 Feb 2009 15:46:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 16:14, Mike (mwester) wrote:

> ((Also, are there any non-angstrom distros still left in OE, besides
> SlugOS?  I really feel like I'm swimming upstream all the time with OE
> -- things break for me so often that just don't seem to affect anyone
> else...))

Things break often<period>

I'm 'fortunate' enough to be able to spend 2 hours every day fixing 
breakages for angstrom, so I can get a working demo for my presentation 
at the bossaconference. Thanks to all the people in the beagleboard 
community I get notified of breakages pretty much the instant they 
happen, which makes finding the cause a lot easier.

This also means that my 'OE time' is almost completely filled with 
bugfixing, instead of working that is fun. I've been trying to push for 
better testing frameworks and removing the taboo stamp from the word 
'review'.

The review bit seems to gaining traction, but 'testing' is still a alien 
and mystic concepts for a lot of OE committers. Worse, some people turn 
*off* testing frameworks like insane.bbclass!

Maybe it's time for OE to consider whether it really wants a zillion 
commits per day or only a few tested commits per day. Having a ton of 
active developers means nothing when people using OE can never get a 
build completed due to all the small, but fatal bugs appearing lately.

I'm close to finishing the new stable branch manifesto which lists 
options and procedures to make it easier to do releases of OE (not 
builds, releases of the metadata itself) and track regressions, but it 
would need about 3 or four people spending a few hours on it every week, 
which sadly might not be feasible, since the .dev branch is too nice and 
shiny compared to any branch.

regards,

Koen




