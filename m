Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5q0A-0001Uo-PC
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 01:42:42 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5pt7-0007Vx-1i
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 23:35:25 +0000
Received: from p5b3b31b9.dip.t-dialin.net ([91.59.49.185])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 23:35:25 +0000
Received: from no2spam by p5b3b31b9.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 23:35:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 18 May 2009 01:35:07 +0200
Message-ID: <guq6vh$tmi$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b31b9.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <200902261144.46548.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Sun, 17 May 2009 23:42:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> My addition to this:
> 
> mkdir recipes-broken
> git add  recipes-broken
> git mv recipes/obsolete recipes-broken/obsolete
> git mv recipes/nonworking recipes-broken/nonworking
> 
> As this will allow users to set:
> 
> BBFILES = "/somewhere/oe/recipes/"
> 
> which is supported by BitBake for years.

I'd like to revisit this suggestion from Marcin which came up during the 
discussion of the packages->recipes renaming.  I think the above makes 
sense and should be committed.  I think it would be nice if the folder 
was named broken-recipes instead of recipes-broken.  First of all, it 
sounds nicer IMHO ;-) but more importantly, this works better with 
bash-completion.

Reopening discussion for this change.



