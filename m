Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KZUcD-0005VM-KB
	for openembedded-devel@openembedded.org; Sat, 30 Aug 2008 19:52:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KZUaS-0001Il-5q
	for openembedded-devel@openembedded.org; Sat, 30 Aug 2008 17:50:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 Aug 2008 17:50:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 Aug 2008 17:50:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 Aug 2008 19:50:03 +0200
Message-ID: <g9c18c$itk$1@ger.gmane.org>
References: <48B90081.30105@whitby.id.au>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <48B90081.30105@whitby.id.au>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: When PREFERRED_PROVIDER does not build, don't try other alternatives by default
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
X-List-Received-Date: Sat, 30 Aug 2008 17:52:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> Whenever I build virtual/kernel, and for some reason (perhaps a git
> fetcher problem, or a patch doesn't apply cleanly) it doesn't build,
> bitbake decides to then go and build every other kernel under the sun
> trying to complete virtual/kernel.
>
> This is undesirable to the extreme,

Related to that: if for some reason you add a linux-myleetmachine.bb 
recipe instead of extending existing kernel recipes, please set 
COMPATIBLE_MACHINE = "myleetmachine" inside that recipe.
The same goes for other machine specific recipes (e.g. omapfbplay_git.bb 
should have COMPATIBLE_MACHINE set to all omap3 boards).

regards,

Koen



