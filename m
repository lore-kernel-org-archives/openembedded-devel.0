Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7EsL-0002N1-OG
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 22:28:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7Eku-0002uq-4J
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 20:20:44 +0000
Received: from p5b3b3e33.dip.t-dialin.net ([91.59.62.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 20:20:44 +0000
Received: from no2spam by p5b3b3e33.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 20:20:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 May 2009 22:20:30 +0200
Message-ID: <gv4d2h$oft$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3e33.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
Sender: news <news@ger.gmane.org>
Subject: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 20:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

we have recipes/nonworking/ to collect known-to-be-broken recipes.  With 
the explosion of MACHINE, DISTRO and other settings, most all recipes 
are prone to fail in some circumstances.  Occasionally, this has led to 
packages being moved to nonworking that were only broken for some 
occasions and possibly essential for others.  Problems reported in the 
bug tracker had not always gotten on the radar of the person needing the 
recipe.  The result is frustration left and right.

We already have COMPATIBLE_MACHINE and COMPATIBLE_HOST, but they're not 
commonly used.  As a matter of policy, I think we should agree on 
setting COMPATIBLE_MACHINE to an empty string for packages that fail in 
do_configure or do_compile and which otherwise would have been a 
candidate for recipes/nonworking.  The recipe will then not be 
considered by the parser.

The person who wants the recipe finds it right where he would expect it 
and can add a regexp for the MACHINE he knows this recipes is working 
for.  Furthermore, "git log" can't track moving operations very well and 
this proposal avoids renaming files.

I think that, eventually, "bitbake world" should be working again and 
usable as a test case.  I suggest to use COMPATIBLE_MACHINE because I 
assume that to be the more common issue.

Best regards

Rolf



