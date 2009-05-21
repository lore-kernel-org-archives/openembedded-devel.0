Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7HMS-0001zT-Ec
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 01:07:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7HF2-0001ga-2l
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 23:00:00 +0000
Received: from p5b3b3e33.dip.t-dialin.net ([91.59.62.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 23:00:00 +0000
Received: from no2spam by p5b3b3e33.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 23:00:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 22 May 2009 00:59:46 +0200
Message-ID: <gv4md5$jmq$1@ger.gmane.org>
References: <gv4d2h$oft$1@ger.gmane.org>
	<gv4ea5$sbp$1@ger.gmane.org>	<gv4g4j$2r4$1@ger.gmane.org>
	<gv4i2t$90h$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3e33.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <gv4i2t$90h$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 23:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen,

we're still discussing to find a good solution.  No need to get all 
worked up yet and calling other people pendantic[sic].  Is it really too 
much to ask that the data in OE should generally be such that "bitbake 
$target" at least builds?

If the distribution's settings are responsible for a build failing then 
it's the distribution's responsibility to fix this.  The pulseaudio and 
autoconf example you gave is essentially bug 3722 but can otherwise be 
handled.  BTW, the workflow you then described is not what I'm suggesting.

My intention is not to abuse COMPATIBLE_MACHINE if that is not the right 
place.  I can only go by the well-defined meaning in the documentation 
which at least does not mention build-time vs. run-time. 
conf/documentation.conf:COMPATIBLE_MACHINE[doc] = "A regular expression 
which matches the MACHINES support by the package/file. Failure to match 
will cause the file to be skipped by the parser."  IMHO setting it to an 
empty string to indicate that no compatible machines are (currently!) 
known does not conflict with that.

It would get people talking to fix the problem if there was still 
interest, "git log" would stay meaningful, the recipe remains in the 
place where people would be looking for it, etc.pp.  Lots of good 
reasons, I think, even if in the end it turned out that 
s/autoconf/autoconf >= X.Y/ is what was really necessary.

To make it clear, my suggestion is not that every dev should immediately 
set this when something does not compile.  First of all, the "core stuff 
  needs review"-rule still applies, so we're mostly talking normal 
packages here.  Furthermore, this is a suggestion for stuff that would 
otherwise be a candidate for recipes/nonworking, IOW things that are 
known broken and nobody steps up to fix them.

Again, I'm all ears for better suggestions on how to document in OE 
build-time dependencies and failures so that ideally "bitbake $target" 
will always work or say "no suitable provider found".  What I've heard 
so far is not a solution.

Regards

Rolf



