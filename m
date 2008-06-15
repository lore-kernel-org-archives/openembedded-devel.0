Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K7p4V-0000gG-Ve
	for openembedded-devel@openembedded.org; Sun, 15 Jun 2008 12:02:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K7p41-0004pG-3K
	for openembedded-devel@openembedded.org; Sun, 15 Jun 2008 10:02:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 15 Jun 2008 10:02:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 15 Jun 2008 10:02:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 15 Jun 2008 12:02:13 +0200
Message-ID: <g32pb5$jvi$1@ger.gmane.org>
References: <20080614221857.GB3428@cimmeria.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <20080614221857.GB3428@cimmeria.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: Packaged Staging Problems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 15 Jun 2008 10:03:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> I get the problem in packaged staging that it repeatedly issues the
> error.
>
> NOTE: Checking if staging package installed
> head: `-1' option is obsolete; use `-n 1'
> Try `head --help' for more information.
> sed: couldn't flush stdout: Broken pipe
> NOTE: No. Manually removing any installed files
>
> I suspect the attached patch is the fix for this. But this is scary core
> stuff so I thought I would send it for review.

I wondered why I wasn't seeing those errors, it turns out I have a stray 
ipkg-cl from my original packaged-staging in /usr/local/bin, so 
stagemanager-ipkg doesn't get used. A 'bitbake opkg-native' gets you a 
nice opkg-cl in $PATH, but we still need a real solution.

regards,

Koen



